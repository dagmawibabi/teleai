part of '../tdapi.dart';

/// **CreatedBasicGroupChat** *(createdBasicGroupChat)* - basic class
///
/// Contains information about a newly created basic group chat.
///
/// * [chatId]: Chat identifier.
/// * [failedToAddMembers]: Information about failed to add members.
final class CreatedBasicGroupChat extends TdObject {
  /// **CreatedBasicGroupChat** *(createdBasicGroupChat)* - basic class
  ///
  /// Contains information about a newly created basic group chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [failedToAddMembers]: Information about failed to add members.
  const CreatedBasicGroupChat({
    required this.chatId,
    required this.failedToAddMembers,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Information about failed to add members
  final FailedToAddMembers failedToAddMembers;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CreatedBasicGroupChat.fromJson(Map<String, dynamic> json) =>
      CreatedBasicGroupChat(
        chatId: json['chat_id'],
        failedToAddMembers:
            FailedToAddMembers.fromJson(json['failed_to_add_members']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "failed_to_add_members": failedToAddMembers.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [failed_to_add_members]: Information about failed to add members
  CreatedBasicGroupChat copyWith({
    int? chatId,
    FailedToAddMembers? failedToAddMembers,
    dynamic extra,
    int? clientId,
  }) =>
      CreatedBasicGroupChat(
        chatId: chatId ?? this.chatId,
        failedToAddMembers: failedToAddMembers ?? this.failedToAddMembers,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createdBasicGroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
