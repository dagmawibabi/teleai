import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../../chat/domain/chat_models.dart';
import '../../chat/presentation/widgets/post_viewer.dart';
import '../data/telegram_store.dart';
import '../data/telegram_tools.dart';
import 'chat_profile_screen.dart';
import 'chat_view_screen.dart';
import 'search_screen.dart';

/// The navigator, for links tapped where no context is at hand (inside
/// formatted text).
final appNavigatorKey = GlobalKey<NavigatorState>();

final _telegramLink = RegExp(r'^(?:(?:https?://)?(?:www\.)?(?:t\.me|telegram\.me|telegram\.dog)/|tg://)', caseSensitive: false);

bool isTelegramLink(String url) => _telegramLink.hasMatch(url.trim());

/// A tapped #hashtag or $cashtag: searches every chat for it.
Future<void> openHashtag(String tag) async {
  final nav = appNavigatorKey.currentState;
  if (nav == null) return;
  await nav.push(MaterialPageRoute<void>(builder: (_) => SearchScreen(initialQuery: tag)));
}

/// A tapped mention of someone without a username: their profile.
Future<void> openUser(int userId) async {
  final ctx = appNavigatorKey.currentContext;
  if (ctx == null) return;
  final container = ProviderScope.containerOf(ctx, listen: false);
  final nav = Navigator.of(ctx);
  try {
    final chat = await container
        .read(telegramClientProvider)
        .send<td.Chat>(td.CreatePrivateChat(userId: userId, force: false), limited: true);
    if (nav.mounted) await nav.push(MaterialPageRoute<void>(builder: (_) => ChatProfileScreen(chatId: chat.id)));
  } catch (e) {
    if (nav.mounted) showSnack(nav.context, 'Couldn\'t open that profile', icon: Icons.error_outline_rounded);
  }
}

/// A tapped /command: copied, to paste in the bot's chat.
Future<void> copyBotCommand(String command) async {
  await Clipboard.setData(ClipboardData(text: command));
  final ctx = appNavigatorKey.currentContext;
  if (ctx != null && ctx.mounted) showSnack(ctx, 'Copied $command');
}

/// Opens [url]: Telegram links inside the app (the chat, the post, an
/// invite to look at before joining), everything else in the browser.
Future<void> openUrl(String url, {BuildContext? context}) async {
  final ctx = context ?? appNavigatorKey.currentContext;
  if (ctx == null || !isTelegramLink(url)) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    return;
  }
  final container = ProviderScope.containerOf(ctx, listen: false);
  final runner = container.read(toolRunnerProvider);
  final store = container.read(telegramStoreProvider);
  final nav = Navigator.of(ctx);
  Map<String, dynamic> r;
  try {
    r = await runner.resolveLink(url);
  } catch (_) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    return;
  }
  if (!nav.mounted) return;
  final chatId = r['chat_id'] is int ? r['chat_id'] as int : null;
  switch (r['kind']) {
    case 'message' when chatId != null && r['message_id'] is int:
      final m = r['message'] as Map<String, dynamic>?;
      await showPost(
        nav.context,
        PostSnapshot(
          chatId: chatId,
          messageId: r['message_id'] as int,
          chatTitle: '${r['chat'] ?? 'Post'}',
          date: DateTime.tryParse('${m?['date'] ?? ''}') ?? DateTime.now(),
          text: '${m?['text'] ?? m?['detail'] ?? ''}',
        ),
      );
    case 'chat' || 'bot_start' || 'story' || 'video_chat' || 'web_app' || 'bot_add_to_group' when chatId != null:
      // Public chats open even when not joined: their history is readable.
      await store.ensureChatsLoaded();
      await nav.push(MaterialPageRoute<void>(builder: (_) => ChatViewScreen(chatId: chatId)));
    case 'invite':
      if (chatId != null && r['already_member'] == true) {
        await nav.push(MaterialPageRoute<void>(builder: (_) => ChatViewScreen(chatId: chatId)));
      } else {
        await showModalBottomSheet<void>(
          context: nav.context,
          showDragHandle: true,
          backgroundColor: AppColors.surface,
          builder: (_) => _InviteSheet(info: r),
        );
      }
    default:
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

/// An invite link, shown before joining: what the chat is and how big.
class _InviteSheet extends ConsumerStatefulWidget {
  const _InviteSheet({required this.info});
  final Map<String, dynamic> info;

  @override
  ConsumerState<_InviteSheet> createState() => _InviteSheetState();
}

class _InviteSheetState extends ConsumerState<_InviteSheet> {
  bool _joining = false;

  Future<void> _join() async {
    setState(() => _joining = true);
    try {
      final chat = await ref
          .read(telegramClientProvider)
          .send<td.Chat>(td.JoinChatByInviteLink(inviteLink: '${widget.info['invite_link']}'), limited: true);
      if (!mounted) return;
      final nav = Navigator.of(context)..pop();
      await nav.push(MaterialPageRoute<void>(builder: (_) => ChatViewScreen(chatId: chat.id)));
    } catch (e) {
      if (mounted) {
        setState(() => _joining = false);
        showSnack(context, 'Couldn\'t join: $e', icon: Icons.error_outline_rounded);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final i = widget.info;
    final approval = i['needs_approval_to_join'] == true;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${i['title'] ?? 'Chat'}', style: context.text.titleLarge, textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(
              '${i['type'] ?? 'chat'} · ${i['members'] ?? 0} ${i['type'] == 'channel' ? 'subscribers' : 'members'}',
              textAlign: TextAlign.center,
              style: context.text.bodySmall,
            ),
            if (i['warning'] != null) ...[
              const SizedBox(height: Space.s),
              Text('${i['warning']}', textAlign: TextAlign.center, style: TextStyle(color: AppColors.danger)),
            ],
            if ('${i['description'] ?? ''}'.isNotEmpty) ...[
              const SizedBox(height: Space.m),
              Text('${i['description']}', textAlign: TextAlign.center, maxLines: 6, overflow: TextOverflow.ellipsis),
            ],
            const SizedBox(height: Space.l),
            FilledButton(
              onPressed: _joining ? null : _join,
              child: Text(_joining ? 'Joining…' : (approval ? 'Ask to join' : 'Join')),
            ),
          ],
        ),
      ),
    );
  }
}
