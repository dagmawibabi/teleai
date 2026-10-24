part of '../tdapi.dart';

/// **BanChatMember** *(banChatMember)* - TDLib function
///
/// Bans a member in a chat; requires can_restrict_members administrator right. Members can't be banned in private or secret chats.. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first.
///
/// * [chatId]: Chat identifier.
/// * [memberId]: Member identifier.
/// * [bannedUntilDate]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned.
/// * [revokeMessages]: Pass true to delete all messages in the chat for the user who is being removed. Always true for supergroups and channels.
///
/// [Ok] is returned on completion.
final class BanChatMember extends TdFunction {
  /// **BanChatMember** *(banChatMember)* - TDLib function
  ///
  /// Bans a member in a chat; requires can_restrict_members administrator right. Members can't be banned in private or secret chats.. In supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first.
  ///
  /// * [chatId]: Chat identifier.
  /// * [memberId]: Member identifier.
  /// * [bannedUntilDate]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned.
  /// * [revokeMessages]: Pass true to delete all messages in the chat for the user who is being removed. Always true for supergroups and channels.
  ///
  /// [Ok] is returned on completion.
  const BanChatMember({
    required this.chatId,
    required this.memberId,
    required this.bannedUntilDate,
    required this.revokeMessages,
  });

  /// Chat identifier
  final int chatId;

  /// Member identifier
  final MessageSender memberId;

  /// Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
  final int bannedUntilDate;

  /// Pass true to delete all messages in the chat for the user who is being removed. Always true for supergroups and channels
  final bool revokeMessages;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "member_id": memberId.toJson(),
      "banned_until_date": bannedUntilDate,
      "revoke_messages": revokeMessages,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [member_id]: Member identifier
  /// * [banned_until_date]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Ignored in basic groups and if a chat is banned
  /// * [revoke_messages]: Pass true to delete all messages in the chat for the user who is being removed. Always true for supergroups and channels
  BanChatMember copyWith({
    int? chatId,
    MessageSender? memberId,
    int? bannedUntilDate,
    bool? revokeMessages,
  }) =>
      BanChatMember(
        chatId: chatId ?? this.chatId,
        memberId: memberId ?? this.memberId,
        bannedUntilDate: bannedUntilDate ?? this.bannedUntilDate,
        revokeMessages: revokeMessages ?? this.revokeMessages,
      );

  /// TDLib object type
  static const String defaultObjectId = 'banChatMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
