part of '../tdapi.dart';

/// **GiftUpgradePrice** *(giftUpgradePrice)* - basic class
///
/// Describes a price required to pay to upgrade a gift.
///
/// * [date]: Point in time (Unix timestamp) when the price will be in effect.
/// * [starCount]: The Telegram Star amount required to pay to upgrade the gift.
final class GiftUpgradePrice extends TdObject {
  /// **GiftUpgradePrice** *(giftUpgradePrice)* - basic class
  ///
  /// Describes a price required to pay to upgrade a gift.
  ///
  /// * [date]: Point in time (Unix timestamp) when the price will be in effect.
  /// * [starCount]: The Telegram Star amount required to pay to upgrade the gift.
  const GiftUpgradePrice({
    required this.date,
    required this.starCount,
  });

  /// Point in time (Unix timestamp) when the price will be in effect
  final int date;

  /// The Telegram Star amount required to pay to upgrade the gift
  final int starCount;

  /// Parse from a json
  factory GiftUpgradePrice.fromJson(Map<String, dynamic> json) =>
      GiftUpgradePrice(
        date: json['date'],
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "date": date,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [date]: Point in time (Unix timestamp) when the price will be in effect
  /// * [star_count]: The Telegram Star amount required to pay to upgrade the gift
  GiftUpgradePrice copyWith({
    int? date,
    int? starCount,
  }) =>
      GiftUpgradePrice(
        date: date ?? this.date,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftUpgradePrice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
