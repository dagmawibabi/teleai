part of '../tdapi.dart';

/// **ChatLists** *(chatLists)* - basic class
///
/// Contains a list of chat lists.
///
/// * [chatLists]: List of chat lists.
final class ChatLists extends TdObject {
  /// **ChatLists** *(chatLists)* - basic class
  ///
  /// Contains a list of chat lists.
  ///
  /// * [chatLists]: List of chat lists.
  const ChatLists({
    required this.chatLists,
    this.extra,
    this.clientId,
  });

  /// List of chat lists
  final List<ChatList> chatLists;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatLists.fromJson(Map<String, dynamic> json) => ChatLists(
        chatLists: List<ChatList>.from((json['chat_lists'] ?? [])
            .map((item) => ChatList.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_lists": chatLists.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_lists]: List of chat lists
  ChatLists copyWith({
    List<ChatList>? chatLists,
    dynamic extra,
    int? clientId,
  }) =>
      ChatLists(
        chatLists: chatLists ?? this.chatLists,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatLists';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
