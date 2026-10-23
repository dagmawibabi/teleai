import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// How much a reasoning model may think before answering.
enum Thinking {
  auto('Auto'),
  off('Off'),
  low('Low'),
  medium('Medium'),
  high('High');

  const Thinking(this.label);
  final String label;
}

/// Who reads answers aloud.
enum VoiceEngine {
  device('Device'),
  ai('AI model'),
  elevenLabs('ElevenLabs');

  const VoiceEngine(this.label);
  final String label;
}

/// Who turns speech into text in the input box.
enum DictationEngine {
  device('Device'),
  ai('AI model'),
  elevenLabs('ElevenLabs');

  const DictationEngine(this.label);
  final String label;
}

enum AccentChoice {
  blue('Blue', 0xFF8AB4FF),
  violet('Violet', 0xFFB49CFF),
  mint('Mint', 0xFF69D9BA),
  coral('Coral', 0xFFFF9A8D),
  amber('Amber', 0xFFFFC86B),
  mono('Monochrome', 0xFFF4F4F5);

  const AccentChoice(this.label, this.value);
  final String label;
  final int value;
}

/// How much the assistant writes.
enum AnswerStyle {
  concise('Concise', 'Short and to the point'),
  balanced('Balanced', 'Clear, with the detail that matters'),
  detailed('Detailed', 'Thorough, with context and specifics');

  const AnswerStyle(this.label, this.explanation);
  final String label;
  final String explanation;
}

enum CodeThemeChoice {
  midnight('Midnight'),
  ocean('Ocean'),
  ember('Ember');

  const CodeThemeChoice(this.label);
  final String label;
}

/// When actions that change something (sending, reacting, muting…) need a tap.
enum ApprovalMode {
  ask('Always ask', 'Every action waits for you to approve it.'),
  watches(
    'Ask in chats only',
    'Watches and routines act on their own; the chat still asks.',
  ),
  never(
    'Never ask',
    'The assistant acts right away everywhere. Use with care.',
  );

  const ApprovalMode(this.label, this.explanation);
  final String label;
  final String explanation;
}

@immutable
class AppSettings {
  const AppSettings({
    this.vercelKey = '',
    this.openRouterKey = '',
    this.elevenKey = '',
    this.model = defaultModel,
    this.imageModel = defaultImageModel,
    this.thinking = Thinking.auto,
    this.voiceEngine = VoiceEngine.device,
    this.speechModel = defaultSpeechModel,
    this.aiVoice = '',
    this.deviceVoice = '',
    this.elevenVoiceId = '',
    this.elevenVoiceName = '',
    this.elevenModel = 'eleven_flash_v2_5',
    this.speechRate = 1.0,
    this.dictationEngine = DictationEngine.device,
    this.transcriptionModel = defaultTranscriptionModel,
    this.disabledTools = const {},
    this.enabledDangerTools = const {},
    this.readOnlyMode = false,
    this.autoPhotos = true,
    this.autoVoice = true,
    this.autoMusic = false,
    this.customInstructions = '',
    this.approvalMode = ApprovalMode.ask,
    this.proactive = true,
    this.notifications = true,
    this.keepAlive = true,
    this.mentionAlerts = true,
    this.appearOnline = true,
    this.showMessageUsage = true,
    this.briefsScheduled = true,
    this.translateTo = '',
    this.showLinkPreviews = true,
    this.answerStyle = AnswerStyle.balanced,
    this.answerLanguage = '',
    this.maxSteps = 14,
    this.showThinking = true,
    this.showToolCalls = true,
    this.use24h = true,
    this.groupAvatars = true,
    this.compactList = false,
    this.markReadOnOpen = false,
    this.quietHours = false,
    this.quietStart = '23:00',
    this.quietEnd = '07:00',
    this.briefMorning = '08:00',
    this.briefNight = '21:30',
    this.accent = AccentChoice.mono,
    this.chatFontSize = 15.5,
    this.codeTheme = CodeThemeChoice.midnight,
    this.exaKey = '',
    this.loaded = false,
  });

  /// The user's own standing instructions, added to every conversation.
  final String customInstructions;
  final ApprovalMode approvalMode;

  /// Watches and routines may run. Off pauses all of them.
  final bool proactive;
  final bool notifications;

  /// Keeps the app alive in the background (a quiet ongoing notification)
  /// while watches are on, so they still hear new messages.
  final bool keepAlive;

  /// A notification when someone mentions or replies to the account.
  final bool mentionAlerts;

  /// Shows the account as online while the app is on screen, which is what
  /// lets Telegram send typing indicators and live status.
  final bool appearOnline;

  /// Shows tokens and cost under each answer.
  final bool showMessageUsage;

  /// Language code translations go into; empty means the phone's.
  final String translateTo;

  /// Draws link previews under messages.
  final bool showLinkPreviews;

  /// How long and detailed answers are.
  final AnswerStyle answerStyle;

  /// Language answers are written in; empty matches the question.
  final String answerLanguage;

  /// Most model calls (tool rounds) one answer may take.
  final int maxSteps;

  /// Shows the model's reasoning above answers.
  final bool showThinking;

  /// Shows each tool call as a card (approvals always show).
  final bool showToolCalls;

  /// Message times as 14:05 rather than 2:05 PM.
  final bool use24h;

  /// Avatars next to messages in groups.
  final bool groupAvatars;

  /// Tighter rows in chat lists.
  final bool compactList;

  /// Opening a chat marks it as read, like Telegram does.
  final bool markReadOnOpen;

  /// No notifications between quietStart and quietEnd (updates still arrive in the app).
  final bool quietHours;
  final String quietStart;
  final String quietEnd;

  /// Writes a brief each morning and night at these times (HH:mm).
  final bool briefsScheduled;
  final String briefMorning;
  final String briefNight;
  final AccentChoice accent;
  final double chatFontSize;
  final CodeThemeChoice codeTheme;
  final String exaKey;

  static const defaultModel = 'anthropic/claude-sonnet-5.5';
  static const defaultImageModel = 'google/gemini-3.1-flash-lite-image';
  static const defaultSpeechModel = 'openai/gpt-4o-mini-tts';
  static const defaultTranscriptionModel = 'google/gemini-3-flash';

  final String vercelKey;
  final String openRouterKey;
  final String elevenKey;

  /// A gateway id like `openai/gpt-5`, or `or:` + an OpenRouter id.
  final String model;
  final String imageModel;
  final Thinking thinking;

  final VoiceEngine voiceEngine;
  final String speechModel;
  final String aiVoice;

  /// The device voice's name, or empty for the system default.
  final String deviceVoice;
  final String elevenVoiceId;
  final String elevenVoiceName;
  final String elevenModel;

  /// Reading speed, 1 = normal.
  final double speechRate;

  final DictationEngine dictationEngine;

  /// A chat model that accepts audio, for AI dictation.
  final String transcriptionModel;

  /// Tools the assistant may not use.
  final Set<String> disabledTools;

  /// Destructive tools are off by default: these are the ones turned on.
  final Set<String> enabledDangerTools;

  /// Only tools that read are offered: nothing that sends, changes or
  /// deletes, whatever the per-tool switches say.
  final bool readOnlyMode;

  /// Inside the quiet hours right now.
  bool get isQuietNow {
    if (!quietHours) return false;
    int mins(String hm) {
      final p = hm.split(':');
      return (int.tryParse(p.first) ?? 0) * 60 + (int.tryParse(p.last) ?? 0);
    }

    final now = DateTime.now();
    final m = now.hour * 60 + now.minute, a = mins(quietStart), b = mins(quietEnd);
    return a <= b ? (m >= a && m < b) : (m >= a || m < b);
  }

  /// The user's switch for a tool.
  bool toolChosen(String name, {bool destructive = false}) =>
      destructive ? enabledDangerTools.contains(name) : !disabledTools.contains(name);

  /// Whether the assistant gets the tool: its switch, unless read-only mode
  /// rules it out because it [writes].
  bool toolOn(String name, {bool destructive = false, bool writes = false}) =>
      toolChosen(name, destructive: destructive) && !(readOnlyMode && (writes || destructive));

  /// Download these as soon as they show up; otherwise they wait for a tap.
  final bool autoPhotos;
  final bool autoVoice;
  final bool autoMusic;
  final bool loaded;

  bool get hasVercelKey => vercelKey.trim().isNotEmpty;
  bool get hasOpenRouterKey => openRouterKey.trim().isNotEmpty;
  bool get hasElevenKey => elevenKey.trim().isNotEmpty;
  bool get hasExaKey => exaKey.trim().isNotEmpty;
  bool get hasAnyKey => hasVercelKey || hasOpenRouterKey;

  AppSettings copyWith({
    String? vercelKey,
    String? openRouterKey,
    String? elevenKey,
    String? model,
    String? imageModel,
    Thinking? thinking,
    VoiceEngine? voiceEngine,
    String? speechModel,
    String? aiVoice,
    String? deviceVoice,
    String? elevenVoiceId,
    String? elevenVoiceName,
    String? elevenModel,
    double? speechRate,
    DictationEngine? dictationEngine,
    String? transcriptionModel,
    Set<String>? disabledTools,
    Set<String>? enabledDangerTools,
    bool? readOnlyMode,
    bool? autoPhotos,
    bool? autoVoice,
    bool? autoMusic,
    String? customInstructions,
    ApprovalMode? approvalMode,
    bool? proactive,
    bool? notifications,
    bool? keepAlive,
    bool? mentionAlerts,
    bool? appearOnline,
    bool? showMessageUsage,
    bool? briefsScheduled,
    String? translateTo,
    bool? showLinkPreviews,
    AnswerStyle? answerStyle,
    String? answerLanguage,
    int? maxSteps,
    bool? showThinking,
    bool? showToolCalls,
    bool? use24h,
    bool? groupAvatars,
    bool? compactList,
    bool? markReadOnOpen,
    bool? quietHours,
    String? quietStart,
    String? quietEnd,
    String? briefMorning,
    String? briefNight,
    AccentChoice? accent,
    double? chatFontSize,
    CodeThemeChoice? codeTheme,
    String? exaKey,
    bool? loaded,
  }) => AppSettings(
    vercelKey: vercelKey ?? this.vercelKey,
    openRouterKey: openRouterKey ?? this.openRouterKey,
    elevenKey: elevenKey ?? this.elevenKey,
    model: model ?? this.model,
    imageModel: imageModel ?? this.imageModel,
    thinking: thinking ?? this.thinking,
    voiceEngine: voiceEngine ?? this.voiceEngine,
    speechModel: speechModel ?? this.speechModel,
    aiVoice: aiVoice ?? this.aiVoice,
    deviceVoice: deviceVoice ?? this.deviceVoice,
    elevenVoiceId: elevenVoiceId ?? this.elevenVoiceId,
    elevenVoiceName: elevenVoiceName ?? this.elevenVoiceName,
    elevenModel: elevenModel ?? this.elevenModel,
    speechRate: speechRate ?? this.speechRate,
    dictationEngine: dictationEngine ?? this.dictationEngine,
    transcriptionModel: transcriptionModel ?? this.transcriptionModel,
    disabledTools: disabledTools ?? this.disabledTools,
    enabledDangerTools: enabledDangerTools ?? this.enabledDangerTools,
    readOnlyMode: readOnlyMode ?? this.readOnlyMode,
    autoPhotos: autoPhotos ?? this.autoPhotos,
    autoVoice: autoVoice ?? this.autoVoice,
    autoMusic: autoMusic ?? this.autoMusic,
    customInstructions: customInstructions ?? this.customInstructions,
    approvalMode: approvalMode ?? this.approvalMode,
    proactive: proactive ?? this.proactive,
    notifications: notifications ?? this.notifications,
    keepAlive: keepAlive ?? this.keepAlive,
    mentionAlerts: mentionAlerts ?? this.mentionAlerts,
    appearOnline: appearOnline ?? this.appearOnline,
    showMessageUsage: showMessageUsage ?? this.showMessageUsage,
    briefsScheduled: briefsScheduled ?? this.briefsScheduled,
    translateTo: translateTo ?? this.translateTo,
    showLinkPreviews: showLinkPreviews ?? this.showLinkPreviews,
    answerStyle: answerStyle ?? this.answerStyle,
    answerLanguage: answerLanguage ?? this.answerLanguage,
    maxSteps: maxSteps ?? this.maxSteps,
    showThinking: showThinking ?? this.showThinking,
    showToolCalls: showToolCalls ?? this.showToolCalls,
    use24h: use24h ?? this.use24h,
    groupAvatars: groupAvatars ?? this.groupAvatars,
    compactList: compactList ?? this.compactList,
    markReadOnOpen: markReadOnOpen ?? this.markReadOnOpen,
    quietHours: quietHours ?? this.quietHours,
    quietStart: quietStart ?? this.quietStart,
    quietEnd: quietEnd ?? this.quietEnd,
    briefMorning: briefMorning ?? this.briefMorning,
    briefNight: briefNight ?? this.briefNight,
    accent: accent ?? this.accent,
    chatFontSize: chatFontSize ?? this.chatFontSize,
    codeTheme: codeTheme ?? this.codeTheme,
    exaKey: exaKey ?? this.exaKey,
    loaded: loaded ?? this.loaded,
  );
}

/// Keys live in the platform keystore; the rest in shared preferences.
class SettingsController extends Notifier<AppSettings> {
  static const _secure = FlutterSecureStorage();
  static const _vercelKey = 'vercel_ai_gateway_key';
  static const _openRouterKey = 'openrouter_key';
  static const _elevenKey = 'elevenlabs_key';
  static const _exaKey = 'exa_key';

  @override
  AppSettings build() {
    _load();
    return const AppSettings();
  }

  Future<String> _secret(String key) async {
    try {
      return await _secure.read(key: key) ?? '';
    } catch (e) {
      debugPrint('[Settings] Could not read $key: $e');
      return '';
    }
  }

  Future<void> _load() async {
    final p = await SharedPreferences.getInstance();
    const d = AppSettings();
    state = AppSettings(
      vercelKey: await _secret(_vercelKey),
      openRouterKey: await _secret(_openRouterKey),
      elevenKey: await _secret(_elevenKey),
      exaKey: await _secret(_exaKey),
      model: p.getString('chat_model') ?? d.model,
      imageModel: p.getString('image_model') ?? d.imageModel,
      thinking:
          Thinking.values.asNameMap()[p.getString('thinking')] ?? d.thinking,
      voiceEngine:
          VoiceEngine.values.asNameMap()[p.getString('voice_engine')] ??
          d.voiceEngine,
      speechModel: p.getString('speech_model') ?? d.speechModel,
      aiVoice: p.getString('ai_voice') ?? d.aiVoice,
      deviceVoice: p.getString('device_voice') ?? d.deviceVoice,
      elevenVoiceId: p.getString('eleven_voice_id') ?? d.elevenVoiceId,
      elevenVoiceName: p.getString('eleven_voice_name') ?? d.elevenVoiceName,
      elevenModel: p.getString('eleven_model') ?? d.elevenModel,
      speechRate: p.getDouble('speech_rate') ?? d.speechRate,
      dictationEngine:
          DictationEngine.values.asNameMap()[p.getString('dictation_engine')] ??
          d.dictationEngine,
      transcriptionModel:
          p.getString('transcription_model') ?? d.transcriptionModel,
      disabledTools: (p.getStringList('disabled_tools') ?? const []).toSet(),
      enabledDangerTools: (p.getStringList('danger_tools') ?? const []).toSet(),
      readOnlyMode: p.getBool('read_only_mode') ?? d.readOnlyMode,
      autoPhotos: p.getBool('auto_photos') ?? d.autoPhotos,
      autoVoice: p.getBool('auto_voice') ?? d.autoVoice,
      autoMusic: p.getBool('auto_music') ?? d.autoMusic,
      customInstructions:
          p.getString('custom_instructions') ?? d.customInstructions,
      approvalMode:
          ApprovalMode.values.asNameMap()[p.getString('approval_mode')] ??
          d.approvalMode,
      proactive: p.getBool('proactive') ?? d.proactive,
      notifications: p.getBool('notifications') ?? d.notifications,
      keepAlive: p.getBool('keep_alive') ?? d.keepAlive,
      mentionAlerts: p.getBool('mention_alerts') ?? d.mentionAlerts,
      appearOnline: p.getBool('appear_online') ?? d.appearOnline,
      showMessageUsage: p.getBool('show_message_usage') ?? d.showMessageUsage,
      briefsScheduled: p.getBool('briefs_scheduled') ?? d.briefsScheduled,
      translateTo: p.getString('translate_to') ?? d.translateTo,
      showLinkPreviews: p.getBool('link_previews') ?? d.showLinkPreviews,
      answerStyle: AnswerStyle.values.asNameMap()[p.getString('answer_style')] ?? d.answerStyle,
      answerLanguage: p.getString('answer_language') ?? d.answerLanguage,
      maxSteps: p.getInt('max_steps') ?? d.maxSteps,
      showThinking: p.getBool('show_thinking') ?? d.showThinking,
      showToolCalls: p.getBool('show_tool_calls') ?? d.showToolCalls,
      use24h: p.getBool('use_24h') ?? d.use24h,
      groupAvatars: p.getBool('group_avatars') ?? d.groupAvatars,
      compactList: p.getBool('compact_list') ?? d.compactList,
      markReadOnOpen: p.getBool('mark_read_on_open') ?? d.markReadOnOpen,
      quietHours: p.getBool('quiet_hours') ?? d.quietHours,
      quietStart: p.getString('quiet_start') ?? d.quietStart,
      quietEnd: p.getString('quiet_end') ?? d.quietEnd,
      briefMorning: p.getString('brief_morning') ?? d.briefMorning,
      briefNight: p.getString('brief_night') ?? d.briefNight,
      accent:
          AccentChoice.values.asNameMap()[p.getString('accent')] ?? d.accent,
      chatFontSize: p.getDouble('chat_font_size') ?? d.chatFontSize,
      codeTheme:
          CodeThemeChoice.values.asNameMap()[p.getString('code_theme')] ??
          d.codeTheme,
      loaded: true,
    );
  }

  Future<void> _write(String key, Object value) async {
    final p = await SharedPreferences.getInstance();
    switch (value) {
      case String v:
        await p.setString(key, v);
      case double v:
        await p.setDouble(key, v);
      case int v:
        await p.setInt(key, v);
      case List<String> v:
        await p.setStringList(key, v);
      case bool v:
        await p.setBool(key, v);
    }
  }

  Future<void> setVercelKey(String key) async {
    state = state.copyWith(vercelKey: key.trim());
    await _secure.write(key: _vercelKey, value: key.trim());
  }

  Future<void> setOpenRouterKey(String key) async {
    state = state.copyWith(openRouterKey: key.trim());
    await _secure.write(key: _openRouterKey, value: key.trim());
  }

  Future<void> setElevenKey(String key) async {
    state = state.copyWith(elevenKey: key.trim());
    await _secure.write(key: _elevenKey, value: key.trim());
  }

  Future<void> setExaKey(String key) async {
    state = state.copyWith(exaKey: key.trim());
    await _secure.write(key: _exaKey, value: key.trim());
  }

  Future<void> setAccent(AccentChoice value) async {
    state = state.copyWith(accent: value);
    await _write('accent', value.name);
  }

  Future<void> setChatFontSize(double value) async {
    state = state.copyWith(chatFontSize: value);
    await _write('chat_font_size', value);
  }

  Future<void> setCodeTheme(CodeThemeChoice value) async {
    state = state.copyWith(codeTheme: value);
    await _write('code_theme', value.name);
  }

  Future<void> setModel(String id) async {
    state = state.copyWith(model: id);
    await _write('chat_model', id);
  }

  Future<void> setImageModel(String id) async {
    state = state.copyWith(imageModel: id);
    await _write('image_model', id);
  }

  Future<void> setThinking(Thinking v) async {
    state = state.copyWith(thinking: v);
    await _write('thinking', v.name);
  }

  Future<void> setVoiceEngine(VoiceEngine v) async {
    state = state.copyWith(voiceEngine: v);
    await _write('voice_engine', v.name);
  }

  Future<void> setSpeechModel(String id) async {
    state = state.copyWith(speechModel: id, aiVoice: '');
    await _write('speech_model', id);
    await _write('ai_voice', '');
  }

  Future<void> setAiVoice(String v) async {
    state = state.copyWith(aiVoice: v);
    await _write('ai_voice', v);
  }

  Future<void> setDeviceVoice(String v) async {
    state = state.copyWith(deviceVoice: v);
    await _write('device_voice', v);
  }

  Future<void> setElevenVoice(String id, String name) async {
    state = state.copyWith(elevenVoiceId: id, elevenVoiceName: name);
    await _write('eleven_voice_id', id);
    await _write('eleven_voice_name', name);
  }

  Future<void> setElevenModel(String id) async {
    state = state.copyWith(elevenModel: id);
    await _write('eleven_model', id);
  }

  Future<void> setSpeechRate(double v) async {
    state = state.copyWith(speechRate: v);
    await _write('speech_rate', v);
  }

  Future<void> setDictationEngine(DictationEngine v) async {
    state = state.copyWith(dictationEngine: v);
    await _write('dictation_engine', v.name);
  }

  Future<void> setTranscriptionModel(String id) async {
    state = state.copyWith(transcriptionModel: id);
    await _write('transcription_model', id);
  }

  Future<void> setAutoDownload({bool? photos, bool? voice, bool? music}) async {
    state = state.copyWith(
      autoPhotos: photos,
      autoVoice: voice,
      autoMusic: music,
    );
    if (photos != null) await _write('auto_photos', photos);
    if (voice != null) await _write('auto_voice', voice);
    if (music != null) await _write('auto_music', music);
  }

  Future<void> setCustomInstructions(String v) async {
    state = state.copyWith(customInstructions: v);
    await _write('custom_instructions', v);
  }

  Future<void> setApprovalMode(ApprovalMode v) async {
    state = state.copyWith(approvalMode: v);
    await _write('approval_mode', v.name);
  }

  Future<void> setProactive(bool v) async {
    state = state.copyWith(proactive: v);
    await _write('proactive', v);
  }

  Future<void> setNotifications(bool v) async {
    state = state.copyWith(notifications: v);
    await _write('notifications', v);
  }

  Future<void> setBriefs({bool? scheduled, String? morning, String? night}) async {
    state = state.copyWith(briefsScheduled: scheduled, briefMorning: morning, briefNight: night);
    if (scheduled != null) await _write('briefs_scheduled', scheduled);
    if (morning != null) await _write('brief_morning', morning);
    if (night != null) await _write('brief_night', night);
  }

  Future<void> setTranslateTo(String v) async {
    state = state.copyWith(translateTo: v);
    await _write('translate_to', v);
  }

  Future<void> setShowLinkPreviews(bool v) async {
    state = state.copyWith(showLinkPreviews: v);
    await _write('link_previews', v);
  }

  /// One switch or choice from the customization settings.
  Future<void> customize(AppSettings next, String key, Object value) async {
    state = next;
    await _write(key, value);
  }

  Future<void> setAnswerStyle(AnswerStyle v) => customize(state.copyWith(answerStyle: v), 'answer_style', v.name);
  Future<void> setAnswerLanguage(String v) => customize(state.copyWith(answerLanguage: v), 'answer_language', v);
  Future<void> setMaxSteps(int v) => customize(state.copyWith(maxSteps: v), 'max_steps', v);
  Future<void> setShowThinking(bool v) => customize(state.copyWith(showThinking: v), 'show_thinking', v);
  Future<void> setShowToolCalls(bool v) => customize(state.copyWith(showToolCalls: v), 'show_tool_calls', v);
  Future<void> setUse24h(bool v) => customize(state.copyWith(use24h: v), 'use_24h', v);
  Future<void> setGroupAvatars(bool v) => customize(state.copyWith(groupAvatars: v), 'group_avatars', v);
  Future<void> setCompactList(bool v) => customize(state.copyWith(compactList: v), 'compact_list', v);
  Future<void> setMarkReadOnOpen(bool v) => customize(state.copyWith(markReadOnOpen: v), 'mark_read_on_open', v);
  Future<void> setQuietHours(bool v) => customize(state.copyWith(quietHours: v), 'quiet_hours', v);
  Future<void> setQuietStart(String v) => customize(state.copyWith(quietStart: v), 'quiet_start', v);
  Future<void> setQuietEnd(String v) => customize(state.copyWith(quietEnd: v), 'quiet_end', v);

  /// Every preference back to its default; keys are kept.
  Future<void> resetPreferences() async {
    final p = await SharedPreferences.getInstance();
    // Keys live in secure storage and aren't touched; the models and the
    // standing instructions are kept too.
    const keep = {'chat_model', 'image_model', 'custom_instructions'};
    for (final k in p.getKeys().toList()) {
      if (!keep.contains(k)) await p.remove(k);
    }
    state = const AppSettings().copyWith(
      vercelKey: state.vercelKey,
      openRouterKey: state.openRouterKey,
      elevenKey: state.elevenKey,
      exaKey: state.exaKey,
      model: state.model,
      imageModel: state.imageModel,
      customInstructions: state.customInstructions,
      loaded: true,
    );
  }

  Future<void> setShowMessageUsage(bool v) async {
    state = state.copyWith(showMessageUsage: v);
    await _write('show_message_usage', v);
  }

  Future<void> setAppearOnline(bool v) async {
    state = state.copyWith(appearOnline: v);
    await _write('appear_online', v);
  }

  Future<void> setKeepAlive(bool v) async {
    state = state.copyWith(keepAlive: v);
    await _write('keep_alive', v);
  }

  Future<void> setMentionAlerts(bool v) async {
    state = state.copyWith(mentionAlerts: v);
    await _write('mention_alerts', v);
  }

  Future<void> setReadOnlyMode(bool v) async {
    state = state.copyWith(readOnlyMode: v);
    await _write('read_only_mode', v);
  }

  /// Turns a set of tools on or off at once.
  Future<void> setToolsEnabled(Iterable<String> names, bool enabled, {bool destructive = false}) async {
    if (destructive) {
      final next = {...state.enabledDangerTools};
      enabled ? next.addAll(names) : next.removeAll(names);
      state = state.copyWith(enabledDangerTools: next);
      await _write('danger_tools', next.toList());
    } else {
      final next = {...state.disabledTools};
      enabled ? next.removeAll(names) : next.addAll(names);
      state = state.copyWith(disabledTools: next);
      await _write('disabled_tools', next.toList());
    }
  }

  Future<void> setToolEnabled(String name, bool enabled, {bool destructive = false}) async {
    if (destructive) {
      final next = {...state.enabledDangerTools};
      enabled ? next.add(name) : next.remove(name);
      state = state.copyWith(enabledDangerTools: next);
      await _write('danger_tools', next.toList());
      return;
    }
    final next = {...state.disabledTools};
    enabled ? next.remove(name) : next.add(name);
    state = state.copyWith(disabledTools: next);
    await _write('disabled_tools', next.toList());
  }
}

final settingsProvider = NotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);
