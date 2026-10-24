part of '../tdapi.dart';

/// **AuctionBid** *(auctionBid)* - basic class
///
/// Describes a bid in an auction.
///
/// * [starCount]: The number of Telegram Stars that were put in the bid.
/// * [bidDate]: Point in time (Unix timestamp) when the bid was made.
/// * [position]: Position of the bid in the list of all bids.
final class AuctionBid extends TdObject {
  /// **AuctionBid** *(auctionBid)* - basic class
  ///
  /// Describes a bid in an auction.
  ///
  /// * [starCount]: The number of Telegram Stars that were put in the bid.
  /// * [bidDate]: Point in time (Unix timestamp) when the bid was made.
  /// * [position]: Position of the bid in the list of all bids.
  const AuctionBid({
    required this.starCount,
    required this.bidDate,
    required this.position,
  });

  /// The number of Telegram Stars that were put in the bid
  final int starCount;

  /// Point in time (Unix timestamp) when the bid was made
  final int bidDate;

  /// Position of the bid in the list of all bids
  final int position;

  /// Parse from a json
  factory AuctionBid.fromJson(Map<String, dynamic> json) => AuctionBid(
        starCount: json['star_count'],
        bidDate: json['bid_date'],
        position: json['position'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "bid_date": bidDate,
      "position": position,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The number of Telegram Stars that were put in the bid
  /// * [bid_date]: Point in time (Unix timestamp) when the bid was made
  /// * [position]: Position of the bid in the list of all bids
  AuctionBid copyWith({
    int? starCount,
    int? bidDate,
    int? position,
  }) =>
      AuctionBid(
        starCount: starCount ?? this.starCount,
        bidDate: bidDate ?? this.bidDate,
        position: position ?? this.position,
      );

  /// TDLib object type
  static const String defaultObjectId = 'auctionBid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
