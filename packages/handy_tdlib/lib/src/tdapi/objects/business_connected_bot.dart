part of '../tdapi.dart';

/// **BusinessConnectedBot** *(businessConnectedBot)* - basic class
///
/// Describes a business bot connected to an account.
///
/// * [botUserId]: User identifier of the bot.
/// * [recipients]: Private chats that will be accessible to the bot.
/// * [rights]: Rights of the bot.
final class BusinessConnectedBot extends TdObject {
  /// **BusinessConnectedBot** *(businessConnectedBot)* - basic class
  ///
  /// Describes a business bot connected to an account.
  ///
  /// * [botUserId]: User identifier of the bot.
  /// * [recipients]: Private chats that will be accessible to the bot.
  /// * [rights]: Rights of the bot.
  const BusinessConnectedBot({
    required this.botUserId,
    required this.recipients,
    required this.rights,
  });

  /// User identifier of the bot
  final int botUserId;

  /// Private chats that will be accessible to the bot
  final BusinessRecipients recipients;

  /// Rights of the bot
  final BusinessBotRights rights;

  /// Parse from a json
  factory BusinessConnectedBot.fromJson(Map<String, dynamic> json) =>
      BusinessConnectedBot(
        botUserId: json['bot_user_id'],
        recipients: BusinessRecipients.fromJson(json['recipients']),
        rights: BusinessBotRights.fromJson(json['rights']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "recipients": recipients.toJson(),
      "rights": rights.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot
  /// * [recipients]: Private chats that will be accessible to the bot
  /// * [rights]: Rights of the bot
  BusinessConnectedBot copyWith({
    int? botUserId,
    BusinessRecipients? recipients,
    BusinessBotRights? rights,
  }) =>
      BusinessConnectedBot(
        botUserId: botUserId ?? this.botUserId,
        recipients: recipients ?? this.recipients,
        rights: rights ?? this.rights,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
