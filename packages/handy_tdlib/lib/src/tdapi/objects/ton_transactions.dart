part of '../tdapi.dart';

/// **TonTransactions** *(tonTransactions)* - basic class
///
/// Represents a list of TON Gram transactions.
///
/// * [gramAmount]: The total amount of owned Grams, in the smallest units of the cryptocurrency.
/// * [transactions]: List of Gram transactions.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class TonTransactions extends TdObject {
  /// **TonTransactions** *(tonTransactions)* - basic class
  ///
  /// Represents a list of TON Gram transactions.
  ///
  /// * [gramAmount]: The total amount of owned Grams, in the smallest units of the cryptocurrency.
  /// * [transactions]: List of Gram transactions.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const TonTransactions({
    required this.gramAmount,
    required this.transactions,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total amount of owned Grams, in the smallest units of the cryptocurrency
  final int gramAmount;

  /// List of Gram transactions
  final List<TonTransaction> transactions;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonTransactions.fromJson(Map<String, dynamic> json) =>
      TonTransactions(
        gramAmount: json['gram_amount'],
        transactions: List<TonTransaction>.from((json['transactions'] ?? [])
            .map((item) => TonTransaction.fromJson(item))
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
      "gram_amount": gramAmount,
      "transactions": transactions.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gram_amount]: The total amount of owned Grams, in the smallest units of the cryptocurrency
  /// * [transactions]: List of Gram transactions
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  TonTransactions copyWith({
    int? gramAmount,
    List<TonTransaction>? transactions,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      TonTransactions(
        gramAmount: gramAmount ?? this.gramAmount,
        transactions: transactions ?? this.transactions,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
