import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart' show PointerScrollEvent;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart' show McpServer, McpTransportKind;

import '../../app/theme.dart';
import '../ai/data/ai.dart';

/// A Triangle Companion on a PC, found among the installed MCP servers.
class PcLink {
  const PcLink({required this.name, required this.origin, required this.token});

  /// The MCP server's name in Triangle.
  final String name;

  /// `http://192.168.1.20:8765` or `https://pc.tail1234.ts.net`.
  final Uri origin;
  final String token;

  Uri get live => origin.replace(scheme: origin.scheme == 'https' ? 'wss' : 'ws', path: '/live', queryParameters: {'token': token});
  Uri get info => origin.replace(path: '/live/info', queryParameters: {'token': token});

  /// The companion address and token from an installed server: the token is
  /// in the address (`/mcp/<token>`) or the Authorization header.
  static PcLink? fromServer(McpServer s) {
    if (s.transport == McpTransportKind.stdio || s.url == null) return null;
    final u = Uri.tryParse(s.url!);
    if (u == null || u.pathSegments.isEmpty || u.pathSegments.first != 'mcp') return null;
    final auth = s.headers.entries.where((e) => e.key.toLowerCase() == 'authorization').map((e) => e.value).firstOrNull;
    final token = u.pathSegments.length == 2
        ? u.pathSegments[1]
        : auth?.replaceFirst(RegExp(r'^Bearer\s+', caseSensitive: false), '');
    if (token == null || token.isEmpty) return null;
    return PcLink(name: s.id, origin: Uri(scheme: u.scheme, host: u.host, port: u.hasPort ? u.port : null), token: token);
  }

  /// What the companion says about itself, or null when this isn't one or
  /// it can't be reached.
  Future<Map<String, dynamic>?> probe() async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 4);
    try {
      final res = await (await client.getUrl(info)).close().timeout(const Duration(seconds: 5));
      if (res.statusCode != 200) return null;
      final j = jsonDecode(await res.transform(utf8.decoder).join());
      return j is Map<String, dynamic> && j['name'] == 'triangle-companion' ? j : null;
    } catch (_) {
      return null;
    } finally {
      client.close(force: true);
    }
  }
}

/// The installed MCP servers that are companions and answer right now.
Future<List<PcLink>> findPcs(WidgetRef ref) async {
  final servers = await ref.read(aiProvider).mcp.list();
  final links = [for (final s in servers) ?PcLink.fromServer(s)];
  final answers = await Future.wait(links.map((l) => l.probe()));
  return [for (var i = 0; i < links.length; i++) if (answers[i] != null) links[i]];
}

/// Your PC's screen, live, and usable by touch: tap to click, two quick
/// taps to double-click, long-press for a right click, long-press and drag
/// to drag, one finger to scroll, two fingers to zoom and pan.
class PcScreen extends ConsumerStatefulWidget {
  const PcScreen({super.key, this.link});

  /// Which PC; null finds the companions among the MCP servers.
  final PcLink? link;

  static Future<void> open(BuildContext context, {PcLink? link}) =>
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => PcScreen(link: link)));

  @override
  ConsumerState<PcScreen> createState() => _PcScreenState();
}

enum _Quality {
  fast('Fast', 960, 45),
  balanced('Balanced', 1280, 55),
  sharp('Sharp', 1920, 70);

  const _Quality(this.label, this.width, this.q);
  final String label;
  final int width;
  final int q;
}

class _PcScreenState extends ConsumerState<PcScreen> {
  PcLink? _link;
  List<PcLink>? _found;
  WebSocket? _ws;
  ui.Image? _frame;
  String? _status = 'Connecting…';
  String? _notice;
  bool _control = false;
  List<Map> _monitors = const [];
  int _monitor = 0;
  _Quality _quality = _Quality.balanced;
  bool _keyboard = false;
  bool _decoding = false;

  /// Off: no connection to the PC and no picture until it's turned on again.
  bool _viewing = true;

  // Frame rate, over the last second.
  final _frameTimes = <DateTime>[];
  int _lastBytes = 0;

  // View transform: scale and offset of the picture in the viewport.
  double _scale = 1;
  Offset _offset = Offset.zero;
  Size _viewport = Size.zero;

  @override
  void initState() {
    super.initState();
    _link = widget.link;
    if (_link == null) {
      _discover();
    } else {
      _connect();
    }
  }

  @override
  void dispose() {
    _ws?.close();
    _frame?.dispose();
    _longTimer?.cancel();
    super.dispose();
  }

  Future<void> _discover() async {
    setState(() => _status = 'Looking for your PC…');
    final found = await findPcs(ref);
    if (!mounted) return;
    setState(() {
      _found = found;
      _status = found.isEmpty ? null : _status;
    });
    if (found.length == 1) {
      _link = found.first;
      _connect();
    }
  }

  Future<void> _connect() async {
    final link = _link;
    if (link == null) return;
    await _ws?.close();
    setState(() {
      _viewing = true;
      _status = 'Connecting to ${link.name}…';
      _notice = null;
    });
    try {
      final ws = await WebSocket.connect(link.live.toString()).timeout(const Duration(seconds: 8));
      if (!mounted || !_viewing) {
        await ws.close();
        return;
      }
      _ws = ws;
      ws.add(jsonEncode({'t': 'config', 'w': _width(), 'q': _quality.q, 'monitor': _monitor}));
      ws.listen(_onMessage, onDone: () {
        if (!mounted || _ws != ws) return;
        setState(() => _status = ws.closeReason?.isNotEmpty == true ? ws.closeReason : 'Disconnected');
      }, onError: (_) {});
      setState(() => _status = null);
    } on WebSocketException catch (e) {
      if (mounted && _viewing) setState(() => _status = _explain('$e'));
    } catch (e) {
      if (mounted && _viewing) setState(() => _status = 'Can\'t reach ${link.name}. Is the PC on, the companion running, and the phone on the same network?');
    }
  }

  /// Ends the stream and clears the picture; the PC stops capturing for us.
  void _stopViewing() {
    if (_dragging) _mouse('up', _lastPos);
    _dragging = false;
    _longTimer?.cancel();
    _pointers.clear();
    final ws = _ws, frame = _frame;
    _ws = null;
    ws?.close();
    setState(() {
      _viewing = false;
      _frame = null;
      _frameTimes.clear();
      _keyboard = false;
      _notice = null;
      _scale = 1;
      _offset = Offset.zero;
      _status = 'Viewing is off';
    });
    frame?.dispose();
  }

  String _explain(String e) {
    if (e.contains('403')) return 'The PC refused: "See the screen" may be off, or the companion is paused.';
    if (e.contains('401')) return 'The PC doesn\'t know this token. Pair again in MCP & Skills.';
    return 'Can\'t connect: $e';
  }

  /// Frame width for the quality, no wider than the phone needs.
  int _width() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final px = (view.physicalSize.longestSide).round();
    return math.min(_quality.width, math.max(px, 960));
  }

  void _onMessage(Object? m) {
    if (m is List<int>) {
      _showFrame(m is Uint8List ? m : Uint8List.fromList(m));
      return;
    }
    if (m is! String) return;
    final j = jsonDecode(m);
    if (j is! Map) return;
    if (j['t'] == 'info') {
      setState(() {
        _monitors = [for (final x in (j['monitors'] as List? ?? const [])) if (x is Map) x];
        _monitor = (j['monitor'] as num?)?.toInt() ?? 0;
        _control = j['control'] == true;
      });
    } else if (j['t'] == 'error') {
      setState(() => _notice = '${j['m']}');
    }
  }

  Future<void> _showFrame(Uint8List bytes) async {
    if (_decoding) {
      // Still drawing the last one; the PC waits for our ack, so this is rare.
      _ws?.add('{"t":"ack"}');
      return;
    }
    _decoding = true;
    try {
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = (await codec.getNextFrame()).image;
      codec.dispose();
      if (!mounted || !_viewing) {
        frame.dispose();
        return;
      }
      final old = _frame;
      final now = DateTime.now();
      _frameTimes
        ..add(now)
        ..removeWhere((t) => now.difference(t) > const Duration(seconds: 1));
      _lastBytes = bytes.length;
      setState(() => _frame = frame);
      old?.dispose();
    } catch (_) {
      // A damaged frame: skip it.
    } finally {
      _decoding = false;
      _ws?.add('{"t":"ack"}');
    }
  }

  void _send(Map<String, dynamic> m) {
    if (!_control) {
      if (_notice == null) setState(() => _notice = 'Watch-only: switch on "Control mouse & keyboard" in the companion on the PC.');
      return;
    }
    _ws?.add(jsonEncode(m));
  }

  void _reconfigure() => _ws?.add(jsonEncode({'t': 'config', 'w': _width(), 'q': _quality.q, 'monitor': _monitor}));

  // Where the picture sits in the viewport at scale 1 (fitted, centred).
  Rect get _fitted {
    final f = _frame;
    if (f == null || _viewport.isEmpty) return Rect.zero;
    final s = math.min(_viewport.width / f.width, _viewport.height / f.height);
    final w = f.width * s, h = f.height * s;
    return Rect.fromLTWH((_viewport.width - w) / 2, (_viewport.height - h) / 2, w, h);
  }

  /// A viewport point as 0–1 across and down the PC screen, or null off it.
  Offset? _toScreen(Offset p) {
    final fit = _fitted;
    if (fit.isEmpty) return null;
    final c = (p - _offset) / _scale;
    final x = (c.dx - fit.left) / fit.width, y = (c.dy - fit.top) / fit.height;
    if (x < 0 || y < 0 || x > 1 || y > 1) return null;
    return Offset(x, y);
  }

  void _clampOffset() {
    final fit = _fitted;
    final w = fit.width * _scale, h = fit.height * _scale;
    final left = fit.left * _scale, top = fit.top * _scale;
    double clampAxis(double o, double contentStart, double content, double view) {
      if (content <= view) return (view - content) / 2 - contentStart;
      return o.clamp(view - content - contentStart, -contentStart);
    }

    _offset = Offset(clampAxis(_offset.dx, left, w, _viewport.width), clampAxis(_offset.dy, top, h, _viewport.height));
    if (_scale <= 1.001) _offset = Offset.zero;
  }

  // Touch handling, by hand so taps, scrolls, drags and pinches don't fight.
  final _pointers = <int, Offset>{};
  Offset _start = Offset.zero;
  Offset _lastPos = Offset.zero;
  bool _moved = false, _long = false, _dragging = false, _pinching = false;
  Timer? _longTimer;
  double _scrollAcc = 0;
  DateTime _lastMoveSent = DateTime.fromMillisecondsSinceEpoch(0);
  double _pinchStartDist = 1, _pinchStartScale = 1;
  Offset _pinchStartFocal = Offset.zero, _pinchStartOffset = Offset.zero;

  Offset get _focal => _pointers.values.reduce((a, b) => a + b) / _pointers.length.toDouble();
  double get _spread {
    final p = _pointers.values.toList();
    return p.length < 2 ? 1 : (p[0] - p[1]).distance;
  }

  void _down(PointerDownEvent e) {
    _pointers[e.pointer] = e.localPosition;
    if (_pointers.length == 1) {
      _start = _lastPos = e.localPosition;
      _moved = _long = _dragging = _pinching = false;
      _scrollAcc = 0;
      _longTimer?.cancel();
      _longTimer = Timer(const Duration(milliseconds: 450), () {
        if (_moved || _pinching) return;
        _long = true;
        HapticFeedback.mediumImpact();
      });
    } else if (_pointers.length == 2) {
      _longTimer?.cancel();
      if (_dragging) _mouse('up', _lastPos);
      _dragging = false;
      _pinching = true;
      _pinchStartDist = math.max(_spread, 1);
      _pinchStartScale = _scale;
      _pinchStartFocal = _focal;
      _pinchStartOffset = _offset;
    }
  }

  void _move(PointerMoveEvent e) {
    if (!_pointers.containsKey(e.pointer)) return;
    _pointers[e.pointer] = e.localPosition;
    if (_pinching) {
      if (_pointers.length < 2) return;
      setState(() {
        _scale = (_pinchStartScale * _spread / _pinchStartDist).clamp(1.0, 6.0);
        _offset = _focal - (_pinchStartFocal - _pinchStartOffset) * (_scale / _pinchStartScale);
        _clampOffset();
      });
      return;
    }
    final delta = e.localPosition - _lastPos;
    _lastPos = e.localPosition;
    if (!_moved && (e.localPosition - _start).distance > 10) {
      _moved = true;
      if (!_long) _longTimer?.cancel();
    }
    if (!_moved) return;
    if (_long) {
      // Long-press then move: drag with the left button held.
      if (!_dragging) {
        _dragging = true;
        _mouse('down', _start);
      }
      final now = DateTime.now();
      if (now.difference(_lastMoveSent) > const Duration(milliseconds: 25)) {
        _lastMoveSent = now;
        _mouse('move', e.localPosition);
      }
    } else if (_scale > 1.01) {
      setState(() {
        _offset += delta;
        _clampOffset();
      });
    } else {
      // One finger scrolls: about one wheel notch per 30 points.
      _scrollAcc += delta.dy;
      final notches = (_scrollAcc / 30).truncate();
      if (notches != 0) {
        _scrollAcc -= notches * 30;
        final at = _toScreen(_start);
        if (at != null) _send({'t': 'scroll', 'x': at.dx, 'y': at.dy, 'dy': notches});
      }
    }
  }

  void _up(PointerEvent e) {
    _pointers.remove(e.pointer);
    _longTimer?.cancel();
    if (_pinching) {
      if (_pointers.isEmpty) _pinching = false;
      return;
    }
    if (_dragging) {
      _mouse('up', e.localPosition);
      _dragging = false;
    } else if (!_moved) {
      if (_long) {
        _mouse('click', _start, button: 'right');
      } else {
        // Two quick taps reach Windows as a double-click.
        _mouse('click', _start);
      }
    }
  }

  void _mouse(String type, Offset p, {String button = 'left'}) {
    final at = _toScreen(p);
    if (at == null) return;
    _send({'t': type, 'x': at.dx, 'y': at.dy, 'b': button});
  }

  void _key(String k) => _send({'t': 'key', 'k': k});

  @override
  Widget build(BuildContext context) {
    final fps = _frameTimes.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_link?.name ?? 'PC screen'),
        actions: [
          if (_monitors.length > 1)
            IconButton(
              tooltip: 'Next monitor',
              icon: const Icon(Icons.monitor_rounded),
              onPressed: () {
                setState(() {
                  _monitor = (_monitor + 1) % _monitors.length;
                  _scale = 1;
                  _offset = Offset.zero;
                });
                _reconfigure();
              },
            ),
          PopupMenuButton<_Quality>(
            tooltip: 'Quality',
            icon: const Icon(Icons.high_quality_outlined),
            initialValue: _quality,
            onSelected: (q) {
              setState(() => _quality = q);
              _reconfigure();
            },
            itemBuilder: (_) => [for (final q in _Quality.values) PopupMenuItem(value: q, child: Text(q.label))],
          ),
          IconButton(
            tooltip: _keyboard ? 'Hide keyboard' : 'Keyboard',
            icon: Icon(_keyboard ? Icons.keyboard_hide_outlined : Icons.keyboard_outlined),
            onPressed: !_viewing ? null : () => setState(() => _keyboard = !_keyboard),
          ),
          if (_link != null)
            IconButton(
              key: const Key('pc-viewing'),
              tooltip: _viewing ? 'Turn off viewing' : 'Turn on viewing',
              icon: Icon(_viewing ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              onPressed: _viewing ? _stopViewing : _connect,
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, box) {
              final size = Size(box.maxWidth, box.maxHeight);
              if (size != _viewport) {
                _viewport = size;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) setState(_clampOffset);
                });
              }
              return Stack(
                children: [
                  Positioned.fill(
                    child: Listener(
                      key: const Key('pc-surface'),
                      behavior: HitTestBehavior.opaque,
                      onPointerDown: _down,
                      onPointerMove: _move,
                      onPointerUp: _up,
                      onPointerCancel: _up,
                      onPointerSignal: (s) {
                        if (s is PointerScrollEvent) {
                          final at = _toScreen(s.localPosition);
                          if (at != null) _send({'t': 'scroll', 'x': at.dx, 'y': at.dy, 'dy': -(s.scrollDelta.dy / 40).round()});
                        }
                      },
                      child: _frame == null
                          ? const SizedBox.expand()
                          : Transform(
                              transform: Matrix4.identity()
                                ..translateByDouble(_offset.dx, _offset.dy, 0, 1)
                                ..scaleByDouble(_scale, _scale, 1, 1),
                              child: RawImage(image: _frame, fit: BoxFit.contain, filterQuality: FilterQuality.medium, width: size.width, height: size.height),
                            ),
                    ),
                  ),
                  if (_frame != null && _status == null)
                    Positioned(
                      left: Space.s,
                      top: Space.s,
                      child: _Pill(
                        '${_control ? '' : 'Watch-only · '}$fps fps · ${(_lastBytes / 1024).round()} KB${_scale > 1.01 ? ' · ${_scale.toStringAsFixed(1)}×' : ''}',
                      ),
                    ),
                  if (_status != null || (_found != null && _found!.isEmpty) || (_found != null && _found!.length > 1 && _link == null))
                    Positioned.fill(child: _overlay(context)),
                  if (_notice != null)
                    Positioned(
                      left: Space.m,
                      right: Space.m,
                      bottom: Space.m,
                      child: Material(
                        color: AppColors.surface2,
                        borderRadius: BorderRadius.circular(Radii.m),
                        child: ListTile(
                          dense: true,
                          title: Text(_notice!, style: context.text.bodySmall),
                          trailing: IconButton(icon: const Icon(Icons.close_rounded, size: 18), onPressed: () => setState(() => _notice = null)),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
          if (_keyboard) _KeyboardBar(onText: (s) => _send({'t': 'text', 's': s}), onKey: _key),
        ],
      ),
    );
  }

  Widget _overlay(BuildContext context) {
    final found = _found;
    Widget body;
    if (_link == null && found != null && found.isEmpty) {
      body = Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.desktop_windows_outlined, size: 40, color: AppColors.text3),
        const SizedBox(height: Space.m),
        Text('No PC found', style: context.text.titleMedium),
        const SizedBox(height: Space.s),
        Text(
          'Run Triangle Companion on your PC, switch on "See the screen", and add its address in Settings → MCP & Skills. '
          'On home Wi-Fi the phone must be on the same network.',
          textAlign: TextAlign.center,
          style: context.text.bodySmall,
        ),
        const SizedBox(height: Space.l),
        FilledButton.tonal(onPressed: _discover, child: const Text('Look again')),
      ]);
    } else if (_link == null && found != null && found.length > 1) {
      body = Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Which PC?', style: context.text.titleMedium),
        const SizedBox(height: Space.m),
        for (final l in found)
          ListTile(
            leading: const Icon(Icons.desktop_windows_outlined),
            title: Text(l.name),
            subtitle: Text(l.origin.host),
            onTap: () {
              setState(() => _link = l);
              _connect();
            },
          ),
      ]);
    } else {
      final connecting = _status?.endsWith('…') ?? false;
      body = Column(mainAxisSize: MainAxisSize.min, children: [
        if (connecting)
          const CircularProgressIndicator()
        else
          Icon(_viewing ? Icons.link_off_rounded : Icons.visibility_off_outlined, size: 40, color: AppColors.text3),
        const SizedBox(height: Space.l),
        Text(_status ?? '', textAlign: TextAlign.center, style: context.text.bodyMedium),
        if (!connecting && _link != null) ...[
          const SizedBox(height: Space.l),
          FilledButton.tonal(onPressed: _connect, child: Text(_viewing ? 'Try again' : 'Turn on viewing')),
        ],
      ]);
    }
    return ColoredBox(
      color: Colors.black.withValues(alpha: _frame == null ? 1 : 0.7),
      child: Center(child: Padding(padding: const EdgeInsets.all(Space.xxl), child: body)),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Space.s, vertical: Space.xs),
        decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.55), borderRadius: BorderRadius.circular(Radii.s)),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11)),
      );
}

/// Typing goes to the PC as you type; the keys row sends shortcuts.
class _KeyboardBar extends StatefulWidget {
  const _KeyboardBar({required this.onText, required this.onKey});
  final void Function(String text) onText;
  final void Function(String keys) onKey;

  @override
  State<_KeyboardBar> createState() => _KeyboardBarState();
}

class _KeyboardBarState extends State<_KeyboardBar> {
  final _field = TextEditingController();
  final _focus = FocusNode();
  String _sent = '';

  static const _keys = [
    ('Esc', 'esc'), ('Tab', 'tab'), ('⌫', 'backspace'), ('Del', 'delete'), ('←', 'left'), ('↑', 'up'), ('↓', 'down'), ('→', 'right'),
    ('Win', 'win'), ('Alt+Tab', 'alt+tab'), ('Copy', 'ctrl+c'), ('Paste', 'ctrl+v'), ('Undo', 'ctrl+z'), ('All', 'ctrl+a'),
    ('Desktop', 'win+d'), ('F5', 'f5'), ('Close', 'alt+f4'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  @override
  void dispose() {
    _field.dispose();
    _focus.dispose();
    super.dispose();
  }

  /// Sends the difference since last time: backspaces for what was removed
  /// (keyboards that autocorrect replace whole words), then the new text.
  void _changed(String now) {
    var common = 0;
    while (common < now.length && common < _sent.length && now.codeUnitAt(common) == _sent.codeUnitAt(common)) {
      common++;
    }
    final removed = _sent.length - common;
    if (removed > 0) widget.onKey(List.filled(math.min(removed, 10), 'backspace').join(' '));
    for (var i = 10; i < removed; i += 10) {
      widget.onKey(List.filled(math.min(removed - i, 10), 'backspace').join(' '));
    }
    if (now.length > common) widget.onText(now.substring(common));
    _sent = now;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      child: SafeArea(
        top: false,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: Space.s, vertical: Space.xs),
              children: [
                for (final (label, k) in _keys)
                  Padding(
                    padding: const EdgeInsets.only(right: Space.xs),
                    child: ActionChip(label: Text(label), onPressed: () => widget.onKey(k), visualDensity: VisualDensity.compact),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.m, 0, Space.m, Space.s),
            child: TextField(
              controller: _field,
              focusNode: _focus,
              autocorrect: false,
              enableSuggestions: false,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(hintText: 'Type on the PC…', isDense: true),
              onChanged: _changed,
              onSubmitted: (_) {
                widget.onKey('enter');
                _field.clear();
                _sent = '';
                _focus.requestFocus();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
