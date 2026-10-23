import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../../ai/data/gateway_client.dart';
import '../../settings/data/settings.dart';
import '../../usage/usage.dart';
import '../../ai/data/model_catalog.dart';
import '../data/message_content.dart';
import '../data/telegram_tools.dart';

const translateLanguages = <String, String>{
  'en': 'English',
  'es': 'Spanish',
  'fr': 'French',
  'de': 'German',
  'it': 'Italian',
  'pt': 'Portuguese',
  'ru': 'Russian',
  'uk': 'Ukrainian',
  'tr': 'Turkish',
  'ar': 'Arabic',
  'fa': 'Persian',
  'he': 'Hebrew',
  'hi': 'Hindi',
  'bn': 'Bengali',
  'ur': 'Urdu',
  'id': 'Indonesian',
  'vi': 'Vietnamese',
  'th': 'Thai',
  'zh': 'Chinese',
  'ja': 'Japanese',
  'ko': 'Korean',
  'am': 'Amharic',
  'sw': 'Swahili',
  'pl': 'Polish',
  'nl': 'Dutch',
};

String deviceLanguage() {
  final code = PlatformDispatcher.instance.locale.languageCode;
  return translateLanguages.containsKey(code) ? code : 'en';
}

/// Translates a message: Telegram's own translation first (it works for
/// Premium accounts and chats with translation on), then the AI model.
Future<void> showTranslation(BuildContext context, td.Message message) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  useSafeArea: true,
  builder: (_) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.55,
    maxChildSize: 0.95,
    builder: (_, scroll) => _TranslateView(message: message, scroll: scroll),
  ),
);

class _TranslateView extends ConsumerStatefulWidget {
  const _TranslateView({required this.message, required this.scroll});
  final td.Message message;
  final ScrollController scroll;

  @override
  ConsumerState<_TranslateView> createState() => _TranslateViewState();
}

class _TranslateViewState extends ConsumerState<_TranslateView> {
  late String _lang = ref.read(settingsProvider).translateTo.isNotEmpty
      ? ref.read(settingsProvider).translateTo
      : deviceLanguage();
  String? _result;
  String? _via;
  String? _error;
  bool _busy = false;

  String get _original => gistOf(widget.message.content).text;

  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    setState(() {
      _busy = true;
      _error = null;
      _result = null;
    });
    try {
      final r = await ref.read(toolRunnerProvider).translateMessage(widget.message, _lang);
      if (!mounted) return;
      setState(() {
        _result = r;
        _via = 'Telegram';
      });
    } catch (_) {
      // Not available on this account or chat: ask the model.
      try {
        final r = await translateWithAi(ref, _original, translateLanguages[_lang] ?? _lang);
        if (!mounted) return;
        setState(() {
          _result = r;
          _via = ref.read(settingsProvider).model.replaceFirst('or:', '');
        });
      } catch (e) {
        if (mounted) setState(() => _error = '$e');
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scroll,
      padding: const EdgeInsets.fromLTRB(Space.xl, 0, Space.xl, Space.x4),
      children: [
        Row(
          children: [
            Icon(Icons.translate_rounded, color: AppColors.accent),
            const SizedBox(width: Space.m),
            Expanded(child: Text('Translate', style: context.text.titleLarge)),
            DropdownButton<String>(
              value: _lang,
              underline: const SizedBox(),
              items: [
                for (final e in translateLanguages.entries) DropdownMenuItem(value: e.key, child: Text(e.value)),
              ],
              onChanged: (v) {
                if (v == null || v == _lang) return;
                setState(() => _lang = v);
                _run();
              },
            ),
          ],
        ),
        const SizedBox(height: Space.l),
        if (_busy)
          const Padding(
            padding: EdgeInsets.all(Space.xl),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          )
        else if (_error != null)
          Text('Couldn\'t translate: $_error', style: context.text.bodySmall?.copyWith(color: AppColors.danger))
        else if (_result != null) ...[
          SelectableText(_result!, style: context.text.bodyLarge),
          const SizedBox(height: Space.s),
          Row(
            children: [
              Expanded(child: Text('Translated by $_via', style: context.text.labelSmall)),
              TextButton.icon(
                icon: const Icon(Icons.copy_rounded, size: 16),
                label: const Text('Copy'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _result!));
                  showSnack(context, 'Copied');
                },
              ),
            ],
          ),
        ],
        const Divider(height: Space.xxl),
        Text('ORIGINAL', style: context.text.labelSmall),
        const SizedBox(height: Space.s),
        SelectableText(_original, style: context.text.bodyMedium?.copyWith(color: AppColors.text2)),
      ],
    );
  }
}

/// A plain translation from the chat model, recorded in usage.
Future<String> translateWithAi(WidgetRef ref, String text, String language) async {
  final settings = ref.read(settingsProvider);
  if (!settings.hasAnyKey) throw StateError('Add an AI key in Settings to translate.');
  final buf = StringBuffer();
  await for (final e in GatewayClient(settings).streamTurn(
    model: settings.model,
    messages: [
      {
        'role': 'system',
        'content':
            'Translate the user\'s text into $language. Reply with the translation only, keeping line breaks, emoji, '
            'links and names. If it is already in $language, return it unchanged.',
      },
      {'role': 'user', 'content': text},
    ],
  )) {
    switch (e) {
      case ContentDelta(:final text):
        buf.write(text);
      case TurnEnd(:final usage?):
        ref
            .read(usageProvider.notifier)
            .recordChat(
              model: settings.model,
              usage: usage,
              info: ref.read(modelCatalogProvider).byId(settings.model),
            );
      default:
        break;
    }
  }
  final out = buf.toString().trim();
  if (out.isEmpty) throw StateError('The model returned nothing.');
  return out;
}
