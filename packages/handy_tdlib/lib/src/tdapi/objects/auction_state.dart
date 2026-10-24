part of '../tdapi.dart';

/// **AuctionState** *(auctionState)* - parent
///
/// Describes state of an auction.
sealed class AuctionState extends TdObject {
  /// **AuctionState** *(auctionState)* - parent
  ///
  /// Describes state of an auction.
  const AuctionState();

  /// a AuctionState return type can be :
  /// * [AuctionStateActive]
  /// * [AuctionStateFinished]
  factory AuctionState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case AuctionStateActive.defaultObjectId:
        return AuctionStateActive.fromJson(json);
      case AuctionStateFinished.defaultObjectId:
        return AuctionStateFinished.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of AuctionState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  AuctionState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'auctionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuctionStateActive** *(auctionStateActive)* - child of AuctionState
///
/// Contains information about an ongoing or scheduled auction.
///
/// * [startDate]: Point in time (Unix timestamp) when the auction started or will start.
/// * [endDate]: Point in time (Unix timestamp) when the auction will be ended.
/// * [minBid]: The minimum possible bid in the auction in Telegram Stars.
/// * [bidLevels]: A sparse list of bids that were made in the auction.
/// * [topBidderUserIds]: User identifiers of at most 3 users with the biggest bids.
/// * [rounds]: Rounds of the auction in which their duration or extension rules are changed.
/// * [currentRoundEndDate]: Point in time (Unix timestamp) when the current round will end.
/// * [currentRoundNumber]: 1-based number of the current round.
/// * [totalRoundCount]: The total number of rounds.
/// * [distributedItemCount]: The number of items that were purchased on the auction by all users.
/// * [leftItemCount]: The number of items that have to be distributed on the auction.
/// * [acquiredItemCount]: The number of items that were purchased by the current user on the auction.
/// * [userBid]: Bid of the current user in the auction; may be null if none *(optional)*.
final class AuctionStateActive extends AuctionState {
  /// **AuctionStateActive** *(auctionStateActive)* - child of AuctionState
  ///
  /// Contains information about an ongoing or scheduled auction.
  ///
  /// * [startDate]: Point in time (Unix timestamp) when the auction started or will start.
  /// * [endDate]: Point in time (Unix timestamp) when the auction will be ended.
  /// * [minBid]: The minimum possible bid in the auction in Telegram Stars.
  /// * [bidLevels]: A sparse list of bids that were made in the auction.
  /// * [topBidderUserIds]: User identifiers of at most 3 users with the biggest bids.
  /// * [rounds]: Rounds of the auction in which their duration or extension rules are changed.
  /// * [currentRoundEndDate]: Point in time (Unix timestamp) when the current round will end.
  /// * [currentRoundNumber]: 1-based number of the current round.
  /// * [totalRoundCount]: The total number of rounds.
  /// * [distributedItemCount]: The number of items that were purchased on the auction by all users.
  /// * [leftItemCount]: The number of items that have to be distributed on the auction.
  /// * [acquiredItemCount]: The number of items that were purchased by the current user on the auction.
  /// * [userBid]: Bid of the current user in the auction; may be null if none *(optional)*.
  const AuctionStateActive({
    required this.startDate,
    required this.endDate,
    required this.minBid,
    required this.bidLevels,
    required this.topBidderUserIds,
    required this.rounds,
    required this.currentRoundEndDate,
    required this.currentRoundNumber,
    required this.totalRoundCount,
    required this.distributedItemCount,
    required this.leftItemCount,
    required this.acquiredItemCount,
    this.userBid,
  });

  /// Point in time (Unix timestamp) when the auction started or will start
  final int startDate;

  /// Point in time (Unix timestamp) when the auction will be ended
  final int endDate;

  /// The minimum possible bid in the auction in Telegram Stars
  final int minBid;

  /// A sparse list of bids that were made in the auction
  final List<AuctionBid> bidLevels;

  /// User identifiers of at most 3 users with the biggest bids
  final List<int> topBidderUserIds;

  /// Rounds of the auction in which their duration or extension rules are changed
  final List<AuctionRound> rounds;

  /// Point in time (Unix timestamp) when the current round will end
  final int currentRoundEndDate;

  /// 1-based number of the current round
  final int currentRoundNumber;

  /// The total number of rounds
  final int totalRoundCount;

  /// The number of items that were purchased on the auction by all users
  final int distributedItemCount;

  /// The number of items that have to be distributed on the auction
  final int leftItemCount;

  /// The number of items that were purchased by the current user on the auction
  final int acquiredItemCount;

  /// Bid of the current user in the auction; may be null if none
  final UserAuctionBid? userBid;

  /// Parse from a json
  factory AuctionStateActive.fromJson(Map<String, dynamic> json) =>
      AuctionStateActive(
        startDate: json['start_date'],
        endDate: json['end_date'],
        minBid: json['min_bid'],
        bidLevels: List<AuctionBid>.from((json['bid_levels'] ?? [])
            .map((item) => AuctionBid.fromJson(item))
            .toList()),
        topBidderUserIds: List<int>.from(
            (json['top_bidder_user_ids'] ?? []).map((item) => item).toList()),
        rounds: List<AuctionRound>.from((json['rounds'] ?? [])
            .map((item) => AuctionRound.fromJson(item))
            .toList()),
        currentRoundEndDate: json['current_round_end_date'],
        currentRoundNumber: json['current_round_number'],
        totalRoundCount: json['total_round_count'],
        distributedItemCount: json['distributed_item_count'],
        leftItemCount: json['left_item_count'],
        acquiredItemCount: json['acquired_item_count'],
        userBid: json['user_bid'] == null
            ? null
            : UserAuctionBid.fromJson(json['user_bid']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "start_date": startDate,
      "end_date": endDate,
      "min_bid": minBid,
      "bid_levels": bidLevels.map((i) => i.toJson()).toList(),
      "top_bidder_user_ids": topBidderUserIds.map((i) => i).toList(),
      "rounds": rounds.map((i) => i.toJson()).toList(),
      "current_round_end_date": currentRoundEndDate,
      "current_round_number": currentRoundNumber,
      "total_round_count": totalRoundCount,
      "distributed_item_count": distributedItemCount,
      "left_item_count": leftItemCount,
      "acquired_item_count": acquiredItemCount,
      "user_bid": userBid?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_date]: Point in time (Unix timestamp) when the auction started or will start
  /// * [end_date]: Point in time (Unix timestamp) when the auction will be ended
  /// * [min_bid]: The minimum possible bid in the auction in Telegram Stars
  /// * [bid_levels]: A sparse list of bids that were made in the auction
  /// * [top_bidder_user_ids]: User identifiers of at most 3 users with the biggest bids
  /// * [rounds]: Rounds of the auction in which their duration or extension rules are changed
  /// * [current_round_end_date]: Point in time (Unix timestamp) when the current round will end
  /// * [current_round_number]: 1-based number of the current round
  /// * [total_round_count]: The total number of rounds
  /// * [distributed_item_count]: The number of items that were purchased on the auction by all users
  /// * [left_item_count]: The number of items that have to be distributed on the auction
  /// * [acquired_item_count]: The number of items that were purchased by the current user on the auction
  /// * [user_bid]: Bid of the current user in the auction; may be null if none
  @override
  AuctionStateActive copyWith({
    int? startDate,
    int? endDate,
    int? minBid,
    List<AuctionBid>? bidLevels,
    List<int>? topBidderUserIds,
    List<AuctionRound>? rounds,
    int? currentRoundEndDate,
    int? currentRoundNumber,
    int? totalRoundCount,
    int? distributedItemCount,
    int? leftItemCount,
    int? acquiredItemCount,
    UserAuctionBid? userBid,
  }) =>
      AuctionStateActive(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        minBid: minBid ?? this.minBid,
        bidLevels: bidLevels ?? this.bidLevels,
        topBidderUserIds: topBidderUserIds ?? this.topBidderUserIds,
        rounds: rounds ?? this.rounds,
        currentRoundEndDate: currentRoundEndDate ?? this.currentRoundEndDate,
        currentRoundNumber: currentRoundNumber ?? this.currentRoundNumber,
        totalRoundCount: totalRoundCount ?? this.totalRoundCount,
        distributedItemCount: distributedItemCount ?? this.distributedItemCount,
        leftItemCount: leftItemCount ?? this.leftItemCount,
        acquiredItemCount: acquiredItemCount ?? this.acquiredItemCount,
        userBid: userBid ?? this.userBid,
      );

  /// TDLib object type
  static const String defaultObjectId = 'auctionStateActive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuctionStateFinished** *(auctionStateFinished)* - child of AuctionState
///
/// Contains information about a finished auction.
///
/// * [startDate]: Point in time (Unix timestamp) when the auction started.
/// * [endDate]: Point in time (Unix timestamp) when the auction will be ended.
/// * [averagePrice]: Average price of bought items in Telegram Stars.
/// * [acquiredItemCount]: The number of items that were purchased by the current user on the auction.
/// * [telegramListedItemCount]: Number of items from the auction being resold on Telegram.
/// * [fragmentListedItemCount]: Number of items from the auction being resold on Fragment.
/// * [fragmentUrl]: The HTTPS link to the Fragment for the resold items; may be empty if there are no such items being sold on Fragment.
final class AuctionStateFinished extends AuctionState {
  /// **AuctionStateFinished** *(auctionStateFinished)* - child of AuctionState
  ///
  /// Contains information about a finished auction.
  ///
  /// * [startDate]: Point in time (Unix timestamp) when the auction started.
  /// * [endDate]: Point in time (Unix timestamp) when the auction will be ended.
  /// * [averagePrice]: Average price of bought items in Telegram Stars.
  /// * [acquiredItemCount]: The number of items that were purchased by the current user on the auction.
  /// * [telegramListedItemCount]: Number of items from the auction being resold on Telegram.
  /// * [fragmentListedItemCount]: Number of items from the auction being resold on Fragment.
  /// * [fragmentUrl]: The HTTPS link to the Fragment for the resold items; may be empty if there are no such items being sold on Fragment.
  const AuctionStateFinished({
    required this.startDate,
    required this.endDate,
    required this.averagePrice,
    required this.acquiredItemCount,
    required this.telegramListedItemCount,
    required this.fragmentListedItemCount,
    required this.fragmentUrl,
  });

  /// Point in time (Unix timestamp) when the auction started
  final int startDate;

  /// Point in time (Unix timestamp) when the auction will be ended
  final int endDate;

  /// Average price of bought items in Telegram Stars
  final int averagePrice;

  /// The number of items that were purchased by the current user on the auction
  final int acquiredItemCount;

  /// Number of items from the auction being resold on Telegram
  final int telegramListedItemCount;

  /// Number of items from the auction being resold on Fragment
  final int fragmentListedItemCount;

  /// The HTTPS link to the Fragment for the resold items; may be empty if there are no such items being sold on Fragment
  final String fragmentUrl;

  /// Parse from a json
  factory AuctionStateFinished.fromJson(Map<String, dynamic> json) =>
      AuctionStateFinished(
        startDate: json['start_date'],
        endDate: json['end_date'],
        averagePrice: json['average_price'],
        acquiredItemCount: json['acquired_item_count'],
        telegramListedItemCount: json['telegram_listed_item_count'],
        fragmentListedItemCount: json['fragment_listed_item_count'],
        fragmentUrl: json['fragment_url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "start_date": startDate,
      "end_date": endDate,
      "average_price": averagePrice,
      "acquired_item_count": acquiredItemCount,
      "telegram_listed_item_count": telegramListedItemCount,
      "fragment_listed_item_count": fragmentListedItemCount,
      "fragment_url": fragmentUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_date]: Point in time (Unix timestamp) when the auction started
  /// * [end_date]: Point in time (Unix timestamp) when the auction will be ended
  /// * [average_price]: Average price of bought items in Telegram Stars
  /// * [acquired_item_count]: The number of items that were purchased by the current user on the auction
  /// * [telegram_listed_item_count]: Number of items from the auction being resold on Telegram
  /// * [fragment_listed_item_count]: Number of items from the auction being resold on Fragment
  /// * [fragment_url]: The HTTPS link to the Fragment for the resold items; may be empty if there are no such items being sold on Fragment
  @override
  AuctionStateFinished copyWith({
    int? startDate,
    int? endDate,
    int? averagePrice,
    int? acquiredItemCount,
    int? telegramListedItemCount,
    int? fragmentListedItemCount,
    String? fragmentUrl,
  }) =>
      AuctionStateFinished(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        averagePrice: averagePrice ?? this.averagePrice,
        acquiredItemCount: acquiredItemCount ?? this.acquiredItemCount,
        telegramListedItemCount:
            telegramListedItemCount ?? this.telegramListedItemCount,
        fragmentListedItemCount:
            fragmentListedItemCount ?? this.fragmentListedItemCount,
        fragmentUrl: fragmentUrl ?? this.fragmentUrl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'auctionStateFinished';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
