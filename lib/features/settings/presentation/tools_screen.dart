import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ai/data/ai.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../../chat/presentation/widgets/tool_card.dart';
import '../../integrations/integrations_store.dart';
import '../../telegram/data/telegram_tools.dart';
import '../../telegram/presentation/chat_actions.dart' show confirmAction;
import '../data/settings.dart';
import 'apps_screen.dart';
import 'cloud_settings.dart';
import 'settings_screen.dart' show SettingsScreen, SettingsSection;
import 'telegram_tab.dart';

/// The three kinds of tools Settings → Tools switches between.
enum ToolGroup {
  telegram('Telegram', Icons.send_rounded),
  apps('Apps & web', Icons.hub_outlined),
  device('Device', Icons.phone_android_rounded);

  const ToolGroup(this.label, this.icon);
  final String label;
  final IconData icon;

  bool has(TelegramTool t) => switch (this) {
    ToolGroup.apps => t.category.onAppsScreen,
    ToolGroup.device => (t.category == ToolCategory.device || t.category == ToolCategory.code),
    ToolGroup.telegram => !t.category.onAppsScreen && t.category != ToolCategory.device && t.category != ToolCategory.code,
  };
}

List<TelegramTool> toolsIn(ToolGroup group) => [
  for (final t in telegramTools)
    if (group.has(t)) t,
];

/// Every tool the assistant can use, each one switchable, in three groups:
/// Telegram, apps and the web, and the phone itself. Destructive tools have
/// their own red tab and start off.
class ToolsScreen extends ConsumerStatefulWidget {
  const ToolsScreen({super.key, this.group = ToolGroup.telegram});
  final ToolGroup group;

  @override
  ConsumerState<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends ConsumerState<ToolsScreen> {
  late ToolGroup _group = widget.group;

  @override
  Widget build(BuildContext context) {
    final all = toolsIn(_group);
    final partitions = {for (final access in ToolAccess.values)
      access: all.where((t) => t.access == access).toList()};
    String intro(ToolAccess access) => switch (access) {
      ToolAccess.read => 'Reads and inspects data. These are the only tools available in read-only mode.',
      ToolAccess.modify => 'Creates, sends, saves or changes data or device state. Hidden from the assistant in read-only mode. Approval follows your settings.',
      ToolAccess.destructive => 'Deletes, removes or replaces data. Off until enabled and always asks for approval. Hidden in read-only mode.',
    };
    return DefaultTabController(
      key: ValueKey(_group),
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tools'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(104),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
                  child: SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<ToolGroup>(
                      showSelectedIcon: false,
                      segments: [
                        for (final g in ToolGroup.values)
                          ButtonSegment(value: g, icon: Icon(g.icon, size: 16), label: Text(g.label)),
                      ],
                      selected: {_group},
                      onSelectionChanged: (v) => setState(() => _group = v.first),
                    ),
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  tabs: [for (final access in ToolAccess.values)
                    Tab(child: Text('${access.label} · ${partitions[access]!.length}',
                      style: TextStyle(color: access == ToolAccess.destructive ? AppColors.danger : null))),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [for (final access in ToolAccess.values)
            _ToolList(key: ValueKey('$_group-$access'), tools: partitions[access]!,
              danger: access == ToolAccess.destructive, intro: intro(access)),
          ],
        ),
      ),
    );
  }
}

/// Settings → Apps & web: the keys and connections behind the app and web
/// tools, one tab per service (their tools are under Settings → Tools).
class AppsWebScreen extends ConsumerWidget {
  const AppsWebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final connected = ref.watch(integrationsProvider).connected.length;
    final ready = ref.watch(authStateProvider).value is td.AuthorizationStateReady;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Apps & web'),
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const ToolsScreen(group: ToolGroup.apps)),
              ),
              icon: const Icon(Icons.handyman_outlined, size: 18),
              label: const Text('Tools'),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: ready ? 'Telegram ✓' : 'Telegram'),
              Tab(text: s.hasComposioKey ? 'Composio · $connected' : 'Composio'),
              Tab(text: s.hasExaKey ? 'Exa ✓' : 'Exa'),
              Tab(text: s.hasCloudflare ? 'Cloudflare ✓' : 'Cloudflare'),
              Tab(text: s.hasE2bKey ? 'E2B ✓' : 'E2B'),
            ],
          ),
        ),
        body: const TabBarView(children: [TelegramTab(), AppsTab(), ExaTab(), CloudflareTab(), E2bTab()]),
      ),
    );
  }
}

class _ToolList extends ConsumerStatefulWidget {
  const _ToolList({super.key, required this.tools, required this.intro, this.danger = false});
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
    final connected = ref.watch(integrationsProvider).connected;
    final telegram = ref.watch(authStateProvider).value is td.AuthorizationStateReady;
    final danger = widget.danger;
    final intro = widget.intro;
    final q = _q.toLowerCase().trim();
    final all = widget.tools;
    final tools = q.isEmpty
        ? all
        : all
              .where(
                (t) =>
                    t.name.contains(q) || t.category.label.toLowerCase().contains(q) || t.label.toLowerCase().contains(q) || t.description.toLowerCase().contains(q),
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
                  prefixIcon: Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
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
            for (final category in _categoryOrder)
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
                            blocked: s.readOnlyMode && t.modifiesData,
                            needs: toolPrerequisiteProblems(t, s, telegram: telegram, connected: connected).firstOrNull,
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

/// Apps first, then the web tools; Telegram's in their own order.
final _categoryOrder = [
  for (final c in ToolCategory.values)
    if (c.onAppsScreen && !_webCategories.contains(c)) c,
  for (final c in ToolCategory.values)
    if (!c.onAppsScreen || _webCategories.contains(c)) c,
];

const _webCategories = {ToolCategory.web, ToolCategory.developer, ToolCategory.discover};

class _ToolRow extends ConsumerWidget {
  const _ToolRow({required this.tool, required this.enabled, this.blocked = false, this.needs});
  final TelegramTool tool;
  final bool enabled;

  /// An app tool's missing connection, e.g. "Connect Gmail first".
  final String? needs;

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
                      if (blocked) _Tag('Off in read-only mode', color: AppColors.text3),
                      if (needs != null) _Tag(needs!, color: AppColors.text3),
                      if (tool.destructive)
                        _Tag('Destructive · always asks', color: AppColors.danger)
                      else if (tool.alwaysAsk)
                        _Tag('Always asks', color: AppColors.warning),
                      _Tag(tool.access.label, color: AppColors.text2),
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
    final s = ref.watch(settingsProvider);
    final integrations = ref.watch(integrationsProvider);
    final telegram = ref.watch(authStateProvider).value is td.AuthorizationStateReady;
    final sees = ref.watch(modelCatalogProvider).byId(s.model)?.vision ?? true;
    final enabled = s.toolChosen(tool.name, destructive: tool.destructive);
    final readOnly = s.readOnlyMode && tool.modifiesData;
    final needs = toolPrerequisiteProblems(
      tool,
      s,
      telegram: telegram,
      connected: integrations.connected,
      modelSeesImages: sees,
    );
    final doc = tool.documentation;
    final props = ((tool.parameters['properties'] as Map?) ?? const {}).cast<String, dynamic>();
    final required = ((tool.parameters['required'] as List?) ?? const []).cast<String>().toSet();
    final app = appToolkitOf(tool.name);
    final account = app == null ? null : integrations.accountFor(app);

    final (status, statusColor) = !enabled
        ? ('Off', AppColors.text3)
        : readOnly
        ? ('Off in read-only mode', AppColors.text3)
        : needs.isNotEmpty
        ? ('Needs setup', AppColors.warning)
        : ('Ready', AppColors.success);
    final accessColor = switch (tool.access) {
      ToolAccess.read => AppColors.success,
      ToolAccess.modify => AppColors.warning,
      ToolAccess.destructive => AppColors.danger,
    };

    // A Material, not a decorated box, so row taps show their ripple.
    Widget card(List<Widget> children) => Padding(
      padding: const EdgeInsets.only(top: Space.s),
      child: Material(
        color: AppColors.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Radii.l),
          side: BorderSide(color: AppColors.line),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
      ),
    );
    Widget label(String text) => Padding(
      padding: const EdgeInsets.only(top: Space.xl),
      child: Text(text, style: context.text.labelSmall),
    );
    Widget fact(IconData icon, String title, String body, {Color? color}) => ListTile(
      leading: Icon(icon, color: color ?? AppColors.text2),
      title: Text(title),
      subtitle: Text(body, style: context.text.bodySmall?.copyWith(height: 1.4)),
    );
    List<Widget> divided(List<Widget> rows) => [
      for (final (i, row) in rows.indexed) ...[if (i > 0) const Divider(indent: 56), row],
    ];
    Widget fold(IconData icon, String title, List<Widget> children) => ExpansionTile(
      leading: Icon(icon, color: AppColors.text2),
      title: Text(title),
      shape: const Border(),
      collapsedShape: const Border(),
      childrenPadding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
    void open(Widget screen) => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => screen));

    final approval = tool.destructive || tool.alwaysAsk
        ? 'Always asks first'
        : tool.requiresApproval
        ? 'Asks you first'
        : 'Runs without asking';
    final model = switch (tool.name) {
      'generate_image' => s.imageModel,
      'generate_audio' =>
        s.voiceEngine == VoiceEngine.elevenLabs
            ? 'ElevenLabs ${s.elevenModel} · ${s.elevenVoiceName.isEmpty ? 'default voice' : s.elevenVoiceName}'
            : '${s.voiceEngine == VoiceEngine.addis ? 'addis:voices-2' : s.speechModel} · '
                  '${s.aiVoice.isEmpty ? 'default voice' : s.aiVoice}',
      _ => null,
    };

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
                    child: Icon(toolIcon(tool.name), color: tool.destructive ? AppColors.danger : AppColors.accent),
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
              const SizedBox(height: Space.m),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _Tag(status, color: statusColor),
                  _Tag(tool.access.label, color: accessColor),
                  _Tag(tool.cost.label, color: tool.cost == ToolCost.local ? AppColors.success : AppColors.text2),
                ],
              ),
              const SizedBox(height: Space.s),
              card([
                SwitchListTile(
                  title: const Text('Available to the assistant'),
                  subtitle: Text(
                    readOnly
                        ? 'Read-only mode keeps it hidden whatever this switch says.'
                        : enabled
                        ? 'The assistant can call this tool.'
                        : 'Hidden from the assistant.',
                    style: context.text.bodySmall,
                  ),
                  value: enabled,
                  activeThumbColor: tool.destructive ? AppColors.danger : null,
                  onChanged: (v) =>
                      ref.read(settingsProvider.notifier).setToolEnabled(tool.name, v, destructive: tool.destructive),
                ),
                if (needs.isNotEmpty) ...[
                  const Divider(indent: Space.l, endIndent: Space.l),
                  for (final need in needs)
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.error_outline_rounded, color: AppColors.warning, size: 20),
                      title: Text(need, style: context.text.bodyMedium),
                      trailing: Icon(Icons.chevron_right_rounded, color: AppColors.text3),
                      onTap: () => open(
                        need.contains('AI & models')
                            ? const SettingsScreen(section: SettingsSection.ai)
                            : const AppsWebScreen(),
                      ),
                    ),
                ],
              ]),
              label('WHAT IT DOES'),
              const SizedBox(height: Space.s),
              Text(tool.description, style: context.text.bodyLarge),
              const SizedBox(height: Space.s),
              card(
                divided([
                  fact(
                    switch (tool.access) {
                      ToolAccess.read => Icons.visibility_outlined,
                      ToolAccess.modify => Icons.edit_outlined,
                      ToolAccess.destructive => Icons.delete_outline_rounded,
                    },
                    tool.access.label,
                    doc.effects,
                    color: accessColor,
                  ),
                  fact(
                    tool.requiresApproval ? Icons.front_hand_outlined : Icons.bolt_rounded,
                    approval,
                    toolApprovalDescription(tool, s),
                    color: tool.requiresApproval ? AppColors.warning : AppColors.text2,
                  ),
                  fact(
                    tool.cost == ToolCost.local ? Icons.offline_bolt_outlined : Icons.cloud_outlined,
                    doc.provider,
                    doc.location,
                  ),
                  fact(Icons.payments_outlined, 'Cost', doc.billing),
                  fact(Icons.checklist_rounded, 'Needs', doc.prerequisites),
                  if (account != null)
                    fact(
                      Icons.account_circle_outlined,
                      'Connected account',
                      '${account.alias ?? account.toolkit} · ${account.status}',
                    ),
                  if (model != null) fact(Icons.tune_rounded, 'Current model', model),
                  fact(Icons.stop_circle_outlined, 'Stopping a call', doc.cancellation),
                ]),
              ),
              label('PARAMETERS'),
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
                      child: _Param(
                        name: e.key,
                        schema: Map<String, dynamic>.from(e.value as Map),
                        required: required.contains(e.key),
                      ),
                    ),
                  ],
                ]),
              if (doc.outputs.isNotEmpty) ...[
                label('RETURNS'),
                card([
                  Padding(
                    padding: const EdgeInsets.all(Space.l),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [for (final field in doc.outputs) _Code(field)],
                    ),
                  ),
                ]),
              ],
              if (doc.limits.isNotEmpty) ...[
                label('GOOD TO KNOW'),
                card(
                  divided([
                    for (final limit in doc.limits)
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.info_outline_rounded, size: 20, color: AppColors.text3),
                        title: Text(limit, style: context.text.bodySmall?.copyWith(height: 1.4)),
                      ),
                  ]),
                ),
              ],
              label('REFERENCE'),
              card([
                if (doc.example.isNotEmpty) ...[
                  fold(Icons.data_object_rounded, 'Example input', [
                    _CodeBlock(const JsonEncoder.withIndent('  ').convert(doc.example)),
                    const SizedBox(height: Space.s),
                    Text('Placeholder values; nothing runs from here.', style: context.text.bodySmall),
                  ]),
                  const Divider(indent: 56),
                ],
                fold(Icons.schema_outlined, 'Full input schema', [
                  _CodeBlock(const JsonEncoder.withIndent('  ').convert(tool.parameters)),
                ]),
                const Divider(indent: 56),
                fold(Icons.replay_rounded, 'Errors and retrying', [
                  Text(
                    'Permissions, quotas and timeouts come back as an error on the call. A change can partly finish '
                    'before failing, so check what already happened before retrying. Open the call in chat to see its '
                    'recorded result.',
                    style: context.text.bodySmall?.copyWith(height: 1.4),
                  ),
                ]),
                const Divider(indent: 56),
                ListTile(
                  leading: Icon(Icons.menu_book_outlined, color: AppColors.text2),
                  title: const Text('Service documentation'),
                  subtitle: Text(Uri.parse(doc.referenceUrl).host, style: context.text.bodySmall),
                  trailing: Icon(Icons.open_in_new_rounded, size: 18, color: AppColors.text3),
                  onTap: () => launchUrl(Uri.parse(doc.referenceUrl), mode: LaunchMode.externalApplication),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

/// One input: its name, type, whether it is required, what it means and
/// its rules, with nested fields indented underneath.
class _Param extends StatelessWidget {
  const _Param({required this.name, required this.schema, this.required = false});
  final String name;
  final Map<String, dynamic> schema;
  final bool required;

  static String _type(Map s) {
    final items = s['items'];
    if (s['type'] == 'array' && items is Map && items['type'] != null) return 'list of ${items['type']}';
    if (s['type'] != null) return '${s['type']}';
    return s.containsKey('oneOf') || s.containsKey('anyOf') ? 'one of' : 'any';
  }

  @override
  Widget build(BuildContext context) {
    String v(String k) => schema[k] is String ? '${schema[k]}' : jsonEncode(schema[k]);
    final rules = [
      if (schema.containsKey('default')) 'default ${v('default')}',
      if (schema.containsKey('minimum')) 'min ${v('minimum')}',
      if (schema.containsKey('exclusiveMinimum')) 'over ${v('exclusiveMinimum')}',
      if (schema.containsKey('maximum')) 'max ${v('maximum')}',
      if (schema.containsKey('exclusiveMaximum')) 'under ${v('exclusiveMaximum')}',
      if (schema.containsKey('minItems')) 'at least ${v('minItems')} items',
      if (schema.containsKey('maxItems')) 'up to ${v('maxItems')} items',
      if (schema.containsKey('minLength')) 'at least ${v('minLength')} chars',
      if (schema.containsKey('maxLength')) 'up to ${v('maxLength')} chars',
      if (schema.containsKey('format')) v('format'),
      if (schema.containsKey('pattern')) 'pattern ${v('pattern')}',
      if (schema['uniqueItems'] == true) 'no duplicates',
    ];
    final values = schema['enum'] is List ? schema['enum'] as List : const [];
    final props = ((schema['properties'] as Map?) ?? const {}).cast<String, dynamic>();
    final requiredFields = ((schema['required'] as List?) ?? const []).cast<String>().toSet();
    final items = schema['items'];
    final nested = <Widget>[
      for (final e in props.entries)
        _Param(name: e.key, schema: Map<String, dynamic>.from(e.value as Map), required: requiredFields.contains(e.key)),
      if (items is Map && items['properties'] is Map)
        for (final e in (items['properties'] as Map).entries)
          _Param(
            name: '${e.key}',
            schema: Map<String, dynamic>.from(e.value as Map),
            required: ((items['required'] as List?) ?? const []).contains(e.key),
          ),
      for (final key in const ['oneOf', 'anyOf'])
        if (schema[key] is List)
          for (final (i, option) in (schema[key] as List).indexed)
            if (option is Map) _Param(name: 'option ${i + 1}', schema: Map<String, dynamic>.from(option)),
    ];
    final enumValues = values.isNotEmpty ? values : (items is Map && items['enum'] is List ? items['enum'] as List : const []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(name, style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w600)),
            _Tag(_type(schema), color: AppColors.text2),
            if (required) _Tag('required', color: AppColors.accent),
          ],
        ),
        if (schema['description'] != null) ...[
          const SizedBox(height: Space.xs),
          Text('${schema['description']}', style: context.text.bodySmall?.copyWith(height: 1.4)),
        ],
        if (rules.isNotEmpty) ...[
          const SizedBox(height: Space.s),
          Wrap(spacing: 6, runSpacing: 6, children: [for (final r in rules) _Tag(r, color: AppColors.text3)]),
        ],
        if (enumValues.isNotEmpty) ...[
          const SizedBox(height: Space.s),
          Wrap(spacing: 6, runSpacing: 6, children: [for (final e in enumValues) _Code('$e')]),
        ],
        if (schema['type'] == 'object' && props.isEmpty) ...[
          const SizedBox(height: Space.xs),
          Text('Any fields the service accepts.', style: context.text.bodySmall?.copyWith(color: AppColors.text3)),
        ],
        if (nested.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: Space.m, left: 2),
            padding: const EdgeInsets.only(left: Space.m),
            decoration: BoxDecoration(border: Border(left: BorderSide(color: AppColors.line, width: 2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (i, n) in nested.indexed) ...[if (i > 0) const SizedBox(height: Space.m), n],
              ],
            ),
          ),
      ],
    );
  }
}

class _Code extends StatelessWidget {
  const _Code(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(6)),
    child: Text(text, style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: AppColors.text2)),
  );
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(Space.m),
    decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.m)),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SelectableText(text, style: const TextStyle(fontFamily: 'monospace', fontSize: 12, height: 1.4)),
    ),
  );
}