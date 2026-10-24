part of '../tdapi.dart';

/// **EditUserStarSubscription** *(editUserStarSubscription)* - TDLib function
///
/// Cancels or re-enables Telegram Star subscription for a user; for bots only.
///
/// * [userId]: User identifier.
/// * [telegramPaymentChargeId]: Telegram payment identifier of the subscription.
/// * [isCanceled]: Pass true to cancel the subscription; pass false to allow the user to enable it.
///
/// [Ok] is returned on completion.
final class EditUserStarSubscription extends TdFunction {
  /// **EditUserStarSubscription** *(editUserStarSubscription)* - TDLib function
  ///
  /// Cancels or re-enables Telegram Star subscription for a user; for bots only.
  ///
  /// * [userId]: User identifier.
  /// * [telegramPaymentChargeId]: Telegram payment identifier of the subscription.
  /// * [isCanceled]: Pass true to cancel the subscription; pass false to allow the user to enable it.
  ///
  /// [Ok] is returned on completion.
  const EditUserStarSubscription({
    required this.userId,
    required this.telegramPaymentChargeId,
    required this.isCanceled,
  });

  /// User identifier
  final int userId;

  /// Telegram payment identifier of the subscription
  final String telegramPaymentChargeId;

  /// Pass true to cancel the subscription; pass false to allow the user to enable it
  final bool isCanceled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "telegram_payment_charge_id": telegramPaymentChargeId,
      "is_canceled": isCanceled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [telegram_payment_charge_id]: Telegram payment identifier of the subscription
  /// * [is_canceled]: Pass true to cancel the subscription; pass false to allow the user to enable it
  EditUserStarSubscription copyWith({
    int? userId,
    String? telegramPaymentChargeId,
    bool? isCanceled,
  }) =>
      EditUserStarSubscription(
        userId: userId ?? this.userId,
        telegramPaymentChargeId:
            telegramPaymentChargeId ?? this.telegramPaymentChargeId,
        isCanceled: isCanceled ?? this.isCanceled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editUserStarSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
