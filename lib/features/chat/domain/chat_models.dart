import 'dart:convert';

/// Where a tool call stands.
enum ToolStatus { running, awaitingApproval, denied, done, error }

/// One tool call inside a model step, with what it returned.
class ToolPart {
  ToolPart({
    required this.callId,
    required this.name,
    this.arguments = '',
    this.status = ToolStatus.running,
    this.result,
    DateTime? startedAt,
    this.durationMs,
    this.autoApproved = false,
  }) : startedAt = startedAt ?? DateTime.now();

  /// Ran without asking, because of the approval setting.
  bool autoApproved;

  final String callId;
  final String name;

  /// JSON text as the model wrote it.
  String arguments;
  ToolStatus status;

  /// JSON text handed back to the model.
  String? result;
  final DateTime startedAt;
  int? durationMs;

  Map<String, dynamic> get args {
    try {
      final v = jsonDecode(arguments.isEmpty ? '{}' : arguments);
      return v is Map<String, dynamic> ? v : {};
    } catch (_) {
      return {};
    }
  }

  Map<String, dynamic> toJson() => {
    'id': callId,
    'name': name,
    'args': arguments,
    'status': status.name,
    'result': result,
    'at': startedAt.toIso8601String(),
    'ms': durationMs,
    if (autoApproved) 'auto': true,
  };

  factory ToolPart.fromJson(Map<String, dynamic> j) => ToolPart(
    callId: j['id'],
    name: j['name'],
    arguments: j['args'] ?? '',
    // A call left waiting when the app closed never ran.
    status: switch (ToolStatus.values.asNameMap()[j['status']] ?? ToolStatus.error) {
      ToolStatus.running => ToolStatus.error,
      ToolStatus.awaitingApproval => ToolStatus.denied,
      final s => s,
    },
    result: j['result'],
    startedAt: DateTime.tryParse(j['at'] ?? ''),
    durationMs: j['ms'],
    autoApproved: j['auto'] ?? false,
  );
}

/// One round trip to the model: what it thought, wrote and called.
class ModelStep {
  ModelStep({
    this.reasoning = '',
    this.text = '',
    List<ToolPart>? tools,
    this.reasoningDetails,
    this.thinkingMs,
    this.usage,
  }) : tools = tools ?? [];

  /// Tokens and cost of the model call that produced this step.
  StepUsage? usage;

  String reasoning;
  String text;
  final List<ToolPart> tools;
  List<dynamic>? reasoningDetails;
  int? thinkingMs;

  Map<String, dynamic> toJson() => {
    'reasoning': reasoning,
    'text': text,
    'tools': [for (final t in tools) t.toJson()],
    if (reasoningDetails != null) 'rd': reasoningDetails,
    'tms': thinkingMs,
    if (usage != null) 'u': usage!.toJson(),
  };

  factory ModelStep.fromJson(Map<String, dynamic> j) => ModelStep(
    reasoning: j['reasoning'] ?? '',
    text: j['text'] ?? '',
    tools: [for (final t in (j['tools'] as List? ?? const [])) ToolPart.fromJson(Map<String, dynamic>.from(t))],
    reasoningDetails: j['rd'] as List?,
    thinkingMs: j['tms'],
    usage: j['u'] is Map ? StepUsage.fromJson(Map<String, dynamic>.from(j['u'])) : null,
  );
}

/// What one model call used: tokens in and out (cached and reasoning are
/// parts of those) and what it cost, as the gateway reported it or, when
/// it didn't, at the model's list price.
class StepUsage {
  const StepUsage({
    this.input = 0,
    this.output = 0,
    this.cached = 0,
    this.reasoning = 0,
    this.cost = 0,
    this.estimated = false,
  });
  final int input;
  final int output;
  final int cached;
  final int reasoning;
  final double cost;
  final bool estimated;

  StepUsage operator +(StepUsage o) => StepUsage(
    input: input + o.input,
    output: output + o.output,
    cached: cached + o.cached,
    reasoning: reasoning + o.reasoning,
    cost: cost + o.cost,
    estimated: estimated || o.estimated,
  );

  Map<String, dynamic> toJson() => {'i': input, 'o': output, 'c': cached, 'r': reasoning, '\$': cost, 'e': estimated};

  factory StepUsage.fromJson(Map<String, dynamic> j) => StepUsage(
    input: (j['i'] as num?)?.toInt() ?? 0,
    output: (j['o'] as num?)?.toInt() ?? 0,
    cached: (j['c'] as num?)?.toInt() ?? 0,
    reasoning: (j['r'] as num?)?.toInt() ?? 0,
    cost: (j['\$'] as num?)?.toDouble() ?? 0,
    estimated: j['e'] == true,
  );
}

sealed class ChatEntry {
  ChatEntry({required this.id, DateTime? at}) : at = at ?? DateTime.now();
  final String id;
  final DateTime at;

  Map<String, dynamic> toJson();

  static ChatEntry fromJson(Map<String, dynamic> j) =>
      j['role'] == 'user' ? UserEntry.fromJson(j) : AssistantEntry.fromJson(j);
}

/// A file or picture sent to the assistant, copied into the app's folder.
class Attachment {
  const Attachment({required this.path, required this.name, required this.mime, required this.size});

  final String path;
  final String name;
  final String mime;
  final int size;

  bool get isImage => mime.startsWith('image/');
  bool get isPdf => mime == 'application/pdf';
  bool get isAudio => mime.startsWith('audio/') || RegExp(r'\.(ogg|oga|opus|m4a|mp3|wav|aac)$').hasMatch(name.toLowerCase());
  bool get isVideo => mime.startsWith('video/');

  /// Read as text and pasted into the message.
  bool get isText =>
      mime.startsWith('text/') ||
      const {
        'application/json',
        'application/xml',
        'application/javascript',
        'application/x-yaml',
        'application/yaml',
        'application/sql',
      }.contains(mime);

  Map<String, dynamic> toJson() => {'path': path, 'name': name, 'mime': mime, 'size': size};

  factory Attachment.fromJson(Map<String, dynamic> j) => Attachment(
    path: j['path'],
    name: j['name'] ?? 'file',
    mime: j['mime'] ?? 'application/octet-stream',
    size: j['size'] ?? 0,
  );
}

class UserEntry extends ChatEntry {
  UserEntry({required super.id, required this.text, super.at, this.attachments = const [], this.event});
  final String text;
  final List<Attachment> attachments;

  /// Set when a watch wrote this, not the person: the watch's name.
  final String? event;

  @override
  Map<String, dynamic> toJson() => {
    'role': 'user',
    'id': id,
    'at': at.toIso8601String(),
    'text': text,
    if (attachments.isNotEmpty) 'files': [for (final a in attachments) a.toJson()],
    'event': ?event,
  };

  factory UserEntry.fromJson(Map<String, dynamic> j) => UserEntry(
    id: j['id'],
    text: j['text'] ?? '',
    at: DateTime.tryParse(j['at'] ?? ''),
    attachments: [for (final a in (j['files'] as List? ?? const [])) Attachment.fromJson(Map<String, dynamic>.from(a))],
    event: j['event'],
  );
}

class AssistantEntry extends ChatEntry {
  AssistantEntry({required super.id, super.at, List<ModelStep>? steps, this.model = '', this.error, this.done = false})
    : steps = steps ?? [];

  final List<ModelStep> steps;
  final String model;
  String? error;
  bool done;

  /// Everything this answer used, across its model calls.
  StepUsage? get usage {
    StepUsage? total;
    for (final s in steps) {
      if (s.usage case final u?) total = total == null ? u : total + u;
    }
    return total;
  }

  @override
  Map<String, dynamic> toJson() => {
    'role': 'assistant',
    'id': id,
    'at': at.toIso8601String(),
    'model': model,
    'error': error,
    'steps': [for (final s in steps) s.toJson()],
  };

  factory AssistantEntry.fromJson(Map<String, dynamic> j) => AssistantEntry(
    id: j['id'],
    at: DateTime.tryParse(j['at'] ?? ''),
    model: j['model'] ?? '',
    error: j['error'],
    done: true,
    steps: [for (final s in (j['steps'] as List? ?? const [])) ModelStep.fromJson(Map<String, dynamic>.from(s))],
  );
}

/// What a chip needs to show a post before the post itself is fetched.
class PostSnapshot {
  const PostSnapshot({
    required this.chatId,
    required this.messageId,
    required this.chatTitle,
    required this.date,
    required this.text,
    this.sender,
    this.kind = 'text',
  });

  final int chatId;
  final int messageId;
  final String chatTitle;
  final DateTime date;
  final String text;
  final String? sender;
  final String kind;

  String get key => '$chatId:$messageId';

  Map<String, dynamic> toJson() => {
    'chat_id': chatId,
    'message_id': messageId,
    'chat': chatTitle,
    'date': date.toIso8601String(),
    'text': text,
    'sender': sender,
    'kind': kind,
  };

  factory PostSnapshot.fromJson(Map<String, dynamic> j) => PostSnapshot(
    chatId: (j['chat_id'] as num).toInt(),
    messageId: (j['message_id'] as num).toInt(),
    chatTitle: j['chat'] ?? '',
    date: DateTime.tryParse(j['date'] ?? '') ?? DateTime.now(),
    text: j['text'] ?? '',
    sender: j['sender'],
    kind: j['kind'] ?? 'text',
  );
}

class Conversation {
  Conversation({
    required this.id,
    this.title = 'New chat',
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ChatEntry>? entries,
    Map<String, PostSnapshot>? posts,
    this.unread = 0,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now(),
       entries = entries ?? [],
       posts = posts ?? {};

  final String id;
  String title;
  final DateTime createdAt;
  DateTime updatedAt;
  final List<ChatEntry> entries;

  /// Every post a tool has shown the model, by `chatId:messageId`.
  final Map<String, PostSnapshot> posts;

  /// Watch updates added while the person wasn't looking.
  int unread;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'created': createdAt.toIso8601String(),
    'updated': updatedAt.toIso8601String(),
    'entries': [for (final e in entries) e.toJson()],
    'posts': {for (final p in posts.entries) p.key: p.value.toJson()},
    if (unread > 0) 'unread': unread,
  };

  factory Conversation.fromJson(Map<String, dynamic> j) => Conversation(
    id: j['id'],
    title: j['title'] ?? 'New chat',
    createdAt: DateTime.tryParse(j['created'] ?? ''),
    updatedAt: DateTime.tryParse(j['updated'] ?? ''),
    entries: [for (final e in (j['entries'] as List? ?? const [])) ChatEntry.fromJson(Map<String, dynamic>.from(e))],
    posts: {
      for (final p in ((j['posts'] as Map?) ?? const {}).entries)
        '${p.key}': PostSnapshot.fromJson(Map<String, dynamic>.from(p.value)),
    },
    unread: (j['unread'] as num?)?.toInt() ?? 0,
  );
}

/// A conversation as the history drawer lists it.
class ConversationSummary {
  const ConversationSummary({required this.id, required this.title, required this.updatedAt, this.unread = 0});
  final String id;
  final String title;
  final DateTime updatedAt;

  /// Watch updates not seen yet.
  final int unread;
}
