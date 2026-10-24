part of '../tdapi.dart';

/// **BuyGiftUpgrade** *(buyGiftUpgrade)* - TDLib function
///
/// Pays for upgrade of a regular gift that is owned by another user or channel chat.
///
/// * [ownerId]: Identifier of the user or the channel chat that owns the gift.
/// * [prepaidUpgradeHash]: Prepaid upgrade hash as received along with the gift.
/// * [starCount]: The Telegram Star amount the user agreed to pay for the upgrade; must be equal to gift.upgrade_star_count.
///
/// [Ok] is returned on completion.
final class BuyGiftUpgrade extends TdFunction {
  /// **BuyGiftUpgrade** *(buyGiftUpgrade)* - TDLib function
  ///
  /// Pays for upgrade of a regular gift that is owned by another user or channel chat.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that owns the gift.
  /// * [prepaidUpgradeHash]: Prepaid upgrade hash as received along with the gift.
  /// * [starCount]: The Telegram Star amount the user agreed to pay for the upgrade; must be equal to gift.upgrade_star_count.
  ///
  /// [Ok] is returned on completion.
  const BuyGiftUpgrade({
    required this.ownerId,
    required this.prepaidUpgradeHash,
    required this.starCount,
  });

  /// Identifier of the user or the channel chat that owns the gift
  final MessageSender ownerId;

  /// Prepaid upgrade hash as received along with the gift
  final String prepaidUpgradeHash;

  /// The Telegram Star amount the user agreed to pay for the upgrade; must be equal to gift.upgrade_star_count
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "prepaid_upgrade_hash": prepaidUpgradeHash,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that owns the gift
  /// * [prepaid_upgrade_hash]: Prepaid upgrade hash as received along with the gift
  /// * [star_count]: The Telegram Star amount the user agreed to pay for the upgrade; must be equal to gift.upgrade_star_count
  BuyGiftUpgrade copyWith({
    MessageSender? ownerId,
    String? prepaidUpgradeHash,
    int? starCount,
  }) =>
      BuyGiftUpgrade(
        ownerId: ownerId ?? this.ownerId,
        prepaidUpgradeHash: prepaidUpgradeHash ?? this.prepaidUpgradeHash,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'buyGiftUpgrade';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
