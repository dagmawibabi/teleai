part of '../tdapi.dart';

/// **StarSubscriptionPricing** *(starSubscriptionPricing)* - basic class
///
/// Describes subscription plan paid in Telegram Stars.
///
/// * [period]: The number of seconds between consecutive Telegram Star debiting.
/// * [starCount]: The Telegram Star amount that must be paid for each period.
final class StarSubscriptionPricing extends TdObject {
  /// **StarSubscriptionPricing** *(starSubscriptionPricing)* - basic class
  ///
  /// Describes subscription plan paid in Telegram Stars.
  ///
  /// * [period]: The number of seconds between consecutive Telegram Star debiting.
  /// * [starCount]: The Telegram Star amount that must be paid for each period.
  const StarSubscriptionPricing({
    required this.period,
    required this.starCount,
  });

  /// The number of seconds between consecutive Telegram Star debiting
  final int period;

  /// The Telegram Star amount that must be paid for each period
  final int starCount;

  /// Parse from a json
  factory StarSubscriptionPricing.fromJson(Map<String, dynamic> json) =>
      StarSubscriptionPricing(
        period: json['period'],
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "period": period,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [period]: The number of seconds between consecutive Telegram Star debiting
  /// * [star_count]: The Telegram Star amount that must be paid for each period
  StarSubscriptionPricing copyWith({
    int? period,
    int? starCount,
  }) =>
      StarSubscriptionPricing(
        period: period ?? this.period,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starSubscriptionPricing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
