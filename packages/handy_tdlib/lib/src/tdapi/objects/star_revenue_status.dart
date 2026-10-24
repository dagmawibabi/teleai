part of '../tdapi.dart';

/// **StarRevenueStatus** *(starRevenueStatus)* - basic class
///
/// Contains information about Telegram Stars earned by a user or a chat.
///
/// * [totalAmount]: Total Telegram Star amount earned.
/// * [currentAmount]: The Telegram Star amount that isn't withdrawn yet.
/// * [availableAmount]: The Telegram Star amount that is available for withdrawal.
/// * [withdrawalEnabled]: True, if Telegram Stars can be withdrawn now or later.
/// * [nextWithdrawalIn]: Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now.
final class StarRevenueStatus extends TdObject {
  /// **StarRevenueStatus** *(starRevenueStatus)* - basic class
  ///
  /// Contains information about Telegram Stars earned by a user or a chat.
  ///
  /// * [totalAmount]: Total Telegram Star amount earned.
  /// * [currentAmount]: The Telegram Star amount that isn't withdrawn yet.
  /// * [availableAmount]: The Telegram Star amount that is available for withdrawal.
  /// * [withdrawalEnabled]: True, if Telegram Stars can be withdrawn now or later.
  /// * [nextWithdrawalIn]: Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now.
  const StarRevenueStatus({
    required this.totalAmount,
    required this.currentAmount,
    required this.availableAmount,
    required this.withdrawalEnabled,
    required this.nextWithdrawalIn,
  });

  /// Total Telegram Star amount earned
  final StarAmount totalAmount;

  /// The Telegram Star amount that isn't withdrawn yet
  final StarAmount currentAmount;

  /// The Telegram Star amount that is available for withdrawal
  final StarAmount availableAmount;

  /// True, if Telegram Stars can be withdrawn now or later
  final bool withdrawalEnabled;

  /// Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now
  final int nextWithdrawalIn;

  /// Parse from a json
  factory StarRevenueStatus.fromJson(Map<String, dynamic> json) =>
      StarRevenueStatus(
        totalAmount: StarAmount.fromJson(json['total_amount']),
        currentAmount: StarAmount.fromJson(json['current_amount']),
        availableAmount: StarAmount.fromJson(json['available_amount']),
        withdrawalEnabled: json['withdrawal_enabled'],
        nextWithdrawalIn: json['next_withdrawal_in'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_amount": totalAmount.toJson(),
      "current_amount": currentAmount.toJson(),
      "available_amount": availableAmount.toJson(),
      "withdrawal_enabled": withdrawalEnabled,
      "next_withdrawal_in": nextWithdrawalIn,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_amount]: Total Telegram Star amount earned
  /// * [current_amount]: The Telegram Star amount that isn't withdrawn yet
  /// * [available_amount]: The Telegram Star amount that is available for withdrawal
  /// * [withdrawal_enabled]: True, if Telegram Stars can be withdrawn now or later
  /// * [next_withdrawal_in]: Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now
  StarRevenueStatus copyWith({
    StarAmount? totalAmount,
    StarAmount? currentAmount,
    StarAmount? availableAmount,
    bool? withdrawalEnabled,
    int? nextWithdrawalIn,
  }) =>
      StarRevenueStatus(
        totalAmount: totalAmount ?? this.totalAmount,
        currentAmount: currentAmount ?? this.currentAmount,
        availableAmount: availableAmount ?? this.availableAmount,
        withdrawalEnabled: withdrawalEnabled ?? this.withdrawalEnabled,
        nextWithdrawalIn: nextWithdrawalIn ?? this.nextWithdrawalIn,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starRevenueStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
