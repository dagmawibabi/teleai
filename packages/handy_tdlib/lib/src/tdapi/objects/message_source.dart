part of '../tdapi.dart';

/// **MessageSource** *(messageSource)* - parent
///
/// Describes source of a message.
sealed class MessageSource extends TdObject {
  /// **MessageSource** *(messageSource)* - parent
  ///
  /// Describes source of a message.
  const MessageSource();

  /// a MessageSource return type can be :
  /// * [MessageSourceChatHistory]
  /// * [MessageSourceMessageThreadHistory]
  /// * [MessageSourceForumTopicHistory]
  /// * [MessageSourceDirectMessagesChatTopicHistory]
  /// * [MessageSourceHistoryPreview]
  /// * [MessageSourceChatList]
  /// * [MessageSourceSearch]
  /// * [MessageSourceChatEventLog]
  /// * [MessageSourceNotification]
  /// * [MessageSourceScreenshot]
  /// * [MessageSourceOther]
  factory MessageSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageSourceChatHistory.defaultObjectId:
        return MessageSourceChatHistory.fromJson(json);
      case MessageSourceMessageThreadHistory.defaultObjectId:
        return MessageSourceMessageThreadHistory.fromJson(json);
      case MessageSourceForumTopicHistory.defaultObjectId:
        return MessageSourceForumTopicHistory.fromJson(json);
      case MessageSourceDirectMessagesChatTopicHistory.defaultObjectId:
        return MessageSourceDirectMessagesChatTopicHistory.fromJson(json);
      case MessageSourceHistoryPreview.defaultObjectId:
        return MessageSourceHistoryPreview.fromJson(json);
      case MessageSourceChatList.defaultObjectId:
        return MessageSourceChatList.fromJson(json);
      case MessageSourceSearch.defaultObjectId:
        return MessageSourceSearch.fromJson(json);
      case MessageSourceChatEventLog.defaultObjectId:
        return MessageSourceChatEventLog.fromJson(json);
      case MessageSourceNotification.defaultObjectId:
        return MessageSourceNotification.fromJson(json);
      case MessageSourceScreenshot.defaultObjectId:
        return MessageSourceScreenshot.fromJson(json);
      case MessageSourceOther.defaultObjectId:
        return MessageSourceOther.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceChatHistory** *(messageSourceChatHistory)* - child of MessageSource
///
/// The message is from a chat history.
final class MessageSourceChatHistory extends MessageSource {
  /// **MessageSourceChatHistory** *(messageSourceChatHistory)* - child of MessageSource
  ///
  /// The message is from a chat history.
  const MessageSourceChatHistory();

  /// Parse from a json
  factory MessageSourceChatHistory.fromJson(Map<String, dynamic> json) =>
      const MessageSourceChatHistory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceChatHistory copyWith() => const MessageSourceChatHistory();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceChatHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceMessageThreadHistory** *(messageSourceMessageThreadHistory)* - child of MessageSource
///
/// The message is from history of a message thread.
final class MessageSourceMessageThreadHistory extends MessageSource {
  /// **MessageSourceMessageThreadHistory** *(messageSourceMessageThreadHistory)* - child of MessageSource
  ///
  /// The message is from history of a message thread.
  const MessageSourceMessageThreadHistory();

  /// Parse from a json
  factory MessageSourceMessageThreadHistory.fromJson(
          Map<String, dynamic> json) =>
      const MessageSourceMessageThreadHistory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceMessageThreadHistory copyWith() =>
      const MessageSourceMessageThreadHistory();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceMessageThreadHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceForumTopicHistory** *(messageSourceForumTopicHistory)* - child of MessageSource
///
/// The message is from history of a forum topic.
final class MessageSourceForumTopicHistory extends MessageSource {
  /// **MessageSourceForumTopicHistory** *(messageSourceForumTopicHistory)* - child of MessageSource
  ///
  /// The message is from history of a forum topic.
  const MessageSourceForumTopicHistory();

  /// Parse from a json
  factory MessageSourceForumTopicHistory.fromJson(Map<String, dynamic> json) =>
      const MessageSourceForumTopicHistory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceForumTopicHistory copyWith() =>
      const MessageSourceForumTopicHistory();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceForumTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceDirectMessagesChatTopicHistory** *(messageSourceDirectMessagesChatTopicHistory)* - child of MessageSource
///
/// The message is from history of a topic in a channel direct messages chat administered by the current user.
final class MessageSourceDirectMessagesChatTopicHistory extends MessageSource {
  /// **MessageSourceDirectMessagesChatTopicHistory** *(messageSourceDirectMessagesChatTopicHistory)* - child of MessageSource
  ///
  /// The message is from history of a topic in a channel direct messages chat administered by the current user.
  const MessageSourceDirectMessagesChatTopicHistory();

  /// Parse from a json
  factory MessageSourceDirectMessagesChatTopicHistory.fromJson(
          Map<String, dynamic> json) =>
      const MessageSourceDirectMessagesChatTopicHistory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceDirectMessagesChatTopicHistory copyWith() =>
      const MessageSourceDirectMessagesChatTopicHistory();

  /// TDLib object type
  static const String defaultObjectId =
      'messageSourceDirectMessagesChatTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceHistoryPreview** *(messageSourceHistoryPreview)* - child of MessageSource
///
/// The message is from chat, message thread or forum topic history preview.
final class MessageSourceHistoryPreview extends MessageSource {
  /// **MessageSourceHistoryPreview** *(messageSourceHistoryPreview)* - child of MessageSource
  ///
  /// The message is from chat, message thread or forum topic history preview.
  const MessageSourceHistoryPreview();

  /// Parse from a json
  factory MessageSourceHistoryPreview.fromJson(Map<String, dynamic> json) =>
      const MessageSourceHistoryPreview();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceHistoryPreview copyWith() => const MessageSourceHistoryPreview();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceHistoryPreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceChatList** *(messageSourceChatList)* - child of MessageSource
///
/// The message is from a chat list or a forum topic list.
final class MessageSourceChatList extends MessageSource {
  /// **MessageSourceChatList** *(messageSourceChatList)* - child of MessageSource
  ///
  /// The message is from a chat list or a forum topic list.
  const MessageSourceChatList();

  /// Parse from a json
  factory MessageSourceChatList.fromJson(Map<String, dynamic> json) =>
      const MessageSourceChatList();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceChatList copyWith() => const MessageSourceChatList();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceChatList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceSearch** *(messageSourceSearch)* - child of MessageSource
///
/// The message is from search results, including file downloads, local file list, outgoing document messages, calendar.
final class MessageSourceSearch extends MessageSource {
  /// **MessageSourceSearch** *(messageSourceSearch)* - child of MessageSource
  ///
  /// The message is from search results, including file downloads, local file list, outgoing document messages, calendar.
  const MessageSourceSearch();

  /// Parse from a json
  factory MessageSourceSearch.fromJson(Map<String, dynamic> json) =>
      const MessageSourceSearch();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceSearch copyWith() => const MessageSourceSearch();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceChatEventLog** *(messageSourceChatEventLog)* - child of MessageSource
///
/// The message is from a chat event log.
final class MessageSourceChatEventLog extends MessageSource {
  /// **MessageSourceChatEventLog** *(messageSourceChatEventLog)* - child of MessageSource
  ///
  /// The message is from a chat event log.
  const MessageSourceChatEventLog();

  /// Parse from a json
  factory MessageSourceChatEventLog.fromJson(Map<String, dynamic> json) =>
      const MessageSourceChatEventLog();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceChatEventLog copyWith() => const MessageSourceChatEventLog();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceChatEventLog';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceNotification** *(messageSourceNotification)* - child of MessageSource
///
/// The message is from a notification.
final class MessageSourceNotification extends MessageSource {
  /// **MessageSourceNotification** *(messageSourceNotification)* - child of MessageSource
  ///
  /// The message is from a notification.
  const MessageSourceNotification();

  /// Parse from a json
  factory MessageSourceNotification.fromJson(Map<String, dynamic> json) =>
      const MessageSourceNotification();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceNotification copyWith() => const MessageSourceNotification();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceScreenshot** *(messageSourceScreenshot)* - child of MessageSource
///
/// The message was screenshotted; the source must be used only if the message content was visible during the screenshot.
final class MessageSourceScreenshot extends MessageSource {
  /// **MessageSourceScreenshot** *(messageSourceScreenshot)* - child of MessageSource
  ///
  /// The message was screenshotted; the source must be used only if the message content was visible during the screenshot.
  const MessageSourceScreenshot();

  /// Parse from a json
  factory MessageSourceScreenshot.fromJson(Map<String, dynamic> json) =>
      const MessageSourceScreenshot();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceScreenshot copyWith() => const MessageSourceScreenshot();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceScreenshot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSourceOther** *(messageSourceOther)* - child of MessageSource
///
/// The message is from some other source.
final class MessageSourceOther extends MessageSource {
  /// **MessageSourceOther** *(messageSourceOther)* - child of MessageSource
  ///
  /// The message is from some other source.
  const MessageSourceOther();

  /// Parse from a json
  factory MessageSourceOther.fromJson(Map<String, dynamic> json) =>
      const MessageSourceOther();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSourceOther copyWith() => const MessageSourceOther();

  /// TDLib object type
  static const String defaultObjectId = 'messageSourceOther';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
