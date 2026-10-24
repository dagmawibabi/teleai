part of '../tdapi.dart';

/// **PremiumFeaturePromotionAnimation** *(premiumFeaturePromotionAnimation)* - basic class
///
/// Describes a promotion animation for a Premium feature.
///
/// * [feature]: Premium feature.
/// * [animation]: Promotion animation for the feature.
final class PremiumFeaturePromotionAnimation extends TdObject {
  /// **PremiumFeaturePromotionAnimation** *(premiumFeaturePromotionAnimation)* - basic class
  ///
  /// Describes a promotion animation for a Premium feature.
  ///
  /// * [feature]: Premium feature.
  /// * [animation]: Promotion animation for the feature.
  const PremiumFeaturePromotionAnimation({
    required this.feature,
    required this.animation,
  });

  /// Premium feature
  final PremiumFeature feature;

  /// Promotion animation for the feature
  final Animation animation;

  /// Parse from a json
  factory PremiumFeaturePromotionAnimation.fromJson(
          Map<String, dynamic> json) =>
      PremiumFeaturePromotionAnimation(
        feature: PremiumFeature.fromJson(json['feature']),
        animation: Animation.fromJson(json['animation']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "feature": feature.toJson(),
      "animation": animation.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [feature]: Premium feature
  /// * [animation]: Promotion animation for the feature
  PremiumFeaturePromotionAnimation copyWith({
    PremiumFeature? feature,
    Animation? animation,
  }) =>
      PremiumFeaturePromotionAnimation(
        feature: feature ?? this.feature,
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumFeaturePromotionAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
