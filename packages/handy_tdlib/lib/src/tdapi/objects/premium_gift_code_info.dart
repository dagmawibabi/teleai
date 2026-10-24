part of '../tdapi.dart';

/// **PremiumGiftCodeInfo** *(premiumGiftCodeInfo)* - basic class
///
/// Contains information about a Telegram Premium gift code.
///
/// * [creatorId]: Identifier of a chat or a user who created the gift code; may be null if unknown. If null and the code is from messagePremiumGiftCode message, then creator_id from the message can be used *(optional)*.
/// * [creationDate]: Point in time (Unix timestamp) when the code was created.
/// * [isFromGiveaway]: True, if the gift code was created for a giveaway.
/// * [giveawayMessageId]: Identifier of the corresponding giveaway message in the creator_id chat; may be 0 or an identifier of a deleted message.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
/// * [dayCount]: Number of days the Telegram Premium subscription will be active after code activation.
/// * [userId]: Identifier of a user for which the code was created; 0 if none.
/// * [useDate]: Point in time (Unix timestamp) when the code was activated; 0 if none.
final class PremiumGiftCodeInfo extends TdObject {
  /// **PremiumGiftCodeInfo** *(premiumGiftCodeInfo)* - basic class
  ///
  /// Contains information about a Telegram Premium gift code.
  ///
  /// * [creatorId]: Identifier of a chat or a user who created the gift code; may be null if unknown. If null and the code is from messagePremiumGiftCode message, then creator_id from the message can be used *(optional)*.
  /// * [creationDate]: Point in time (Unix timestamp) when the code was created.
  /// * [isFromGiveaway]: True, if the gift code was created for a giveaway.
  /// * [giveawayMessageId]: Identifier of the corresponding giveaway message in the creator_id chat; may be 0 or an identifier of a deleted message.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
  /// * [dayCount]: Number of days the Telegram Premium subscription will be active after code activation.
  /// * [userId]: Identifier of a user for which the code was created; 0 if none.
  /// * [useDate]: Point in time (Unix timestamp) when the code was activated; 0 if none.
  const PremiumGiftCodeInfo({
    this.creatorId,
    required this.creationDate,
    required this.isFromGiveaway,
    required this.giveawayMessageId,
    required this.monthCount,
    required this.dayCount,
    required this.userId,
    required this.useDate,
    this.extra,
    this.clientId,
  });

  /// Identifier of a chat or a user who created the gift code; may be null if unknown. If null and the code is from messagePremiumGiftCode message, then creator_id from the message can be used
  final MessageSender? creatorId;

  /// Point in time (Unix timestamp) when the code was created
  final int creationDate;

  /// True, if the gift code was created for a giveaway
  final bool isFromGiveaway;

  /// Identifier of the corresponding giveaway message in the creator_id chat; may be 0 or an identifier of a deleted message
  final int giveawayMessageId;

  /// Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  final int monthCount;

  /// Number of days the Telegram Premium subscription will be active after code activation
  final int dayCount;

  /// Identifier of a user for which the code was created; 0 if none
  final int userId;

  /// Point in time (Unix timestamp) when the code was activated; 0 if none
  final int useDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PremiumGiftCodeInfo.fromJson(Map<String, dynamic> json) =>
      PremiumGiftCodeInfo(
        creatorId: json['creator_id'] == null
            ? null
            : MessageSender.fromJson(json['creator_id']),
        creationDate: json['creation_date'],
        isFromGiveaway: json['is_from_giveaway'],
        giveawayMessageId: json['giveaway_message_id'],
        monthCount: json['month_count'],
        dayCount: json['day_count'],
        userId: json['user_id'] ?? 0,
        useDate: json['use_date'] ?? 0,
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "creator_id": creatorId?.toJson(),
      "creation_date": creationDate,
      "is_from_giveaway": isFromGiveaway,
      "giveaway_message_id": giveawayMessageId,
      "month_count": monthCount,
      "day_count": dayCount,
      "user_id": userId,
      "use_date": useDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [creator_id]: Identifier of a chat or a user who created the gift code; may be null if unknown. If null and the code is from messagePremiumGiftCode message, then creator_id from the message can be used
  /// * [creation_date]: Point in time (Unix timestamp) when the code was created
  /// * [is_from_giveaway]: True, if the gift code was created for a giveaway
  /// * [giveaway_message_id]: Identifier of the corresponding giveaway message in the creator_id chat; may be 0 or an identifier of a deleted message
  /// * [month_count]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  /// * [day_count]: Number of days the Telegram Premium subscription will be active after code activation
  /// * [user_id]: Identifier of a user for which the code was created; 0 if none
  /// * [use_date]: Point in time (Unix timestamp) when the code was activated; 0 if none
  PremiumGiftCodeInfo copyWith({
    MessageSender? creatorId,
    int? creationDate,
    bool? isFromGiveaway,
    int? giveawayMessageId,
    int? monthCount,
    int? dayCount,
    int? userId,
    int? useDate,
    dynamic extra,
    int? clientId,
  }) =>
      PremiumGiftCodeInfo(
        creatorId: creatorId ?? this.creatorId,
        creationDate: creationDate ?? this.creationDate,
        isFromGiveaway: isFromGiveaway ?? this.isFromGiveaway,
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
        monthCount: monthCount ?? this.monthCount,
        dayCount: dayCount ?? this.dayCount,
        userId: userId ?? this.userId,
        useDate: useDate ?? this.useDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumGiftCodeInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
