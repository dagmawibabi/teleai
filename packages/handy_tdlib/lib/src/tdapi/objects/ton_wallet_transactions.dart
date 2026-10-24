part of '../tdapi.dart';

/// **TonWalletTransactions** *(tonWalletTransactions)* - basic class
///
/// Represents a list of TON Gram transactions.
///
/// * [gramAmount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency.
/// * [transactions]: List of transactions.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class TonWalletTransactions extends TdObject {
  /// **TonWalletTransactions** *(tonWalletTransactions)* - basic class
  ///
  /// Represents a list of TON Gram transactions.
  ///
  /// * [gramAmount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency.
  /// * [transactions]: List of transactions.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const TonWalletTransactions({
    required this.gramAmount,
    required this.transactions,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total amount of owned TON Grams, in the smallest units of the cryptocurrency
  final int gramAmount;

  /// List of transactions
  final List<TonWalletTransaction> transactions;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletTransactions.fromJson(Map<String, dynamic> json) =>
      TonWalletTransactions(
        gramAmount: json['gram_amount'],
        transactions: List<TonWalletTransaction>.from(
            (json['transactions'] ?? [])
                .map((item) => TonWalletTransaction.fromJson(item))
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
  /// * [gram_amount]: The total amount of owned TON Grams, in the smallest units of the cryptocurrency
  /// * [transactions]: List of transactions
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  TonWalletTransactions copyWith({
    int? gramAmount,
    List<TonWalletTransaction>? transactions,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletTransactions(
        gramAmount: gramAmount ?? this.gramAmount,
        transactions: transactions ?? this.transactions,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
