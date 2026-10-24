part of '../tdapi.dart';

/// **ChatRevenueTransaction** *(chatRevenueTransaction)* - basic class
///
/// Contains a chat revenue transaction.
///
/// * [cryptocurrency]: Cryptocurrency in which revenue is calculated.
/// * [cryptocurrencyAmount]: The withdrawn amount, in the smallest units of the cryptocurrency.
/// * [type]: Type of the transaction.
final class ChatRevenueTransaction extends TdObject {
  /// **ChatRevenueTransaction** *(chatRevenueTransaction)* - basic class
  ///
  /// Contains a chat revenue transaction.
  ///
  /// * [cryptocurrency]: Cryptocurrency in which revenue is calculated.
  /// * [cryptocurrencyAmount]: The withdrawn amount, in the smallest units of the cryptocurrency.
  /// * [type]: Type of the transaction.
  const ChatRevenueTransaction({
    required this.cryptocurrency,
    required this.cryptocurrencyAmount,
    required this.type,
  });

  /// Cryptocurrency in which revenue is calculated
  final String cryptocurrency;

  /// The withdrawn amount, in the smallest units of the cryptocurrency
  final int cryptocurrencyAmount;

  /// Type of the transaction
  final ChatRevenueTransactionType type;

  /// Parse from a json
  factory ChatRevenueTransaction.fromJson(Map<String, dynamic> json) =>
      ChatRevenueTransaction(
        cryptocurrency: json['cryptocurrency'],
        cryptocurrencyAmount: json['cryptocurrency_amount'] is int
            ? json['cryptocurrency_amount']
            : int.parse(json['cryptocurrency_amount']),
        type: ChatRevenueTransactionType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "cryptocurrency": cryptocurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [cryptocurrency]: Cryptocurrency in which revenue is calculated
  /// * [cryptocurrency_amount]: The withdrawn amount, in the smallest units of the cryptocurrency
  /// * [type]: Type of the transaction
  ChatRevenueTransaction copyWith({
    String? cryptocurrency,
    int? cryptocurrencyAmount,
    ChatRevenueTransactionType? type,
  }) =>
      ChatRevenueTransaction(
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
