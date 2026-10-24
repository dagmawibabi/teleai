part of '../tdapi.dart';

/// **UserAuctionBid** *(userAuctionBid)* - basic class
///
/// Describes a bid of the current user in an auction.
///
/// * [starCount]: The number of Telegram Stars that were put in the bid.
/// * [bidDate]: Point in time (Unix timestamp) when the bid was made.
/// * [nextBidStarCount]: The minimum number of Telegram Stars that can be put for the next bid.
/// * [ownerId]: Identifier of the user or the chat that will receive the auctioned item. If the auction is opened in context of another user or chat, then a warning is supposed to be shown to the current user.
/// * [wasReturned]: True, if the bid was returned to the user, because it was outbid and can't win anymore.
final class UserAuctionBid extends TdObject {
  /// **UserAuctionBid** *(userAuctionBid)* - basic class
  ///
  /// Describes a bid of the current user in an auction.
  ///
  /// * [starCount]: The number of Telegram Stars that were put in the bid.
  /// * [bidDate]: Point in time (Unix timestamp) when the bid was made.
  /// * [nextBidStarCount]: The minimum number of Telegram Stars that can be put for the next bid.
  /// * [ownerId]: Identifier of the user or the chat that will receive the auctioned item. If the auction is opened in context of another user or chat, then a warning is supposed to be shown to the current user.
  /// * [wasReturned]: True, if the bid was returned to the user, because it was outbid and can't win anymore.
  const UserAuctionBid({
    required this.starCount,
    required this.bidDate,
    required this.nextBidStarCount,
    required this.ownerId,
    required this.wasReturned,
  });

  /// The number of Telegram Stars that were put in the bid
  final int starCount;

  /// Point in time (Unix timestamp) when the bid was made
  final int bidDate;

  /// The minimum number of Telegram Stars that can be put for the next bid
  final int nextBidStarCount;

  /// Identifier of the user or the chat that will receive the auctioned item. If the auction is opened in context of another user or chat, then a warning is supposed to be shown to the current user
  final MessageSender ownerId;

  /// True, if the bid was returned to the user, because it was outbid and can't win anymore
  final bool wasReturned;

  /// Parse from a json
  factory UserAuctionBid.fromJson(Map<String, dynamic> json) => UserAuctionBid(
        starCount: json['star_count'],
        bidDate: json['bid_date'],
        nextBidStarCount: json['next_bid_star_count'],
        ownerId: MessageSender.fromJson(json['owner_id']),
        wasReturned: json['was_returned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "bid_date": bidDate,
      "next_bid_star_count": nextBidStarCount,
      "owner_id": ownerId.toJson(),
      "was_returned": wasReturned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The number of Telegram Stars that were put in the bid
  /// * [bid_date]: Point in time (Unix timestamp) when the bid was made
  /// * [next_bid_star_count]: The minimum number of Telegram Stars that can be put for the next bid
  /// * [owner_id]: Identifier of the user or the chat that will receive the auctioned item. If the auction is opened in context of another user or chat, then a warning is supposed to be shown to the current user
  /// * [was_returned]: True, if the bid was returned to the user, because it was outbid and can't win anymore
  UserAuctionBid copyWith({
    int? starCount,
    int? bidDate,
    int? nextBidStarCount,
    MessageSender? ownerId,
    bool? wasReturned,
  }) =>
      UserAuctionBid(
        starCount: starCount ?? this.starCount,
        bidDate: bidDate ?? this.bidDate,
        nextBidStarCount: nextBidStarCount ?? this.nextBidStarCount,
        ownerId: ownerId ?? this.ownerId,
        wasReturned: wasReturned ?? this.wasReturned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userAuctionBid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
