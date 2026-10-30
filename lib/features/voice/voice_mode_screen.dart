import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../chat/data/chat_controller.dart';
import '../chat/domain/chat_models.dart';
import '../settings/data/settings.dart';
import '../settings/presentation/settings_screen.dart';
import 'voice_session.dart';

/// Full-screen voice mode. The orb follows your voice and the AI's; drag it
/// down and the conversation shows behind it while you keep talking.
class VoiceModeScreen extends ConsumerStatefulWidget {
  const VoiceModeScreen({super.key});

  static Future<void> open(BuildContext context) => Navigator.of(context).push(
    PageRouteBuilder<void>(
      opaque: true,
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (_, _, _) => const VoiceModeScreen(),
      transitionsBuilder: (_, a, _, child) => FadeTransition(opacity: a, child: child),
    ),
  );

  @override
  ConsumerState<VoiceModeScreen> createState() => _VoiceModeScreenState();
}

class _VoiceModeScreenState extends ConsumerState<VoiceModeScreen> with TickerProviderStateMixin, WidgetsBindingObserver {
  static const _black = Colors.black;

  late final VoiceSession _session;

  /// 0: the orb fills the screen. 1: it's down low, the conversation behind it.
  late final AnimationController _reveal = AnimationController(vsync: this, duration: const Duration(milliseconds: 320));
  late final Ticker _ticker;
  final _orb = ValueNotifier<_OrbState>(const _OrbState());
  final _text = TextEditingController();
  final _focus = FocusNode();
  final List<Attachment> _files = [];
  double _smoothed = 0;
  double _time = 0;
  Duration _lastTick = Duration.zero;
  bool _closing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _session = ref.read(voiceSessionProvider);
    _ticker = createTicker(_tick)..start();
    _focus.addListener(() {
      if (_focus.hasFocus) _reveal.animateTo(1);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _session.start());
  }

  void _tick(Duration now) {
    final dt = (now - _lastTick).inMicroseconds / 1e6;
    _lastTick = now;
    final target = _session.level;
    // Quick to rise with a voice, slow to fall, like a real level meter.
    final rate = target > _smoothed ? 7.0 : 2.5;
    _smoothed += (target - _smoothed) * (1 - math.exp(-rate * dt));
    _time += dt * (0.5 + _smoothed * 1.1);
    _orb.value = _OrbState(time: _time, level: _smoothed, phase: _session.phase);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _session.setForeground(true);
    } else if (state == AppLifecycleState.paused) {
      _session.setForeground(false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_session.close());
    _ticker.dispose();
    _reveal.dispose();
    _orb.dispose();
    _text.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (_closing) return;
    _closing = true;
    await _session.close();
    if (mounted) Navigator.of(context).pop();
  }

  void _dragEnd(DragEndDetails d) {
    final v = d.primaryVelocity ?? 0;
    _reveal.animateTo(v > 300 ? 1 : (v < -300 ? 0 : (_reveal.value > 0.4 ? 1 : 0)), curve: Curves.easeOutCubic);
  }

  Future<void> _attach() async {
    final added = <Attachment>[];
    for (final f in await FilePicker.pickFiles()) {
      if (f.path != null) added.add(await ChatController.attach(f.path!, name: f.name));
    }
    if (mounted) setState(() => _files.addAll(added));
  }

  void _sendTyped() {
    final text = _text.text;
    final files = [..._files];
    if (text.trim().isEmpty && files.isEmpty) return;
    _text.clear();
    setState(_files.clear);
    _focus.unfocus();
    unawaited(_session.sendText(text, attachments: files));
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(voiceSessionProvider);
    final look = ref.watch(settingsProvider.select((s) => (s.orbShape, s.rainbowLogo)));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (popped, _) {
        if (!popped) _close();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: _black,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, box) => AnimatedBuilder(
                      animation: _reveal,
                      builder: (context, _) => _stage(context, box, session, shape: look.$1, rainbow: look.$2),
                    ),
                  ),
                ),
                _controls(context, session),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _stage(BuildContext context, BoxConstraints box, VoiceSession session, {required OrbShape shape, required bool rainbow}) {
    final t = Curves.easeInOut.transform(_reveal.value);
    final w = box.maxWidth, h = box.maxHeight;
    final big = math.min(w * 0.58, h * 0.5);
    final small = math.min(w * 0.25, 112.0);
    final size = ui.lerpDouble(big, small, t)!;
    final centerY = ui.lerpDouble(h * 0.47, h - small / 2 - 26, t)!;
    // How far the orb travels when dragged all the way.
    final travel = math.max(1.0, h * 0.53 - small / 2 - 26);
    return Stack(
      children: [
        if (_reveal.value > 0)
          Positioned.fill(
            bottom: small + 34,
            top: 60,
            child: Opacity(
              opacity: t,
              child: IgnorePointer(ignoring: t < 0.5, child: _Transcript(heard: session.heard)),
            ),
          ),
        Positioned(
          left: Space.m,
          top: Space.s,
          child: _CircleButton(
            key: const Key('voice-transcript'),
            icon: t > 0.5 ? Icons.fullscreen_rounded : Icons.notes_rounded,
            tooltip: t > 0.5 ? 'Just the orb' : 'Show the conversation',
            onTap: () => _reveal.animateTo(t > 0.5 ? 0 : 1, curve: Curves.easeOutCubic),
          ),
        ),
        Positioned(
          right: Space.m,
          top: Space.s,
          child: _CircleButton(
            icon: Icons.tune_rounded,
            tooltip: 'Voice settings',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SettingsScreen(section: SettingsSection.voice)),
            ),
          ),
        ),
        Positioned(
          left: (w - size) / 2,
          top: centerY - size / 2,
          width: size,
          height: size,
          child: GestureDetector(
            key: const Key('voice-orb'),
            behavior: HitTestBehavior.opaque,
            onTap: session.interrupt,
            onVerticalDragUpdate: (d) => _reveal.value = (_reveal.value + d.delta.dy / travel).clamp(0.0, 1.0),
            onVerticalDragEnd: _dragEnd,
            child: Semantics(
              button: true,
              label: 'Voice orb, ${session.status}. Tap to interrupt, drag down to see the conversation.',
              child: RepaintBoundary(child: CustomPaint(painter: _OrbPainter(_orb, shape: shape, rainbow: rainbow))),
            ),
          ),
        ),
        if (t < 0.5 || session.problem != null || session.approval != null)
          Positioned(
            left: Space.xl,
            right: Space.xl,
            bottom: t < 0.5 ? math.max(Space.m, h - centerY - size / 2 - 96) : small + 40,
            child: Opacity(
              opacity: t < 0.5 ? 1 - t * 2 : 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (session.approval case final part?) _ApprovalPrompt(part: part),
                  if (t < 0.5 || session.problem != null)
                    Text(
                      session.status,
                      key: const Key('voice-status'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFFB9B9C2), fontSize: 15),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _controls(BuildContext context, VoiceSession session) {
    final typed = _text.text.trim().isNotEmpty || _files.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.xl, Space.s, Space.xl, Space.m),
      child: Row(
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.symmetric(horizontal: Space.s),
              decoration: BoxDecoration(
                color: const Color(0xFF2B2B2E),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color(0xFF3A3A3E)),
              ),
              child: Row(
                children: [
                  IconButton(
                    tooltip: 'Attach',
                    icon: Badge(
                      isLabelVisible: _files.isNotEmpty,
                      label: Text('${_files.length}'),
                      child: const Icon(Icons.add_rounded, color: Colors.white),
                    ),
                    onPressed: _attach,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _text,
                      focusNode: _focus,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.send,
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      cursorColor: Colors.white,
                      onChanged: (_) => setState(() {}),
                      onSubmitted: (_) => _sendTyped(),
                      decoration: const InputDecoration(
                        hintText: 'Ask Triangle',
                        hintStyle: TextStyle(color: Color(0xFFA0A0A8)),
                        isDense: true,
                        filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Space.m),
          if (typed)
            _CircleButton(icon: Icons.arrow_upward_rounded, tooltip: 'Send', onTap: _sendTyped, size: 52)
          else
            _CircleButton(
              key: const Key('voice-mute'),
              icon: session.muted ? Icons.mic_off_outlined : Icons.mic_none_rounded,
              tooltip: session.muted ? 'Turn the mic on' : 'Turn the mic off',
              onTap: session.toggleMute,
              size: 52,
            ),
          const SizedBox(width: Space.m),
          _CircleButton(
            key: const Key('voice-close'),
            icon: Icons.close_rounded,
            tooltip: 'End voice mode',
            onTap: _close,
            size: 52,
            light: true,
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({super.key, required this.icon, required this.tooltip, required this.onTap, this.size = 48, this.light = false});
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final double size;
  final bool light;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: Material(
      color: light ? Colors.white : const Color(0xFF2B2B2E),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(dimension: size, child: Icon(icon, color: light ? Colors.black : Colors.white, size: 24)),
      ),
    ),
  );
}

/// Allow or Deny for a tool the answer wants to run.
class _ApprovalPrompt extends ConsumerWidget {
  const _ApprovalPrompt({required this.part});
  final ToolPart part;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.read(chatControllerProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(bottom: Space.m),
      padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.s, Space.s),
      decoration: BoxDecoration(color: const Color(0xFF232326), borderRadius: BorderRadius.circular(Radii.l)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(voiceToolLabel(part), style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () => chat.deny(part.callId), child: const Text('Deny', style: TextStyle(color: Color(0xFFB9B9C2)))),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                onPressed: () => chat.approve(part.callId),
                child: const Text('Allow'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// The conversation so far, newest at the bottom, and the words being said.
class _Transcript extends ConsumerWidget {
  const _Transcript({required this.heard});
  final String heard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversation = ref.watch(chatControllerProvider).conversation;
    const color = Color(0xFF2B2B2E);
    final items = <Widget>[];
    for (final e in conversation.entries) {
      if (e is UserEntry && (e.text.trim().isNotEmpty || e.attachments.isNotEmpty)) {
        items.add(_UserBubble(text: e.text.trim().isEmpty ? e.attachments.map((a) => a.name).join(', ') : e.text, color: color));
      } else if (e is AssistantEntry) {
        final text = [for (final s in e.steps) s.text].where((t) => t.trim().isNotEmpty).join('\n\n');
        if (text.isNotEmpty) items.add(_AiText(text: text));
        if (e.error != null) items.add(_AiText(text: e.error!));
      }
    }
    if (heard.trim().isNotEmpty) items.add(_UserBubble(text: heard, color: color, live: true));
    if (items.isEmpty) {
      return const Center(child: Text('Your conversation shows here.', style: TextStyle(color: Color(0xFF8A8A92))));
    }
    return ListView.builder(
      key: const Key('voice-transcript-list'),
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: Space.xl, vertical: Space.m),
      itemCount: items.length,
      itemBuilder: (_, i) => items[items.length - 1 - i],
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.text, required this.color, this.live = false});
  final String text;
  final Color color;
  final bool live;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.75),
      margin: const EdgeInsets.only(left: Space.x4, top: Space.m, bottom: Space.m),
      padding: const EdgeInsets.symmetric(horizontal: Space.xl, vertical: Space.m),
      decoration: BoxDecoration(color: live ? color.withValues(alpha: 0.55) : color, borderRadius: BorderRadius.circular(26)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.4)),
    ),
  );
}

class _AiText extends StatelessWidget {
  const _AiText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: Space.m),
    // Always dark, whatever the app's theme: this screen is black. Theme.of
    // fills in the font sizes a bare ThemeData.dark() doesn't have.
    child: Theme(
      data: ThemeData.dark(),
      child: Builder(
        builder: (context) => MarkdownBody(
          data: text,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: const TextStyle(color: Colors.white, fontSize: 16, height: 1.45),
          ),
        ),
      ),
    ),
  );
}

@immutable
class _OrbState {
  const _OrbState({this.time = 0, this.level = 0, this.phase = VoicePhase.muted});
  final double time;
  final double level;
  final VoicePhase phase;
}

/// A triangle or sphere of night sky: a black top, white clouds rolling along
/// a band across the middle, with a little gray where they meet. Your voice
/// and the AI's push the clouds higher and faster and swell it. With the
/// rainbow logo on, the sky is every colour, turning as it moves.
class _OrbPainter extends CustomPainter {
  _OrbPainter(this.state, {required this.shape, required this.rainbow}) : super(repaint: state);
  final ValueListenable<_OrbState> state;
  final OrbShape shape;
  final bool rainbow;

  /// The logo's triangle with soft corners, centred on its centroid.
  static Path _triangle(Offset center, double reach) {
    final points = [
      for (final degrees in const [-90.0, 30.0, 150.0])
        center + Offset.fromDirection(degrees * math.pi / 180, reach),
    ];
    final path = Path();
    for (var i = 0; i < 3; i++) {
      final corner = points[i], next = points[(i + 1) % 3], last = points[(i + 2) % 3];
      final from = Offset.lerp(corner, last, 0.1)!, to = Offset.lerp(corner, next, 0.1)!;
      i == 0 ? path.moveTo(from.dx, from.dy) : path.lineTo(from.dx, from.dy);
      path.quadraticBezierTo(corner.dx, corner.dy, to.dx, to.dy);
    }
    return path..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final s = state.value;
    final r0 = size.shortestSide / 2;
    final thinking = s.phase == VoicePhase.thinking || s.phase == VoicePhase.transcribing;
    final breathe = thinking ? 0.03 * math.sin(s.time * 5) : 0.012 * math.sin(s.time * 1.6);
    final r = r0 * (0.9 + s.level * 0.07 + breathe);
    final center = size.center(Offset.zero);

    // A triangle reaches further out, to look as big as the sphere.
    final bounds = Rect.fromCircle(center: center, radius: shape == OrbShape.triangle ? r * 1.12 : r);
    final outline = shape == OrbShape.triangle ? _triangle(center, bounds.width / 2) : (Path()..addOval(bounds));
    canvas.save();
    canvas.clipPath(outline);
    canvas.drawRect(
      bounds,
      Paint()
        ..shader = rainbow
            ? ui.Gradient.sweep(center, [
                for (var i = 0; i <= 6; i++) HSVColor.fromAHSV(1, (s.time * 100 + i * 60) % 360, 0.72, 1).toColor(),
              ], const [0, 1 / 6, 2 / 6, 3 / 6, 4 / 6, 5 / 6, 1])
            : ui.Gradient.linear(bounds.topCenter, bounds.bottomCenter, const [
                Color(0xFF000000),
                Color(0xFF17171A),
                Color(0xFFB4B4B8),
                Color(0xFFF2F2F3),
              ], const [0, 0.42, 0.62, 1]),
    );

    // The clouds: soft white puffs along a wave, rising with the voice.
    final horizon = center.dy + r * (0.1 - s.level * 0.12);
    final blur = MaskFilter.blur(BlurStyle.normal, r * 0.11);
    for (var i = 0; i < 11; i++) {
      final a = i * 1.7;
      final x = center.dx + r * 1.2 * math.sin(a + s.time * (0.22 + i * 0.015));
      final swell = math.sin(a * 1.3 + s.time * 1.2);
      final y = horizon + r * (0.1 + 0.2 * math.sin(a * 2.1)) + r * (0.07 + s.level * 0.13) * swell;
      final radius = r * (0.2 + 0.1 * math.sin(a * 3.3).abs() + s.level * 0.05);
      canvas.drawCircle(
        Offset(x, y),
        radius,
        Paint()
          ..color = Colors.white.withValues(alpha: (0.5 + 0.2 * math.sin(a).abs()) * (rainbow ? 0.55 : 1))
          ..maskFilter = blur,
      );
    }
    // Wisps thrown up by a loud voice.
    final wisp = MaskFilter.blur(BlurStyle.normal, r * 0.05);
    for (var i = 0; i < 6; i++) {
      final a = i * 2.4;
      final x = center.dx + r * 0.85 * math.sin(a + s.time * 0.31);
      final y = horizon - r * (0.1 + 0.14 * i / 5 + s.level * 0.14) + r * 0.05 * math.sin(s.time * 1.7 + a);
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, y), width: r * 0.34, height: r * 0.1),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.2 + s.level * 0.15)
          ..maskFilter = wisp,
      );
    }
    // The lower part stays bright and solid, and lets the rainbow show through.
    canvas.drawRect(
      Rect.fromLTRB(bounds.left, horizon + r * 0.28, bounds.right, bounds.bottom),
      Paint()
        ..shader = ui.Gradient.linear(Offset(center.dx, horizon + r * 0.28), bounds.bottomCenter, [
          Colors.white.withValues(alpha: 0.0),
          rainbow ? Colors.white.withValues(alpha: 0.35) : const Color(0xFFF2F2F3),
        ]),
    );
    if (s.phase == VoicePhase.muted) {
      canvas.drawRect(bounds, Paint()..color = Colors.black.withValues(alpha: 0.42));
    }
    canvas.restore();
    // A faint gray rim, so the black top still reads as a shape on black.
    canvas.drawPath(
      outline,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = const Color(0xFF55555A),
    );
  }

  @override
  bool shouldRepaint(_OrbPainter old) => old.state != state || old.shape != shape || old.rainbow != rainbow;
}
