import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/telegram_store.dart';
import 'tg_avatar.dart';
import '../../../infrastructure/telegram/td_compat.dart';

/// A poll or quiz you can use: vote (one option, or several then "Vote"),
/// see the results once you voted or it closed, take your vote back, see
/// who voted in public polls, and close your own. Live: votes from others
/// arrive as TDLib's updatePoll.
class PollView extends ConsumerStatefulWidget {
  const PollView({super.key, required this.message, required this.poll});
  final td.Message message;
  final td.Poll poll;

  @override
  ConsumerState<PollView> createState() => _PollViewState();
}

class _PollViewState extends ConsumerState<PollView> {
  late td.Poll _poll = widget.poll;
  StreamSubscription<td.TdObject>? _sub;
  final Set<int> _picked = {};
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _sub = ref.read(telegramClientProvider).updates.listen((u) {
      if (u case td.UpdatePoll(:final poll) when poll.id == _poll.id && mounted) {
        setState(() => _poll = poll);
      }
    });
  }

  @override
  void didUpdateWidget(PollView old) {
    super.didUpdateWidget(old);
    if (old.poll != widget.poll) _poll = widget.poll;
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  td.PollTypeQuiz? get _quiz => _poll.type is td.PollTypeQuiz ? _poll.type as td.PollTypeQuiz : null;
  bool get _multiple => _poll.type is td.PollTypeRegular && _poll.allowsMultipleAnswers;
  bool get _voted => _poll.options.any((o) => o.isChosen);
  bool get _showResults => _voted || _poll.isClosed;

  /// Your own poll, or one in a channel you post in.
  bool get _canStop {
    final m = widget.message;
    if (m.isOutgoing) return true;
    final chat = ref.read(telegramStoreProvider).chat(m.chatId);
    return m.isChannelPost && chat != null && ref.read(telegramStoreProvider).canPost(chat);
  }

  Future<void> _vote(List<int> options) async {
    setState(() => _busy = true);
    try {
      await ref.read(telegramClientProvider).send<td.Ok>(
        td.SetPollAnswer(chatId: widget.message.chatId, messageId: widget.message.id, optionIds: options),
        limited: true,
      );
      _picked.clear();
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t vote: $e', icon: Icons.error_outline_rounded);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _close() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(_quiz != null ? 'Stop the quiz?' : 'Stop the poll?'),
        content: const Text('Nobody will be able to vote any more. This can\'t be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Stop')),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await ref.read(telegramClientProvider).send<td.Ok>(
        td.StopPoll(chatId: widget.message.chatId, messageId: widget.message.id),
        limited: true,
      );
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t stop it: $e', icon: Icons.error_outline_rounded);
    }
  }

  void _voters(int option) => showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: AppColors.surface,
    builder: (_) => _Voters(message: widget.message, option: option, title: _poll.options[option].text.text),
  );

  @override
  Widget build(BuildContext context) {
    final quiz = _quiz;
    final kind = [
      if (_poll.isClosed) 'Final results' else if (_poll.isAnonymous) 'Anonymous' else 'Public',
      quiz != null ? 'quiz' : (_multiple ? 'poll · several answers' : 'poll'),
    ].join(' ');
    final closesAt = _poll.closeDate > 0 && !_poll.isClosed
        ? DateFormat('d MMM HH:mm').format(DateTime.fromMillisecondsSinceEpoch(_poll.closeDate * 1000))
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_poll.question.text, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(kind, style: const TextStyle(fontSize: 12, color: AppColors.text3)),
            if (closesAt != null) Text(' · closes $closesAt', style: const TextStyle(fontSize: 12, color: AppColors.text3)),
            const Spacer(),
            if (!_poll.isClosed && (_voted || _canStop))
              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                iconSize: 18,
                icon: const Icon(Icons.more_horiz_rounded, size: 18, color: AppColors.text3),
                onSelected: (v) => v == 'retract' ? _vote(const []) : _close(),
                itemBuilder: (_) => [
                  if (_voted && quiz == null) const PopupMenuItem(value: 'retract', child: Text('Take back my vote')),
                  if (_canStop)
                    PopupMenuItem(value: 'stop', child: Text(quiz != null ? 'Stop the quiz' : 'Stop the poll')),
                ],
              ),
          ],
        ),
        const SizedBox(height: Space.s),
        for (final (i, o) in _poll.options.indexed) _option(i, o, quiz),
        if (_multiple && !_showResults)
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.tonal(
              onPressed: _picked.isEmpty || _busy ? null : () => _vote(_picked.toList()..sort()),
              child: Text('Vote${_picked.isEmpty ? '' : ' (${_picked.length})'}'),
            ),
          ),
        if (quiz != null && _showResults && quiz.explanation.text.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: Space.s),
            padding: const EdgeInsets.all(Space.s),
            decoration: BoxDecoration(color: AppColors.surface3, borderRadius: BorderRadius.circular(Radii.s)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_outline_rounded, size: 16, color: AppColors.warning),
                const SizedBox(width: Space.s),
                Expanded(child: Text(quiz.explanation.text, style: const TextStyle(fontSize: 13))),
              ],
            ),
          ),
        const SizedBox(height: 4),
        Text(
          '${NumberFormat.decimalPattern().format(_poll.totalVoterCount)} ${_poll.totalVoterCount == 1 ? 'vote' : 'votes'}'
          '${_showResults || _poll.isAnonymous ? '' : ' · vote to see results'}',
          style: const TextStyle(fontSize: 12, color: AppColors.text3),
        ),
      ],
    );
  }

  Widget _option(int i, td.PollOption o, td.PollTypeQuiz? quiz) {
    final results = _showResults;
    final correct = quiz != null && quiz.correctOptionId == i;
    final wrong = quiz != null && o.isChosen && !correct;
    final tint = correct && results ? AppColors.success : (wrong ? AppColors.danger : AppColors.accent);
    final picked = _picked.contains(i);
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(Radii.s),
        onTap: _busy || _poll.isClosed
            ? null
            : results
            ? (_poll.isAnonymous || o.voterCount == 0 ? null : () => _voters(i))
            : _multiple
            ? () => setState(() => picked ? _picked.remove(i) : _picked.add(i))
            : () => _vote([i]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (results)
                    SizedBox(
                      width: 40,
                      child: Text('${o.votePercentage}%', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(right: Space.s),
                      child: Icon(
                        _multiple
                            ? (picked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded)
                            : (o.isBeingChosen ? Icons.radio_button_checked_rounded : Icons.radio_button_unchecked_rounded),
                        size: 20,
                        color: picked || o.isBeingChosen ? AppColors.accent : AppColors.text3,
                      ),
                    ),
                  Expanded(child: Text(o.text.text, style: const TextStyle(fontSize: 14.5))),
                  if (results && (o.isChosen || correct))
                    Icon(
                      correct ? Icons.check_circle_rounded : (wrong ? Icons.cancel_rounded : Icons.check_circle_outline_rounded),
                      size: 16,
                      color: tint,
                    ),
                ],
              ),
              if (results) ...[
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: o.votePercentage / 100,
                    minHeight: 4,
                    color: tint,
                    backgroundColor: AppColors.surface3,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Voters extends ConsumerStatefulWidget {
  const _Voters({required this.message, required this.option, required this.title});
  final td.Message message;
  final int option;
  final String title;

  @override
  ConsumerState<_Voters> createState() => _VotersState();
}

class _VotersState extends ConsumerState<_Voters> {
  List<td.MessageSender>? _voters;

  @override
  void initState() {
    super.initState();
    ref
        .read(telegramClientProvider)
        .send<td.MessageSenders>(
          td.GetPollVoters(chatId: widget.message.chatId, messageId: widget.message.id, optionId: widget.option, offset: 0, limit: 50),
          limited: true,
        )
        .then((r) {
          if (mounted) setState(() => _voters = r.senders);
        })
        .catchError((Object _) {
          if (mounted) setState(() => _voters = const []);
        });
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.title, style: context.text.titleMedium),
            const SizedBox(height: Space.s),
            if (_voters == null)
              const Padding(padding: EdgeInsets.all(Space.l), child: Center(child: CircularProgressIndicator(strokeWidth: 2)))
            else if (_voters!.isEmpty)
              Text('Telegram didn\'t say who voted.', style: context.text.bodySmall)
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.5),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final v in _voters!)
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: TgAvatar(
                          userId: v is td.MessageSenderUser ? v.userId : null,
                          chatId: v is td.MessageSenderChat ? v.chatId : null,
                          title: store.senderName(v),
                          size: 32,
                        ),
                        title: Text(store.senderName(v)),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
