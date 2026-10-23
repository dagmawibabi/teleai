import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';
import '../../chat/presentation/widgets/tool_card.dart';
import '../../telegram/data/telegram_tools.dart';
import '../../telegram/presentation/chat_actions.dart' show confirmAction;
import '../data/settings.dart';

/// Every tool the assistant can use, each one switchable. Destructive
/// tools have their own red tab and start off.
class ToolsScreen extends ConsumerWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final safe = telegramTools.where((t) => !t.destructive).toList();
    final danger = telegramTools.where((t) => t.destructive).toList();
    final enabled = safe.where((t) => t.isOn(s)).length;
    final dangerOn = danger.where((t) => t.isOn(s)).length;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tools'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tools · $enabled/${safe.length}'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.danger),
                    const SizedBox(width: 6),
                    Text(
                      'Destructive · $dangerOn/${danger.length}',
                      style: const TextStyle(color: AppColors.danger),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ToolList(
              tools: safe,
              intro:
                  '$enabled of ${safe.length} tools on. The assistant only sees the tools that are on. Anything that '
                  'sends or changes something asks you first (see the approval setting).',
            ),
            _ToolList(
              tools: danger,
              danger: true,
              intro:
                  'These delete, leave, block or ban, and most can\'t be undone. They are off until you turn them on, '
                  'and every call waits for your approval, even when approvals are otherwise skipped.',
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolList extends ConsumerStatefulWidget {
  const _ToolList({required this.tools, required this.intro, this.danger = false});
  final List<TelegramTool> tools;
  final String intro;
  final bool danger;

  @override
  ConsumerState<_ToolList> createState() => _ToolListState();
}

class _ToolListState extends ConsumerState<_ToolList> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(settingsProvider);
    final danger = widget.danger;
    final intro = widget.intro;
    final q = _q.toLowerCase().trim();
    final all = widget.tools;
    final tools = q.isEmpty
        ? all
        : all
              .where(
                (t) =>
                    t.name.contains(q) || t.label.toLowerCase().contains(q) || t.description.toLowerCase().contains(q),
              )
              .toList();
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.x4),
          children: [
            if (s.readOnlyMode)
              Container(
                margin: const EdgeInsets.only(top: Space.m),
                padding: const EdgeInsets.all(Space.m),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(Radii.m),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock_outline_rounded, size: 18, color: AppColors.accent),
                    const SizedBox(width: Space.s),
                    Expanded(
                      child: Text(
                        'Read-only mode is on: only tools that read are offered. Turn it off in Settings to use the rest.',
                        style: context.text.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: Space.m),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.done_all_rounded, size: 18),
                      label: const Text('Enable all'),
                      style: danger ? OutlinedButton.styleFrom(foregroundColor: AppColors.danger) : null,
                      onPressed: () async {
                        if (danger &&
                            !await confirmAction(
                              context,
                              title: 'Turn on every destructive tool?',
                              message: 'The assistant could then delete, leave, block and ban, each time after you approve.',
                              action: 'Enable all',
                            )) {
                          return;
                        }
                        await ref
                            .read(settingsProvider.notifier)
                            .setToolsEnabled([for (final t in tools) t.name], true, destructive: danger);
                      },
                    ),
                  ),
                  const SizedBox(width: Space.s),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.remove_done_rounded, size: 18),
                      label: const Text('Disable all'),
                      onPressed: () => ref
                          .read(settingsProvider.notifier)
                          .setToolsEnabled([for (final t in tools) t.name], false, destructive: danger),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Space.m),
              padding: danger ? const EdgeInsets.all(Space.m) : const EdgeInsets.symmetric(horizontal: Space.xs),
              decoration: danger
                  ? BoxDecoration(
                      color: AppColors.danger.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(Radii.m),
                      border: Border.all(color: AppColors.danger.withValues(alpha: 0.4)),
                    )
                  : null,
              child: Text(
                intro,
                style: context.text.bodySmall?.copyWith(color: danger ? AppColors.danger : null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Space.m),
              child: TextField(
                onChanged: (v) => setState(() => _q = v),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search ${all.length} tools',
                  prefixIcon: const Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
                ),
              ),
            ),
            if (tools.isEmpty)
              Padding(
                padding: const EdgeInsets.all(Space.xl),
                child: Center(child: Text('No tool matches', style: context.text.bodySmall)),
              ),
            for (final category in ToolCategory.values)
              if (tools.any((t) => t.category == category)) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.xs, Space.xxl, Space.xs, Space.s),
                  child: Text(
                    '${category.label.toUpperCase()} · ${tools.where((t) => t.category == category && t.isOn(s)).length}/${tools.where((t) => t.category == category).length}',
                    style: context.text.labelSmall?.copyWith(color: danger ? AppColors.danger : null),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.l),
                    border: Border.all(color: danger ? AppColors.danger.withValues(alpha: 0.5) : AppColors.line),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      children: [
                        for (final (i, t) in tools.where((t) => t.category == category).indexed) ...[
                          if (i > 0) const Divider(indent: 56),
                          _ToolRow(
                            tool: t,
                            enabled: s.toolChosen(t.name, destructive: t.destructive),
                            blocked: s.readOnlyMode && (t.requiresApproval || t.destructive),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
          ],
        ),
      ),
    );
  }
}

class _ToolRow extends ConsumerWidget {
  const _ToolRow({required this.tool, required this.enabled, this.blocked = false});
  final TelegramTool tool;
  final bool enabled;

  /// Read-only mode keeps it from the assistant whatever its switch says.
  final bool blocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => ToolDetailScreen(tool: tool))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.s, Space.m),
        child: Row(
          children: [
            Icon(
              toolIcon(tool.name),
              size: 22,
              color: tool.destructive ? AppColors.danger : (enabled ? AppColors.text : AppColors.text3),
            ),
            const SizedBox(width: Space.l),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tool.name,
                    style: context.text.titleSmall?.copyWith(
                      fontFamily: 'monospace',
                      fontSize: 13.5,
                      color: tool.destructive ? AppColors.danger : (enabled ? AppColors.text : AppColors.text3),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    tool.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySmall?.copyWith(height: 1.35),
                  ),
                  const SizedBox(height: Space.xs + 2),
                  Wrap(
                    spacing: 6,
                    children: [
                      _Tag(tool.cost.label, color: tool.cost == ToolCost.local ? AppColors.success : AppColors.text2),
                      if (blocked) const _Tag('Off in read-only mode', color: AppColors.text3),
                      if (tool.destructive)
                        const _Tag('Destructive · always asks', color: AppColors.danger)
                      else if (tool.requiresApproval)
                        const _Tag('Asks first', color: AppColors.warning),
                    ],
                  ),
                ],
              ),
            ),
            Switch(
              value: enabled,
              activeThumbColor: tool.destructive ? AppColors.danger : null,
              onChanged: (v) =>
                  ref.read(settingsProvider.notifier).setToolEnabled(tool.name, v, destructive: tool.destructive),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text, {required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(999)),
    child: Text(text, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500)),
  );
}

class ToolDetailScreen extends ConsumerWidget {
  const ToolDetailScreen({super.key, required this.tool});
  final TelegramTool tool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(settingsProvider).toolChosen(tool.name, destructive: tool.destructive);
    final props = ((tool.parameters['properties'] as Map?) ?? const {}).cast<String, dynamic>();
    final required = ((tool.parameters['required'] as List?) ?? const []).cast<String>().toSet();

    Widget card(List<Widget> children) => Container(
      margin: const EdgeInsets.only(top: Space.m),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.l),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
    );

    return Scaffold(
      appBar: AppBar(title: Text(tool.label)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Space.m),
                    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.m)),
                    child: Icon(toolIcon(tool.name), color: AppColors.accent),
                  ),
                  const SizedBox(width: Space.l),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(tool.name, style: context.text.titleMedium?.copyWith(fontFamily: 'monospace')),
                        Text(tool.category.label, style: context.text.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
              card([
                SwitchListTile(
                  title: const Text('Available to the assistant'),
                  subtitle: Text(
                    enabled ? 'The assistant can call this tool.' : 'Hidden from the assistant.',
                    style: context.text.bodySmall,
                  ),
                  value: enabled,
                  onChanged: (v) =>
                      ref.read(settingsProvider.notifier).setToolEnabled(tool.name, v, destructive: tool.destructive),
                ),
              ]),
              const SizedBox(height: Space.l),
              Text('WHAT IT DOES', style: context.text.labelSmall),
              const SizedBox(height: Space.s),
              Text(tool.description, style: context.text.bodyLarge),
              const SizedBox(height: Space.l),
              card([
                ListTile(
                  leading: Icon(
                    tool.cost == ToolCost.local ? Icons.offline_bolt_outlined : Icons.cloud_outlined,
                    color: AppColors.text2,
                  ),
                  title: Text(tool.cost.label),
                  subtitle: Text(tool.cost.explanation, style: context.text.bodySmall),
                ),
                const Divider(indent: 56),
                ListTile(
                  leading: Icon(
                    tool.requiresApproval ? Icons.front_hand_outlined : Icons.visibility_outlined,
                    color: tool.requiresApproval ? AppColors.warning : AppColors.text2,
                  ),
                  title: Text(tool.requiresApproval ? 'Asks you first' : 'Read-only'),
                  subtitle: Text(
                    tool.requiresApproval
                        ? 'Shows you exactly what it will do and waits for you to approve or decline.'
                        : tool.cost == ToolCost.ai
                        ? 'Creates something new; nothing in Telegram changes.'
                        : 'Only reads. Nothing in Telegram changes and nothing is marked as read.',
                    style: context.text.bodySmall,
                  ),
                ),
              ]),
              const SizedBox(height: Space.xl),
              Text('PARAMETERS', style: context.text.labelSmall),
              if (props.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: Space.s),
                  child: Text('None. The tool takes no input.', style: context.text.bodySmall),
                )
              else
                card([
                  for (final (i, e) in props.entries.indexed) ...[
                    if (i > 0) const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(e.key, style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w600)),
                              const SizedBox(width: Space.s),
                              _Tag('${(e.value as Map)['type']}', color: AppColors.text2),
                              const SizedBox(width: 6),
                              if (required.contains(e.key)) _Tag('required', color: AppColors.accent),
                            ],
                          ),
                          if ((e.value as Map)['description'] != null) ...[
                            const SizedBox(height: Space.xs),
                            Text('${(e.value as Map)['description']}', style: context.text.bodySmall),
                          ],
                          if ((e.value as Map)['enum'] is List) ...[
                            const SizedBox(height: Space.s),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                for (final v in (e.value as Map)['enum'] as List) _Tag('$v', color: AppColors.text2),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ]),
            ],
          ),
        ),
      ),
    );
  }
}
