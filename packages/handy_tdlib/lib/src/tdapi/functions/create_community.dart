part of '../tdapi.dart';

/// **CreateCommunity** *(createCommunity)* - TDLib function
///
/// Creates a new community for the given chat. Returns identifier of the created community.
///
/// * [name]: Name of the new community.
/// * [chatId]: Identifier of the chat in the community; only chats with owned bots and owned basic group, supergroup and channel chats are allowed;. basic group chats will be automatically upgraded to supergroup chats.
/// * [isChatHidden]: Pass true if the chat will be visible only to administrators of the community.
///
/// [CommunityId] is returned on completion.
final class CreateCommunity extends TdFunction {
  /// **CreateCommunity** *(createCommunity)* - TDLib function
  ///
  /// Creates a new community for the given chat. Returns identifier of the created community.
  ///
  /// * [name]: Name of the new community.
  /// * [chatId]: Identifier of the chat in the community; only chats with owned bots and owned basic group, supergroup and channel chats are allowed;. basic group chats will be automatically upgraded to supergroup chats.
  /// * [isChatHidden]: Pass true if the chat will be visible only to administrators of the community.
  ///
  /// [CommunityId] is returned on completion.
  const CreateCommunity({
    required this.name,
    required this.chatId,
    required this.isChatHidden,
  });

  /// Name of the new community
  final String name;

  /// Identifier of the chat in the community; only chats with owned bots and owned basic group, supergroup and channel chats are allowed;. basic group chats will be automatically upgraded to supergroup chats
  final int chatId;

  /// Pass true if the chat will be visible only to administrators of the community
  final bool isChatHidden;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "chat_id": chatId,
      "is_chat_hidden": isChatHidden,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the new community
  /// * [chat_id]: Identifier of the chat in the community; only chats with owned bots and owned basic group, supergroup and channel chats are allowed;. basic group chats will be automatically upgraded to supergroup chats
  /// * [is_chat_hidden]: Pass true if the chat will be visible only to administrators of the community
  CreateCommunity copyWith({
    String? name,
    int? chatId,
    bool? isChatHidden,
  }) =>
      CreateCommunity(
        name: name ?? this.name,
        chatId: chatId ?? this.chatId,
        isChatHidden: isChatHidden ?? this.isChatHidden,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
