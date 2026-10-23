part of 'telegram_tools.dart';

// Polls, contacts and the other tools added after the core set. Same
// library as telegram_tools.dart, so they share the runner's helpers.

/// A poll or quiz as the composer or the assistant describes it.
class PollDraft {
  const PollDraft({
    required this.question,
    required this.options,
    this.anonymous = true,
    this.multipleAnswers = false,
    this.quiz = false,
    this.correctOption = 0,
    this.explanation = '',
    this.openSeconds = 0,
  });

  final String question;
  final List<String> options;
  final bool anonymous;
  final bool multipleAnswers;
  final bool quiz;
  final int correctOption;
  final String explanation;

  /// Closes on its own after this long; 0 keeps it open.
  final int openSeconds;
}

final _moreTools = <TelegramTool>[
  TelegramTool(
    name: 'create_poll',
    label: 'Creating a poll',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Posts a poll or a quiz in a chat or channel: 2 to 10 options, anonymous or public, single or multiple '
        'answers, or a quiz with one correct answer and an explanation. Can close itself after open_minutes. The user '
        'must approve it first.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'question': {'type': 'string'},
      'options': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'anonymous': {'type': 'boolean', 'description': 'Default true.'},
      'multiple_answers': {'type': 'boolean'},
      'quiz': {'type': 'boolean'},
      'correct_option': {'type': 'integer', 'description': 'Quiz: index of the right answer, from 0.'},
      'explanation': {'type': 'string', 'description': 'Quiz: shown after answering.'},
      'open_minutes': {'type': 'integer', 'description': 'Close automatically after this many minutes (5-600).'},
      'topic_id': {'type': 'integer'},
    }, ['chat_id', 'question', 'options']),
  ),
  TelegramTool(
    name: 'get_poll_results',
    label: 'Reading poll results',
    category: ToolCategory.messages,
    description:
        'The results of a poll or quiz: votes and percentages per option, whether it is closed, what the user chose, '
        'and for public polls who voted for each option.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'with_voters': {'type': 'boolean', 'description': 'List voters of public polls. Default true.'},
    }, ['chat_id', 'message_id']),
  ),
  TelegramTool(
    name: 'vote_poll',
    label: 'Voting',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Votes in a poll (option indexes from 0), or takes the vote back with an empty list. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'options': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
    }, ['chat_id', 'message_id', 'options']),
  ),
  TelegramTool(
    name: 'stop_poll',
    label: 'Closing a poll',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Closes one of the user\'s polls so nobody can vote any more. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),
  TelegramTool(
    name: 'send_contact',
    label: 'Sharing a contact',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Shares one of the user\'s Telegram contacts (or the user themself) as a contact card in a chat. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer', 'description': 'Who to share; from list_contacts.'},
    }, ['chat_id', 'user_id']),
  ),
];

extension _MoreTools on TelegramToolRunner {
  Future<ToolOutput>? _runMore(String name, Map<String, dynamic> args) => switch (name) {
    'create_poll' => _createPoll(args),
    'get_poll_results' => _pollResults(args),
    'vote_poll' => _vote(args),
    'stop_poll' => _stopPoll(args),
    'send_contact' => _shareContact(args),
    _ => null,
  };

  String? _describeMore(String name, Map<String, dynamic> args, String title) => switch (name) {
    'create_poll' =>
      'Post a ${args['quiz'] == true ? 'quiz' : 'poll'} in $title:\n“${args['question']}”\n'
          '${[for (final (i, o) in (args['options'] as List? ?? const []).indexed) '${args['quiz'] == true && i == (args['correct_option'] ?? 0) ? '✓' : '•'} $o'].join('\n')}',
    'vote_poll' => (args['options'] as List? ?? const []).isEmpty
        ? 'Take back your vote on poll ${args['message_id']} in $title'
        : 'Vote for option ${(args['options'] as List).map((o) => (o as num).toInt() + 1).join(', ')} on poll ${args['message_id']} in $title',
    'stop_poll' => 'Close poll ${args['message_id']} in $title',
    'send_contact' => 'Share ${_store.userName(TelegramToolRunner._intOrNull(args, 'user_id') ?? 0)}\'s contact in $title',
    _ => null,
  };

  Future<ToolOutput> _createPoll(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final options = [for (final o in (args['options'] as List? ?? const [])) '$o'.trim()]..removeWhere((o) => o.isEmpty);
    final draft = PollDraft(
      question: '${args['question'] ?? ''}'.trim(),
      options: options,
      anonymous: args['anonymous'] != false,
      multipleAnswers: args['multiple_answers'] == true,
      quiz: args['quiz'] == true,
      correctOption: TelegramToolRunner._intOrNull(args, 'correct_option') ?? 0,
      explanation: '${args['explanation'] ?? ''}',
      openSeconds: (TelegramToolRunner._intOrNull(args, 'open_minutes') ?? 0).clamp(0, 600) * 60,
    );
    final m = await sendPoll(c.id, draft, threadId: TelegramToolRunner._intOrNull(args, 'topic_id') ?? 0);
    return ToolOutput({'sent': true, 'chat': c.title, 'poll': true, 'ref': 'post:${m.chatId}:${m.id}'}, posts: [_message(m, c).$2]);
  }

  Future<ToolOutput> _pollResults(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    final m = await _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
    final content = m.content;
    if (content is! td.MessagePoll) throw ArgumentError('That message isn\'t a poll.');
    final poll = content.poll;
    final quiz = poll.type is td.PollTypeQuiz ? poll.type as td.PollTypeQuiz : null;
    final options = <Map<String, dynamic>>[];
    for (final (i, o) in poll.options.indexed) {
      final row = <String, dynamic>{
        'option': i,
        'text': o.text.text,
        'votes': o.voterCount,
        'percent': o.votePercentage,
        if (o.isChosen) 'you_chose': true,
        if (quiz != null && quiz.correctOptionId == i) 'correct': true,
      };
      if (!poll.isAnonymous && args['with_voters'] != false && o.voterCount > 0) {
        try {
          final voters = await _client.send<td.MessageSenders>(
            td.GetPollVoters(chatId: c.id, messageId: id, optionId: i, offset: 0, limit: 50),
            limited: true,
          );
          row['voters'] = [for (final s in voters.senders) _store.senderName(s)];
        } catch (_) {}
      }
      options.add(row);
    }
    return ToolOutput({
      'chat': c.title,
      'question': poll.question.text,
      'type': quiz != null ? 'quiz' : (poll.type is td.PollTypeRegular && (poll.type as td.PollTypeRegular).allowMultipleAnswers ? 'multiple choice' : 'single choice'),
      'anonymous': poll.isAnonymous,
      'closed': poll.isClosed,
      'total_voters': poll.totalVoterCount,
      'options': options,
      if (quiz != null && quiz.explanation.text.isNotEmpty) 'explanation': quiz.explanation.text,
      'ref': 'post:${c.id}:$id',
    }, posts: [_message(m, c).$2]);
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _vote(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    final picks = [for (final o in (args['options'] as List? ?? const [])) if (o is num) o.toInt()];
    await _client.send<td.Ok>(td.SetPollAnswer(chatId: c.id, messageId: id, optionIds: picks), limited: true);
    return ToolOutput({'done': true, 'chat': c.title, 'voted': picks});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _stopPoll(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    await _client.send<td.Ok>(td.StopPoll(chatId: c.id, messageId: id), limited: true);
    return ToolOutput({'done': true, 'chat': c.title, 'poll_closed': true});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _shareContact(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final userId = TelegramToolRunner._intOrNull(args, 'user_id');
    if (userId == null) throw ArgumentError('user_id is required');
    final m = await sendContact(c.id, userId);
    return ToolOutput({'sent': true, 'chat': c.title, 'contact': _store.userName(userId), 'ref': 'post:${m.chatId}:${m.id}'});
  }
}
