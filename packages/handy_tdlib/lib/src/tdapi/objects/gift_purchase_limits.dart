part of '../tdapi.dart';

/// **GiftPurchaseLimits** *(giftPurchaseLimits)* - basic class
///
/// Describes the maximum number of times that a specific gift can be purchased.
///
/// * [totalCount]: The maximum number of times the gifts can be purchased.
/// * [remainingCount]: Number of remaining times the gift can be purchased.
final class GiftPurchaseLimits extends TdObject {
  /// **GiftPurchaseLimits** *(giftPurchaseLimits)* - basic class
  ///
  /// Describes the maximum number of times that a specific gift can be purchased.
  ///
  /// * [totalCount]: The maximum number of times the gifts can be purchased.
  /// * [remainingCount]: Number of remaining times the gift can be purchased.
  const GiftPurchaseLimits({
    required this.totalCount,
    required this.remainingCount,
  });

  /// The maximum number of times the gifts can be purchased
  final int totalCount;

  /// Number of remaining times the gift can be purchased
  final int remainingCount;

  /// Parse from a json
  factory GiftPurchaseLimits.fromJson(Map<String, dynamic> json) =>
      GiftPurchaseLimits(
        totalCount: json['total_count'],
        remainingCount: json['remaining_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "remaining_count": remainingCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: The maximum number of times the gifts can be purchased
  /// * [remaining_count]: Number of remaining times the gift can be purchased
  GiftPurchaseLimits copyWith({
    int? totalCount,
    int? remainingCount,
  }) =>
      GiftPurchaseLimits(
        totalCount: totalCount ?? this.totalCount,
        remainingCount: remainingCount ?? this.remainingCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftPurchaseLimits';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
