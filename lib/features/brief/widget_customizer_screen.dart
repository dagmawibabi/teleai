import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import 'brief_store.dart';
import 'brief_widget.dart';

/// Settings → Home-screen widget: how the Brief widget looks, with a live
/// preview. Changes reach the widget on the home screen right away.
class WidgetCustomizerScreen extends ConsumerWidget {
  const WidgetCustomizerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final look = ref.watch(widgetLookProvider);
    final ctl = ref.read(widgetLookProvider.notifier);
    final brief = ref.watch(briefStoreProvider).briefs.where((b) => b.error == null && b.text.isNotEmpty).firstOrNull;
    final text = brief == null
        ? 'TL;DR: three people are waiting on you, the team moved Friday\'s meeting to 10:00, and a delivery arrives today.\n\n'
              '🔴 Liya asked whether you can review the budget by tonight. Dawit wants the slides.'
        : BriefHomeWidget.forWidget(brief.text, look.content);

    Widget section(String title, List<Widget> children) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.xs, Space.xl, Space.xs, Space.s),
          child: Text(title.toUpperCase(), style: context.text.labelSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(Radii.l),
            border: Border.all(color: AppColors.line),
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(type: MaterialType.transparency, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children)),
        ),
      ],
    );

    Widget slider(String label, double value, double min, double max, int divisions, String shown, ValueChanged<double> onChanged) => Padding(
      padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Text(label, style: context.text.titleSmall), const Spacer(), Text(shown, style: context.text.labelSmall)]),
          Slider(value: value.clamp(min, max), min: min, max: max, divisions: divisions, label: shown, onChanged: onChanged),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home-screen widget'),
        actions: [
          IconButton(
            tooltip: 'Reset',
            icon: const Icon(Icons.restart_alt_rounded),
            onPressed: () => ctl.update((_) => WidgetLook(accent: AppColors.activeAccent.toARGB32())),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
            children: [
              // On a wallpaper-ish backdrop, as on the home screen.
              Container(
                padding: const EdgeInsets.all(Space.xl),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Radii.xl),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3A4E7A), Color(0xFF7A4E6A), Color(0xFFC08A5A)],
                  ),
                ),
                child: _Preview(look: look, title: brief == null ? '☀️ Morning brief' : '${brief.kind.emoji} ${brief.kind.label}', text: text),
              ),
              if (Platform.isAndroid)
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.xs, Space.m, Space.xs, 0),
                  child: Text(
                    'Add it from your home screen: long-press an empty spot → Widgets → Triangle → Brief. It updates with every new brief.',
                    style: context.text.bodySmall,
                  ),
                ),
              section('Text', [
                slider('Text size', look.fontSize, 9, 20, 22, '${look.fontSize.toStringAsFixed(1)} sp', (v) => ctl.update((l) => l.copyWith(fontSize: (v * 2).round() / 2))),
                slider('Title size', look.titleSize, 10, 24, 28, '${look.titleSize.toStringAsFixed(1)} sp', (v) => ctl.update((l) => l.copyWith(titleSize: (v * 2).round() / 2))),
                slider('Lines of text', look.maxLines.toDouble(), 2, 30, 28, '${look.maxLines}', (v) => ctl.update((l) => l.copyWith(maxLines: v.round()))),
                const SizedBox(height: Space.s),
              ]),
              section('Content', [
                Padding(
                  padding: const EdgeInsets.all(Space.l),
                  child: SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<WidgetContent>(
                      showSelectedIcon: false,
                      segments: [for (final c in WidgetContent.values) ButtonSegment(value: c, label: Text(c.label))],
                      selected: {look.content},
                      onSelectionChanged: (v) => ctl.update((l) => l.copyWith(content: v.first)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                  child: Text(look.content.explanation, style: context.text.bodySmall),
                ),
                SwitchListTile(
                  title: const Text('Title'),
                  value: look.showTitle,
                  onChanged: (v) => ctl.update((l) => l.copyWith(showTitle: v)),
                ),
                SwitchListTile(
                  title: const Text('When it was written'),
                  value: look.showTime,
                  onChanged: (v) => ctl.update((l) => l.copyWith(showTime: v)),
                ),
                SwitchListTile(
                  title: const Text('"Open Triangle" line'),
                  value: look.showFooter,
                  onChanged: (v) => ctl.update((l) => l.copyWith(showFooter: v)),
                ),
              ]),
              section('Background', [
                Padding(
                  padding: const EdgeInsets.all(Space.l),
                  child: Wrap(
                    spacing: Space.s,
                    runSpacing: Space.s,
                    children: [
                      for (final t in WidgetTheme.values)
                        ChoiceChip(
                          avatar: CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(t == WidgetTheme.accent ? AppColors.activeAccent.toARGB32() : t.background),
                          ),
                          label: Text(t.label),
                          selected: look.theme == t,
                          onSelected: (_) => ctl.update(
                            (l) => l.copyWith(theme: t, accent: t == WidgetTheme.accent ? AppColors.activeAccent.toARGB32() : null),
                          ),
                        ),
                    ],
                  ),
                ),
                slider('Opacity', look.opacity.toDouble(), 0, 100, 20, '${look.opacity}%', (v) => ctl.update((l) => l.copyWith(opacity: v.round()))),
                const SizedBox(height: Space.s),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

/// The widget as the launcher draws it.
class _Preview extends StatelessWidget {
  const _Preview({required this.look, required this.title, required this.text});
  final WidgetLook look;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Color(look.background).withValues(alpha: look.opacity / 100),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (look.showTitle || look.showTime)
          Row(
            children: [
              if (look.showTitle)
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(look.theme.title), fontSize: look.titleSize, fontWeight: FontWeight.bold),
                  ),
                )
              else
                const Spacer(),
              if (look.showTime) Text('Sat 24 Oct, 08:00', style: TextStyle(color: Color(look.theme.body), fontSize: 11)),
            ],
          ),
        const SizedBox(height: 8),
        Text(
          text,
          maxLines: look.maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Color(look.theme.body), fontSize: look.fontSize, height: 1.3),
        ),
        if (look.showFooter) ...[
          const SizedBox(height: 6),
          Text('Open Triangle ›', style: TextStyle(color: Color(look.theme.body), fontSize: 11)),
        ],
      ],
    ),
  );
}
