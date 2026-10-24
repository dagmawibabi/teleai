part of '../tdapi.dart';

/// **RefundStarPayment** *(refundStarPayment)* - TDLib function
///
/// Refunds a previously done payment in Telegram Stars; for bots only.
///
/// * [userId]: Identifier of the user who did the payment.
/// * [telegramPaymentChargeId]: Telegram payment identifier.
///
/// [Ok] is returned on completion.
final class RefundStarPayment extends TdFunction {
  /// **RefundStarPayment** *(refundStarPayment)* - TDLib function
  ///
  /// Refunds a previously done payment in Telegram Stars; for bots only.
  ///
  /// * [userId]: Identifier of the user who did the payment.
  /// * [telegramPaymentChargeId]: Telegram payment identifier.
  ///
  /// [Ok] is returned on completion.
  const RefundStarPayment({
    required this.userId,
    required this.telegramPaymentChargeId,
  });

  /// Identifier of the user who did the payment
  final int userId;

  /// Telegram payment identifier
  final String telegramPaymentChargeId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "telegram_payment_charge_id": telegramPaymentChargeId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who did the payment
  /// * [telegram_payment_charge_id]: Telegram payment identifier
  RefundStarPayment copyWith({
    int? userId,
    String? telegramPaymentChargeId,
  }) =>
      RefundStarPayment(
        userId: userId ?? this.userId,
        telegramPaymentChargeId:
            telegramPaymentChargeId ?? this.telegramPaymentChargeId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'refundStarPayment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
