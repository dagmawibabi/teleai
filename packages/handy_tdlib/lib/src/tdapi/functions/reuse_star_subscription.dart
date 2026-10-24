part of '../tdapi.dart';

/// **ReuseStarSubscription** *(reuseStarSubscription)* - TDLib function
///
/// Reuses an active Telegram Star subscription to a channel chat and joins the chat again.
///
/// * [subscriptionId]: Identifier of the subscription.
///
/// [Ok] is returned on completion.
final class ReuseStarSubscription extends TdFunction {
  /// **ReuseStarSubscription** *(reuseStarSubscription)* - TDLib function
  ///
  /// Reuses an active Telegram Star subscription to a channel chat and joins the chat again.
  ///
  /// * [subscriptionId]: Identifier of the subscription.
  ///
  /// [Ok] is returned on completion.
  const ReuseStarSubscription({
    required this.subscriptionId,
  });

  /// Identifier of the subscription
  final String subscriptionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "subscription_id": subscriptionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subscription_id]: Identifier of the subscription
  ReuseStarSubscription copyWith({
    String? subscriptionId,
  }) =>
      ReuseStarSubscription(
        subscriptionId: subscriptionId ?? this.subscriptionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reuseStarSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
