part of '../tdapi.dart';

/// **SetAuthenticationPremiumPurchaseTransaction** *(setAuthenticationPremiumPurchaseTransaction)* - TDLib function
///
/// Informs server about an in-store purchase of Telegram Premium before authorization. Works only when the current authorization state is authorizationStateWaitPremiumPurchase.
///
/// * [transaction]: Information about the transaction.
/// * [isRestore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store.
/// * [premiumDayCount]: The number of days for which the Telegram Premium subscription will be granted.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
///
/// [Ok] is returned on completion.
final class SetAuthenticationPremiumPurchaseTransaction extends TdFunction {
  /// **SetAuthenticationPremiumPurchaseTransaction** *(setAuthenticationPremiumPurchaseTransaction)* - TDLib function
  ///
  /// Informs server about an in-store purchase of Telegram Premium before authorization. Works only when the current authorization state is authorizationStateWaitPremiumPurchase.
  ///
  /// * [transaction]: Information about the transaction.
  /// * [isRestore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store.
  /// * [premiumDayCount]: The number of days for which the Telegram Premium subscription will be granted.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  ///
  /// [Ok] is returned on completion.
  const SetAuthenticationPremiumPurchaseTransaction({
    required this.transaction,
    required this.isRestore,
    required this.premiumDayCount,
    required this.currency,
    required this.amount,
  });

  /// Information about the transaction
  final StoreTransaction transaction;

  /// Pass true if this is a restore of a Telegram Premium purchase; only for App Store
  final bool isRestore;

  /// The number of days for which the Telegram Premium subscription will be granted
  final int premiumDayCount;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "transaction": transaction.toJson(),
      "is_restore": isRestore,
      "premium_day_count": premiumDayCount,
      "currency": currency,
      "amount": amount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [transaction]: Information about the transaction
  /// * [is_restore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store
  /// * [premium_day_count]: The number of days for which the Telegram Premium subscription will be granted
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  SetAuthenticationPremiumPurchaseTransaction copyWith({
    StoreTransaction? transaction,
    bool? isRestore,
    int? premiumDayCount,
    String? currency,
    int? amount,
  }) =>
      SetAuthenticationPremiumPurchaseTransaction(
        transaction: transaction ?? this.transaction,
        isRestore: isRestore ?? this.isRestore,
        premiumDayCount: premiumDayCount ?? this.premiumDayCount,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'setAuthenticationPremiumPurchaseTransaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
