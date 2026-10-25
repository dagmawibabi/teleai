import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Runs code for the assistant in a page of its own: JavaScript straight
/// away, Python through Pyodide (Python compiled to WebAssembly, fetched
/// once from a CDN, then cached by the WebView). The code sees nothing of
/// the app or Telegram: no files but the ones handed to it, no keys.
///
/// Files: input files are written into the sandbox (Python: the working
/// directory; JavaScript: `files` maps names to Uint8Arrays). Whatever the
/// code writes to `out/` (Python) or puts in `outFiles` (JavaScript, name →
/// string or Uint8Array) comes back as files of the conversation.
///
/// It runs in Android's WebView (webview_flutter), which hands the async
/// result back through a JavaScript channel. [cancel] stops a run by
/// throwing the page away.
class Sandbox {
  WebViewController? _c;
  Completer<void>? _ready;
  bool _python = false;
  final Map<int, Completer<Object?>> _pending = {};
  int _next = 0;

  static const _pyodide = 'https://cdn.jsdelivr.net/pyodide/v0.26.4/full/';

  bool get running => _pending.isNotEmpty;

  Future<WebViewController> _page() async {
    if (!Platform.isAndroid && !Platform.isIOS) throw UnsupportedError('Running code works on Android and iOS only.');
    final ready = _ready;
    if (ready != null) {
      await ready.future;
      return _c!;
    }
    final done = _ready = Completer<void>();
    final c = _c = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'TriangleSandbox',
        onMessageReceived: (m) {
          try {
            final j = jsonDecode(m.message) as Map<String, dynamic>;
            final waiter = _pending.remove(j['id']);
            if (j['ok'] == true) {
              waiter?.complete(j['value']);
            } else {
              waiter?.completeError(StateError('${j['error']}'));
            }
          } catch (_) {}
        },
      )
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (_) {
        if (!done.isCompleted) done.complete();
      }));
    // An https origin, so the CDN serves Pyodide and its packages.
    await c.loadHtmlString('<!doctype html><html><head><meta charset="utf-8"></head><body></body></html>', baseUrl: 'https://sandbox.teleai.app/');
    await done.future.timeout(const Duration(seconds: 15), onTimeout: () {});
    return c;
  }

  /// Runs [body] as an async function with [args] as its parameters, and
  /// returns what it returns.
  Future<Object?> _call(String body, Map<String, Object?> args, Duration timeout) async {
    final c = await _page();
    final id = ++_next;
    final waiter = _pending[id] = Completer<Object?>();
    final names = args.keys.join(', ');
    final values = args.values.map(jsonEncode).join(', ');
    await c.runJavaScript('''
      (async function ($names) { $body })($values)
        .then(function (v) { TriangleSandbox.postMessage(JSON.stringify({id: $id, ok: true, value: v === undefined ? null : v})); })
        .catch(function (e) { TriangleSandbox.postMessage(JSON.stringify({id: $id, ok: false, error: String(e && e.stack || e)})); });
    ''');
    try {
      return await waiter.future.timeout(timeout);
    } on TimeoutException {
      _pending.remove(id);
      await cancel();
      throw StateError('The code ran longer than ${timeout.inSeconds} s and was stopped.');
    }
  }

  Future<SandboxResult> run({
    required String language,
    required String code,
    Map<String, List<int>> inputs = const {},
    Duration timeout = const Duration(seconds: 90),
  }) async {
    final files = {for (final e in inputs.entries) e.key: base64Encode(e.value)};
    final Object? raw;
    if (language == 'python') {
      if (!_python) {
        await _call('''
          if (!window.loadPyodide) {
            await new Promise(function (ok, fail) {
              var s = document.createElement('script');
              s.src = '${_pyodide}pyodide.js'; s.onload = ok; s.onerror = function () { fail(new Error('Could not download Python (Pyodide). Is there an internet connection?')); };
              document.head.appendChild(s);
            });
          }
          if (!window.__py) window.__py = await loadPyodide({indexURL: '$_pyodide'});
          return true;
        ''', const {}, const Duration(minutes: 3));
        _python = true;
      }
      raw = await _call(_pythonRunner, {'__code': code, '__files': files}, timeout);
    } else {
      raw = await _call(_jsRunner, {'__code': code, '__files': files}, timeout);
    }
    final r = raw is Map ? raw : <String, dynamic>{'result': raw};
    final dir = Directory('${(await getApplicationSupportDirectory()).path}/sandbox/${DateTime.now().millisecondsSinceEpoch}');
    final made = <File>[];
    for (final f in (r['files'] as List? ?? const [])) {
      if (f is! Map) continue;
      if (!await dir.exists()) await dir.create(recursive: true);
      final name = '${f['name']}'.split(RegExp(r'[\\/]')).last;
      made.add(await File('${dir.path}/$name').writeAsBytes(base64Decode('${f['data']}')));
    }
    return SandboxResult(
      output: '${r['stdout'] ?? ''}',
      result: r['result'],
      error: r['error'] as String?,
      files: made,
    );
  }

  /// Stops whatever is running: the page goes, and the next run starts a
  /// fresh one (Python downloads again only if the WebView's cache lost it).
  Future<void> cancel() async {
    for (final w in _pending.values) {
      if (!w.isCompleted) w.completeError(StateError('Stopped.'));
    }
    _pending.clear();
    final c = _c;
    _c = null;
    _ready = null;
    _python = false;
    try {
      await c?.loadRequest(Uri.parse('about:blank'));
    } catch (_) {}
  }

  /// JavaScript, inside an async function: console output is captured, the
  /// last value returned, outFiles collected.
  static const _jsRunner = r'''
    var out = [];
    var log = function () { out.push(Array.prototype.map.call(arguments, function (a) { return typeof a === 'string' ? a : JSON.stringify(a); }).join(' ')); };
    var input = {};
    for (var name in __files) { var b = atob(__files[name]); var u = new Uint8Array(b.length); for (var i = 0; i < b.length; i++) u[i] = b.charCodeAt(i); input[name] = u; }
    var outFiles = {};
    var con = {log: log, info: log, warn: log, error: log};
    var result, error;
    try {
      var AsyncFunction = Object.getPrototypeOf(async function () {}).constructor;
      result = await new AsyncFunction('files', 'outFiles', 'console', __code)(input, outFiles, con);
    } catch (e) { error = String(e && e.stack || e); }
    var made = [];
    for (var n in outFiles) {
      var v = outFiles[n];
      var bytes = typeof v === 'string' ? new TextEncoder().encode(v) : new Uint8Array(v);
      var s = ''; for (var j = 0; j < bytes.length; j++) s += String.fromCharCode(bytes[j]);
      made.push({name: n, data: btoa(s)});
    }
    try { JSON.stringify(result); } catch (e) { result = String(result); }
    return {stdout: out.join('\n'), result: result === undefined ? null : result, error: error || null, files: made};
  ''';

  /// Python through Pyodide: stdout captured, files in and out through its
  /// file system, packages imported by the code loaded first.
  static const _pythonRunner = r'''
    var py = window.__py, out = [];
    py.setStdout({batched: function (s) { out.push(s); }});
    py.setStderr({batched: function (s) { out.push(s); }});
    var home = '/home/pyodide/run_' + Date.now();
    py.FS.mkdirTree(home + '/out');
    py.FS.chdir(home);
    for (var name in __files) {
      var b = atob(__files[name]); var u = new Uint8Array(b.length); for (var i = 0; i < b.length; i++) u[i] = b.charCodeAt(i);
      py.FS.writeFile(home + '/' + name, u);
    }
    var result = null, error = null;
    try {
      await py.loadPackagesFromImports(__code);
      var v = await py.runPythonAsync(__code);
      if (v !== undefined && v !== null) result = v.toJs ? JSON.parse(JSON.stringify(v.toJs({dict_converter: Object.fromEntries}))) : (typeof v === 'object' ? String(v) : v);
    } catch (e) { error = String(e); }
    var made = [];
    var walk = function (dir, prefix) {
      py.FS.readdir(dir).forEach(function (n) {
        if (n === '.' || n === '..') return;
        var p = dir + '/' + n, st = py.FS.stat(p);
        if (py.FS.isDir(st.mode)) return walk(p, prefix + n + '_');
        var bytes = py.FS.readFile(p), s = '';
        for (var j = 0; j < bytes.length; j++) s += String.fromCharCode(bytes[j]);
        made.push({name: prefix + n, data: btoa(s)});
      });
    };
    walk(home + '/out', '');
    return {stdout: out.join('\n'), result: result, error: error, files: made};
  ''';

}

class SandboxResult {
  const SandboxResult({required this.output, this.result, this.error, this.files = const []});
  final String output;
  final Object? result;
  final String? error;
  final List<File> files;
}

final sandboxProvider = Provider<Sandbox>((ref) {
  final s = Sandbox();
  ref.onDispose(s.cancel);
  return s;
});
