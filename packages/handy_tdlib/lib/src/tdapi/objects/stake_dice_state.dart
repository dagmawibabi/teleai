part of '../tdapi.dart';

/// **StakeDiceState** *(stakeDiceState)* - basic class
///
/// Describes state of the stake dice.
///
/// * [stateHash]: Hash of the state to use for sending the next dice; may be empty if the stake dice can't be sent by the current user.
/// * [stakeGramAmount]: The amount of TON Grams staked in the previous roll; in the smallest units of the currency.
/// * [suggestedStakeGramAmounts]: The amounts of Grams that are suggested to be staked; in the smallest units of the currency.
/// * [currentStreak]: The number of rolled sixes towards the streak; 0-2.
/// * [prizePerMille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 1-6 correspondingly; may be empty if the stake dice can't be sent by the current user.
/// * [streakPrizePerMille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 6 three times in a row with the same stake.
final class StakeDiceState extends TdObject {
  /// **StakeDiceState** *(stakeDiceState)* - basic class
  ///
  /// Describes state of the stake dice.
  ///
  /// * [stateHash]: Hash of the state to use for sending the next dice; may be empty if the stake dice can't be sent by the current user.
  /// * [stakeGramAmount]: The amount of TON Grams staked in the previous roll; in the smallest units of the currency.
  /// * [suggestedStakeGramAmounts]: The amounts of Grams that are suggested to be staked; in the smallest units of the currency.
  /// * [currentStreak]: The number of rolled sixes towards the streak; 0-2.
  /// * [prizePerMille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 1-6 correspondingly; may be empty if the stake dice can't be sent by the current user.
  /// * [streakPrizePerMille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 6 three times in a row with the same stake.
  const StakeDiceState({
    required this.stateHash,
    required this.stakeGramAmount,
    required this.suggestedStakeGramAmounts,
    required this.currentStreak,
    required this.prizePerMille,
    required this.streakPrizePerMille,
    this.extra,
    this.clientId,
  });

  /// Hash of the state to use for sending the next dice; may be empty if the stake dice can't be sent by the current user
  final String stateHash;

  /// The amount of TON Grams staked in the previous roll; in the smallest units of the currency
  final int stakeGramAmount;

  /// The amounts of Grams that are suggested to be staked; in the smallest units of the currency
  final List<int> suggestedStakeGramAmounts;

  /// The number of rolled sixes towards the streak; 0-2
  final int currentStreak;

  /// The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 1-6 correspondingly; may be empty if the stake dice can't be sent by the current user
  final List<int> prizePerMille;

  /// The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 6 three times in a row with the same stake
  final int streakPrizePerMille;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StakeDiceState.fromJson(Map<String, dynamic> json) => StakeDiceState(
        stateHash: json['state_hash'],
        stakeGramAmount: json['stake_gram_amount'],
        suggestedStakeGramAmounts: List<int>.from(
            (json['suggested_stake_gram_amounts'] ?? [])
                .map((item) => item)
                .toList()),
        currentStreak: json['current_streak'],
        prizePerMille: List<int>.from(
            (json['prize_per_mille'] ?? []).map((item) => item).toList()),
        streakPrizePerMille: json['streak_prize_per_mille'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state_hash": stateHash,
      "stake_gram_amount": stakeGramAmount,
      "suggested_stake_gram_amounts":
          suggestedStakeGramAmounts.map((i) => i).toList(),
      "current_streak": currentStreak,
      "prize_per_mille": prizePerMille.map((i) => i).toList(),
      "streak_prize_per_mille": streakPrizePerMille,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state_hash]: Hash of the state to use for sending the next dice; may be empty if the stake dice can't be sent by the current user
  /// * [stake_gram_amount]: The amount of TON Grams staked in the previous roll; in the smallest units of the currency
  /// * [suggested_stake_gram_amounts]: The amounts of Grams that are suggested to be staked; in the smallest units of the currency
  /// * [current_streak]: The number of rolled sixes towards the streak; 0-2
  /// * [prize_per_mille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 1-6 correspondingly; may be empty if the stake dice can't be sent by the current user
  /// * [streak_prize_per_mille]: The number of Grams received by the user for each 1000 Grams staked if the dice outcome is 6 three times in a row with the same stake
  StakeDiceState copyWith({
    String? stateHash,
    int? stakeGramAmount,
    List<int>? suggestedStakeGramAmounts,
    int? currentStreak,
    List<int>? prizePerMille,
    int? streakPrizePerMille,
    dynamic extra,
    int? clientId,
  }) =>
      StakeDiceState(
        stateHash: stateHash ?? this.stateHash,
        stakeGramAmount: stakeGramAmount ?? this.stakeGramAmount,
        suggestedStakeGramAmounts:
            suggestedStakeGramAmounts ?? this.suggestedStakeGramAmounts,
        currentStreak: currentStreak ?? this.currentStreak,
        prizePerMille: prizePerMille ?? this.prizePerMille,
        streakPrizePerMille: streakPrizePerMille ?? this.streakPrizePerMille,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stakeDiceState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
