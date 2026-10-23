import '../../assistant/presentation/watches_screen.dart';
import '../../brief/brief_screen.dart';
import '../../telegram/presentation/scheduled_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../../../core/config/app_config.dart';
import '../../../core/widgets/brand_mark.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../../ai/data/model_catalog.dart';
import '../../assistant/watches.dart';
import '../../auth/presentation/welcome_screen.dart';
import '../../telegram/data/telegram_store.dart';
import '../../telegram/data/telegram_tools.dart';
import '../../telegram/presentation/chat_profile_screen.dart';
import '../../telegram/presentation/tg_avatar.dart';
import '../../usage/usage.dart';
import '../../usage/usage_screen.dart';
import '../data/settings.dart';
import 'settings_screen.dart';
import 'tools_screen.dart';

/// Settings at a glance: who's signed in, then a few groups that each open
/// a page of their own.
class SettingsHub extends ConsumerWidget {
  const SettingsHub({super.key});

  void _open(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final store = ref.watch(telegramStoreProvider);
    final cat = ref.watch(modelCatalogProvider);
    final watches = ref
        .watch(watchStoreProvider)
        .where((w) => w.enabled)
        .length;
    final usage = ref.watch(usageProvider);
    final today = DateTime.now();
    final spentToday = usage
        .where(
          (e) => e.at.isAfter(DateTime(today.year, today.month, today.day)),
        )
        .fold<double>(0, (n, e) => n + e.cost);
    final toolsOn = telegramTools
        .where((t) => t.isOn(s))
        .length;
    final me = store.me;
    final username = me == null ? null : store.username(me.usernames);

    Widget tile(
      IconData icon,
      String title,
      String subtitle,
      VoidCallback onTap, {
      Color? tint,
    }) => ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: (tint ?? AppColors.activeAccent).withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(Radii.m),
        ),
        child: Icon(icon, size: 20, color: tint ?? AppColors.activeAccent),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: context.text.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.text3),
      onTap: onTap,
    );

    Widget group(String label, List<Widget> tiles) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            Space.xs,
            Space.l,
            Space.xs,
            Space.xs,
          ),
          child: Text(label.toUpperCase(), style: context.text.labelSmall),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(Radii.xl),
            border: Border.all(color: AppColors.line),
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              children: [
                for (final (i, t) in tiles.indexed) ...[
                  if (i > 0) const Divider(indent: 68),
                  t,
                ],
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              Space.l,
              Space.s,
              Space.l,
              Space.xxl,
            ),
            children: [
              Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.xl),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Radii.xl),
                  onTap: me == null
                      ? null
                      : () async {
                          final chat = await ref
                              .read(telegramClientProvider)
                              .send<td.Chat>(
                                td.CreatePrivateChat(
                                  userId: me.id,
                                  force: false,
                                ),
                                limited: true,
                              );
                          if (context.mounted)
                            _open(
                              context,
                              ChatProfileScreen(chatId: chat.id, self: true),
                            );
                        },
                  child: Padding(
                    padding: const EdgeInsets.all(Space.l),
                    child: Row(
                      children: [
                        if (me != null)
                          TgAvatar(
                            userId: me.id,
                            title: '${me.firstName} ${me.lastName}',
                            size: 56,
                          )
                        else
                          const BrandMark(size: 56),
                        const SizedBox(width: Space.l),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                me == null
                                    ? 'TeleAI'
                                    : '${me.firstName} ${me.lastName}'.trim(),
                                style: context.text.titleLarge,
                              ),
                              Text(
                                [
                                  if (username != null) '@$username',
                                  if (me != null && me.phoneNumber.isNotEmpty)
                                    '+${me.phoneNumber}',
                                ].join(' · '),
                                style: context.text.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.text3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              group('Assistant', [
                tile(
                  SettingsSection.ai.icon,
                  SettingsSection.ai.title,
                  s.hasAnyKey
                      ? (cat.byId(s.model)?.name ?? AiRoute.bare(s.model))
                      : 'Add your AI key to start',
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.ai),
                  ),
                  tint: s.hasAnyKey ? null : AppColors.warning,
                ),
                tile(
                  SettingsSection.assistant.icon,
                  SettingsSection.assistant.title,
                  SettingsSection.assistant.subtitle,
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.assistant),
                  ),
                ),
                tile(
                  Icons.handyman_outlined,
                  'Tools',
                  s.readOnlyMode
                      ? 'Read-only mode · $toolsOn of ${telegramTools.length} on'
                      : '$toolsOn of ${telegramTools.length} on',
                  () => _open(context, const ToolsScreen()),
                ),
                SwitchListTile(
                  secondary: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.activeAccent.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(Radii.m),
                    ),
                    child: Icon(Icons.lock_outline_rounded, size: 20, color: AppColors.activeAccent),
                  ),
                  title: const Text('Read-only mode'),
                  subtitle: Text(
                    'Only tools that read: nothing is sent, changed or deleted',
                    style: context.text.bodySmall,
                  ),
                  value: s.readOnlyMode,
                  onChanged: ref.read(settingsProvider.notifier).setReadOnlyMode,
                ),
                tile(
                  Icons.insights_outlined,
                  'Usage & cost',
                  spentToday > 0
                      ? '${usd(spentToday)} today'
                      : 'Tokens and spend by chat, model and modality',
                  () => _open(context, const UsageScreen()),
                ),
              ]),
              group('Automation', [
                tile(
                  Icons.visibility_outlined,
                  'Watches & routines',
                  '$watches on',
                  () => _open(context, const WatchesScreen()),
                ),
                tile(
                  Icons.schedule_send_outlined,
                  'Scheduled messages',
                  'Everything waiting to go out, by date or chat',
                  () => _open(context, const ScheduledScreen()),
                ),
                tile(
                  Icons.wb_twilight_rounded,
                  'Briefs',
                  s.briefsScheduled ? 'Morning ${s.briefMorning} · night ${s.briefNight}' : 'On demand only',
                  () => _open(context, const BriefScreen()),
                ),
                tile(
                  SettingsSection.proactivity.icon,
                  SettingsSection.proactivity.title,
                  !s.proactive
                      ? 'Paused'
                      : '${s.approvalMode.label} · ${s.notifications ? 'notifications on' : 'notifications off'}',
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.proactivity),
                  ),
                ),
              ]),
              group('Experience', [
                tile(
                  SettingsSection.voice.icon,
                  SettingsSection.voice.title,
                  '${s.voiceEngine.label} voice · ${s.dictationEngine.label} dictation',
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.voice),
                  ),
                ),
                tile(
                  SettingsSection.media.icon,
                  SettingsSection.media.title,
                  [
                        if (s.autoPhotos) 'photos',
                        if (s.autoVoice) 'voice',
                        if (s.autoMusic) 'music',
                      ].isEmpty
                      ? 'Nothing downloads on its own'
                      : 'Auto: ${[if (s.autoPhotos) 'photos', if (s.autoVoice) 'voice', if (s.autoMusic) 'music'].join(', ')}',
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.media),
                  ),
                ),
                tile(
                  SettingsSection.appearance.icon,
                  SettingsSection.appearance.title,
                  '${s.accent.label} accent · ${s.chatFontSize.toStringAsFixed(0)} pt chat text',
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.appearance),
                  ),
                ),
              ]),
              group('Account & app', [
                tile(
                  SettingsSection.account.icon,
                  SettingsSection.account.title,
                  SettingsSection.account.subtitle,
                  () => _open(
                    context,
                    const SettingsScreen(section: SettingsSection.account),
                  ),
                ),
                tile(
                  Icons.auto_stories_outlined,
                  'Show the introduction again',
                  'The welcome pages',
                  () => _open(context, const WelcomeScreen(replay: true)),
                ),
              ]),
              const SizedBox(height: Space.l),
              Center(
                child: Column(
                  children: [
                    const BrandMark(size: 36),
                    const SizedBox(height: Space.s),
                    Text(
                      '${AppConfig.appName} ${AppConfig.version}',
                      style: context.text.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
