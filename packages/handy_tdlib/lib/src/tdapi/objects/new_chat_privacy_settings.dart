part of '../tdapi.dart';

/// **NewChatPrivacySettings** *(newChatPrivacySettings)* - basic class
///
/// Contains privacy settings for chats with non-contacts.
///
/// * [allowNewChatsFromUnknownUsers]: True, if non-contacts users are able to write first to the current user. Telegram Premium subscribers are able to write first regardless of this setting.
/// * [incomingPaidMessageStarCount]: Number of Telegram Stars that must be paid for every incoming private message by non-contacts; 0-getOption("paid_message_star_count_max").. If positive, then allow_new_chats_from_unknown_users must be true. The current user will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.. Can be positive, only if getOption("can_enable_paid_messages") is true.
final class NewChatPrivacySettings extends TdObject {
  /// **NewChatPrivacySettings** *(newChatPrivacySettings)* - basic class
  ///
  /// Contains privacy settings for chats with non-contacts.
  ///
  /// * [allowNewChatsFromUnknownUsers]: True, if non-contacts users are able to write first to the current user. Telegram Premium subscribers are able to write first regardless of this setting.
  /// * [incomingPaidMessageStarCount]: Number of Telegram Stars that must be paid for every incoming private message by non-contacts; 0-getOption("paid_message_star_count_max").. If positive, then allow_new_chats_from_unknown_users must be true. The current user will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.. Can be positive, only if getOption("can_enable_paid_messages") is true.
  const NewChatPrivacySettings({
    required this.allowNewChatsFromUnknownUsers,
    required this.incomingPaidMessageStarCount,
    this.extra,
    this.clientId,
  });

  /// True, if non-contacts users are able to write first to the current user. Telegram Premium subscribers are able to write first regardless of this setting
  final bool allowNewChatsFromUnknownUsers;

  /// Number of Telegram Stars that must be paid for every incoming private message by non-contacts; 0-getOption("paid_message_star_count_max").. If positive, then allow_new_chats_from_unknown_users must be true. The current user will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.. Can be positive, only if getOption("can_enable_paid_messages") is true
  final int incomingPaidMessageStarCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory NewChatPrivacySettings.fromJson(Map<String, dynamic> json) =>
      NewChatPrivacySettings(
        allowNewChatsFromUnknownUsers:
            json['allow_new_chats_from_unknown_users'],
        incomingPaidMessageStarCount: json['incoming_paid_message_star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "allow_new_chats_from_unknown_users": allowNewChatsFromUnknownUsers,
      "incoming_paid_message_star_count": incomingPaidMessageStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [allow_new_chats_from_unknown_users]: True, if non-contacts users are able to write first to the current user. Telegram Premium subscribers are able to write first regardless of this setting
  /// * [incoming_paid_message_star_count]: Number of Telegram Stars that must be paid for every incoming private message by non-contacts; 0-getOption("paid_message_star_count_max").. If positive, then allow_new_chats_from_unknown_users must be true. The current user will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.. Can be positive, only if getOption("can_enable_paid_messages") is true
  NewChatPrivacySettings copyWith({
    bool? allowNewChatsFromUnknownUsers,
    int? incomingPaidMessageStarCount,
    dynamic extra,
    int? clientId,
  }) =>
      NewChatPrivacySettings(
        allowNewChatsFromUnknownUsers:
            allowNewChatsFromUnknownUsers ?? this.allowNewChatsFromUnknownUsers,
        incomingPaidMessageStarCount:
            incomingPaidMessageStarCount ?? this.incomingPaidMessageStarCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'newChatPrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
