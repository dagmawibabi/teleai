part of '../tdapi.dart';

/// **GramRevenueStatus** *(gramRevenueStatus)* - basic class
///
/// Contains information about TON Grams earned by the current user.
///
/// * [totalAmount]: Total Gram amount earned; in the smallest units of the cryptocurrency.
/// * [balanceAmount]: The Gram amount that isn't withdrawn yet; in the smallest units of the cryptocurrency.
/// * [availableAmount]: The Gram amount that is available for withdrawal; in the smallest units of the cryptocurrency.
/// * [withdrawalEnabled]: True, if Grams can be withdrawn.
final class GramRevenueStatus extends TdObject {
  /// **GramRevenueStatus** *(gramRevenueStatus)* - basic class
  ///
  /// Contains information about TON Grams earned by the current user.
  ///
  /// * [totalAmount]: Total Gram amount earned; in the smallest units of the cryptocurrency.
  /// * [balanceAmount]: The Gram amount that isn't withdrawn yet; in the smallest units of the cryptocurrency.
  /// * [availableAmount]: The Gram amount that is available for withdrawal; in the smallest units of the cryptocurrency.
  /// * [withdrawalEnabled]: True, if Grams can be withdrawn.
  const GramRevenueStatus({
    required this.totalAmount,
    required this.balanceAmount,
    required this.availableAmount,
    required this.withdrawalEnabled,
  });

  /// Total Gram amount earned; in the smallest units of the cryptocurrency
  final int totalAmount;

  /// The Gram amount that isn't withdrawn yet; in the smallest units of the cryptocurrency
  final int balanceAmount;

  /// The Gram amount that is available for withdrawal; in the smallest units of the cryptocurrency
  final int availableAmount;

  /// True, if Grams can be withdrawn
  final bool withdrawalEnabled;

  /// Parse from a json
  factory GramRevenueStatus.fromJson(Map<String, dynamic> json) =>
      GramRevenueStatus(
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
      "total_amount": totalAmount,
      "balance_amount": balanceAmount,
      "available_amount": availableAmount,
      "withdrawal_enabled": withdrawalEnabled,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_amount]: Total Gram amount earned; in the smallest units of the cryptocurrency
  /// * [balance_amount]: The Gram amount that isn't withdrawn yet; in the smallest units of the cryptocurrency
  /// * [available_amount]: The Gram amount that is available for withdrawal; in the smallest units of the cryptocurrency
  /// * [withdrawal_enabled]: True, if Grams can be withdrawn
  GramRevenueStatus copyWith({
    int? totalAmount,
    int? balanceAmount,
    int? availableAmount,
    bool? withdrawalEnabled,
  }) =>
      GramRevenueStatus(
        totalAmount: totalAmount ?? this.totalAmount,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        availableAmount: availableAmount ?? this.availableAmount,
        withdrawalEnabled: withdrawalEnabled ?? this.withdrawalEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'gramRevenueStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
