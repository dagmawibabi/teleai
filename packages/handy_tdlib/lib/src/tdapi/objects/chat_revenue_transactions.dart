part of '../tdapi.dart';

/// **ChatRevenueTransactions** *(chatRevenueTransactions)* - basic class
///
/// Contains a list of chat revenue transactions.
///
/// * [gramAmount]: The amount of owned TON Grams; in the smallest units of the cryptocurrency.
/// * [transactions]: List of transactions.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class ChatRevenueTransactions extends TdObject {
  /// **ChatRevenueTransactions** *(chatRevenueTransactions)* - basic class
  ///
  /// Contains a list of chat revenue transactions.
  ///
  /// * [gramAmount]: The amount of owned TON Grams; in the smallest units of the cryptocurrency.
  /// * [transactions]: List of transactions.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const ChatRevenueTransactions({
    required this.gramAmount,
    required this.transactions,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The amount of owned TON Grams; in the smallest units of the cryptocurrency
  final int gramAmount;

  /// List of transactions
  final List<ChatRevenueTransaction> transactions;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatRevenueTransactions.fromJson(Map<String, dynamic> json) =>
      ChatRevenueTransactions(
        gramAmount: json['gram_amount'],
        transactions: List<ChatRevenueTransaction>.from(
            (json['transactions'] ?? [])
                .map((item) => ChatRevenueTransaction.fromJson(item))
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
  /// * [gram_amount]: The amount of owned TON Grams; in the smallest units of the cryptocurrency
  /// * [transactions]: List of transactions
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  ChatRevenueTransactions copyWith({
    int? gramAmount,
    List<ChatRevenueTransaction>? transactions,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      ChatRevenueTransactions(
        gramAmount: gramAmount ?? this.gramAmount,
        transactions: transactions ?? this.transactions,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueTransactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
