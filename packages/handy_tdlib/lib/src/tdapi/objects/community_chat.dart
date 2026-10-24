part of '../tdapi.dart';

/// **CommunityChat** *(communityChat)* - basic class
///
/// Describes a chat in a community.
///
/// * [chatId]: Identifier of the chat in the community.
/// * [canViewHistory]: True, if message history of the chat can be viewed.
/// * [isHidden]: True, if the chat is hidden in the list of community chats; for community administrators only.
final class CommunityChat extends TdObject {
  /// **CommunityChat** *(communityChat)* - basic class
  ///
  /// Describes a chat in a community.
  ///
  /// * [chatId]: Identifier of the chat in the community.
  /// * [canViewHistory]: True, if message history of the chat can be viewed.
  /// * [isHidden]: True, if the chat is hidden in the list of community chats; for community administrators only.
  const CommunityChat({
    required this.chatId,
    required this.canViewHistory,
    required this.isHidden,
  });

  /// Identifier of the chat in the community
  final int chatId;

  /// True, if message history of the chat can be viewed
  final bool canViewHistory;

  /// True, if the chat is hidden in the list of community chats; for community administrators only
  final bool isHidden;

  /// Parse from a json
  factory CommunityChat.fromJson(Map<String, dynamic> json) => CommunityChat(
        chatId: json['chat_id'],
        canViewHistory: json['can_view_history'],
        isHidden: json['is_hidden'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "can_view_history": canViewHistory,
      "is_hidden": isHidden,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in the community
  /// * [can_view_history]: True, if message history of the chat can be viewed
  /// * [is_hidden]: True, if the chat is hidden in the list of community chats; for community administrators only
  CommunityChat copyWith({
    int? chatId,
    bool? canViewHistory,
    bool? isHidden,
  }) =>
      CommunityChat(
        chatId: chatId ?? this.chatId,
        canViewHistory: canViewHistory ?? this.canViewHistory,
        isHidden: isHidden ?? this.isHidden,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
