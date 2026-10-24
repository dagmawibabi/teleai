part of '../tdapi.dart';

/// **StarGiveawayWinnerOption** *(starGiveawayWinnerOption)* - basic class
///
/// Describes an option for the number of winners of a Telegram Star giveaway.
///
/// * [winnerCount]: The number of users that will be chosen as winners.
/// * [wonStarCount]: The number of Telegram Stars that will be won by the winners of the giveaway.
/// * [isDefault]: True, if the option must be chosen by default.
final class StarGiveawayWinnerOption extends TdObject {
  /// **StarGiveawayWinnerOption** *(starGiveawayWinnerOption)* - basic class
  ///
  /// Describes an option for the number of winners of a Telegram Star giveaway.
  ///
  /// * [winnerCount]: The number of users that will be chosen as winners.
  /// * [wonStarCount]: The number of Telegram Stars that will be won by the winners of the giveaway.
  /// * [isDefault]: True, if the option must be chosen by default.
  const StarGiveawayWinnerOption({
    required this.winnerCount,
    required this.wonStarCount,
    required this.isDefault,
  });

  /// The number of users that will be chosen as winners
  final int winnerCount;

  /// The number of Telegram Stars that will be won by the winners of the giveaway
  final int wonStarCount;

  /// True, if the option must be chosen by default
  final bool isDefault;

  /// Parse from a json
  factory StarGiveawayWinnerOption.fromJson(Map<String, dynamic> json) =>
      StarGiveawayWinnerOption(
        winnerCount: json['winner_count'],
        wonStarCount: json['won_star_count'],
        isDefault: json['is_default'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "winner_count": winnerCount,
      "won_star_count": wonStarCount,
      "is_default": isDefault,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [winner_count]: The number of users that will be chosen as winners
  /// * [won_star_count]: The number of Telegram Stars that will be won by the winners of the giveaway
  /// * [is_default]: True, if the option must be chosen by default
  StarGiveawayWinnerOption copyWith({
    int? winnerCount,
    int? wonStarCount,
    bool? isDefault,
  }) =>
      StarGiveawayWinnerOption(
        winnerCount: winnerCount ?? this.winnerCount,
        wonStarCount: wonStarCount ?? this.wonStarCount,
        isDefault: isDefault ?? this.isDefault,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starGiveawayWinnerOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
