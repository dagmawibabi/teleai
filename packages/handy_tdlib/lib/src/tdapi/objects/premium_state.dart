part of '../tdapi.dart';

/// **PremiumState** *(premiumState)* - basic class
///
/// Contains state of Telegram Premium subscription and promotion videos for Premium features.
///
/// * [state]: Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription.
/// * [paymentOptions]: The list of available options for buying Telegram Premium.
/// * [animations]: The list of available promotion animations for Premium features.
/// * [businessAnimations]: The list of available promotion animations for Business features.
final class PremiumState extends TdObject {
  /// **PremiumState** *(premiumState)* - basic class
  ///
  /// Contains state of Telegram Premium subscription and promotion videos for Premium features.
  ///
  /// * [state]: Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription.
  /// * [paymentOptions]: The list of available options for buying Telegram Premium.
  /// * [animations]: The list of available promotion animations for Premium features.
  /// * [businessAnimations]: The list of available promotion animations for Business features.
  const PremiumState({
    required this.state,
    required this.paymentOptions,
    required this.animations,
    required this.businessAnimations,
    this.extra,
    this.clientId,
  });

  /// Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
  final FormattedText state;

  /// The list of available options for buying Telegram Premium
  final List<PremiumStatePaymentOption> paymentOptions;

  /// The list of available promotion animations for Premium features
  final List<PremiumFeaturePromotionAnimation> animations;

  /// The list of available promotion animations for Business features
  final List<BusinessFeaturePromotionAnimation> businessAnimations;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PremiumState.fromJson(Map<String, dynamic> json) => PremiumState(
        state: FormattedText.fromJson(json['state']),
        paymentOptions: List<PremiumStatePaymentOption>.from(
            (json['payment_options'] ?? [])
                .map((item) => PremiumStatePaymentOption.fromJson(item))
                .toList()),
        animations: List<PremiumFeaturePromotionAnimation>.from(
            (json['animations'] ?? [])
                .map((item) => PremiumFeaturePromotionAnimation.fromJson(item))
                .toList()),
        businessAnimations: List<BusinessFeaturePromotionAnimation>.from(
            (json['business_animations'] ?? [])
                .map((item) => BusinessFeaturePromotionAnimation.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state": state.toJson(),
      "payment_options": paymentOptions.map((i) => i.toJson()).toList(),
      "animations": animations.map((i) => i.toJson()).toList(),
      "business_animations": businessAnimations.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state]: Text description of the state of the current Premium subscription; may be empty if the current user has no Telegram Premium subscription
  /// * [payment_options]: The list of available options for buying Telegram Premium
  /// * [animations]: The list of available promotion animations for Premium features
  /// * [business_animations]: The list of available promotion animations for Business features
  PremiumState copyWith({
    FormattedText? state,
    List<PremiumStatePaymentOption>? paymentOptions,
    List<PremiumFeaturePromotionAnimation>? animations,
    List<BusinessFeaturePromotionAnimation>? businessAnimations,
    dynamic extra,
    int? clientId,
  }) =>
      PremiumState(
        state: state ?? this.state,
        paymentOptions: paymentOptions ?? this.paymentOptions,
        animations: animations ?? this.animations,
        businessAnimations: businessAnimations ?? this.businessAnimations,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
