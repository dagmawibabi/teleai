import '../../telegram/presentation/chat_actions.dart' show confirmAction;
import '../../brief/brief_store.dart';
import '../../canvas/canvas_store.dart';
import '../../chat/data/chat_controller.dart';
import '../../telegram/presentation/translate_sheet.dart' show translateLanguages;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../../ai/data/gateway_client.dart';
import '../../ai/data/media_client.dart';
import '../../ai/data/model_catalog.dart';
import '../../auth/data/auth_controller.dart';
import '../../telegram/data/telegram_store.dart';
import '../../telegram/data/telegram_tools.dart';
import '../../telegram/presentation/tg_avatar.dart';
import '../../voice/player_sheet.dart';
import '../../voice/speaker.dart';
import '../data/settings.dart';
import 'model_picker_screen.dart';
import 'permissions_card.dart';
import 'settings_hub.dart';
import 'tools_screen.dart';
import '../../assistant/memory.dart';
import '../../assistant/presentation/memory_screen.dart';
import '../../usage/usage_screen.dart';

/// The pages Settings opens into.
enum SettingsSection {
  ai(
    'AI & models',
    'Keys, chat and image models, thinking',
    Icons.auto_awesome_outlined,
  ),
  assistant(
    'Assistant',
    'Instructions, memory and tools',
    Icons.psychology_outlined,
  ),
  proactivity(
    'Proactivity & watches',
    'Notifications, approvals, background',
    Icons.bolt_rounded,
  ),
  voice('Voice', 'Read aloud and dictation', Icons.graphic_eq_rounded),
  media(
    'Media & downloads',
    'Auto-download and storage',
    Icons.perm_media_outlined,
  ),
  appearance(
    'Appearance',
    'Accent, chat text and code colours',
    Icons.palette_outlined,
  ),
  account(
    'Account & privacy',
    'Your Telegram session and safety',
    Icons.shield_outlined,
  );

  const SettingsSection(this.title, this.subtitle, this.icon);
  final String title;
  final String subtitle;
  final IconData icon;
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key, this.section});

  /// The page to show; none shows the overview.
  final SettingsSection? section;

  Future<void> _pick(
    BuildContext context,
    WidgetRef ref,
    ModelKind kind,
    String current,
    Future<void> Function(String) set,
  ) async {
    final id = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => ModelPickerScreen(current: current, kind: kind),
      ),
    );
    if (id != null) await set(id);
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text(
          'This ends TeleAI\'s Telegram session and removes your conversations from this device. '
          'Nothing in your Telegram account is deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    if (context.mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    await ref.read(authControllerProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final ctl = ref.read(settingsProvider.notifier);
    final cat = ref.watch(modelCatalogProvider);
    final store = ref.watch(telegramStoreProvider);
    final me = store.me;
    final limiter = ref.watch(telegramClientProvider).limiter;
    final model = cat.byId(s.model);
    final enabledTools = telegramTools
        .where((t) => t.isOn(s))
        .length;
    final section = this.section;
    if (section == null) return const SettingsHub();

    return Scaffold(
      appBar: AppBar(title: Text(section.title)),
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
              if (section == SettingsSection.ai) ...[
                const _Header('Keys'),
                _Card(
                  children: [
                    _KeyTile(
                      title: 'Vercel AI Gateway',
                      subtitle: 'vercel.com → AI Gateway → API keys',
                      value: s.vercelKey,
                      onSave: ctl.setVercelKey,
                      verify: (k) => GatewayClient.verifyKey(
                        router: AiRouter.vercel,
                        key: k,
                      ),
                      help: Uri.parse('https://vercel.com/docs/ai-gateway'),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    _KeyTile(
                      title: 'Exa web search',
                      subtitle: 'Exa → API keys. Lets the assistant search the web when you ask.',
                      value: s.exaKey,
                      onSave: ctl.setExaKey,
                      verify: (k) async =>
                          k.trim().isEmpty ? 'Paste an Exa key first.' : null,
                      help: Uri.parse('https://dashboard.exa.ai/api-keys'),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    _KeyTile(
                      title: 'OpenRouter (optional)',
                      subtitle: 'openrouter.ai → Keys',
                      value: s.openRouterKey,
                      onSave: ctl.setOpenRouterKey,
                      verify: (k) => GatewayClient.verifyKey(
                        router: AiRouter.openRouter,
                        key: k,
                      ),
                      help: Uri.parse('https://openrouter.ai/keys'),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    _KeyTile(
                      title: 'ElevenLabs (optional)',
                      subtitle: 'For ElevenLabs voices and dictation',
                      value: s.elevenKey,
                      onSave: ctl.setElevenKey,
                      verify: (k) async {
                        try {
                          await ElevenLabsClient(k).voices();
                          return null;
                        } catch (e) {
                          return '$e';
                        }
                      },
                      help: Uri.parse(
                        'https://elevenlabs.io/app/settings/api-keys',
                      ),
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.ai) ...[
                const _Header('Models'),
                _Card(
                  children: [
                    _ModelTile(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'Chat',
                      model: cat.byId(s.model),
                      id: s.model,
                      onTap: () => _pick(
                        context,
                        ref,
                        ModelKind.text,
                        s.model,
                        ctl.setModel,
                      ),
                    ),
                    if (model != null && !model.toolCall)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Space.l,
                          0,
                          Space.l,
                          Space.m,
                        ),
                        child: Text(
                          'This model can\'t call tools, so answers can\'t use your Telegram.',
                          style: context.text.bodySmall?.copyWith(
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    const Divider(indent: 56),
                    _ModelTile(
                      icon: Icons.brush_outlined,
                      title: 'Images',
                      model: cat.byId(s.imageModel),
                      id: s.imageModel,
                      onTap: () => _pick(
                        context,
                        ref,
                        ModelKind.image,
                        s.imageModel,
                        ctl.setImageModel,
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Space.l,
                        Space.m,
                        Space.l,
                        Space.l,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Thinking', style: context.text.titleSmall),
                          const SizedBox(height: 2),
                          Text(
                            'How much reasoning models think before answering.',
                            style: context.text.bodySmall,
                          ),
                          const SizedBox(height: Space.m),
                          SizedBox(
                            width: double.infinity,
                            child: SegmentedButton<Thinking>(
                              showSelectedIcon: false,
                              segments: [
                                for (final t in Thinking.values)
                                  ButtonSegment(value: t, label: Text(t.label)),
                              ],
                              selected: {s.thinking},
                              onSelectionChanged: (v) =>
                                  ctl.setThinking(v.first),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.assistant) ...[
                const _Header('Assistant'),
                _Card(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.handyman_outlined),
                      title: const Text('Tools'),
                      subtitle: Text(
                        '$enabledTools of ${telegramTools.length} on',
                        style: context.text.bodySmall,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.text3,
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ToolsScreen(),
                        ),
                      ),
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.insights_outlined),
                      title: const Text('Usage & cost'),
                      subtitle: Text(
                        'Tokens and spend by chat, model and modality',
                        style: context.text.bodySmall,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.text3,
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const UsageScreen(),
                        ),
                      ),
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.bookmarks_outlined),
                      title: const Text('Memory'),
                      subtitle: Text(
                        '${ref.watch(memoryProvider).length} things remembered',
                        style: context.text.bodySmall,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.text3,
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const MemoryScreen(),
                        ),
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    const _InstructionsField(),
                  ],
                ),
                const _Header('Answers'),
                _Card(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.short_text_rounded),
                      title: const Text('Answer length'),
                      subtitle: Text(s.answerStyle.explanation, style: context.text.bodySmall),
                      trailing: DropdownButton<AnswerStyle>(
                        value: s.answerStyle,
                        underline: const SizedBox(),
                        items: [
                          for (final v in AnswerStyle.values) DropdownMenuItem(value: v, child: Text(v.label)),
                        ],
                        onChanged: (v) {
                          if (v != null) ctl.setAnswerStyle(v);
                        },
                      ),
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.language_rounded),
                      title: const Text('Answer language'),
                      subtitle: Text('The language the assistant writes in', style: context.text.bodySmall),
                      trailing: DropdownButton<String>(
                        value: s.answerLanguage,
                        underline: const SizedBox(),
                        items: [
                          const DropdownMenuItem(value: '', child: Text('Same as mine')),
                          for (final v in translateLanguages.values) DropdownMenuItem(value: v, child: Text(v)),
                        ],
                        onChanged: (v) {
                          if (v != null) ctl.setAnswerLanguage(v);
                        },
                      ),
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.repeat_rounded),
                      title: const Text('Steps per answer'),
                      subtitle: Text(
                        'Up to ${s.maxSteps} rounds of tool calls. More digs deeper but costs more.',
                        style: context.text.bodySmall,
                      ),
                    ),
                    Slider(
                      value: s.maxSteps.toDouble().clamp(4, 30),
                      min: 4,
                      max: 30,
                      divisions: 26,
                      label: '${s.maxSteps}',
                      onChanged: (v) => ctl.setMaxSteps(v.round()),
                    ),
                    const Divider(indent: 56),
                    SwitchListTile(
                      secondary: const Icon(Icons.psychology_outlined),
                      title: const Text('Show thinking'),
                      subtitle: Text('The model\'s reasoning above its answer', style: context.text.bodySmall),
                      value: s.showThinking,
                      onChanged: ctl.setShowThinking,
                    ),
                    const Divider(indent: 56),
                    SwitchListTile(
                      secondary: const Icon(Icons.build_circle_outlined),
                      title: const Text('Show tool calls'),
                      subtitle: Text(
                        'A card for each tool the assistant uses. Approvals always show.',
                        style: context.text.bodySmall,
                      ),
                      value: s.showToolCalls,
                      onChanged: ctl.setShowToolCalls,
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.proactivity) ...[
                const _Header('Proactivity'),
                _Card(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.bolt_rounded),
                      title: const Text('Proactive assistant'),
                      subtitle: Text(
                        s.proactive
                            ? 'Watches and routines run on their own'
                            : 'All watches and routines are paused',
                        style: context.text.bodySmall,
                      ),
                      value: s.proactive,
                      onChanged: ctl.setProactive,
                    ),
                    SwitchListTile(
                      secondary: const Icon(Icons.notifications_none_rounded),
                      title: const Text('Notifications'),
                      subtitle: Text(
                        'What watches find, and approvals they wait for',
                        style: context.text.bodySmall,
                      ),
                      value: s.notifications,
                      onChanged: ctl.setNotifications,
                    ),
                    if (s.notifications) ...[
                      SwitchListTile(
                        secondary: const Icon(Icons.bedtime_outlined),
                        title: const Text('Quiet hours'),
                        subtitle: Text(
                          s.quietHours
                              ? 'Silent from ${s.quietStart} to ${s.quietEnd}; updates still arrive in the app'
                              : 'Pause notifications overnight',
                          style: context.text.bodySmall,
                        ),
                        value: s.quietHours,
                        onChanged: ctl.setQuietHours,
                      ),
                      if (s.quietHours)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                          child: Row(
                            children: [
                              for (final (start, label, value) in [
                                (true, 'From', s.quietStart),
                                (false, 'To', s.quietEnd),
                              ]) ...[
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      final p = value.split(':');
                                      final t = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                          hour: int.tryParse(p.first) ?? 0,
                                          minute: int.tryParse(p.last) ?? 0,
                                        ),
                                      );
                                      if (t == null) return;
                                      final v =
                                          '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
                                      start ? ctl.setQuietStart(v) : ctl.setQuietEnd(v);
                                    },
                                    child: Text('$label $value'),
                                  ),
                                ),
                                if (start) const SizedBox(width: Space.s),
                              ],
                            ],
                          ),
                        ),
                    ],
                    SwitchListTile(
                      secondary: const Icon(Icons.nightlight_outlined),
                      title: const Text('Keep running in the background'),
                      subtitle: Text(
                        'A quiet ongoing notification keeps watches listening after you leave the app',
                        style: context.text.bodySmall,
                      ),
                      value: s.keepAlive,
                      onChanged: ctl.setKeepAlive,
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Approvals', style: context.text.titleSmall),
                          const SizedBox(height: 2),
                          Text(
                            'For sending, commenting, editing, scheduling, reacting, muting, archiving and marking as read.',
                            style: context.text.bodySmall,
                          ),
                          const SizedBox(height: Space.m),
                          SizedBox(
                            width: double.infinity,
                            child: SegmentedButton<ApprovalMode>(
                              showSelectedIcon: false,
                              segments: const [
                                ButtonSegment(
                                  value: ApprovalMode.ask,
                                  label: Text('Always ask'),
                                ),
                                ButtonSegment(
                                  value: ApprovalMode.watches,
                                  label: Text('Not in watches'),
                                ),
                                ButtonSegment(
                                  value: ApprovalMode.never,
                                  label: Text('Never ask'),
                                ),
                              ],
                              selected: {s.approvalMode},
                              onSelectionChanged: (v) =>
                                  ctl.setApprovalMode(v.first),
                            ),
                          ),
                          const SizedBox(height: Space.s),
                          Text(
                            s.approvalMode.explanation,
                            style: context.text.bodySmall?.copyWith(
                              color: s.approvalMode == ApprovalMode.ask
                                  ? AppColors.text2
                                  : AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.proactivity) ...[
                const _Header('Permissions'),
                const _Card(children: [PermissionsCard()]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Space.xs,
                    Space.s,
                    Space.xs,
                    0,
                  ),
                  child: Text(
                    'Some phones (Samsung, Xiaomi, Huawei) also have their own battery saver: set TeleAI to '
                    '"Unrestricted" there so watches are not stopped.',
                    style: context.text.bodySmall,
                  ),
                ),
              ],
              if (section == SettingsSection.voice) ...[
                const _Header('Read aloud'),
                _Card(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: SizedBox(
                        width: double.infinity,
                        child: SegmentedButton<VoiceEngine>(
                          showSelectedIcon: false,
                          segments: [
                            for (final e in VoiceEngine.values)
                              ButtonSegment(value: e, label: Text(e.label)),
                          ],
                          selected: {s.voiceEngine},
                          onSelectionChanged: (v) =>
                              ctl.setVoiceEngine(v.first),
                        ),
                      ),
                    ),
                    if (s.voiceEngine != VoiceEngine.ai) ...[
                      const Divider(indent: 56),
                      _ModelTile(
                        icon: Icons.graphic_eq_rounded,
                        title: 'AI audio model',
                        model: cat.byId(s.speechModel),
                        id: s.speechModel,
                        onTap: () => _pick(
                          context,
                          ref,
                          ModelKind.speech,
                          s.speechModel,
                          ctl.setSpeechModel,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Space.l,
                          0,
                          Space.l,
                          Space.m,
                        ),
                        child: Text(
                          'Used when the assistant generates audio.',
                          style: context.text.bodySmall,
                        ),
                      ),
                    ],
                    ...switch (s.voiceEngine) {
                      VoiceEngine.device => [
                        ListTile(
                          leading: const Icon(Icons.record_voice_over_outlined),
                          title: const Text('Device voice'),
                          subtitle: Text(
                            s.deviceVoice.isEmpty
                                ? 'System default'
                                : s.deviceVoice,
                            style: context.text.bodySmall,
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.text3,
                          ),
                          onTap: () => _pickDeviceVoice(context, ref),
                        ),
                      ],
                      VoiceEngine.ai => [
                        _ModelTile(
                          icon: Icons.graphic_eq_rounded,
                          title: 'AI audio model',
                          model: cat.byId(s.speechModel),
                          id: s.speechModel,
                          onTap: () => _pick(
                            context,
                            ref,
                            ModelKind.speech,
                            s.speechModel,
                            ctl.setSpeechModel,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            Space.l,
                            0,
                            Space.l,
                            Space.m,
                          ),
                          child: Text(
                            'Used for Read aloud and AI-generated audio.',
                            style: context.text.bodySmall,
                          ),
                        ),
                        const Divider(indent: 56),
                        ListTile(
                          leading: const Icon(Icons.record_voice_over_outlined),
                          title: const Text('Voice'),
                          subtitle: Text(
                            s.aiVoice.isEmpty ? 'Model default' : s.aiVoice,
                            style: context.text.bodySmall,
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.text3,
                          ),
                          onTap: () => _pickAiVoice(
                            context,
                            ref,
                            cat.byId(s.speechModel)?.voices ?? const [],
                          ),
                        ),
                      ],
                      VoiceEngine.elevenLabs => [
                        if (!s.hasElevenKey)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              Space.l,
                              0,
                              Space.l,
                              Space.m,
                            ),
                            child: Text(
                              'Add your ElevenLabs key above to use its voices.',
                              style: context.text.bodySmall?.copyWith(
                                color: AppColors.warning,
                              ),
                            ),
                          ),
                        ListTile(
                          leading: const Icon(Icons.record_voice_over_outlined),
                          title: const Text('ElevenLabs voice'),
                          subtitle: Text(
                            s.elevenVoiceName.isEmpty
                                ? 'Choose a voice'
                                : s.elevenVoiceName,
                            style: context.text.bodySmall,
                          ),
                          trailing: const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.text3,
                          ),
                          enabled: s.hasElevenKey,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const _ElevenVoicesScreen(),
                            ),
                          ),
                        ),
                        const Divider(indent: 56),
                        ListTile(
                          leading: const Icon(Icons.tune_rounded),
                          title: const Text('ElevenLabs model'),
                          subtitle: Text(
                            elevenModels
                                    .where((m) => m.$1 == s.elevenModel)
                                    .map((m) => '${m.$2} · ${m.$3}')
                                    .firstOrNull ??
                                s.elevenModel,
                            style: context.text.bodySmall,
                          ),
                          trailing: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.expand_more_rounded,
                              color: AppColors.text3,
                            ),
                            onSelected: ctl.setElevenModel,
                            itemBuilder: (_) => [
                              for (final m in elevenModels)
                                PopupMenuItem(
                                  value: m.$1,
                                  child: Text('${m.$2} · ${m.$3}'),
                                ),
                            ],
                          ),
                        ),
                      ],
                    },
                    const Divider(indent: Space.l, endIndent: Space.l),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Space.l,
                        Space.m,
                        Space.s,
                        0,
                      ),
                      child: Row(
                        children: [
                          Text('Speed', style: context.text.titleSmall),
                          Expanded(
                            child: Slider(
                              value: s.speechRate.clamp(0.5, 2.5),
                              min: 0.5,
                              max: 2.5,
                              divisions: 20,
                              label: '${s.speechRate.toStringAsFixed(2)}×',
                              onChanged: (v) =>
                                  ctl.setSpeechRate((v * 20).round() / 20),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                            child: Text(
                              '${s.speechRate.toStringAsFixed(2)}×',
                              style: context.text.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Space.l,
                        0,
                        Space.l,
                        Space.m,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          icon: const Icon(Icons.play_arrow_rounded),
                          label: const Text('Test voice'),
                          onPressed: () {
                            ref
                                .read(speakerProvider)
                                .play(
                                  'Hi! This is how TeleAI will read your answers aloud. You have three unread messages from your channels.',
                                  title: 'Voice test',
                                );
                            showPlayerSheet(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.media) ...[
                const _Header('Media'),
                _Card(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.photo_outlined),
                      title: const Text('Download photos automatically'),
                      subtitle: Text(
                        'Otherwise photos show blurred until you tap them',
                        style: context.text.bodySmall,
                      ),
                      value: s.autoPhotos,
                      onChanged: (v) => ctl.setAutoDownload(photos: v),
                    ),
                    SwitchListTile(
                      secondary: const Icon(Icons.mic_none_rounded),
                      title: const Text(
                        'Download voice messages automatically',
                      ),
                      subtitle: Text(
                        'So they play straight away',
                        style: context.text.bodySmall,
                      ),
                      value: s.autoVoice,
                      onChanged: (v) => ctl.setAutoDownload(voice: v),
                    ),
                    SwitchListTile(
                      secondary: const Icon(Icons.music_note_outlined),
                      title: const Text('Download music automatically'),
                      subtitle: Text(
                        'Songs can be large; off downloads when you press play',
                        style: context.text.bodySmall,
                      ),
                      value: s.autoMusic,
                      onChanged: (v) => ctl.setAutoDownload(music: v),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Space.l,
                        0,
                        Space.l,
                        Space.m,
                      ),
                      child: Text(
                        'Everything downloaded stays on this phone in Telegram\'s own cache, so it opens instantly next time.',
                        style: context.text.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.appearance) ...[
                const _Header('Appearance'),
                _Card(
                  children: [
                    _AppearancePreview(
                      accent: Color(s.accent.value),
                      fontSize: s.chatFontSize,
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Accent colour', style: context.text.titleSmall),
                          const SizedBox(height: Space.m),
                          Wrap(
                            spacing: Space.s,
                            runSpacing: Space.s,
                            children: [
                              for (final a in AccentChoice.values)
                                ChoiceChip(
                                  label: Text(a.label),
                                  selected: s.accent == a,
                                  avatar: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Color(a.value),
                                  ),
                                  onSelected: (_) => ctl.setAccent(a),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chat text size',
                            style: context.text.titleSmall,
                          ),
                          Text(
                            '${s.chatFontSize.toStringAsFixed(0)} pt',
                            style: context.text.bodySmall,
                          ),
                          Slider(
                            value: s.chatFontSize,
                            min: 13,
                            max: 21,
                            divisions: 8,
                            label: '${s.chatFontSize.toStringAsFixed(0)} pt',
                            onChanged: ctl.setChatFontSize,
                          ),
                        ],
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    ListTile(
                      title: const Text('Code highlight theme'),
                      subtitle: Text(
                        s.codeTheme.label,
                        style: context.text.bodySmall,
                      ),
                      trailing: DropdownButton<CodeThemeChoice>(
                        value: s.codeTheme,
                        underline: const SizedBox(),
                        items: [
                          for (final v in CodeThemeChoice.values)
                            DropdownMenuItem(value: v, child: Text(v.label)),
                        ],
                        onChanged: (v) {
                          if (v != null) ctl.setCodeTheme(v);
                        },
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    SwitchListTile(
                      secondary: const Icon(Icons.toll_outlined),
                      title: const Text('Tokens and cost under answers'),
                      subtitle: Text(
                        'A small line under each reply: tokens in and out, cached and reasoning tokens, and what it cost.',
                        style: context.text.bodySmall,
                      ),
                      value: s.showMessageUsage,
                      onChanged: ctl.setShowMessageUsage,
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    SwitchListTile(
                      secondary: const Icon(Icons.web_asset_outlined),
                      title: const Text('Link previews'),
                      subtitle: Text('The site card under messages with links', style: context.text.bodySmall),
                      value: s.showLinkPreviews,
                      onChanged: ctl.setShowLinkPreviews,
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    ListTile(
                      leading: const Icon(Icons.translate_rounded),
                      title: const Text('Translate into'),
                      subtitle: Text('For the Translate button on messages', style: context.text.bodySmall),
                      trailing: DropdownButton<String>(
                        value: s.translateTo,
                        underline: const SizedBox(),
                        items: [
                          const DropdownMenuItem(value: '', child: Text('Phone language')),
                          for (final e in translateLanguages.entries)
                            DropdownMenuItem(value: e.key, child: Text(e.value)),
                        ],
                        onChanged: (v) {
                          if (v != null) ctl.setTranslateTo(v);
                        },
                      ),
                    ),
                  ],
                ),
                const _Header('Chats'),
                _Card(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.schedule_rounded),
                      title: const Text('24-hour clock'),
                      subtitle: Text(s.use24h ? '14:05' : '2:05 PM', style: context.text.bodySmall),
                      value: s.use24h,
                      onChanged: ctl.setUse24h,
                    ),
                    const Divider(indent: 56),
                    SwitchListTile(
                      secondary: const Icon(Icons.account_circle_outlined),
                      title: const Text('Avatars in groups'),
                      subtitle: Text('Who wrote each message, at a glance', style: context.text.bodySmall),
                      value: s.groupAvatars,
                      onChanged: ctl.setGroupAvatars,
                    ),
                    const Divider(indent: 56),
                    SwitchListTile(
                      secondary: const Icon(Icons.view_headline_rounded),
                      title: const Text('Compact chat lists'),
                      subtitle: Text('Smaller rows, more chats on screen', style: context.text.bodySmall),
                      value: s.compactList,
                      onChanged: ctl.setCompactList,
                    ),
                  ],
                ),
              ],
              if (section == SettingsSection.voice) ...[
                const _Header('Dictation'),
                _Card(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Space.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Speech to text in the input box',
                            style: context.text.bodySmall,
                          ),
                          const SizedBox(height: Space.m),
                          SizedBox(
                            width: double.infinity,
                            child: SegmentedButton<DictationEngine>(
                              showSelectedIcon: false,
                              segments: [
                                for (final e in DictationEngine.values)
                                  ButtonSegment(value: e, label: Text(e.label)),
                              ],
                              selected: {s.dictationEngine},
                              onSelectionChanged: (v) =>
                                  ctl.setDictationEngine(v.first),
                            ),
                          ),
                          const SizedBox(height: Space.s),
                          Text(switch (s.dictationEngine) {
                            DictationEngine.device => 'Live, on the device. Free; quality depends on your phone.',
                            DictationEngine.ai => 'Records, then a chat model that understands audio writes it out.',
                            DictationEngine.elevenLabs => 'Records, then ElevenLabs Scribe writes it out. Needs your ElevenLabs key.',
                          }, style: context.text.bodySmall),
                        ],
                      ),
                    ),
                    if (s.dictationEngine == DictationEngine.ai) ...[
                      const Divider(indent: Space.l, endIndent: Space.l),
                      _ModelTile(
                        icon: Icons.hearing_outlined,
                        title: 'Dictation model',
                        model: cat.byId(s.transcriptionModel),
                        id: s.transcriptionModel,
                        onTap: () => _pick(
                          context,
                          ref,
                          ModelKind.transcription,
                          s.transcriptionModel,
                          ctl.setTranscriptionModel,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
              if (section == SettingsSection.account) ...[
                const _Header('Presence'),
                _Card(
                  children: [
                    SwitchListTile(
                      secondary: const Icon(Icons.circle, size: 14, color: AppColors.success),
                      title: const Text('Appear online while using the app'),
                      subtitle: Text(
                        'Needed to see who is typing and live online status. You go offline as soon as you leave the app.',
                        style: context.text.bodySmall,
                      ),
                      value: s.appearOnline,
                      onChanged: ctl.setAppearOnline,
                    ),
                    const Divider(indent: 56),
                    SwitchListTile(
                      secondary: const Icon(Icons.done_all_rounded),
                      title: const Text('Mark chats read when I open them'),
                      subtitle: Text(
                        'Off: reading here stays invisible, and chats stay unread in Telegram.',
                        style: context.text.bodySmall,
                      ),
                      value: s.markReadOnOpen,
                      onChanged: ctl.setMarkReadOnOpen,
                    ),
                  ],
                ),
                const _Header('Data on this phone'),
                _Card(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.delete_sweep_outlined, color: AppColors.danger),
                      title: const Text('Delete all AI conversations'),
                      subtitle: Text('Your Telegram is not touched', style: context.text.bodySmall),
                      onTap: () async {
                        if (!await confirmAction(
                          context,
                          title: 'Delete every AI conversation?',
                          message: 'All chats with the assistant on this phone go. Watches keep running.',
                          action: 'Delete all',
                        )) {
                          return;
                        }
                        await ref.read(chatControllerProvider.notifier).deleteAll();
                        if (context.mounted) showSnack(context, 'Conversations deleted');
                      },
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.wb_twilight_rounded, color: AppColors.danger),
                      title: const Text('Delete all briefs'),
                      onTap: () async {
                        if (!await confirmAction(context, title: 'Delete every brief?', message: 'Saved briefs go.', action: 'Delete')) {
                          return;
                        }
                        await ref.read(briefStoreProvider.notifier).deleteAll();
                        if (context.mounted) showSnack(context, 'Briefs deleted');
                      },
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.dashboard_customize_outlined, color: AppColors.danger),
                      title: const Text('Empty the Content Canvas'),
                      onTap: () async {
                        if (!await confirmAction(
                          context,
                          title: 'Empty the canvas?',
                          message: 'Every folder and saved item goes. Telegram is not touched.',
                          action: 'Empty',
                        )) {
                          return;
                        }
                        await ref.read(canvasProvider.notifier).clear();
                        if (context.mounted) showSnack(context, 'Canvas emptied');
                      },
                    ),
                    const Divider(indent: 56),
                    ListTile(
                      leading: const Icon(Icons.restart_alt_rounded),
                      title: const Text('Reset preferences'),
                      subtitle: Text(
                        'Every setting back to its default. Keys, models and instructions stay.',
                        style: context.text.bodySmall,
                      ),
                      onTap: () async {
                        if (!await confirmAction(
                          context,
                          title: 'Reset all preferences?',
                          message: 'Tools, appearance, voice and automation settings go back to their defaults.',
                          action: 'Reset',
                        )) {
                          return;
                        }
                        await ctl.resetPreferences();
                        if (context.mounted) showSnack(context, 'Preferences reset');
                      },
                    ),
                  ],
                ),
                const _Header('Telegram'),
                _Card(
                  children: [
                    ListTile(
                      leading: me == null
                          ? const Icon(Icons.person_outline_rounded)
                          : TgAvatar(
                              userId: me.id,
                              title: '${me.firstName} ${me.lastName}',
                              size: 36,
                            ),
                      title: Text(
                        me == null
                            ? 'Signed in'
                            : '${me.firstName} ${me.lastName}'.trim(),
                      ),
                      subtitle: Text(
                        [
                          if (me != null && me.phoneNumber.isNotEmpty)
                            '+${me.phoneNumber}',
                          if (store.chatsLoaded)
                            '${store.chats.values.where((c) => c.isListed).length} chats',
                        ].join(' · '),
                        style: context.text.bodySmall,
                      ),
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    const _Note(
                      icon: Icons.verified_user_outlined,
                      title: 'Read-only by design',
                      body:
                          'The assistant can list chats and read and search messages. It has no tools to leave, '
                          'delete, mute, archive or edit anything, and reading never marks messages as read.',
                    ),
                    const _Note(
                      icon: Icons.front_hand_outlined,
                      title: 'You approve every message',
                      body: 'Sending, posting or forwarding waits for you to approve it.',
                    ),
                    _Note(
                      icon: Icons.speed_rounded,
                      title: 'Gentle on Telegram',
                      body:
                          'Requests that reach Telegram\'s servers are paced (bursts of ${limiter.capacity}, then about one '
                          'a second), and the app stops completely when Telegram asks it to wait.',
                    ),
                    const Divider(indent: Space.l, endIndent: Space.l),
                    ListTile(
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: AppColors.danger,
                      ),
                      title: const Text(
                        'Sign out',
                        style: TextStyle(color: AppColors.danger),
                      ),
                      onTap: () => _signOut(context, ref),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDeviceVoice(BuildContext context, WidgetRef ref) async {
    final voices = await ref.read(speakerProvider).loadDeviceVoices();
    if (!context.mounted) return;
    final current = ref.read(settingsProvider).deviceVoice;
    final picked = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 1,
        builder: (ctx, scroll) => ListView(
          controller: scroll,
          children: [
            ListTile(
              title: const Text('System default'),
              trailing: current.isEmpty
                  ? Icon(Icons.check_rounded, color: AppColors.accent)
                  : null,
              onTap: () => Navigator.pop(ctx, ''),
            ),
            if (voices.isEmpty)
              const Padding(
                padding: EdgeInsets.all(Space.xl),
                child: Text('This device didn\'t list any voices.'),
              ),
            for (final v in voices)
              ListTile(
                title: Text(v['name'] ?? ''),
                subtitle: Text(
                  v['locale'] ?? '',
                  style: context.text.bodySmall,
                ),
                trailing: v['name'] == current
                    ? Icon(Icons.check_rounded, color: AppColors.accent)
                    : null,
                onTap: () => Navigator.pop(ctx, v['name']),
              ),
          ],
        ),
      ),
    );
    if (picked != null)
      await ref.read(settingsProvider.notifier).setDeviceVoice(picked);
  }

  Future<void> _pickAiVoice(
    BuildContext context,
    WidgetRef ref,
    List<String> known,
  ) async {
    final ctrl = TextEditingController(
      text: ref.read(settingsProvider).aiVoice,
    );
    final voices = known.isNotEmpty
        ? known
        : const [
            'alloy',
            'ash',
            'ballad',
            'coral',
            'echo',
            'fable',
            'nova',
            'onyx',
            'sage',
            'shimmer',
            'verse',
          ];
    final picked = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Voice'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: ctrl,
              decoration: const InputDecoration(
                hintText: 'Voice name, or empty for default',
              ),
            ),
            const SizedBox(height: Space.m),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final v in voices)
                  ActionChip(
                    label: Text(v),
                    onPressed: () => Navigator.pop(ctx, v),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: const Text('Use'),
          ),
        ],
      ),
    );
    if (picked != null)
      await ref.read(settingsProvider.notifier).setAiVoice(picked);
  }
}

class _ModelTile extends StatelessWidget {
  const _ModelTile({
    required this.icon,
    required this.title,
    required this.model,
    required this.id,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final ModelInfo? model;
  final String id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final m = model;
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        [
          m?.name ?? AiRoute.bare(id),
          AiRoute.routerName(id),
          if (m != null) m.priceLabel,
        ].join(' · '),
        style: context.text.bodySmall,
        maxLines: 2,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (m != null)
            IconButton(
              tooltip: 'Details',
              icon: const Icon(
                Icons.info_outline_rounded,
                size: 20,
                color: AppColors.text3,
              ),
              onPressed: () => showModelDetails(context, m),
            ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.text3),
        ],
      ),
      onTap: onTap,
    );
  }
}

/// The ElevenLabs voices in the user's library, with samples.
class _ElevenVoicesScreen extends ConsumerStatefulWidget {
  const _ElevenVoicesScreen();

  @override
  ConsumerState<_ElevenVoicesScreen> createState() =>
      _ElevenVoicesScreenState();
}

class _ElevenVoicesScreenState extends ConsumerState<_ElevenVoicesScreen> {
  List<ElevenVoice>? _voices;
  String? _error;
  String _q = '';
  final _player = AudioPlayer();
  String? _playing;

  @override
  void initState() {
    super.initState();
    ElevenLabsClient(ref.read(settingsProvider).elevenKey).voices().then(
      (v) {
        if (mounted) setState(() => _voices = v);
      },
      onError: (Object e) {
        if (mounted) setState(() => _error = '$e');
      },
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _sample(ElevenVoice v) async {
    if (_playing == v.id) {
      await _player.stop();
      setState(() => _playing = null);
      return;
    }
    if (v.previewUrl == null) return;
    setState(() => _playing = v.id);
    await _player.play(UrlSource(v.previewUrl!));
    _player.onPlayerComplete.first.then((_) {
      if (mounted && _playing == v.id) setState(() => _playing = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(settingsProvider);
    final q = _q.toLowerCase();
    final list = (_voices ?? const <ElevenVoice>[])
        .where(
          (v) =>
              q.isEmpty ||
              v.name.toLowerCase().contains(q) ||
              v.traits.toLowerCase().contains(q),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('ElevenLabs voices')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
            child: TextField(
              onChanged: (v) => setState(() => _q = v),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Search voices',
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: AppColors.text3,
                ),
              ),
            ),
          ),
          Expanded(
            child: _error != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Space.xl),
                      child: Text(_error!),
                    ),
                  )
                : _voices == null
                ? const Center(
                    child: SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, i) {
                      final v = list[i];
                      final selected = v.id == s.elevenVoiceId;
                      return ListTile(
                        leading: IconButton(
                          tooltip: 'Play sample',
                          icon: Icon(
                            _playing == v.id
                                ? Icons.stop_circle_outlined
                                : Icons.play_circle_outline_rounded,
                          ),
                          onPressed: v.previewUrl == null
                              ? null
                              : () => _sample(v),
                        ),
                        title: Text(v.name),
                        subtitle: Text(
                          [
                            v.traits,
                            v.category,
                          ].where((t) => t.isNotEmpty).join(' · '),
                          style: context.text.bodySmall,
                        ),
                        trailing: selected
                            ? Icon(
                                Icons.check_rounded,
                                color: AppColors.accent,
                              )
                            : null,
                        onTap: () async {
                          await ref
                              .read(settingsProvider.notifier)
                              .setElevenVoice(v.id, v.name);
                          if (context.mounted) Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _AppearancePreview extends StatelessWidget {
  const _AppearancePreview({required this.accent, required this.fontSize});
  final Color accent;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Space.l),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live preview', style: context.text.titleSmall),
        const SizedBox(height: Space.s),
        Text(
          'See chat colour and type changes as you adjust them.',
          style: context.text.bodySmall,
        ),
        const SizedBox(height: Space.m),
        Container(
          padding: const EdgeInsets.all(Space.m),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(Radii.m),
            border: Border.all(color: accent.withValues(alpha: .45)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Maya · online',
                    style: TextStyle(
                      fontSize: 12,
                      color: accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Space.s),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Space.m,
                    vertical: Space.s,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface3,
                    borderRadius: BorderRadius.circular(Radii.l),
                  ),
                  child: Text(
                    'This is how messages will read.',
                    style: TextStyle(fontSize: fontSize, color: AppColors.text),
                  ),
                ),
              ),
              const SizedBox(height: Space.s),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Space.s),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(Radii.s),
                ),
                child: Text(
                  'final theme = "$fontSize pt";',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    color: accent,
                    fontSize: 12.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Header extends StatelessWidget {
  const _Header(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Space.xs, Space.l, Space.xs, Space.xs),
    child: Text(text.toUpperCase(), style: context.text.labelSmall),
  );
}

class _Card extends StatelessWidget {
  const _Card({required this.children});
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
      child: Column(children: children),
    ),
  );
}

class _Note extends StatelessWidget {
  const _Note({required this.icon, required this.title, required this.body});
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.s),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.text2),
        const SizedBox(width: Space.l),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.text.titleSmall),
              const SizedBox(height: 2),
              Text(body, style: context.text.bodySmall?.copyWith(height: 1.45)),
            ],
          ),
        ),
      ],
    ),
  );
}

class _KeyTile extends StatefulWidget {
  const _KeyTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onSave,
    required this.verify,
    required this.help,
  });

  final String title;
  final String subtitle;
  final String value;
  final Future<void> Function(String) onSave;

  /// Null when the key works, or what went wrong.
  final Future<String?> Function(String) verify;
  final Uri help;

  @override
  State<_KeyTile> createState() => _KeyTileState();
}

class _KeyTileState extends State<_KeyTile> {
  late final _ctrl = TextEditingController(text: widget.value);
  bool _obscure = true;
  bool _checking = false;
  String? _status;
  bool _ok = false;

  @override
  void didUpdateWidget(_KeyTile old) {
    super.didUpdateWidget(old);
    if (old.value != widget.value && _ctrl.text != widget.value)
      _ctrl.text = widget.value;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final key = _ctrl.text.trim();
    await widget.onSave(key);
    if (key.isEmpty) {
      setState(() => _status = null);
      return;
    }
    setState(() {
      _checking = true;
      _status = null;
    });
    final error = await widget.verify(key);
    if (!mounted) return;
    setState(() {
      _checking = false;
      _ok = error == null;
      _status = error == null
          ? 'Key saved and working'
          : 'Saved, but the check failed: $error';
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Text(widget.title, style: context.text.titleSmall),
                    Text(widget.subtitle, style: context.text.bodySmall),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => launchUrl(
                  widget.help,
                  mode: LaunchMode.externalApplication,
                ),
                child: const Text('Get a key'),
              ),
            ],
          ),
          const SizedBox(height: Space.m),
          TextField(
            controller: _ctrl,
            obscureText: _obscure,
            autocorrect: false,
            enableSuggestions: false,
            onSubmitted: (_) => _save(),
            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Paste your key',
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: _obscure ? 'Show' : 'Hide',
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 18,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  IconButton(
                    tooltip: 'Save',
                    icon: _checking
                        ? const SizedBox.square(
                            dimension: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.check_rounded, size: 20),
                    onPressed: _checking ? null : _save,
                  ),
                ],
              ),
            ),
          ),
          if (_status != null) ...[
            const SizedBox(height: Space.s),
            Text(
              _status!,
              style: context.text.bodySmall?.copyWith(
                color: _ok ? AppColors.success : AppColors.warning,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// The user's standing instructions for the assistant.
class _InstructionsField extends ConsumerStatefulWidget {
  const _InstructionsField();

  @override
  ConsumerState<_InstructionsField> createState() => _InstructionsFieldState();
}

class _InstructionsFieldState extends ConsumerState<_InstructionsField> {
  late final _ctrl = TextEditingController(
    text: ref.read(settingsProvider).customInstructions,
  );
  bool _dirty = false;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saved = ref.watch(settingsProvider).customInstructions;
    if (!_dirty && _ctrl.text != saved) _ctrl.text = saved;
    return Padding(
      padding: const EdgeInsets.all(Space.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Instructions', style: context.text.titleSmall),
          const SizedBox(height: 2),
          Text(
            'Always followed, in every conversation and watch.',
            style: context.text.bodySmall,
          ),
          const SizedBox(height: Space.m),
          TextField(
            controller: _ctrl,
            minLines: 3,
            maxLines: 10,
            onChanged: (_) => setState(() => _dirty = true),
            decoration: const InputDecoration(
              hintText: 'e.g. Call me Dag. Answer in short bullet points. Never message my boss without asking.',
            ),
          ),
          if (_dirty)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  await ref
                      .read(settingsProvider.notifier)
                      .setCustomInstructions(_ctrl.text.trim());
                  if (mounted) setState(() => _dirty = false);
                  if (context.mounted) showSnack(context, 'Instructions saved');
                },
                child: const Text('Save'),
              ),
            ),
        ],
      ),
    );
  }
}
