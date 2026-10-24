part of '../tdapi.dart';

/// **ClickPremiumSubscriptionButton** *(clickPremiumSubscriptionButton)* - TDLib function
///
/// Informs TDLib that the user clicked Premium subscription button on the Premium features screen.
///
/// [Ok] is returned on completion.
final class ClickPremiumSubscriptionButton extends TdFunction {
  /// **ClickPremiumSubscriptionButton** *(clickPremiumSubscriptionButton)* - TDLib function
  ///
  /// Informs TDLib that the user clicked Premium subscription button on the Premium features screen.
  ///
  /// [Ok] is returned on completion.
  const ClickPremiumSubscriptionButton();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ClickPremiumSubscriptionButton copyWith() =>
      const ClickPremiumSubscriptionButton();

  /// TDLib object type
  static const String defaultObjectId = 'clickPremiumSubscriptionButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
