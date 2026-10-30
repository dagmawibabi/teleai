import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import '../native/capture.dart';
import '../native/windows.dart' as win;
import 'activity.dart';
import 'mcp_server.dart';

/// The live screen: a WebSocket at `/live?token=…` that streams JPEG frames
/// and takes taps, drags, scrolls and keys back. Not MCP: a frame is sent
/// only after the phone acknowledged the one before (at most two in
/// flight), so there is never a backlog, and a screen that didn't change is
/// not sent again.
///
/// Phone → PC (JSON text):
///   {"t":"config","w":1280,"q":55,"monitor":0}
///   {"t":"ack"}
///   {"t":"move"|"click"|"down"|"up","x":0..1,"y":0..1,"b":"left","n":1}
///   {"t":"scroll","x","y","dy":-3,"dx":0}
///   {"t":"key","k":"ctrl+c"}   {"t":"text","s":"hello"}
/// PC → phone: binary JPEG frames, and JSON text {"t":"info",…} or
/// {"t":"error","m":…}.
class LiveScreen {
  LiveScreen(this.server);

  final McpServer server;
  final _sessions = <_Session>{};
  Future<CaptureWorker>? _worker;

  /// A session started (+1) or ended (−1).
  void Function(String who, int delta)? onChange;

  int get sessions => _sessions.length;

  Future<CaptureWorker> get worker => _worker ??= CaptureWorker.start();

  Future<Map<String, dynamic>> info() async {
    final c = server.config();
    return {
      'name': McpServer.name,
      'version': McpServer.version,
      'live': c.seeScreen && !c.paused,
      'control': c.controlInput,
      if (c.seeScreen) 'monitors': [for (final m in await (await worker).monitors()) _monitor(m)],
    };
  }

  Future<void> accept(HttpRequest r, String who) async {
    final c = server.config();
    final refusal = c.paused
        ? 'The companion is paused on the PC.'
        : !c.seeScreen
            ? '"See the screen" is off in Triangle Companion on the PC.'
            : null;
    if (refusal != null) {
      r.response
        ..statusCode = 403
        ..write(refusal);
      await r.response.close();
      return;
    }
    final ws = await WebSocketTransformer.upgrade(r, compression: CompressionOptions.compressionOff);
    ws.pingInterval = const Duration(seconds: 10);
    final s = _Session(this, ws, who);
    _sessions.add(s);
    onChange?.call(who, 1);
    server.log.add(ActivityEntry(at: DateTime.now(), tool: 'live view', summary: 'started', outcome: Outcome.ok, who: who));
    unawaited(s.run().whenComplete(() {
      _sessions.remove(s);
      onChange?.call(who, -1);
      server.log.add(ActivityEntry(at: DateTime.now(), tool: 'live view', summary: 'ended', outcome: Outcome.ok, who: who));
    }));
  }

  void disconnectAll() {
    for (final s in [..._sessions]) {
      s.close('Ended on the PC.');
    }
  }

  void dispose() {
    disconnectAll();
    unawaited(_worker?.then((w) => w.dispose()));
    _worker = null;
  }

  static Map<String, dynamic> _monitor(Monitor m) =>
      {'x': m.x, 'y': m.y, 'width': m.width, 'height': m.height, 'primary': m.primary};
}

class _Session {
  _Session(this.live, this.ws, this.who);

  final LiveScreen live;
  final WebSocket ws;
  final String who;

  var _open = true;
  var _credits = 2;
  Completer<void>? _wake;
  int _maxWidth = 1280, _quality = 55, _monitor = 0;
  List<Monitor> _monitors = const [];
  int? _lastHash;
  var _idle = 0;
  var _controlWarned = false;

  ScreenRect get _rect {
    final m = _monitors[_monitor.clamp(0, _monitors.length - 1)];
    return (x: m.x, y: m.y, width: m.width, height: m.height);
  }

  Future<void> run() async {
    final worker = await live.worker;
    _monitors = await worker.monitors();
    if (_monitors.isEmpty) {
      close('No screen found.');
      return;
    }
    final done = Completer<void>();
    ws.listen(_onMessage, onDone: () {
      _open = false;
      _poke();
      if (!done.isCompleted) done.complete();
    }, onError: (_) {
      _open = false;
      _poke();
    }, cancelOnError: true);
    _sendInfo();

    var last = DateTime.fromMillisecondsSinceEpoch(0);
    while (_open) {
      final c = live.server.config();
      if (c.paused || !c.seeScreen) {
        close(c.paused ? 'The companion was paused on the PC.' : '"See the screen" was switched off on the PC.');
        break;
      }
      if (_credits <= 0) {
        await _sleep(const Duration(seconds: 2));
        continue;
      }
      // At most ~30 frames a second.
      final gap = DateTime.now().difference(last);
      if (gap < const Duration(milliseconds: 33)) await Future<void>.delayed(const Duration(milliseconds: 33) - gap);
      Frame frame;
      try {
        frame = await worker.capture(_rect, maxWidth: _maxWidth, quality: _quality);
      } catch (e) {
        _send({'t': 'error', 'm': '$e'});
        await _sleep(const Duration(seconds: 1));
        continue;
      }
      last = DateTime.now();
      final hash = _hash(frame.jpeg);
      if (hash == _lastHash) {
        // Unchanged: look again soon, less often the longer it stays still.
        _idle++;
        await _sleep(Duration(milliseconds: _idle < 10 ? 80 : 250));
        continue;
      }
      _idle = 0;
      _lastHash = hash;
      if (!_open) break;
      ws.add(frame.jpeg);
      _credits--;
    }
    await done.future.timeout(const Duration(seconds: 2), onTimeout: () {});
  }

  void _onMessage(Object? data) {
    if (data is! String) return;
    Map m;
    try {
      m = jsonDecode(data) as Map;
    } catch (_) {
      return;
    }
    switch (m['t']) {
      case 'ack':
        _credits = (_credits + 1).clamp(0, 3);
        _poke();
      case 'config':
        if (m['w'] is num) _maxWidth = (m['w'] as num).round().clamp(320, 3840);
        if (m['q'] is num) _quality = (m['q'] as num).round().clamp(20, 90);
        if (m['monitor'] is num) _monitor = (m['monitor'] as num).round().clamp(0, _monitors.length - 1);
        _lastHash = null;
        _sendInfo();
        _poke();
      default:
        _input(m);
    }
  }

  void _input(Map m) {
    final type = m['t'];
    if (!const {'move', 'click', 'down', 'up', 'scroll', 'key', 'text'}.contains(type)) return;
    if (!live.server.config().controlInput) {
      if (!_controlWarned) _send({'t': 'error', 'm': '"Control mouse & keyboard" is off on the PC, so the live view is watch-only.'});
      _controlWarned = true;
      return;
    }
    final r = _rect;
    int px() => r.x + ((m['x'] as num? ?? 0.5).clamp(0, 1) * (r.width - 1)).round();
    int py() => r.y + ((m['y'] as num? ?? 0.5).clamp(0, 1) * (r.height - 1)).round();
    final button = '${m['b'] ?? 'left'}';
    try {
      switch (type) {
        case 'move':
          win.moveMouse(px(), py());
        case 'click':
          win.click(px(), py(), button: button, times: (m['n'] as num? ?? 1).round().clamp(1, 3));
        case 'down':
          win.moveMouse(px(), py());
          win.mouseDown(button);
        case 'up':
          win.moveMouse(px(), py());
          win.mouseUp(button);
        case 'scroll':
          final dy = (m['dy'] as num? ?? 0).round().clamp(-20, 20), dx = (m['dx'] as num? ?? 0).round().clamp(-20, 20);
          if (dy != 0) win.scroll(px(), py(), dy);
          if (dx != 0) win.scroll(px(), py(), dx, horizontal: true);
        case 'key':
          for (final k in '${m['k'] ?? ''}'.trim().split(RegExp(r'\s+')).where((k) => k.isNotEmpty).take(10)) {
            win.pressKeys(k);
          }
        case 'text':
          final s = '${m['s'] ?? ''}';
          if (s.isNotEmpty && s.length <= 2000) win.typeText(s);
      }
    } catch (e) {
      _send({'t': 'error', 'm': e is ArgumentError ? '${e.message}' : '$e'});
    }
    // Show the result right away.
    _idle = 0;
    _poke();
  }

  void _sendInfo() => _send({
        't': 'info',
        'monitors': [for (final m in _monitors) LiveScreen._monitor(m)],
        'monitor': _monitor,
        'control': live.server.config().controlInput,
        'w': _maxWidth,
        'q': _quality,
      });

  void _send(Map<String, dynamic> m) {
    if (_open) ws.add(jsonEncode(m));
  }

  void _poke() {
    final w = _wake;
    _wake = null;
    if (w != null && !w.isCompleted) w.complete();
  }

  /// Waits [d], or less if a message arrives.
  Future<void> _sleep(Duration d) {
    final w = _wake ??= Completer<void>();
    return w.future.timeout(d, onTimeout: () {});
  }

  void close(String reason) {
    if (!_open) return;
    _send({'t': 'error', 'm': reason});
    _open = false;
    _poke();
    unawaited(ws.close(WebSocketStatus.normalClosure, reason.length > 120 ? reason.substring(0, 120) : reason));
  }

  /// FNV-1a over a sample of the bytes: enough to tell frames apart.
  static int _hash(Uint8List b) {
    var h = 0x811c9dc5;
    final step = b.length > 65536 ? b.length ~/ 65536 : 1;
    for (var i = 0; i < b.length; i += step) {
      h = ((h ^ b[i]) * 0x01000193) & 0xFFFFFFFF;
    }
    return h ^ b.length;
  }
}
