import 'package:handy_tdlib/api.dart' as td;

/// Small bridges over TDLib 1.8.69's API so the rest of the app reads the
/// way it did, and builders for its new media inputs.
///
/// Topics: TDLib now names a message's topic with a [td.MessageTopic]
/// (a forum topic, a comment thread, or a channel direct-messages topic)
/// instead of a bare `message_thread_id`. In this app a "topic id" is a
/// forum topic's id, and a "thread" a comment thread's root message.

extension MessageTopicX on td.Message {
  /// The forum topic or comment thread the message is in; 0 when none.
  int get messageThreadId => switch (topicId) {
    td.MessageTopicForum(:final forumTopicId) => forumTopicId,
    td.MessageTopicThread(:final messageThreadId) => messageThreadId,
    td.MessageTopicDirectMessages(:final directMessagesChatTopicId) => directMessagesChatTopicId,
    _ => 0,
  };

  /// In a forum topic (not the General one, which has no topic id).
  bool get isTopicMessage => topicId is td.MessageTopicForum;

  /// In a channel's direct messages, and which conversation (sender) there.
  int? get directMessagesTopicId => switch (topicId) {
    td.MessageTopicDirectMessages(:final directMessagesChatTopicId) => directMessagesChatTopicId,
    _ => null,
  };

  String get restrictionReason => restrictionInfo?.restrictionReason ?? '';
}

/// The number a [td.MessageTopic] stands for (forum topic id, thread root
/// or direct-messages topic); 0 for none.
int topicNumber(td.MessageTopic? t) => switch (t) {
  td.MessageTopicForum(:final forumTopicId) => forumTopicId,
  td.MessageTopicThread(:final messageThreadId) => messageThreadId,
  td.MessageTopicDirectMessages(:final directMessagesChatTopicId) => directMessagesChatTopicId,
  _ => 0,
};

/// A forum topic to send into or read from; null for none.
td.MessageTopic? forumTopic(int? id) => id == null || id == 0 ? null : td.MessageTopicForum(forumTopicId: id);

/// A comment thread (a channel post's comments in its discussion group).
td.MessageTopic? commentThread(int? rootMessageId) =>
    rootMessageId == null || rootMessageId == 0 ? null : td.MessageTopicThread(messageThreadId: rootMessageId);

extension ForumTopicInfoX on td.ForumTopicInfo {
  int get messageThreadId => forumTopicId;
}

extension MessageLinkInfoX on td.MessageLinkInfo {
  int get messageThreadId => switch (topicId) {
    td.MessageTopicForum(:final forumTopicId) => forumTopicId,
    td.MessageTopicThread(:final messageThreadId) => messageThreadId,
    _ => 0,
  };
}

extension ChatFolderX on td.ChatFolder {
  String get title => name.text.text;
}

extension ChatFolderInfoX on td.ChatFolderInfo {
  String get title => name.text.text;
}

/// A folder's name as TDLib now takes it.
td.ChatFolderName folderName(String title) =>
    td.ChatFolderName(text: td.FormattedText(text: title, entities: const []), animateCustomEmoji: false);

extension StarTransactionsX on td.StarTransactions {
  int get starCount => starAmount.starCount;
}

extension StarRevenueStatusX on td.StarRevenueStatus {
  int get totalCount => totalAmount.starCount;
  int get currentCount => currentAmount.starCount;
  int get availableCount => availableAmount.starCount;
}

extension PollTypeQuizX on td.PollTypeQuiz {
  int get correctOptionId => correctOptionIds.firstOrNull ?? -1;
}


// ---- media inputs ----------------------------------------------------------------

td.InputFile _local(String path) => td.InputFileLocal(path: path);

td.InputPhoto inputPhoto(String path) =>
    td.InputPhoto(photo: _local(path), thumbnail: null, video: null, addedStickerFileIds: const [], width: 0, height: 0);

td.InputVideo inputVideo(String path, {int duration = 0}) => td.InputVideo(
  video: _local(path),
  thumbnail: null,
  cover: null,
  startTimestamp: 0,
  addedStickerFileIds: const [],
  duration: duration,
  width: 0,
  height: 0,
  supportsStreaming: true,
);

td.InputDocument inputDocument(String path, {bool keepAsFile = false}) =>
    td.InputDocument(document: _local(path), thumbnail: null, disableContentTypeDetection: keepAsFile);

td.InputAnimation inputAnimation(String path) =>
    td.InputAnimation(animation: _local(path), thumbnail: null, addedStickerFileIds: const [], duration: 0, width: 0, height: 0);

td.InputAudio inputAudio(String path, {String title = '', String performer = ''}) =>
    td.InputAudio(audio: _local(path), albumCoverThumbnail: null, duration: 0, title: title, performer: performer);

td.InputVoiceNote inputVoiceNote(String path, {int duration = 0, String waveform = ''}) =>
    td.InputVoiceNote(voiceNote: _local(path), duration: duration, waveform: waveform);

td.InputMessageReplyTo replyToMessage(int messageId, {td.InputTextQuote? quote}) =>
    td.InputMessageReplyToMessage(messageId: messageId, quote: quote, checklistTaskId: 0, pollOptionId: '');
