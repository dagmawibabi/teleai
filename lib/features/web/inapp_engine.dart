import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' show Size;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart' show MissingPluginException;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

/// A second browser engine (flutter_inappwebview) next to the assistant's
/// main browser, for what that one can't do: screenshots of a page (the
/// screen or the whole page), inspecting a page (its console messages,
/// network requests, cookies and the HTML its scripts produced), and
/// scripts that await (fetch from the page's own site, wait for things).
/// Both engines are Android's WebView, so they share cookies: a site signed
/// in to in one is signed in in the other.
///
/// It also hosts the code sandbox ([Sandbox]), on a blank page of its own.
class InAppEngine {
  HeadlessInAppWebView? _view;
  InAppWebViewController? _c;
  Completer<void>? _load;
  final List<String> _console = [];
  String? _error;

  static bool get supported => Platform.isAndroid || Platform.isIOS;
  static const _viewport = Size(412, 915);

  Future<InAppWebViewController> _ensure() async {
    if (!supported) throw UnsupportedError('This works on Android and iOS only.');
    final c = _c;
    if (c != null) return c;
    final ready = Completer<InAppWebViewController>();
    _view = HeadlessInAppWebView(
      initialSize: _viewport,
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        userAgent:
            'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) '
            'Chrome/130.0.0.0 Mobile Safari/537.36',
        mediaPlaybackRequiresUserGesture: true,
        useWideViewPort: true,
      ),
      onWebViewCreated: (c) {
        _c = c;
        if (!ready.isCompleted) ready.complete(c);
      },
      onLoadStart: (_, _) {
        _error = null;
        if (_load == null || _load!.isCompleted) _load = Completer<void>();
      },
      onLoadStop: (_, _) {
        if (_load?.isCompleted == false) _load!.complete();
      },
      onReceivedError: (_, req, err) {
        if (req.isForMainFrame ?? true) _error = err.description;
      },
      onConsoleMessage: (_, m) {
        _console.add('[${m.messageLevel.toNativeValue() == 3 ? 'error' : m.messageLevel.toString().split('.').last.toLowerCase()}] ${m.message}');
        if (_console.length > 200) _console.removeAt(0);
      },
    );
    try {
      await _view!.run();
    } on MissingPluginException {
      // The app's Dart side knows the plugin but this install's native side
      // doesn't: a hot restart after adding it, or an older install.
      _view = null;
      throw UnsupportedError('The screenshot browser isn\'t in this install of the app. Reinstall it fully (not a hot restart), then try again.');
    }
    return ready.future.timeout(const Duration(seconds: 15));
  }

  /// Loads [url] and waits for the page and its scripts to settle.
  Future<void> open(String url, {Duration settle = const Duration(milliseconds: 1500)}) async {
    final c = await _ensure();
    _console.clear();
    _load = Completer<void>();
    await c.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
    await _load!.future.timeout(const Duration(seconds: 30), onTimeout: () {});
    await Future<void>.delayed(settle);
  }

  Future<String?> get url async => (await _c?.getUrl())?.toString();

  /// A PNG of the page: what fits the phone's screen, or the whole page
  /// (up to [maxHeight] points tall). Saved with the app's files.
  Future<File> screenshot({bool fullPage = false, int maxHeight = 6000}) async {
    final c = await _ensure();
    if (fullPage) {
      final h = await c.evaluateJavascript(
        source: 'Math.max(document.body ? document.body.scrollHeight : 0, document.documentElement.scrollHeight)',
      );
      final height = (h is num ? h.toDouble() : double.tryParse('$h') ?? _viewport.height).clamp(_viewport.height, maxHeight.toDouble());
      await _view!.setSize(Size(_viewport.width, height));
      await Future<void>.delayed(const Duration(milliseconds: 900));
    }
    try {
      final bytes = await c.takeScreenshot(
        screenshotConfiguration: ScreenshotConfiguration(compressFormat: CompressFormat.PNG),
      );
      if (bytes == null || bytes.isEmpty) throw StateError('The page gave an empty screenshot.');
      final dir = Directory('${(await getApplicationSupportDirectory()).path}/screenshots');
      if (!await dir.exists()) await dir.create(recursive: true);
      final host = Uri.tryParse(await url ?? '')?.host.replaceAll('.', '_') ?? 'page';
      return await File('${dir.path}/${host}_${DateTime.now().millisecondsSinceEpoch}.png').writeAsBytes(bytes);
    } finally {
      if (fullPage) await _view!.setSize(_viewport);
    }
  }

  /// What a developer would look at: console output, the requests the page
  /// made, its cookies, and the HTML as its scripts left it.
  Future<Map<String, dynamic>> inspect({int htmlChars = 6000}) async {
    final c = await _ensure();
    final requests = await c.evaluateJavascript(
      source: '''JSON.stringify(performance.getEntriesByType('resource').slice(-80).map(function (e) {
        return {url: e.name, type: e.initiatorType, ms: Math.round(e.duration), bytes: e.transferSize || undefined};
      }))''',
    );
    final current = await url;
    final cookies = current == null ? const <Cookie>[] : await CookieManager.instance().getCookies(url: WebUri(current));
    final html = await c.getHtml() ?? '';
    return {
      'url': current,
      'title': await c.getTitle(),
      'error': ?_error,
      'console': List.of(_console.take(80)),
      'requests': _decode(requests) ?? const [],
      'cookies': [for (final k in cookies) k.name],
      'html_length': html.length,
      'html': html.length > htmlChars ? '${html.substring(0, htmlChars)}…' : html,
    };
  }

  /// Runs [body] as an async function in the page (it may `await`), with
  /// [args] as named variables; its return value comes back.
  Future<Object?> runAsync(String body, {Map<String, dynamic> args = const {}, Duration timeout = const Duration(seconds: 60)}) async {
    final c = await _ensure();
    final r = await c.callAsyncJavaScript(functionBody: body, arguments: args).timeout(timeout);
    if (r == null) return null;
    if (r.error != null) throw StateError(r.error!);
    return r.value;
  }

  static Object? _decode(Object? v) {
    if (v is String) {
      try {
        return jsonDecode(v);
      } catch (_) {
        return v;
      }
    }
    return v;
  }

  /// Stops loading, and any script still running, by leaving the page.
  Future<void> stop() async {
    if (_load?.isCompleted == false) _load!.complete();
    try {
      await _c?.stopLoading();
      await _c?.loadUrl(urlRequest: URLRequest(url: WebUri('about:blank')));
    } catch (_) {}
  }

  Future<void> dispose() async {
    await _view?.dispose();
    _view = null;
    _c = null;
  }
}

final inAppEngineProvider = Provider<InAppEngine>((ref) {
  final e = InAppEngine();
  ref.onDispose(e.dispose);
  return e;
});
