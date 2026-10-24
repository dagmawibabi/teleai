part of '../tdapi.dart';

/// **ChatBoostLinkInfo** *(chatBoostLinkInfo)* - basic class
///
/// Contains information about a link to boost a chat.
///
/// * [isPublic]: True, if the link will work for non-members of the chat.
/// * [chatId]: Identifier of the chat to which the link points; 0 if the chat isn't found.
final class ChatBoostLinkInfo extends TdObject {
  /// **ChatBoostLinkInfo** *(chatBoostLinkInfo)* - basic class
  ///
  /// Contains information about a link to boost a chat.
  ///
  /// * [isPublic]: True, if the link will work for non-members of the chat.
  /// * [chatId]: Identifier of the chat to which the link points; 0 if the chat isn't found.
  const ChatBoostLinkInfo({
    required this.isPublic,
    required this.chatId,
    this.extra,
    this.clientId,
  });

  /// True, if the link will work for non-members of the chat
  final bool isPublic;

  /// Identifier of the chat to which the link points; 0 if the chat isn't found
  final int chatId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostLinkInfo.fromJson(Map<String, dynamic> json) =>
      ChatBoostLinkInfo(
        isPublic: json['is_public'],
        chatId: json['chat_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_public": isPublic,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_public]: True, if the link will work for non-members of the chat
  /// * [chat_id]: Identifier of the chat to which the link points; 0 if the chat isn't found
  ChatBoostLinkInfo copyWith({
    bool? isPublic,
    int? chatId,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostLinkInfo(
        isPublic: isPublic ?? this.isPublic,
        chatId: chatId ?? this.chatId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
