part of '../tdapi.dart';

/// **ToggleChatViewAsTopics** *(toggleChatViewAsTopics)* - TDLib function
///
/// Changes the view_as_topics setting of a forum chat or Saved Messages.
///
/// * [chatId]: Chat identifier.
/// * [viewAsTopics]: New value of view_as_topics.
///
/// [Ok] is returned on completion.
final class ToggleChatViewAsTopics extends TdFunction {
  /// **ToggleChatViewAsTopics** *(toggleChatViewAsTopics)* - TDLib function
  ///
  /// Changes the view_as_topics setting of a forum chat or Saved Messages.
  ///
  /// * [chatId]: Chat identifier.
  /// * [viewAsTopics]: New value of view_as_topics.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatViewAsTopics({
    required this.chatId,
    required this.viewAsTopics,
  });

  /// Chat identifier
  final int chatId;

  /// New value of view_as_topics
  final bool viewAsTopics;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "view_as_topics": viewAsTopics,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [view_as_topics]: New value of view_as_topics
  ToggleChatViewAsTopics copyWith({
    int? chatId,
    bool? viewAsTopics,
  }) =>
      ToggleChatViewAsTopics(
        chatId: chatId ?? this.chatId,
        viewAsTopics: viewAsTopics ?? this.viewAsTopics,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatViewAsTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
