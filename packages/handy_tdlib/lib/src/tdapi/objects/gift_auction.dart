part of '../tdapi.dart';

/// **GiftAuction** *(giftAuction)* - basic class
///
/// Describes an auction on which a gift can be purchased.
///
/// * [id]: Identifier of the auction.
/// * [giftsPerRound]: Number of gifts distributed in each round.
/// * [startDate]: Point in time (Unix timestamp) when the auction will start.
final class GiftAuction extends TdObject {
  /// **GiftAuction** *(giftAuction)* - basic class
  ///
  /// Describes an auction on which a gift can be purchased.
  ///
  /// * [id]: Identifier of the auction.
  /// * [giftsPerRound]: Number of gifts distributed in each round.
  /// * [startDate]: Point in time (Unix timestamp) when the auction will start.
  const GiftAuction({
    required this.id,
    required this.giftsPerRound,
    required this.startDate,
  });

  /// Identifier of the auction
  final String id;

  /// Number of gifts distributed in each round
  final int giftsPerRound;

  /// Point in time (Unix timestamp) when the auction will start
  final int startDate;

  /// Parse from a json
  factory GiftAuction.fromJson(Map<String, dynamic> json) => GiftAuction(
        id: json['id'],
        giftsPerRound: json['gifts_per_round'],
        startDate: json['start_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "gifts_per_round": giftsPerRound,
      "start_date": startDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Identifier of the auction
  /// * [gifts_per_round]: Number of gifts distributed in each round
  /// * [start_date]: Point in time (Unix timestamp) when the auction will start
  GiftAuction copyWith({
    String? id,
    int? giftsPerRound,
    int? startDate,
  }) =>
      GiftAuction(
        id: id ?? this.id,
        giftsPerRound: giftsPerRound ?? this.giftsPerRound,
        startDate: startDate ?? this.startDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftAuction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
