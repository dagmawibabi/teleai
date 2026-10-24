part of '../tdapi.dart';

/// **GetUpgradedGiftsPromotionalAnimation** *(getUpgradedGiftsPromotionalAnimation)* - TDLib function
///
/// Returns promotional animation for upgraded gifts.
///
/// [Animation] is returned on completion.
final class GetUpgradedGiftsPromotionalAnimation extends TdFunction {
  /// **GetUpgradedGiftsPromotionalAnimation** *(getUpgradedGiftsPromotionalAnimation)* - TDLib function
  ///
  /// Returns promotional animation for upgraded gifts.
  ///
  /// [Animation] is returned on completion.
  const GetUpgradedGiftsPromotionalAnimation();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetUpgradedGiftsPromotionalAnimation copyWith() =>
      const GetUpgradedGiftsPromotionalAnimation();

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftsPromotionalAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
