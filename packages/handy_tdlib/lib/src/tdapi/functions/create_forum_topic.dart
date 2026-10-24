part of '../tdapi.dart';

/// **CreateForumTopic** *(createForumTopic)* - TDLib function
///
/// Creates a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator or can_create_topics member right in the supergroup.
///
/// * [chatId]: Identifier of the chat.
/// * [name]: Name of the topic; 1-128 characters.
/// * [isNameImplicit]: Pass true if the name of the topic wasn't entered explicitly; for chats with bots only.
/// * [icon]: Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F.. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons.
///
/// [ForumTopicInfo] is returned on completion.
final class CreateForumTopic extends TdFunction {
  /// **CreateForumTopic** *(createForumTopic)* - TDLib function
  ///
  /// Creates a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator or can_create_topics member right in the supergroup.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [name]: Name of the topic; 1-128 characters.
  /// * [isNameImplicit]: Pass true if the name of the topic wasn't entered explicitly; for chats with bots only.
  /// * [icon]: Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F.. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons.
  ///
  /// [ForumTopicInfo] is returned on completion.
  const CreateForumTopic({
    required this.chatId,
    required this.name,
    required this.isNameImplicit,
    required this.icon,
  });

  /// Identifier of the chat
  final int chatId;

  /// Name of the topic; 1-128 characters
  final String name;

  /// Pass true if the name of the topic wasn't entered explicitly; for chats with bots only
  final bool isNameImplicit;

  /// Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F.. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons
  final ForumTopicIcon icon;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "name": name,
      "is_name_implicit": isNameImplicit,
      "icon": icon.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [name]: Name of the topic; 1-128 characters
  /// * [is_name_implicit]: Pass true if the name of the topic wasn't entered explicitly; for chats with bots only
  /// * [icon]: Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F.. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons
  CreateForumTopic copyWith({
    int? chatId,
    String? name,
    bool? isNameImplicit,
    ForumTopicIcon? icon,
  }) =>
      CreateForumTopic(
        chatId: chatId ?? this.chatId,
        name: name ?? this.name,
        isNameImplicit: isNameImplicit ?? this.isNameImplicit,
        icon: icon ?? this.icon,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createForumTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
