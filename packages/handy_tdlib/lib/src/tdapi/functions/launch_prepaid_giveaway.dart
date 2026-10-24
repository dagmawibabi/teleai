part of '../tdapi.dart';

/// **LaunchPrepaidGiveaway** *(launchPrepaidGiveaway)* - TDLib function
///
/// Launches a prepaid giveaway.
///
/// * [giveawayId]: Unique identifier of the prepaid giveaway.
/// * [parameters]: Giveaway parameters.
/// * [winnerCount]: The number of users to receive giveaway prize.
/// * [starCount]: The number of Telegram Stars to be distributed through the giveaway; pass 0 for Telegram Premium giveaways.
///
/// [Ok] is returned on completion.
final class LaunchPrepaidGiveaway extends TdFunction {
  /// **LaunchPrepaidGiveaway** *(launchPrepaidGiveaway)* - TDLib function
  ///
  /// Launches a prepaid giveaway.
  ///
  /// * [giveawayId]: Unique identifier of the prepaid giveaway.
  /// * [parameters]: Giveaway parameters.
  /// * [winnerCount]: The number of users to receive giveaway prize.
  /// * [starCount]: The number of Telegram Stars to be distributed through the giveaway; pass 0 for Telegram Premium giveaways.
  ///
  /// [Ok] is returned on completion.
  const LaunchPrepaidGiveaway({
    required this.giveawayId,
    required this.parameters,
    required this.winnerCount,
    required this.starCount,
  });

  /// Unique identifier of the prepaid giveaway
  final int giveawayId;

  /// Giveaway parameters
  final GiveawayParameters parameters;

  /// The number of users to receive giveaway prize
  final int winnerCount;

  /// The number of Telegram Stars to be distributed through the giveaway; pass 0 for Telegram Premium giveaways
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "giveaway_id": giveawayId,
      "parameters": parameters.toJson(),
      "winner_count": winnerCount,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [giveaway_id]: Unique identifier of the prepaid giveaway
  /// * [parameters]: Giveaway parameters
  /// * [winner_count]: The number of users to receive giveaway prize
  /// * [star_count]: The number of Telegram Stars to be distributed through the giveaway; pass 0 for Telegram Premium giveaways
  LaunchPrepaidGiveaway copyWith({
    int? giveawayId,
    GiveawayParameters? parameters,
    int? winnerCount,
    int? starCount,
  }) =>
      LaunchPrepaidGiveaway(
        giveawayId: giveawayId ?? this.giveawayId,
        parameters: parameters ?? this.parameters,
        winnerCount: winnerCount ?? this.winnerCount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'launchPrepaidGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
