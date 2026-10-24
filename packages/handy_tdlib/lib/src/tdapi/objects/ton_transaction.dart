part of '../tdapi.dart';

/// **TonTransaction** *(tonTransaction)* - basic class
///
/// Represents a transaction changing the amount of owned TON Grams.
///
/// * [id]: Unique identifier of the transaction.
/// * [gramAmount]: The amount of added owned Grams, in the smallest units of the cryptocurrency; negative for outgoing transactions.
/// * [isRefund]: True, if the transaction is a refund of a previous transaction.
/// * [date]: Point in time (Unix timestamp) when the transaction was completed.
/// * [type]: Type of the transaction.
final class TonTransaction extends TdObject {
  /// **TonTransaction** *(tonTransaction)* - basic class
  ///
  /// Represents a transaction changing the amount of owned TON Grams.
  ///
  /// * [id]: Unique identifier of the transaction.
  /// * [gramAmount]: The amount of added owned Grams, in the smallest units of the cryptocurrency; negative for outgoing transactions.
  /// * [isRefund]: True, if the transaction is a refund of a previous transaction.
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed.
  /// * [type]: Type of the transaction.
  const TonTransaction({
    required this.id,
    required this.gramAmount,
    required this.isRefund,
    required this.date,
    required this.type,
  });

  /// Unique identifier of the transaction
  final String id;

  /// The amount of added owned Grams, in the smallest units of the cryptocurrency; negative for outgoing transactions
  final int gramAmount;

  /// True, if the transaction is a refund of a previous transaction
  final bool isRefund;

  /// Point in time (Unix timestamp) when the transaction was completed
  final int date;

  /// Type of the transaction
  final TonTransactionType type;

  /// Parse from a json
  factory TonTransaction.fromJson(Map<String, dynamic> json) => TonTransaction(
        id: json['id'],
        gramAmount: json['gram_amount'],
        isRefund: json['is_refund'],
        date: json['date'],
        type: TonTransactionType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "gram_amount": gramAmount,
      "is_refund": isRefund,
      "date": date,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the transaction
  /// * [gram_amount]: The amount of added owned Grams, in the smallest units of the cryptocurrency; negative for outgoing transactions
  /// * [is_refund]: True, if the transaction is a refund of a previous transaction
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed
  /// * [type]: Type of the transaction
  TonTransaction copyWith({
    String? id,
    int? gramAmount,
    bool? isRefund,
    int? date,
    TonTransactionType? type,
  }) =>
      TonTransaction(
        id: id ?? this.id,
        gramAmount: gramAmount ?? this.gramAmount,
        isRefund: isRefund ?? this.isRefund,
        date: date ?? this.date,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
