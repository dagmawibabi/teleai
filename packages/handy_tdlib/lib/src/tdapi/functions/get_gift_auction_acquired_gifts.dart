part of '../tdapi.dart';

/// **GetGiftAuctionAcquiredGifts** *(getGiftAuctionAcquiredGifts)* - TDLib function
///
/// Returns the gifts that were acquired by the current user on a gift auction.
///
/// * [giftId]: Identifier of the auctioned gift.
///
/// [GiftAuctionAcquiredGifts] is returned on completion.
final class GetGiftAuctionAcquiredGifts extends TdFunction {
  /// **GetGiftAuctionAcquiredGifts** *(getGiftAuctionAcquiredGifts)* - TDLib function
  ///
  /// Returns the gifts that were acquired by the current user on a gift auction.
  ///
  /// * [giftId]: Identifier of the auctioned gift.
  ///
  /// [GiftAuctionAcquiredGifts] is returned on completion.
  const GetGiftAuctionAcquiredGifts({
    required this.giftId,
  });

  /// Identifier of the auctioned gift
  final int giftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the auctioned gift
  GetGiftAuctionAcquiredGifts copyWith({
    int? giftId,
  }) =>
      GetGiftAuctionAcquiredGifts(
        giftId: giftId ?? this.giftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftAuctionAcquiredGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
