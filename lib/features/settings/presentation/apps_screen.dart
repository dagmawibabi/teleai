import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme.dart';
import '../../integrations/app_toolkits.dart';
import '../../integrations/composio_client.dart';
import '../../integrations/integrations_store.dart';
import '../../telegram/presentation/chat_actions.dart' show confirmAction;
import '../data/settings.dart';
import 'cloud_settings.dart' show KeyField;

/// The Apps & web screen's first tab: the apps the assistant can use
/// through Composio, each connected or not. Connecting opens Composio's
/// sign-in page in the browser; coming back checks again.
class AppsTab extends ConsumerStatefulWidget {
  const AppsTab({super.key});

  @override
  ConsumerState<AppsTab> createState() => _AppsTabState();
}

class _AppsTabState extends ConsumerState<AppsTab> with WidgetsBindingObserver {
  final _other = TextEditingController();
  String? _busy;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() {
      if (ref.read(settingsProvider).hasComposioKey) ref.read(integrationsProvider.notifier).refresh();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _other.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) ref.read(integrationsProvider.notifier).returned();
  }

  Future<void> _connect(String slug) async {
    setState(() => _busy = slug);
    final error = await ref.read(integrationsProvider.notifier).connect(slug);
    if (!mounted) return;
    setState(() => _busy = null);
    if (error != null) showSnack(context, error, icon: Icons.error_outline_rounded);
  }

  Future<void> _disconnect(String slug) async {
    if (!await confirmAction(
      context,
      title: 'Disconnect ${appLabel(slug)}?',
      message: 'The assistant loses access to it, and Composio forgets the sign-in. You can connect it again any time.',
      action: 'Disconnect',
    )) {
      return;
    }
    setState(() => _busy = slug);
    final error = await ref.read(integrationsProvider.notifier).disconnect(slug);
    if (!mounted) return;
    setState(() => _busy = null);
    showSnack(context, error ?? '${appLabel(slug)} disconnected', icon: error == null ? Icons.link_off_rounded : Icons.error_outline_rounded);
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(settingsProvider);
    final st = ref.watch(integrationsProvider);
    final keyCard = Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.l),
        border: Border.all(color: AppColors.line),
      ),
      child: KeyField(
        label: 'Composio API key',
        hint: 'Project API key, starts with ak_',
        value: s.composioKey,
        secret: true,
        onSave: (k) async {
          await ref.read(settingsProvider.notifier).setComposioKey(k);
          await ref.read(integrationsProvider.notifier).refresh();
        },
        verify: ComposioClient.verifyKey,
        help: Uri.parse('https://dashboard.composio.dev'),
      ),
    );
    if (!s.hasComposioKey) return _NoKey(keyCard: keyCard);
    final known = {for (final t in appToolkits) t.slug};
    final others = {
      for (final a in st.accounts)
        if (!known.contains(a.toolkit)) a.toolkit,
    }.toList()..sort();
    return RefreshIndicator(
      onRefresh: ref.read(integrationsProvider.notifier).refresh,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.x4),
            children: [
              keyCard,
              const SizedBox(height: Space.m),
              Text(
                'Connect your own accounts and the assistant can read, search and, after you approve, act in them. '
                'Composio keeps the sign-ins; this phone keeps only your Composio key.',
                style: context.text.bodySmall,
              ),
              if (st.error != null)
                Container(
                  margin: const EdgeInsets.only(top: Space.m),
                  padding: const EdgeInsets.all(Space.m),
                  decoration: BoxDecoration(
                    color: AppColors.danger.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(Radii.m),
                  ),
                  child: Text(st.error!, style: context.text.bodySmall?.copyWith(color: AppColors.danger)),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(Space.xs, Space.xl, Space.xs, Space.s),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'APPS · ${st.connected.length} CONNECTED',
                        style: context.text.labelSmall,
                      ),
                    ),
                    if (st.loading)
                      const SizedBox.square(dimension: 14, child: CircularProgressIndicator(strokeWidth: 2))
                    else
                      InkWell(
                        onTap: ref.read(integrationsProvider.notifier).refresh,
                        child: const Icon(Icons.refresh_rounded, size: 18, color: AppColors.text3),
                      ),
                  ],
                ),
              ),
              _Group(
                children: [
                  for (final t in appToolkits)
                    _AppRow(
                      slug: t.slug,
                      description: t.description,
                      account: st.accountFor(t.slug),
                      busy: _busy == t.slug,
                      onConnect: () => _connect(t.slug),
                      onDisconnect: () => _disconnect(t.slug),
                    ),
                ],
              ),
              if (others.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(Space.xs, Space.xl, Space.xs, Space.s),
                  child: Text('OTHER APPS', style: context.text.labelSmall),
                ),
                _Group(
                  children: [
                    for (final slug in others)
                      _AppRow(
                        slug: slug,
                        description: 'Used through find_app_tools and run_app_tool.',
                        account: st.accountFor(slug),
                        busy: _busy == slug,
                        onConnect: () => _connect(slug),
                        onDisconnect: () => _disconnect(slug),
                      ),
                  ],
                ),
              ],
              Padding(
                padding: const EdgeInsets.fromLTRB(Space.xs, Space.xl, Space.xs, Space.s),
                child: Text('ANY OTHER APP', style: context.text.labelSmall),
              ),
              Text(
                'Composio has 500+ more: HubSpot, Jira, Asana, Airtable, Dropbox, Zoom, Discord… Type its toolkit slug '
                '(from composio.dev/toolkits) to connect it. The assistant reaches them through run_app_tool, which '
                'always asks first (Destructive tab).',
                style: context.text.bodySmall,
              ),
              const SizedBox(height: Space.s),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _other,
                      autocorrect: false,
                      decoration: const InputDecoration(isDense: true, hintText: 'e.g. hubspot'),
                      onSubmitted: (v) => v.trim().isEmpty ? null : _connect(v.trim().toLowerCase()),
                    ),
                  ),
                  const SizedBox(width: Space.s),
                  FilledButton.tonal(
                    onPressed: () {
                      final v = _other.text.trim().toLowerCase();
                      if (v.isNotEmpty) _connect(v);
                    },
                    child: const Text('Connect'),
                  ),
                ],
              ),
              const SizedBox(height: Space.xl),
              Text(
                'Your Composio user: ${s.composioUserId.isEmpty ? 'made when you first connect' : s.composioUserId}',
                style: context.text.labelSmall?.copyWith(color: AppColors.text3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(Radii.l),
      border: Border.all(color: AppColors.line),
    ),
    clipBehavior: Clip.antiAlias,
    child: Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          for (final (i, c) in children.indexed) ...[if (i > 0) const Divider(indent: 64), c],
        ],
      ),
    ),
  );
}

class _AppRow extends StatelessWidget {
  const _AppRow({
    required this.slug,
    required this.description,
    required this.account,
    required this.busy,
    required this.onConnect,
    required this.onDisconnect,
  });

  final String slug;
  final String description;
  final ConnectedApp? account;
  final bool busy;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;

  @override
  Widget build(BuildContext context) {
    final t = appToolkit(slug);
    final active = account?.active ?? false;
    final pending = account != null && !active;
    final fallback = Icon(t?.icon ?? Icons.apps_rounded, color: t?.color ?? AppColors.text2);
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.m, Space.m),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: AppColors.surface3, borderRadius: BorderRadius.circular(Radii.s)),
            child: Image.network(
              'https://logos.composio.dev/api/$slug',
              errorBuilder: (_, _, _) => fallback,
              loadingBuilder: (_, child, p) => p == null ? child : fallback,
            ),
          ),
          const SizedBox(width: Space.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text(appLabel(slug), style: context.text.titleSmall)),
                    if (active) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.check_circle_rounded, size: 14, color: AppColors.success),
                    ],
                  ],
                ),
                Text(
                  pending ? 'Waiting for sign-in (${account!.status.toLowerCase()}). Tap Connect to try again.' : description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.bodySmall?.copyWith(color: pending ? AppColors.warning : null),
                ),
              ],
            ),
          ),
          const SizedBox(width: Space.s),
          if (busy)
            const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
          else if (active)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded, color: AppColors.text3),
              onSelected: (v) => v == 'open' ? launchUrl(Uri.parse(t!.openUrl!), mode: LaunchMode.externalApplication) : onDisconnect(),
              itemBuilder: (_) => [
                if (t?.openUrl != null) PopupMenuItem(value: 'open', child: Text('Open ${t!.label}')),
                const PopupMenuItem(value: 'disconnect', child: Text('Disconnect', style: TextStyle(color: AppColors.danger))),
              ],
            )
          else
            FilledButton.tonal(onPressed: onConnect, child: const Text('Connect')),
        ],
      ),
    );
  }
}

class _NoKey extends StatelessWidget {
  const _NoKey({required this.keyCard});
  final Widget keyCard;

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.xl),
        children: [
          keyCard,
          const SizedBox(height: Space.xl),
          const Icon(Icons.hub_outlined, size: 44, color: AppColors.text2),
          const SizedBox(height: Space.l),
          Text('Connect Gmail, Slack, Notion and more', style: context.text.titleMedium, textAlign: TextAlign.center),
          const SizedBox(height: Space.s),
          Text(
            'TeleAI reaches your other apps through Composio. Make a free Composio project, copy its API key '
            '(it starts with ak_), and paste it above. Then connect apps here.',
            style: context.text.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Space.s),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('https://dashboard.composio.dev'), mode: LaunchMode.externalApplication),
            child: const Text('Get a key at composio.dev'),
          ),
          const SizedBox(height: Space.xl),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: Space.s,
            runSpacing: Space.s,
            children: [
              for (final t in appToolkits)
                Chip(
                  avatar: Icon(t.icon, size: 16, color: t.color),
                  label: Text(t.label),
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
        ],
      ),
    ),
  );
}
