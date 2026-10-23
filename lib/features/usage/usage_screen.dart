import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/theme.dart';
import '../ai/data/model_catalog.dart';
import 'usage.dart';

enum _Period {
  today('Today'),
  week('7 days'),
  month('30 days'),
  all('All');

  const _Period(this.label);
  final String label;

  bool includes(DateTime t) {
    final now = DateTime.now();
    return switch (this) {
      today => t.isAfter(DateTime(now.year, now.month, now.day)),
      week => now.difference(t).inDays < 7,
      month => now.difference(t).inDays < 30,
      all => true,
    };
  }
}

enum _By {
  chat('By chat'),
  model('By model'),
  modality('By modality');

  const _By(this.label);
  final String label;
}

String usd(double v) => v == 0
    ? '\$0'
    : v < 0.01
    ? '\$${v.toStringAsFixed(4)}'
    : v < 1
    ? '\$${v.toStringAsFixed(3)}'
    : '\$${v.toStringAsFixed(2)}';

String compact(num n) => NumberFormat.compact().format(n);

class _Group {
  _Group(this.label, {this.subtitle});
  final String label;
  final String? subtitle;
  double cost = 0;
  int input = 0, output = 0, requests = 0, units = 0;
  bool estimated = false;
  final Map<Modality, int> kinds = {};
}

/// Tokens and money spent, by chat, by model and by modality.
class UsageScreen extends ConsumerStatefulWidget {
  const UsageScreen({super.key});

  @override
  ConsumerState<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends ConsumerState<UsageScreen> {
  _Period _period = _Period.month;
  _By _by = _By.chat;

  @override
  Widget build(BuildContext context) {
    final all = ref.watch(usageProvider);
    final catalog = ref.watch(modelCatalogProvider);
    final events = all.where((e) => _period.includes(e.at)).toList();
    final total = events.fold<double>(0, (n, e) => n + e.cost);
    final input = events.fold<int>(0, (n, e) => n + e.input);
    final output = events.fold<int>(0, (n, e) => n + e.output);
    final cached = events.fold<int>(0, (n, e) => n + e.cached);
    final anyEstimate = events.any((e) => e.estimated);

    final groups = <String, _Group>{};
    for (final e in events) {
      final (key, label, sub) = switch (_by) {
        _By.chat => (
          e.conversationId ?? e.conversationTitle ?? '-',
          e.conversationTitle ?? (e.modality == Modality.dictation ? 'Dictation' : 'Outside a chat'),
          null,
        ),
        _By.model => (e.model, catalog.byId(e.model)?.name ?? AiRoute.bare(e.model), AiRoute.bare(e.model)),
        _By.modality => (e.modality.name, e.modality.label, e.modality.description),
      };
      final g = groups.putIfAbsent(key, () => _Group(label, subtitle: sub));
      g.cost += e.cost;
      g.input += e.input;
      g.output += e.output;
      g.units += e.units;
      g.requests++;
      g.estimated |= e.estimated;
      g.kinds.update(e.modality, (n) => n + 1, ifAbsent: () => 1);
    }
    final rows = groups.values.toList()..sort((a, b) => b.cost.compareTo(a.cost));
    final top = rows.isEmpty ? 0.0 : rows.first.cost;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage & cost'),
        actions: [
          IconButton(
            tooltip: 'Clear history',
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: all.isEmpty
                ? null
                : () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Clear usage history?'),
                        content: const Text('This only clears the stats on this phone.'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
                        ],
                      ),
                    );
                    if (ok == true) ref.read(usageProvider.notifier).clear();
                  },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
            children: [
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<_Period>(
                  showSelectedIcon: false,
                  segments: [for (final p in _Period.values) ButtonSegment(value: p, label: Text(p.label))],
                  selected: {_period},
                  onSelectionChanged: (v) => setState(() => _period = v.first),
                ),
              ),
              const SizedBox(height: Space.l),
              Container(
                padding: const EdgeInsets.all(Space.xl),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Radii.xl),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1C2433), Color(0xFF131316)],
                  ),
                  border: Border.all(color: AppColors.line),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SPENT', style: context.text.labelSmall),
                    const SizedBox(height: Space.xs),
                    Text(
                      '${anyEstimate ? '≈ ' : ''}${usd(total)}',
                      style: context.text.headlineMedium?.copyWith(fontFeatures: tabularFigures),
                    ),
                    const SizedBox(height: Space.l),
                    Wrap(
                      spacing: Space.xl,
                      runSpacing: Space.m,
                      children: [
                        _Figure(label: 'Input tokens', value: compact(input)),
                        _Figure(label: 'Output tokens', value: compact(output)),
                        if (cached > 0) _Figure(label: 'Cached', value: compact(cached)),
                        _Figure(label: 'Requests', value: compact(events.length)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Space.xl),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<_By>(
                  showSelectedIcon: false,
                  segments: [for (final b in _By.values) ButtonSegment(value: b, label: Text(b.label))],
                  selected: {_by},
                  onSelectionChanged: (v) => setState(() => _by = v.first),
                ),
              ),
              const SizedBox(height: Space.m),
              if (rows.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(Space.x4),
                  child: Text(
                    'Nothing used in this period yet.',
                    textAlign: TextAlign.center,
                    style: context.text.bodySmall,
                  ),
                ),
              for (final g in rows)
                Container(
                  margin: const EdgeInsets.only(bottom: Space.s),
                  padding: const EdgeInsets.all(Space.l),
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(Radii.l)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              g.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.titleSmall,
                            ),
                          ),
                          Text(
                            '${g.estimated ? '≈ ' : ''}${usd(g.cost)}',
                            style: context.text.titleSmall?.copyWith(fontFeatures: tabularFigures),
                          ),
                        ],
                      ),
                      if (g.subtitle != null && g.subtitle != g.label)
                        Text(g.subtitle!, style: context.text.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: Space.s),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: top == 0 ? 0 : g.cost / top,
                          minHeight: 5,
                          backgroundColor: AppColors.surface3,
                        ),
                      ),
                      const SizedBox(height: Space.s),
                      Text(
                        [
                          '${g.requests} request${g.requests == 1 ? '' : 's'}',
                          if (g.input + g.output > 0) '${compact(g.input)} in · ${compact(g.output)} out',
                          if (_by == _By.modality && g.units > 0)
                            switch (Modality.values.asNameMap()[groups.entries.firstWhere((e) => e.value == g).key]) {
                              Modality.image => '${g.units} images',
                              Modality.speech => '${compact(g.units)} characters',
                              Modality.dictation => '${g.units} s of audio',
                              _ => '',
                            },
                          if (_by != _By.modality && g.kinds.length > 1)
                            g.kinds.entries.map((k) => '${k.value} ${k.key.label.toLowerCase()}').join(', '),
                        ].where((t) => t.isNotEmpty).join(' · '),
                        style: context.text.bodySmall,
                      ),
                    ],
                  ),
                ),
              if (anyEstimate)
                Padding(
                  padding: const EdgeInsets.only(top: Space.m),
                  child: Text(
                    '≈ marks estimates from list prices. OpenRouter reports exact costs; other requests are priced from '
                    'the model catalog, voices by character and dictation by seconds of audio.',
                    style: context.text.bodySmall,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  const _Figure({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(value, style: context.text.titleLarge?.copyWith(fontFeatures: tabularFigures)),
      Text(label, style: context.text.bodySmall),
    ],
  );
}
