part of '../tdapi.dart';

/// **AcceptedGiftTypes** *(acceptedGiftTypes)* - basic class
///
/// Describes gift types that are accepted by a user.
///
/// * [unlimitedGifts]: True, if unlimited regular gifts are accepted.
/// * [limitedGifts]: True, if limited regular gifts are accepted.
/// * [upgradedGifts]: True, if upgraded gifts and regular gifts that can be upgraded for free are accepted.
/// * [giftsFromChannels]: True, if gifts from channels are accepted subject to other restrictions.
/// * [premiumSubscription]: True, if Telegram Premium subscription is accepted.
final class AcceptedGiftTypes extends TdObject {
  /// **AcceptedGiftTypes** *(acceptedGiftTypes)* - basic class
  ///
  /// Describes gift types that are accepted by a user.
  ///
  /// * [unlimitedGifts]: True, if unlimited regular gifts are accepted.
  /// * [limitedGifts]: True, if limited regular gifts are accepted.
  /// * [upgradedGifts]: True, if upgraded gifts and regular gifts that can be upgraded for free are accepted.
  /// * [giftsFromChannels]: True, if gifts from channels are accepted subject to other restrictions.
  /// * [premiumSubscription]: True, if Telegram Premium subscription is accepted.
  const AcceptedGiftTypes({
    required this.unlimitedGifts,
    required this.limitedGifts,
    required this.upgradedGifts,
    required this.giftsFromChannels,
    required this.premiumSubscription,
  });

  /// True, if unlimited regular gifts are accepted
  final bool unlimitedGifts;

  /// True, if limited regular gifts are accepted
  final bool limitedGifts;

  /// True, if upgraded gifts and regular gifts that can be upgraded for free are accepted
  final bool upgradedGifts;

  /// True, if gifts from channels are accepted subject to other restrictions
  final bool giftsFromChannels;

  /// True, if Telegram Premium subscription is accepted
  final bool premiumSubscription;

  /// Parse from a json
  factory AcceptedGiftTypes.fromJson(Map<String, dynamic> json) =>
      AcceptedGiftTypes(
        unlimitedGifts: json['unlimited_gifts'],
        limitedGifts: json['limited_gifts'],
        upgradedGifts: json['upgraded_gifts'],
        giftsFromChannels: json['gifts_from_channels'],
        premiumSubscription: json['premium_subscription'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unlimited_gifts": unlimitedGifts,
      "limited_gifts": limitedGifts,
      "upgraded_gifts": upgradedGifts,
      "gifts_from_channels": giftsFromChannels,
      "premium_subscription": premiumSubscription,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unlimited_gifts]: True, if unlimited regular gifts are accepted
  /// * [limited_gifts]: True, if limited regular gifts are accepted
  /// * [upgraded_gifts]: True, if upgraded gifts and regular gifts that can be upgraded for free are accepted
  /// * [gifts_from_channels]: True, if gifts from channels are accepted subject to other restrictions
  /// * [premium_subscription]: True, if Telegram Premium subscription is accepted
  AcceptedGiftTypes copyWith({
    bool? unlimitedGifts,
    bool? limitedGifts,
    bool? upgradedGifts,
    bool? giftsFromChannels,
    bool? premiumSubscription,
  }) =>
      AcceptedGiftTypes(
        unlimitedGifts: unlimitedGifts ?? this.unlimitedGifts,
        limitedGifts: limitedGifts ?? this.limitedGifts,
        upgradedGifts: upgradedGifts ?? this.upgradedGifts,
        giftsFromChannels: giftsFromChannels ?? this.giftsFromChannels,
        premiumSubscription: premiumSubscription ?? this.premiumSubscription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'acceptedGiftTypes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
