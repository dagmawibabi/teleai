part of '../tdapi.dart';

/// **IncreaseGiftAuctionBid** *(increaseGiftAuctionBid)* - TDLib function
///
/// Increases a bid for an auction gift without changing gift text and receiver.
///
/// * [giftId]: Identifier of the gift to put the bid on.
/// * [starCount]: The number of Telegram Stars to put in the bid.
///
/// [Ok] is returned on completion.
final class IncreaseGiftAuctionBid extends TdFunction {
  /// **IncreaseGiftAuctionBid** *(increaseGiftAuctionBid)* - TDLib function
  ///
  /// Increases a bid for an auction gift without changing gift text and receiver.
  ///
  /// * [giftId]: Identifier of the gift to put the bid on.
  /// * [starCount]: The number of Telegram Stars to put in the bid.
  ///
  /// [Ok] is returned on completion.
  const IncreaseGiftAuctionBid({
    required this.giftId,
    required this.starCount,
  });

  /// Identifier of the gift to put the bid on
  final int giftId;

  /// The number of Telegram Stars to put in the bid
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the gift to put the bid on
  /// * [star_count]: The number of Telegram Stars to put in the bid
  IncreaseGiftAuctionBid copyWith({
    int? giftId,
    int? starCount,
  }) =>
      IncreaseGiftAuctionBid(
        giftId: giftId ?? this.giftId,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'increaseGiftAuctionBid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
