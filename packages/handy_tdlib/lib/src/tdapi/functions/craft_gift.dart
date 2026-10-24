part of '../tdapi.dart';

/// **CraftGift** *(craftGift)* - TDLib function
///
/// Crafts a new gift from other gifts that will be permanently lost.
///
/// * [receivedGiftIds]: Identifier of the gifts to use for crafting. In the case of a successful craft, the resulting gift will have the number of the first gift.. Consequently, the first gift must not have been withdrawn to the TON blockchain as an NFT and must have an empty gift_address.
///
/// [CraftGiftResult] is returned on completion.
final class CraftGift extends TdFunction {
  /// **CraftGift** *(craftGift)* - TDLib function
  ///
  /// Crafts a new gift from other gifts that will be permanently lost.
  ///
  /// * [receivedGiftIds]: Identifier of the gifts to use for crafting. In the case of a successful craft, the resulting gift will have the number of the first gift.. Consequently, the first gift must not have been withdrawn to the TON blockchain as an NFT and must have an empty gift_address.
  ///
  /// [CraftGiftResult] is returned on completion.
  const CraftGift({
    required this.receivedGiftIds,
  });

  /// Identifier of the gifts to use for crafting. In the case of a successful craft, the resulting gift will have the number of the first gift.. Consequently, the first gift must not have been withdrawn to the TON blockchain as an NFT and must have an empty gift_address
  final List<String> receivedGiftIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_ids": receivedGiftIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_ids]: Identifier of the gifts to use for crafting. In the case of a successful craft, the resulting gift will have the number of the first gift.. Consequently, the first gift must not have been withdrawn to the TON blockchain as an NFT and must have an empty gift_address
  CraftGift copyWith({
    List<String>? receivedGiftIds,
  }) =>
      CraftGift(
        receivedGiftIds: receivedGiftIds ?? this.receivedGiftIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'craftGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
