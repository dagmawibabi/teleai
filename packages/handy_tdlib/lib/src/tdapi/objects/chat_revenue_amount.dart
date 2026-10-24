part of '../tdapi.dart';

/// **ChatRevenueAmount** *(chatRevenueAmount)* - basic class
///
/// Contains information about revenue earned from sponsored messages in a chat.
///
/// * [cryptocurrency]: Cryptocurrency in which revenue is calculated.
/// * [totalAmount]: Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency.
/// * [balanceAmount]: Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency.
/// * [availableAmount]: Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency.
/// * [withdrawalEnabled]: True, if the cryptocurrency can be withdrawn now or later.
final class ChatRevenueAmount extends TdObject {
  /// **ChatRevenueAmount** *(chatRevenueAmount)* - basic class
  ///
  /// Contains information about revenue earned from sponsored messages in a chat.
  ///
  /// * [cryptocurrency]: Cryptocurrency in which revenue is calculated.
  /// * [totalAmount]: Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency.
  /// * [balanceAmount]: Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency.
  /// * [availableAmount]: Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency.
  /// * [withdrawalEnabled]: True, if the cryptocurrency can be withdrawn now or later.
  const ChatRevenueAmount({
    required this.cryptocurrency,
    required this.totalAmount,
    required this.balanceAmount,
    required this.availableAmount,
    required this.withdrawalEnabled,
  });

  /// Cryptocurrency in which revenue is calculated
  final String cryptocurrency;

  /// Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency
  final int totalAmount;

  /// Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency
  final int balanceAmount;

  /// Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency
  final int availableAmount;

  /// True, if the cryptocurrency can be withdrawn now or later
  final bool withdrawalEnabled;

  /// Parse from a json
  factory ChatRevenueAmount.fromJson(Map<String, dynamic> json) =>
      ChatRevenueAmount(
        cryptocurrency: json['cryptocurrency'],
        totalAmount: json['total_amount'] is int
            ? json['total_amount']
            : int.parse(json['total_amount']),
        balanceAmount: json['balance_amount'] is int
            ? json['balance_amount']
            : int.parse(json['balance_amount']),
        availableAmount: json['available_amount'] is int
            ? json['available_amount']
            : int.parse(json['available_amount']),
        withdrawalEnabled: json['withdrawal_enabled'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "cryptocurrency": cryptocurrency,
      "total_amount": totalAmount,
      "balance_amount": balanceAmount,
      "available_amount": availableAmount,
      "withdrawal_enabled": withdrawalEnabled,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [cryptocurrency]: Cryptocurrency in which revenue is calculated
  /// * [total_amount]: Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency
  /// * [balance_amount]: Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency
  /// * [available_amount]: Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency
  /// * [withdrawal_enabled]: True, if the cryptocurrency can be withdrawn now or later
  ChatRevenueAmount copyWith({
    String? cryptocurrency,
    int? totalAmount,
    int? balanceAmount,
    int? availableAmount,
    bool? withdrawalEnabled,
  }) =>
      ChatRevenueAmount(
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        totalAmount: totalAmount ?? this.totalAmount,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        availableAmount: availableAmount ?? this.availableAmount,
        withdrawalEnabled: withdrawalEnabled ?? this.withdrawalEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatRevenueAmount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
