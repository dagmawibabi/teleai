part of '../tdapi.dart';

/// **GetForumTopicLink** *(getForumTopicLink)* - TDLib function
///
/// Returns an HTTPS link to a topic in a forum supergroup chat. This is an offline method.
///
/// * [chatId]: Identifier of the chat.
/// * [forumTopicId]: Forum topic identifier.
///
/// [MessageLink] is returned on completion.
final class GetForumTopicLink extends TdFunction {
  /// **GetForumTopicLink** *(getForumTopicLink)* - TDLib function
  ///
  /// Returns an HTTPS link to a topic in a forum supergroup chat. This is an offline method.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [forumTopicId]: Forum topic identifier.
  ///
  /// [MessageLink] is returned on completion.
  const GetForumTopicLink({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Forum topic identifier
  final int forumTopicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [forum_topic_id]: Forum topic identifier
  GetForumTopicLink copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      GetForumTopicLink(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getForumTopicLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
