import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart' show JevAnswer, JevClient;

import '../../../app/theme.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../ai/data/ai.dart';
import '../../ai/data/decision_settings.dart';
import '../../telegram/data/telegram_tools.dart' show ToolCategory;
import 'settings_screen.dart';
import 'tools_screen.dart' show FeatureTools;

/// AI & models → Decisions: TypeSafe Jev, a model that answers typed
/// questions (yes/no, one of several, a score) with probabilities. Its key,
/// model, how answers are used, the connection, a place to try it, and the
/// assistant's Jev tools.
class DecisionsSettingsPage extends ConsumerWidget {
  const DecisionsSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(decisionSettingsProvider);
    if (!s.loaded) return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    final ctl = ref.read(decisionSettingsProvider.notifier);
    final hasKey = s.apiKey.trim().isNotEmpty;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.xxl),
          children: [
            SettingsFeatureSwitch(
              icon: Icons.balance_rounded,
              title: 'Decisions',
              on: 'The assistant can ask Jev for calibrated yes/no, choice and score answers.',
              off: 'Off: the Jev tools are hidden from the assistant.',
              value: s.enabled,
              onChanged: (v) => ctl.update(enabled: v),
            ),
            const SettingsHeader('Key'),
            SettingsCard(
              children: [
                SettingsKeyTile(
                  title: 'TypeSafe Jev',
                  subtitle: 'console.typesafe.ai → API keys. Kept in this phone\'s secure storage.',
                  value: s.apiKey,
                  onSave: ctl.setApiKey,
                  verify: (k) => JevClient(apiKey: k, baseUrl: s.baseUrl).verify(),
                  help: Uri.parse('https://console.typesafe.ai'),
                ),
              ],
            ),
            const SettingsHeader('Model'),
            SettingsCard(children: [_ModelPicker(model: s.model, hasKey: hasKey)]),
            const SettingsHeader('How answers are used'),
            SettingsCard(
              children: [
                _SliderRow(
                  icon: Icons.rule_rounded,
                  title: 'Yes from',
                  subtitle: 'A yes/no answer counts as yes at this probability or above.',
                  value: s.threshold,
                  onChanged: (v) => ctl.update(threshold: v),
                ),
                const Divider(indent: 56),
                SwitchListTile(
                  secondary: lead(const Icon(Icons.help_outline_rounded)),
                  title: const Text('Flag unsure answers'),
                  subtitle: Text(
                    'Choice and score answers below a confidence are marked uncertain, so the assistant asks you instead of acting.',
                    style: context.text.bodySmall,
                  ),
                  value: s.gateConfidence,
                  onChanged: (v) => ctl.update(gateConfidence: v),
                ),
                if (s.gateConfidence)
                  _SliderRow(
                    title: 'Unsure below',
                    subtitle: 'Confidence under this is uncertain.',
                    value: s.minConfidence,
                    onChanged: (v) => ctl.update(minConfidence: v),
                  ),
                const Divider(indent: 56),
                SwitchListTile(
                  secondary: lead(const Icon(Icons.notes_rounded)),
                  title: const Text('Long content'),
                  subtitle: Text('Lets Jev read much longer content (TypeSafe\'s long-context mode).', style: context.text.bodySmall),
                  value: s.longContext,
                  onChanged: (v) => ctl.update(longContext: v),
                ),
              ],
            ),
            const SettingsHeader('Connection'),
            SettingsCard(
              children: [
                ListTile(
                  leading: lead(const Icon(Icons.cable_rounded)),
                  title: Text(Uri.tryParse(s.baseUrl)?.host ?? s.baseUrl),
                  subtitle: Text(
                    '${s.maxRetries} ${s.maxRetries == 1 ? 'retry' : 'retries'} · ${s.timeoutSeconds} s per attempt',
                    style: context.text.bodySmall,
                  ),
                  trailing: Icon(Icons.chevron_right_rounded, color: AppColors.text3),
                  onTap: () => showFormSheet<void>(context, builder: (_) => const _ConnectionSheet()),
                ),
              ],
            ),
            const SettingsHeader('Try it'),
            SettingsCard(children: [_Playground(enabled: hasKey && s.enabled)]),
            const SettingsHeader('Assistant tools'),
            const FeatureTools(category: ToolCategory.decisions),
          ],
        ),
      ),
    );
  }
}

/// A 0–1 setting with its value beside the title.
class _SliderRow extends StatelessWidget {
  const _SliderRow({this.icon, required this.title, required this.subtitle, required this.value, required this.onChanged});
  final IconData? icon;
  final String title;
  final String subtitle;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.xs),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!AppLook.leadingIcons)
          const SizedBox.shrink()
        else if (icon != null) ...[Icon(icon, color: AppColors.text2), const SizedBox(width: Space.l)] else const SizedBox(width: 40),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(title, style: context.text.titleSmall)),
                  Text('${(value * 100).round()}%', style: context.text.titleSmall?.copyWith(fontFeatures: tabularFigures)),
                ],
              ),
              Text(subtitle, style: context.text.bodySmall),
              Slider(value: value.clamp(0, 1), divisions: 20, label: '${(value * 100).round()}%', onChanged: onChanged),
            ],
          ),
        ),
      ],
    ),
  );
}

/// The model: aliases and versions as chips, more from the key's list.
class _ModelPicker extends ConsumerStatefulWidget {
  const _ModelPicker({required this.model, required this.hasKey});
  final String model;
  final bool hasKey;

  @override
  ConsumerState<_ModelPicker> createState() => _ModelPickerState();
}

class _ModelPickerState extends ConsumerState<_ModelPicker> {
  List<String> _models = JevClient.models;
  bool _loading = false;

  Future<void> _refresh() async {
    setState(() => _loading = true);
    try {
      final ids = await ref.read(aiProvider).jev.client.listModelIds();
      if (mounted && ids.isNotEmpty) setState(() => _models = {...JevClient.models, ...ids}.toList());
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t list models: $e', icon: Icons.error_outline_rounded);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _custom() async {
    final ctrl = TextEditingController(text: widget.model);
    final picked = await showFormSheet<String>(
      context,
      builder: (sheet) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pin a model version', style: sheet.text.titleMedium),
          const SizedBox(height: Space.xs),
          Text('An alias (jev-latest) follows new releases; a version (jev-1.13.0) never changes.', style: sheet.text.bodySmall),
          const SizedBox(height: Space.l),
          TextField(
            controller: ctrl,
            autofocus: true,
            autocorrect: false,
            style: const TextStyle(fontFamily: 'monospace'),
            decoration: const InputDecoration(hintText: 'jev-1.13.0'),
            onSubmitted: (v) => Navigator.pop(sheet, v.trim()),
          ),
          const SizedBox(height: Space.l),
          FilledButton(onPressed: () => Navigator.pop(sheet, ctrl.text.trim()), child: const Text('Use this model')),
        ],
      ),
    );
    ctrl.dispose();
    if (picked != null && picked.isNotEmpty) await ref.read(decisionSettingsProvider.notifier).update(model: picked);
  }

  @override
  Widget build(BuildContext context) {
    final ctl = ref.read(decisionSettingsProvider.notifier);
    final models = {..._models, widget.model}.toList();
    return Padding(
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.model, style: context.text.titleSmall?.copyWith(fontFamily: 'monospace')),
                    Text(
                      widget.model.contains('latest') || widget.model.contains('preview')
                          ? 'Follows new releases'
                          : 'Pinned: answers stay consistent over time',
                      style: context.text.bodySmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Models this key can use',
                onPressed: !widget.hasKey || _loading ? null : _refresh,
                icon: _loading
                    ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.refresh_rounded),
              ),
            ],
          ),
          const SizedBox(height: Space.m),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final m in models)
                ChoiceChip(
                  label: Text(m, style: const TextStyle(fontFamily: 'monospace', fontSize: 12.5)),
                  selected: m == widget.model,
                  onSelected: (_) => ctl.update(model: m),
                ),
              ActionChip(avatar: const Icon(Icons.edit_outlined, size: 16), label: const Text('Other version'), onPressed: _custom),
            ],
          ),
        ],
      ),
    );
  }
}

/// Where Jev is reached, and how hard to try.
class _ConnectionSheet extends ConsumerStatefulWidget {
  const _ConnectionSheet();

  @override
  ConsumerState<_ConnectionSheet> createState() => _ConnectionSheetState();
}

class _ConnectionSheetState extends ConsumerState<_ConnectionSheet> {
  late final _url = TextEditingController(text: ref.read(decisionSettingsProvider).baseUrl);
  String? _error;

  @override
  void dispose() {
    _url.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final raw = _url.text.trim();
    final uri = Uri.tryParse(raw);
    final local = uri != null && JevClient.isLoopbackHost(uri.host);
    if (uri == null || !uri.hasAuthority || !(uri.scheme == 'https' || (uri.scheme == 'http' && local))) {
      setState(() => _error = 'Use an https:// address (http only for localhost).');
      return;
    }
    await ref.read(decisionSettingsProvider.notifier).update(baseUrl: raw);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(decisionSettingsProvider);
    final ctl = ref.read(decisionSettingsProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Connection', style: context.text.titleMedium),
        const SizedBox(height: Space.xs),
        Text('TypeSafe\'s API, or a compatible server or proxy.', style: context.text.bodySmall),
        const SizedBox(height: Space.l),
        TextField(
          controller: _url,
          autocorrect: false,
          keyboardType: TextInputType.url,
          style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
          onChanged: (_) => setState(() => _error = null),
          decoration: InputDecoration(
            hintText: 'https://api.typesafe.ai',
            errorText: _error,
            suffixIcon: IconButton(
              tooltip: 'TypeSafe\'s address',
              icon: const Icon(Icons.restart_alt_rounded, size: 18),
              onPressed: () => setState(() => _url.text = 'https://api.typesafe.ai'),
            ),
          ),
        ),
        const SizedBox(height: Space.l),
        Text('Retries: ${s.maxRetries}', style: context.text.titleSmall),
        Text('Rate-limit and overload errors are tried again, billed once.', style: context.text.bodySmall),
        Slider(
          value: s.maxRetries.toDouble(),
          max: 5,
          divisions: 5,
          label: '${s.maxRetries}',
          onChanged: (v) => ctl.update(maxRetries: v.round()),
        ),
        Text('Timeout: ${s.timeoutSeconds} s', style: context.text.titleSmall),
        Text('How long one attempt may take.', style: context.text.bodySmall),
        Slider(
          value: s.timeoutSeconds.toDouble(),
          min: 5,
          max: 300,
          divisions: 59,
          label: '${s.timeoutSeconds} s',
          onChanged: (v) => ctl.update(timeoutSeconds: v.round()),
        ),
        const SizedBox(height: Space.m),
        FilledButton(onPressed: _save, child: const Text('Save')),
      ],
    );
  }
}

enum _Kind { noul, choice, score }

/// Ask Jev one question here, to see what the assistant would get.
class _Playground extends ConsumerStatefulWidget {
  const _Playground({required this.enabled});
  final bool enabled;

  @override
  ConsumerState<_Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends ConsumerState<_Playground> {
  final _state = TextEditingController(text: 'Hi, my card was charged twice this month and I need it fixed today.');
  final _question = TextEditingController(text: 'Is this message about billing?');
  final _options = TextEditingController(text: 'billing, technical, sales');
  _Kind _kind = _Kind.noul;
  JevAnswer? _answer;
  String? _error;
  bool _running = false;

  @override
  void dispose() {
    _state.dispose();
    _question.dispose();
    _options.dispose();
    super.dispose();
  }

  void _setKind(_Kind k) => setState(() {
    _kind = k;
    _answer = null;
    switch (k) {
      case _Kind.noul:
        _question.text = 'Is this message about billing?';
      case _Kind.choice:
        _question.text = 'Which team should handle it?';
        _options.text = 'billing, technical, sales';
      case _Kind.score:
        _question.text = 'How urgent is it?';
        _options.text = 'not urgent, this week, today, right now';
    }
  });

  Future<void> _run() async {
    final jev = ref.read(aiProvider).jev;
    final options = [for (final o in _options.text.split(',')) if (o.trim().isNotEmpty) o.trim()];
    setState(() {
      _running = true;
      _error = null;
      _answer = null;
    });
    try {
      final a = switch (_kind) {
        _Kind.noul => await jev.client.noul(_state.text, _question.text, model: jev.model),
        _Kind.choice => await jev.client.choice(_state.text, _question.text, {for (final o in options) o: ''}, model: jev.model),
        _Kind.score => await jev.client.score(_state.text, _question.text, options, model: jev.model),
      };
      if (mounted) setState(() => _answer = a);
    } catch (e) {
      if (mounted) setState(() => _error = '$e');
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final threshold = ref.watch(decisionSettingsProvider).threshold;
    return Padding(
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<_Kind>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: _Kind.noul, label: Text('Yes/no')),
              ButtonSegment(value: _Kind.choice, label: Text('Choice')),
              ButtonSegment(value: _Kind.score, label: Text('Score')),
            ],
            selected: {_kind},
            onSelectionChanged: (v) => _setKind(v.first),
          ),
          const SizedBox(height: Space.m),
          TextField(
            controller: _state,
            minLines: 2,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Content to judge'),
          ),
          const SizedBox(height: Space.s),
          TextField(controller: _question, decoration: const InputDecoration(hintText: 'Question')),
          if (_kind != _Kind.noul) ...[
            const SizedBox(height: Space.s),
            TextField(
              controller: _options,
              decoration: InputDecoration(
                hintText: _kind == _Kind.choice ? 'Options, separated by commas' : 'Levels, lowest first, separated by commas',
              ),
            ),
          ],
          const SizedBox(height: Space.m),
          FilledButton.icon(
            onPressed: widget.enabled && !_running ? _run : null,
            icon: _running
                ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.play_arrow_rounded),
            label: Text(widget.enabled ? 'Ask Jev' : 'Add a key and turn Decisions on'),
          ),
          if (_error != null) ...[
            const SizedBox(height: Space.m),
            Text(_error!, style: context.text.bodySmall?.copyWith(color: AppColors.danger)),
          ],
          if (_answer case final a?) ...[
            const SizedBox(height: Space.l),
            _AnswerView(answer: a, threshold: threshold),
          ],
        ],
      ),
    );
  }
}

/// An answer as probability bars, most likely first.
class _AnswerView extends StatelessWidget {
  const _AnswerView({required this.answer, required this.threshold});
  final JevAnswer answer;
  final double threshold;

  @override
  Widget build(BuildContext context) {
    final a = answer;
    final rows = a.probability != null
        ? {'Yes': a.probability!, 'No': 1 - a.probability!}
        : Map.fromEntries(a.probabilities.entries.toList()..sort((x, y) => y.value.compareTo(x.value)));
    final headline = switch (a.type) {
      'noul' => a.isTrue(threshold) ? 'Yes' : 'No',
      'choice' => a.choice ?? '—',
      _ => a.score == null ? '—' : 'Level ${a.score!.toStringAsFixed(2)}',
    };
    return Container(
      padding: const EdgeInsets.all(Space.m),
      decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.m)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(headline, style: context.text.titleMedium)),
              if (a.confidence != null)
                Text('${(a.confidence! * 100).round()}% confident', style: context.text.bodySmall),
            ],
          ),
          const SizedBox(height: Space.s),
          for (final e in rows.entries)
            Padding(
              padding: const EdgeInsets.only(top: Space.xs),
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      a.legend[e.key] ?? e.key,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.bodySmall,
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: LinearProgressIndicator(
                        value: e.value.clamp(0, 1),
                        minHeight: 6,
                        backgroundColor: AppColors.surface3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    child: Text(
                      '${(e.value * 100).round()}%',
                      textAlign: TextAlign.end,
                      style: context.text.bodySmall?.copyWith(fontFeatures: tabularFigures),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
