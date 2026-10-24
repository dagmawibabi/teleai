part of '../tdapi.dart';

/// **GetUpgradedGiftVariants** *(getUpgradedGiftVariants)* - TDLib function
///
/// Returns all possible variants of upgraded gifts for a regular gift.
///
/// * [regularGiftId]: Identifier of the regular gift.
/// * [returnUpgradeModels]: Pass true to get models that can be obtained by upgrading a regular gift.
/// * [returnCraftModels]: Pass true to get models that can be obtained by crafting a gift from upgraded gifts.
///
/// [GiftUpgradeVariants] is returned on completion.
final class GetUpgradedGiftVariants extends TdFunction {
  /// **GetUpgradedGiftVariants** *(getUpgradedGiftVariants)* - TDLib function
  ///
  /// Returns all possible variants of upgraded gifts for a regular gift.
  ///
  /// * [regularGiftId]: Identifier of the regular gift.
  /// * [returnUpgradeModels]: Pass true to get models that can be obtained by upgrading a regular gift.
  /// * [returnCraftModels]: Pass true to get models that can be obtained by crafting a gift from upgraded gifts.
  ///
  /// [GiftUpgradeVariants] is returned on completion.
  const GetUpgradedGiftVariants({
    required this.regularGiftId,
    required this.returnUpgradeModels,
    required this.returnCraftModels,
  });

  /// Identifier of the regular gift
  final int regularGiftId;

  /// Pass true to get models that can be obtained by upgrading a regular gift
  final bool returnUpgradeModels;

  /// Pass true to get models that can be obtained by crafting a gift from upgraded gifts
  final bool returnCraftModels;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "regular_gift_id": regularGiftId,
      "return_upgrade_models": returnUpgradeModels,
      "return_craft_models": returnCraftModels,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [regular_gift_id]: Identifier of the regular gift
  /// * [return_upgrade_models]: Pass true to get models that can be obtained by upgrading a regular gift
  /// * [return_craft_models]: Pass true to get models that can be obtained by crafting a gift from upgraded gifts
  GetUpgradedGiftVariants copyWith({
    int? regularGiftId,
    bool? returnUpgradeModels,
    bool? returnCraftModels,
  }) =>
      GetUpgradedGiftVariants(
        regularGiftId: regularGiftId ?? this.regularGiftId,
        returnUpgradeModels: returnUpgradeModels ?? this.returnUpgradeModels,
        returnCraftModels: returnCraftModels ?? this.returnCraftModels,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftVariants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
