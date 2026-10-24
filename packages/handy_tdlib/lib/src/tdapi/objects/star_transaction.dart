part of '../tdapi.dart';

/// **StarTransaction** *(starTransaction)* - basic class
///
/// Represents a transaction changing the amount of owned Telegram Stars.
///
/// * [id]: Unique identifier of the transaction.
/// * [starAmount]: The amount of added owned Telegram Stars; negative for outgoing transactions.
/// * [isRefund]: True, if the transaction is a refund of a previous transaction.
/// * [date]: Point in time (Unix timestamp) when the transaction was completed.
/// * [type]: Type of the transaction.
final class StarTransaction extends TdObject {
  /// **StarTransaction** *(starTransaction)* - basic class
  ///
  /// Represents a transaction changing the amount of owned Telegram Stars.
  ///
  /// * [id]: Unique identifier of the transaction.
  /// * [starAmount]: The amount of added owned Telegram Stars; negative for outgoing transactions.
  /// * [isRefund]: True, if the transaction is a refund of a previous transaction.
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed.
  /// * [type]: Type of the transaction.
  const StarTransaction({
    required this.id,
    required this.starAmount,
    required this.isRefund,
    required this.date,
    required this.type,
  });

  /// Unique identifier of the transaction
  final String id;

  /// The amount of added owned Telegram Stars; negative for outgoing transactions
  final StarAmount starAmount;

  /// True, if the transaction is a refund of a previous transaction
  final bool isRefund;

  /// Point in time (Unix timestamp) when the transaction was completed
  final int date;

  /// Type of the transaction
  final StarTransactionType type;

  /// Parse from a json
  factory StarTransaction.fromJson(Map<String, dynamic> json) =>
      StarTransaction(
        id: json['id'],
        starAmount: StarAmount.fromJson(json['star_amount']),
        isRefund: json['is_refund'],
        date: json['date'],
        type: StarTransactionType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "star_amount": starAmount.toJson(),
      "is_refund": isRefund,
      "date": date,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the transaction
  /// * [star_amount]: The amount of added owned Telegram Stars; negative for outgoing transactions
  /// * [is_refund]: True, if the transaction is a refund of a previous transaction
  /// * [date]: Point in time (Unix timestamp) when the transaction was completed
  /// * [type]: Type of the transaction
  StarTransaction copyWith({
    String? id,
    StarAmount? starAmount,
    bool? isRefund,
    int? date,
    StarTransactionType? type,
  }) =>
      StarTransaction(
        id: id ?? this.id,
        starAmount: starAmount ?? this.starAmount,
        isRefund: isRefund ?? this.isRefund,
        date: date ?? this.date,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
