import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// The assistant's web browser: one real WebView that runs a page's
/// JavaScript, so it can use sites that are apps rather than documents
/// (forms posted by script, client-side encryption, logins). The assistant
/// drives it with the browser tools; the person can watch or take over in
/// the Browser screen, which shows this same page.
///
/// Elements are numbered by [snapshot]; clicks and typing refer to those
/// numbers until the next snapshot.
class BrowserSession {
  WebViewController? _controller;
  Completer<void>? _loading;
  String? _lastError;

  /// Bumped on every page change, for the Browser screen.
  final revision = ValueNotifier(0);

  static bool get supported => Platform.isAndroid || Platform.isIOS;

  Map<int, String> _labels = {};
  String? _host;

  /// What element [i] said at the last read, for approval cards.
  String? elementLabel(int i) => _labels[i];

  /// The open page's site.
  String? get host => _host;

  bool get isOpen => _controller != null;

  /// For the Browser screen. Null until a page was opened.
  WebViewController? get controller => _controller;

  WebViewController _ensure() {
    if (!supported) throw UnsupportedError('The browser works on Android and iOS only. Use fetch_url instead.');
    return _controller ??= WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) '
        'Chrome/130.0.0.0 Mobile Safari/537.36',
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            _lastError = null;
            if (_loading == null || _loading!.isCompleted) _loading = Completer<void>();
          },
          onPageFinished: (_) {
            if (_loading?.isCompleted == false) _loading!.complete();
            revision.value++;
          },
          onWebResourceError: (e) {
            if (e.isForMainFrame ?? true) _lastError = '${e.errorCode} ${e.description}';
          },
        ),
      );
  }

  /// Waits for a load in progress, then a moment more for scripts to
  /// render what they fetch.
  Future<void> _settle({Duration extra = const Duration(milliseconds: 1500)}) async {
    final loading = _loading;
    if (loading != null && !loading.isCompleted) {
      await loading.future.timeout(const Duration(seconds: 25), onTimeout: () {});
    }
    await Future<void>.delayed(extra);
    // Script-driven sites keep loading after the page "finished".
    for (var i = 0; i < 10; i++) {
      final state = await _eval('return document.readyState;');
      if (state == 'complete') break;
      await Future<void>.delayed(const Duration(milliseconds: 400));
    }
  }

  Future<Map<String, dynamic>> open(String url, {int maxChars = 6000}) async {
    final c = _ensure();
    _loading = Completer<void>();
    await c.loadRequest(Uri.parse(url));
    await _settle();
    return snapshot(maxChars: maxChars);
  }

  Future<Map<String, dynamic>> back() async {
    final c = _require();
    if (await c.canGoBack()) {
      await c.goBack();
      await _settle();
    }
    return snapshot();
  }

  WebViewController _require() {
    final c = _controller;
    if (c == null) throw StateError('No page is open. Call browser_open first.');
    return c;
  }

  /// Runs [js] in the page and returns its value, decoded from JSON when it
  /// is JSON. Platforms differ in how they hand strings back, so values are
  /// passed through JSON.stringify and decoded here.
  /// [body] is a function body that `return`s the value.
  Future<Object?> _eval(String body) async {
    final c = _require();
    Object? v = await c.runJavaScriptReturningResult(
      'JSON.stringify((function(){ try { $body } catch (e) { return {error: String(e)}; } })())',
    );
    for (var i = 0; i < 2 && v is String; i++) {
      try {
        v = jsonDecode(v);
      } catch (_) {
        break;
      }
    }
    return v;
  }

  /// Runs the assistant's own script; the value of its last expression
  /// comes back.
  Future<Object?> evaluate(String js) async {
    final v = await _eval('return eval(${jsonEncode(js)});');
    await _settle(extra: const Duration(milliseconds: 600));
    return v;
  }

  /// The page as the assistant sees it: title, address, readable text and
  /// the elements it can use, numbered.
  Future<Map<String, dynamic>> snapshot({int offset = 0, int maxChars = 6000, String? find}) async {
    final r = await _eval(_snapshotJs);
    if (r is! Map || r['error'] != null) throw StateError('Couldn\'t read the page${r is Map ? ': ${r['error']}' : ''}.');
    final text = '${r['text'] ?? ''}';
    final out = <String, dynamic>{
      'url': r['url'],
      'title': r['title'],
      'error': ?_lastError,
    };
    if (find != null && find.trim().isNotEmpty) {
      out['matches'] = findSnippets(text, find);
    } else {
      final end = (offset + maxChars).clamp(0, text.length);
      out['text'] = offset >= text.length ? '' : text.substring(offset, end);
      if (end < text.length) out['more_text'] = 'Page text continues; pass offset=$end.';
    }
    out['elements'] = r['elements'];
    _labels = {
      for (final e in (r['elements'] as List? ?? const []))
        if (e is Map && e['i'] is num) (e['i'] as num).toInt(): '${e['text'] ?? e['name'] ?? e['tag'] ?? ''}',
    };
    _host = Uri.tryParse('${r['url'] ?? ''}')?.host;
    if (r['dialog'] != null) out['dialog'] = r['dialog'];
    return out;
  }

  Future<Map<String, dynamic>> click(int index) async {
    final r = await _eval('''
      var el = document.querySelector('[data-triangle-id="$index"]');
      if (!el) return {error: 'No element $index; take a new snapshot with browser_read.'};
      el.scrollIntoView({block: 'center'});
      var opts = {bubbles: true, cancelable: true, view: window};
      ['pointerdown', 'mousedown', 'pointerup', 'mouseup'].forEach(function (t) { el.dispatchEvent(new MouseEvent(t, opts)); });
      el.click();
      return {clicked: (el.innerText || el.value || el.getAttribute('aria-label') || el.tagName).toString().slice(0, 80)};
    ''');
    if (r is Map && r['error'] != null) return Map<String, dynamic>.from(r);
    await _settle();
    return {...?(r as Map?)?.cast<String, dynamic>(), 'page': await snapshot(maxChars: 3000)};
  }

  Future<Map<String, dynamic>> type(int index, String text, {bool clear = true, bool pressEnter = false}) async {
    final r = await _eval('''
      var el = document.querySelector('[data-triangle-id="$index"]');
      if (!el) return {error: 'No element $index; take a new snapshot with browser_read.'};
      el.focus();
      var value = ${jsonEncode(text)};
      if (el.isContentEditable) {
        if (${clear ? 'true' : 'false'}) el.textContent = '';
        document.execCommand('insertText', false, value);
      } else if (el.tagName === 'SELECT') {
        var opt = Array.from(el.options).find(function (o) { return o.value === value || o.text.trim() === value; });
        if (!opt) return {error: 'No option "' + value + '". Options: ' + Array.from(el.options).map(function (o) { return o.text.trim(); }).join(', ')};
        el.value = opt.value;
      } else {
        var proto = el.tagName === 'TEXTAREA' ? HTMLTextAreaElement.prototype : HTMLInputElement.prototype;
        var setter = Object.getOwnPropertyDescriptor(proto, 'value').set;
        setter.call(el, (${clear ? 'true' : 'false'} ? '' : el.value) + value);
      }
      el.dispatchEvent(new Event('input', {bubbles: true}));
      el.dispatchEvent(new Event('change', {bubbles: true}));
      if (${pressEnter ? 'true' : 'false'}) {
        ['keydown', 'keypress', 'keyup'].forEach(function (t) {
          el.dispatchEvent(new KeyboardEvent(t, {key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true}));
        });
        if (el.form) { if (el.form.requestSubmit) el.form.requestSubmit(); else el.form.submit(); }
      }
      return {typed: true, value: (el.value || el.textContent || '').toString().slice(0, 200)};
    ''');
    if (r is Map && r['error'] != null) return Map<String, dynamic>.from(r);
    await _settle(extra: Duration(milliseconds: pressEnter ? 1500 : 400));
    return {...?(r as Map?)?.cast<String, dynamic>(), if (pressEnter) 'page': await snapshot(maxChars: 3000)};
  }

  /// Stops a page that is still loading, or a wait for one.
  Future<void> stop() async {
    if (_loading?.isCompleted == false) _loading!.complete();
    try {
      await _controller?.runJavaScript('window.stop()');
    } catch (_) {}
  }

  Future<void> close() async {
    final c = _controller;
    if (c == null) return;
    await c.loadRequest(Uri.parse('about:blank'));
    _controller = null;
    revision.value++;
  }

  /// Text around each place [needle] appears, for "find" reads.
  static List<String> findSnippets(String text, String needle, {int max = 12, int context = 160}) {
    final lower = text.toLowerCase(), want = needle.toLowerCase();
    final out = <String>[];
    var at = lower.indexOf(want);
    while (at >= 0 && out.length < max) {
      final s = (at - context).clamp(0, text.length), e = (at + want.length + context).clamp(0, text.length);
      out.add('${s > 0 ? '…' : ''}${text.substring(s, e)}${e < text.length ? '…' : ''}');
      at = lower.indexOf(want, at + want.length);
    }
    return out;
  }

  /// Numbers the usable elements (links, buttons, fields) and reads the
  /// page's text. Hidden elements are left out.
  static const _snapshotJs = r'''
    var sel = 'a[href], button, input:not([type=hidden]), textarea, select, [role=button], [role=link], [role=tab], [role=menuitem], [role=checkbox], [onclick], [contenteditable=""], [contenteditable=true], summary';
    var els = Array.from(document.querySelectorAll(sel));
    var shown = function (el) {
      if (el.hidden || el.closest('[hidden],[aria-hidden=true]')) return false;
      var s = getComputedStyle(el);
      return s.display !== 'none' && s.visibility !== 'hidden';
    };
    var label = function (el) {
      var t = (el.innerText || '').trim();
      if (!t && el.labels && el.labels.length) t = el.labels[0].innerText;
      t = t || el.getAttribute('aria-label') || el.getAttribute('placeholder') || el.getAttribute('title') || el.value || el.getAttribute('alt') || '';
      if (!t) { var img = el.querySelector && el.querySelector('img[alt]'); if (img) t = img.alt; }
      return String(t).replace(/\s+/g, ' ').trim().slice(0, 90);
    };
    var out = [], n = 0;
    document.querySelectorAll('[data-triangle-id]').forEach(function (el) { el.removeAttribute('data-triangle-id'); });
    for (var i = 0; i < els.length && out.length < 120; i++) {
      var el = els[i];
      if (!shown(el)) continue;
      el.setAttribute('data-triangle-id', String(n));
      var o = {i: n, tag: el.tagName.toLowerCase()};
      var t = label(el); if (t) o.text = t;
      if (el.type && el.tagName !== 'BUTTON' && el.tagName !== 'A') o.type = el.type;
      if (el.name) o.name = el.name;
      if (el.tagName === 'A') o.href = el.href;
      if (el.tagName === 'SELECT') o.options = Array.from(el.options).slice(0, 20).map(function (x) { return x.text.trim(); });
      if ((el.tagName === 'INPUT' || el.tagName === 'TEXTAREA') && el.value) o.value = String(el.value).slice(0, 80);
      if (el.type === 'checkbox' || el.type === 'radio') o.checked = el.checked;
      if (el.disabled || el.getAttribute('aria-disabled') === 'true') o.disabled = true;
      if (el.maxLength > 0 && el.maxLength < 100000) o.max_length = el.maxLength;
      out.push(o); n++;
    }
    var root = document.querySelector('main, article, [role=main]') || document.body;
    var text = (root ? root.innerText : '').replace(/\n{3,}/g, '\n\n').trim();
    if (root !== document.body && text.length < 200 && document.body) text = document.body.innerText.trim();
    var dialog = document.querySelector('[role=dialog], [role=alertdialog], dialog[open]');
    return {url: location.href, title: document.title, text: text, elements: out, dialog: dialog ? dialog.innerText.trim().slice(0, 500) : null};
  ''';
}

final browserSessionProvider = Provider<BrowserSession>((ref) => BrowserSession());
