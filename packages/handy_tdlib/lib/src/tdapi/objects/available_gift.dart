part of '../tdapi.dart';

/// **AvailableGift** *(availableGift)* - basic class
///
/// Describes a gift that is available for purchase.
///
/// * [gift]: The gift.
/// * [resaleCount]: Number of gifts that are available for resale.
/// * [minResaleStarCount]: The minimum price for the gifts available for resale in Telegram Star equivalent; 0 if there are no such gifts.
/// * [title]: The title of the upgraded gift; empty if the gift isn't available for resale.
final class AvailableGift extends TdObject {
  /// **AvailableGift** *(availableGift)* - basic class
  ///
  /// Describes a gift that is available for purchase.
  ///
  /// * [gift]: The gift.
  /// * [resaleCount]: Number of gifts that are available for resale.
  /// * [minResaleStarCount]: The minimum price for the gifts available for resale in Telegram Star equivalent; 0 if there are no such gifts.
  /// * [title]: The title of the upgraded gift; empty if the gift isn't available for resale.
  const AvailableGift({
    required this.gift,
    required this.resaleCount,
    required this.minResaleStarCount,
    required this.title,
  });

  /// The gift
  final Gift gift;

  /// Number of gifts that are available for resale
  final int resaleCount;

  /// The minimum price for the gifts available for resale in Telegram Star equivalent; 0 if there are no such gifts
  final int minResaleStarCount;

  /// The title of the upgraded gift; empty if the gift isn't available for resale
  final String title;

  /// Parse from a json
  factory AvailableGift.fromJson(Map<String, dynamic> json) => AvailableGift(
        gift: Gift.fromJson(json['gift']),
        resaleCount: json['resale_count'],
        minResaleStarCount: json['min_resale_star_count'],
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "resale_count": resaleCount,
      "min_resale_star_count": minResaleStarCount,
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [resale_count]: Number of gifts that are available for resale
  /// * [min_resale_star_count]: The minimum price for the gifts available for resale in Telegram Star equivalent; 0 if there are no such gifts
  /// * [title]: The title of the upgraded gift; empty if the gift isn't available for resale
  AvailableGift copyWith({
    Gift? gift,
    int? resaleCount,
    int? minResaleStarCount,
    String? title,
  }) =>
      AvailableGift(
        gift: gift ?? this.gift,
        resaleCount: resaleCount ?? this.resaleCount,
        minResaleStarCount: minResaleStarCount ?? this.minResaleStarCount,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'availableGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
