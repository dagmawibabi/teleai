part of '../tdapi.dart';

/// **PremiumStatePaymentOption** *(premiumStatePaymentOption)* - basic class
///
/// Describes an option for buying or upgrading Telegram Premium for self.
///
/// * [paymentOption]: Information about the payment option.
/// * [isCurrent]: True, if this is the currently used Telegram Premium subscription option.
/// * [isUpgrade]: True, if the payment option can be used to upgrade the existing Telegram Premium subscription.
/// * [lastTransactionId]: Identifier of the last in-store transaction for the currently used option.
final class PremiumStatePaymentOption extends TdObject {
  /// **PremiumStatePaymentOption** *(premiumStatePaymentOption)* - basic class
  ///
  /// Describes an option for buying or upgrading Telegram Premium for self.
  ///
  /// * [paymentOption]: Information about the payment option.
  /// * [isCurrent]: True, if this is the currently used Telegram Premium subscription option.
  /// * [isUpgrade]: True, if the payment option can be used to upgrade the existing Telegram Premium subscription.
  /// * [lastTransactionId]: Identifier of the last in-store transaction for the currently used option.
  const PremiumStatePaymentOption({
    required this.paymentOption,
    required this.isCurrent,
    required this.isUpgrade,
    required this.lastTransactionId,
  });

  /// Information about the payment option
  final PremiumPaymentOption paymentOption;

  /// True, if this is the currently used Telegram Premium subscription option
  final bool isCurrent;

  /// True, if the payment option can be used to upgrade the existing Telegram Premium subscription
  final bool isUpgrade;

  /// Identifier of the last in-store transaction for the currently used option
  final String lastTransactionId;

  /// Parse from a json
  factory PremiumStatePaymentOption.fromJson(Map<String, dynamic> json) =>
      PremiumStatePaymentOption(
        paymentOption: PremiumPaymentOption.fromJson(json['payment_option']),
        isCurrent: json['is_current'],
        isUpgrade: json['is_upgrade'],
        lastTransactionId: json['last_transaction_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payment_option": paymentOption.toJson(),
      "is_current": isCurrent,
      "is_upgrade": isUpgrade,
      "last_transaction_id": lastTransactionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payment_option]: Information about the payment option
  /// * [is_current]: True, if this is the currently used Telegram Premium subscription option
  /// * [is_upgrade]: True, if the payment option can be used to upgrade the existing Telegram Premium subscription
  /// * [last_transaction_id]: Identifier of the last in-store transaction for the currently used option
  PremiumStatePaymentOption copyWith({
    PremiumPaymentOption? paymentOption,
    bool? isCurrent,
    bool? isUpgrade,
    String? lastTransactionId,
  }) =>
      PremiumStatePaymentOption(
        paymentOption: paymentOption ?? this.paymentOption,
        isCurrent: isCurrent ?? this.isCurrent,
        isUpgrade: isUpgrade ?? this.isUpgrade,
        lastTransactionId: lastTransactionId ?? this.lastTransactionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumStatePaymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
