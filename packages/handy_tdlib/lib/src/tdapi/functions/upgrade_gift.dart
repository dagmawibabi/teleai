part of '../tdapi.dart';

/// **UpgradeGift** *(upgradeGift)* - TDLib function
///
/// Upgrades a regular gift.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [receivedGiftId]: Identifier of the gift.
/// * [keepOriginalDetails]: Pass true to keep the original gift text, sender and receiver in the upgraded gift.
/// * [starCount]: The Telegram Star amount required to pay for the upgrade. If the gift has prepaid_upgrade_star_count.
///
/// [UpgradeGiftResult] is returned on completion.
final class UpgradeGift extends TdFunction {
  /// **UpgradeGift** *(upgradeGift)* - TDLib function
  ///
  /// Upgrades a regular gift.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [receivedGiftId]: Identifier of the gift.
  /// * [keepOriginalDetails]: Pass true to keep the original gift text, sender and receiver in the upgraded gift.
  /// * [starCount]: The Telegram Star amount required to pay for the upgrade. If the gift has prepaid_upgrade_star_count.
  ///
  /// [UpgradeGiftResult] is returned on completion.
  const UpgradeGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
    required this.keepOriginalDetails,
    required this.starCount,
  });

  /// Unique identifier of business connection on behalf of which to send the request; for bots only
  final String businessConnectionId;

  /// Identifier of the gift
  final String receivedGiftId;

  /// Pass true to keep the original gift text, sender and receiver in the upgraded gift
  final bool keepOriginalDetails;

  /// The Telegram Star amount required to pay for the upgrade. If the gift has prepaid_upgrade_star_count
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "received_gift_id": receivedGiftId,
      "keep_original_details": keepOriginalDetails,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request; for bots only
  /// * [received_gift_id]: Identifier of the gift
  /// * [keep_original_details]: Pass true to keep the original gift text, sender and receiver in the upgraded gift
  /// * [star_count]: The Telegram Star amount required to pay for the upgrade. If the gift has prepaid_upgrade_star_count
  UpgradeGift copyWith({
    String? businessConnectionId,
    String? receivedGiftId,
    bool? keepOriginalDetails,
    int? starCount,
  }) =>
      UpgradeGift(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        keepOriginalDetails: keepOriginalDetails ?? this.keepOriginalDetails,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradeGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
