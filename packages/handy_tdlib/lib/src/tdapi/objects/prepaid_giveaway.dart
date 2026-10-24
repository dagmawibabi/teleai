part of '../tdapi.dart';

/// **PrepaidGiveaway** *(prepaidGiveaway)* - basic class
///
/// Describes a prepaid giveaway.
///
/// * [id]: Unique identifier of the prepaid giveaway.
/// * [winnerCount]: Number of users who will receive giveaway prize.
/// * [prize]: Prize of the giveaway.
/// * [boostCount]: The number of boosts received by the chat from the giveaway; for Telegram Star giveaways only.
/// * [paymentDate]: Point in time (Unix timestamp) when the giveaway was paid.
final class PrepaidGiveaway extends TdObject {
  /// **PrepaidGiveaway** *(prepaidGiveaway)* - basic class
  ///
  /// Describes a prepaid giveaway.
  ///
  /// * [id]: Unique identifier of the prepaid giveaway.
  /// * [winnerCount]: Number of users who will receive giveaway prize.
  /// * [prize]: Prize of the giveaway.
  /// * [boostCount]: The number of boosts received by the chat from the giveaway; for Telegram Star giveaways only.
  /// * [paymentDate]: Point in time (Unix timestamp) when the giveaway was paid.
  const PrepaidGiveaway({
    required this.id,
    required this.winnerCount,
    required this.prize,
    required this.boostCount,
    required this.paymentDate,
  });

  /// Unique identifier of the prepaid giveaway
  final int id;

  /// Number of users who will receive giveaway prize
  final int winnerCount;

  /// Prize of the giveaway
  final GiveawayPrize prize;

  /// The number of boosts received by the chat from the giveaway; for Telegram Star giveaways only
  final int boostCount;

  /// Point in time (Unix timestamp) when the giveaway was paid
  final int paymentDate;

  /// Parse from a json
  factory PrepaidGiveaway.fromJson(Map<String, dynamic> json) =>
      PrepaidGiveaway(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        winnerCount: json['winner_count'],
        prize: GiveawayPrize.fromJson(json['prize']),
        boostCount: json['boost_count'],
        paymentDate: json['payment_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "winner_count": winnerCount,
      "prize": prize.toJson(),
      "boost_count": boostCount,
      "payment_date": paymentDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the prepaid giveaway
  /// * [winner_count]: Number of users who will receive giveaway prize
  /// * [prize]: Prize of the giveaway
  /// * [boost_count]: The number of boosts received by the chat from the giveaway; for Telegram Star giveaways only
  /// * [payment_date]: Point in time (Unix timestamp) when the giveaway was paid
  PrepaidGiveaway copyWith({
    int? id,
    int? winnerCount,
    GiveawayPrize? prize,
    int? boostCount,
    int? paymentDate,
  }) =>
      PrepaidGiveaway(
        id: id ?? this.id,
        winnerCount: winnerCount ?? this.winnerCount,
        prize: prize ?? this.prize,
        boostCount: boostCount ?? this.boostCount,
        paymentDate: paymentDate ?? this.paymentDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'prepaidGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
