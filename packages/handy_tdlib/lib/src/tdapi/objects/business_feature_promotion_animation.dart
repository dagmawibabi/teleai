part of '../tdapi.dart';

/// **BusinessFeaturePromotionAnimation** *(businessFeaturePromotionAnimation)* - basic class
///
/// Describes a promotion animation for a Business feature.
///
/// * [feature]: Business feature.
/// * [animation]: Promotion animation for the feature.
final class BusinessFeaturePromotionAnimation extends TdObject {
  /// **BusinessFeaturePromotionAnimation** *(businessFeaturePromotionAnimation)* - basic class
  ///
  /// Describes a promotion animation for a Business feature.
  ///
  /// * [feature]: Business feature.
  /// * [animation]: Promotion animation for the feature.
  const BusinessFeaturePromotionAnimation({
    required this.feature,
    required this.animation,
  });

  /// Business feature
  final BusinessFeature feature;

  /// Promotion animation for the feature
  final Animation animation;

  /// Parse from a json
  factory BusinessFeaturePromotionAnimation.fromJson(
          Map<String, dynamic> json) =>
      BusinessFeaturePromotionAnimation(
        feature: BusinessFeature.fromJson(json['feature']),
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
  /// * [feature]: Business feature
  /// * [animation]: Promotion animation for the feature
  BusinessFeaturePromotionAnimation copyWith({
    BusinessFeature? feature,
    Animation? animation,
  }) =>
      BusinessFeaturePromotionAnimation(
        feature: feature ?? this.feature,
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessFeaturePromotionAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
