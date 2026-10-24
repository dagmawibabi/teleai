part of '../tdapi.dart';

/// **StarTransactions** *(starTransactions)* - basic class
///
/// Represents a list of Telegram Star transactions.
///
/// * [starAmount]: The amount of owned Telegram Stars.
/// * [transactions]: List of transactions with Telegram Stars.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class StarTransactions extends TdObject {
  /// **StarTransactions** *(starTransactions)* - basic class
  ///
  /// Represents a list of Telegram Star transactions.
  ///
  /// * [starAmount]: The amount of owned Telegram Stars.
  /// * [transactions]: List of transactions with Telegram Stars.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const StarTransactions({
    required this.starAmount,
    required this.transactions,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The amount of owned Telegram Stars
  final StarAmount starAmount;

  /// List of transactions with Telegram Stars
  final List<StarTransaction> transactions;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarTransactions.fromJson(Map<String, dynamic> json) =>
      StarTransactions(
        starAmount: StarAmount.fromJson(json['star_amount']),
        transactions: List<StarTransaction>.from((json['transactions'] ?? [])
            .map((item) => StarTransaction.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_amount": starAmount.toJson(),
      "transactions": transactions.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_amount]: The amount of owned Telegram Stars
  /// * [transactions]: List of transactions with Telegram Stars
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  StarTransactions copyWith({
    StarAmount? starAmount,
    List<StarTransaction>? transactions,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      StarTransactions(
        starAmount: starAmount ?? this.starAmount,
        transactions: transactions ?? this.transactions,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
