part of '../tdapi.dart';

/// **MessageTopic** *(messageTopic)* - parent
///
/// Describes a topic of messages in a chat.
sealed class MessageTopic extends TdObject {
  /// **MessageTopic** *(messageTopic)* - parent
  ///
  /// Describes a topic of messages in a chat.
  const MessageTopic();

  /// a MessageTopic return type can be :
  /// * [MessageTopicThread]
  /// * [MessageTopicForum]
  /// * [MessageTopicDirectMessages]
  /// * [MessageTopicSavedMessages]
  factory MessageTopic.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageTopicThread.defaultObjectId:
        return MessageTopicThread.fromJson(json);
      case MessageTopicForum.defaultObjectId:
        return MessageTopicForum.fromJson(json);
      case MessageTopicDirectMessages.defaultObjectId:
        return MessageTopicDirectMessages.fromJson(json);
      case MessageTopicSavedMessages.defaultObjectId:
        return MessageTopicSavedMessages.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageTopic)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageTopic copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTopicThread** *(messageTopicThread)* - child of MessageTopic
///
/// A topic in a non-forum supergroup chat.
///
/// * [messageThreadId]: Unique identifier of the message thread.
final class MessageTopicThread extends MessageTopic {
  /// **MessageTopicThread** *(messageTopicThread)* - child of MessageTopic
  ///
  /// A topic in a non-forum supergroup chat.
  ///
  /// * [messageThreadId]: Unique identifier of the message thread.
  const MessageTopicThread({
    required this.messageThreadId,
  });

  /// Unique identifier of the message thread
  final int messageThreadId;

  /// Parse from a json
  factory MessageTopicThread.fromJson(Map<String, dynamic> json) =>
      MessageTopicThread(
        messageThreadId: json['message_thread_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_thread_id": messageThreadId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_thread_id]: Unique identifier of the message thread
  @override
  MessageTopicThread copyWith({
    int? messageThreadId,
  }) =>
      MessageTopicThread(
        messageThreadId: messageThreadId ?? this.messageThreadId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTopicThread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTopicForum** *(messageTopicForum)* - child of MessageTopic
///
/// A topic in a forum supergroup chat or a chat with a bot.
///
/// * [forumTopicId]: Unique identifier of the forum topic.
final class MessageTopicForum extends MessageTopic {
  /// **MessageTopicForum** *(messageTopicForum)* - child of MessageTopic
  ///
  /// A topic in a forum supergroup chat or a chat with a bot.
  ///
  /// * [forumTopicId]: Unique identifier of the forum topic.
  const MessageTopicForum({
    required this.forumTopicId,
  });

  /// Unique identifier of the forum topic
  final int forumTopicId;

  /// Parse from a json
  factory MessageTopicForum.fromJson(Map<String, dynamic> json) =>
      MessageTopicForum(
        forumTopicId: json['forum_topic_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "forum_topic_id": forumTopicId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [forum_topic_id]: Unique identifier of the forum topic
  @override
  MessageTopicForum copyWith({
    int? forumTopicId,
  }) =>
      MessageTopicForum(
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTopicForum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTopicDirectMessages** *(messageTopicDirectMessages)* - child of MessageTopic
///
/// A topic in a channel direct messages chat administered by the current user.
///
/// * [directMessagesChatTopicId]: Unique identifier of the topic.
final class MessageTopicDirectMessages extends MessageTopic {
  /// **MessageTopicDirectMessages** *(messageTopicDirectMessages)* - child of MessageTopic
  ///
  /// A topic in a channel direct messages chat administered by the current user.
  ///
  /// * [directMessagesChatTopicId]: Unique identifier of the topic.
  const MessageTopicDirectMessages({
    required this.directMessagesChatTopicId,
  });

  /// Unique identifier of the topic
  final int directMessagesChatTopicId;

  /// Parse from a json
  factory MessageTopicDirectMessages.fromJson(Map<String, dynamic> json) =>
      MessageTopicDirectMessages(
        directMessagesChatTopicId: json['direct_messages_chat_topic_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "direct_messages_chat_topic_id": directMessagesChatTopicId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [direct_messages_chat_topic_id]: Unique identifier of the topic
  @override
  MessageTopicDirectMessages copyWith({
    int? directMessagesChatTopicId,
  }) =>
      MessageTopicDirectMessages(
        directMessagesChatTopicId:
            directMessagesChatTopicId ?? this.directMessagesChatTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTopicDirectMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTopicSavedMessages** *(messageTopicSavedMessages)* - child of MessageTopic
///
/// A topic in Saved Messages chat.
///
/// * [savedMessagesTopicId]: Unique identifier of the Saved Messages topic.
final class MessageTopicSavedMessages extends MessageTopic {
  /// **MessageTopicSavedMessages** *(messageTopicSavedMessages)* - child of MessageTopic
  ///
  /// A topic in Saved Messages chat.
  ///
  /// * [savedMessagesTopicId]: Unique identifier of the Saved Messages topic.
  const MessageTopicSavedMessages({
    required this.savedMessagesTopicId,
  });

  /// Unique identifier of the Saved Messages topic
  final int savedMessagesTopicId;

  /// Parse from a json
  factory MessageTopicSavedMessages.fromJson(Map<String, dynamic> json) =>
      MessageTopicSavedMessages(
        savedMessagesTopicId: json['saved_messages_topic_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Unique identifier of the Saved Messages topic
  @override
  MessageTopicSavedMessages copyWith({
    int? savedMessagesTopicId,
  }) =>
      MessageTopicSavedMessages(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTopicSavedMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
