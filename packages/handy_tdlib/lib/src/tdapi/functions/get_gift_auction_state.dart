part of '../tdapi.dart';

/// **GetGiftAuctionState** *(getGiftAuctionState)* - TDLib function
///
/// Returns auction state for a gift.
///
/// * [auctionId]: Unique identifier of the auction.
///
/// [GiftAuctionState] is returned on completion.
final class GetGiftAuctionState extends TdFunction {
  /// **GetGiftAuctionState** *(getGiftAuctionState)* - TDLib function
  ///
  /// Returns auction state for a gift.
  ///
  /// * [auctionId]: Unique identifier of the auction.
  ///
  /// [GiftAuctionState] is returned on completion.
  const GetGiftAuctionState({
    required this.auctionId,
  });

  /// Unique identifier of the auction
  final String auctionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "auction_id": auctionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [auction_id]: Unique identifier of the auction
  GetGiftAuctionState copyWith({
    String? auctionId,
  }) =>
      GetGiftAuctionState(
        auctionId: auctionId ?? this.auctionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftAuctionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
