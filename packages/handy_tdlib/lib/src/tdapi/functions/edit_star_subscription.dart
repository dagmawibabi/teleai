part of '../tdapi.dart';

/// **EditStarSubscription** *(editStarSubscription)* - TDLib function
///
/// Cancels or re-enables Telegram Star subscription.
///
/// * [subscriptionId]: Identifier of the subscription to change.
/// * [isCanceled]: New value of is_canceled.
///
/// [Ok] is returned on completion.
final class EditStarSubscription extends TdFunction {
  /// **EditStarSubscription** *(editStarSubscription)* - TDLib function
  ///
  /// Cancels or re-enables Telegram Star subscription.
  ///
  /// * [subscriptionId]: Identifier of the subscription to change.
  /// * [isCanceled]: New value of is_canceled.
  ///
  /// [Ok] is returned on completion.
  const EditStarSubscription({
    required this.subscriptionId,
    required this.isCanceled,
  });

  /// Identifier of the subscription to change
  final String subscriptionId;

  /// New value of is_canceled
  final bool isCanceled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "subscription_id": subscriptionId,
      "is_canceled": isCanceled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subscription_id]: Identifier of the subscription to change
  /// * [is_canceled]: New value of is_canceled
  EditStarSubscription copyWith({
    String? subscriptionId,
    bool? isCanceled,
  }) =>
      EditStarSubscription(
        subscriptionId: subscriptionId ?? this.subscriptionId,
        isCanceled: isCanceled ?? this.isCanceled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editStarSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
