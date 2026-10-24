part of '../tdapi.dart';

/// **ViewPremiumFeature** *(viewPremiumFeature)* - TDLib function
///
/// Informs TDLib that the user viewed detailed information about a Premium feature on the Premium features screen.
///
/// * [feature]: The viewed premium feature.
///
/// [Ok] is returned on completion.
final class ViewPremiumFeature extends TdFunction {
  /// **ViewPremiumFeature** *(viewPremiumFeature)* - TDLib function
  ///
  /// Informs TDLib that the user viewed detailed information about a Premium feature on the Premium features screen.
  ///
  /// * [feature]: The viewed premium feature.
  ///
  /// [Ok] is returned on completion.
  const ViewPremiumFeature({
    required this.feature,
  });

  /// The viewed premium feature
  final PremiumFeature feature;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "feature": feature.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [feature]: The viewed premium feature
  ViewPremiumFeature copyWith({
    PremiumFeature? feature,
  }) =>
      ViewPremiumFeature(
        feature: feature ?? this.feature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'viewPremiumFeature';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
