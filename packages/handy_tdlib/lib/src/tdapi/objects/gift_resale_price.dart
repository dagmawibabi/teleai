part of '../tdapi.dart';

/// **GiftResalePrice** *(giftResalePrice)* - parent
///
/// Describes price of a resold gift.
sealed class GiftResalePrice extends TdObject {
  /// **GiftResalePrice** *(giftResalePrice)* - parent
  ///
  /// Describes price of a resold gift.
  const GiftResalePrice();

  /// a GiftResalePrice return type can be :
  /// * [GiftResalePriceStar]
  /// * [GiftResalePriceGram]
  factory GiftResalePrice.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiftResalePriceStar.defaultObjectId:
        return GiftResalePriceStar.fromJson(json);
      case GiftResalePriceGram.defaultObjectId:
        return GiftResalePriceGram.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiftResalePrice)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiftResalePrice copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giftResalePrice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftResalePriceStar** *(giftResalePriceStar)* - child of GiftResalePrice
///
/// Describes price of a resold gift in Telegram Stars.
///
/// * [starCount]: The Telegram Star amount expected to be paid for the gift. Must be in the range. getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale.
final class GiftResalePriceStar extends GiftResalePrice {
  /// **GiftResalePriceStar** *(giftResalePriceStar)* - child of GiftResalePrice
  ///
  /// Describes price of a resold gift in Telegram Stars.
  ///
  /// * [starCount]: The Telegram Star amount expected to be paid for the gift. Must be in the range. getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale.
  const GiftResalePriceStar({
    required this.starCount,
  });

  /// The Telegram Star amount expected to be paid for the gift. Must be in the range. getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale
  final int starCount;

  /// Parse from a json
  factory GiftResalePriceStar.fromJson(Map<String, dynamic> json) =>
      GiftResalePriceStar(
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The Telegram Star amount expected to be paid for the gift. Must be in the range. getOption("gift_resale_star_count_min")-getOption("gift_resale_star_count_max") for gifts put for resale
  @override
  GiftResalePriceStar copyWith({
    int? starCount,
  }) =>
      GiftResalePriceStar(
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftResalePriceStar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftResalePriceGram** *(giftResalePriceGram)* - child of GiftResalePrice
///
/// Describes price of a resold gift in TON Grams.
///
/// * [gramCentCount]: The amount of 1/100 of Gram expected to be paid for the gift. Must be in the range. getOption("gift_resale_gram_cent_count_min")-getOption("gift_resale_gram_cent_count_max").
final class GiftResalePriceGram extends GiftResalePrice {
  /// **GiftResalePriceGram** *(giftResalePriceGram)* - child of GiftResalePrice
  ///
  /// Describes price of a resold gift in TON Grams.
  ///
  /// * [gramCentCount]: The amount of 1/100 of Gram expected to be paid for the gift. Must be in the range. getOption("gift_resale_gram_cent_count_min")-getOption("gift_resale_gram_cent_count_max").
  const GiftResalePriceGram({
    required this.gramCentCount,
  });

  /// The amount of 1/100 of Gram expected to be paid for the gift. Must be in the range. getOption("gift_resale_gram_cent_count_min")-getOption("gift_resale_gram_cent_count_max")
  final int gramCentCount;

  /// Parse from a json
  factory GiftResalePriceGram.fromJson(Map<String, dynamic> json) =>
      GiftResalePriceGram(
        gramCentCount: json['gram_cent_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gram_cent_count": gramCentCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gram_cent_count]: The amount of 1/100 of Gram expected to be paid for the gift. Must be in the range. getOption("gift_resale_gram_cent_count_min")-getOption("gift_resale_gram_cent_count_max")
  @override
  GiftResalePriceGram copyWith({
    int? gramCentCount,
  }) =>
      GiftResalePriceGram(
        gramCentCount: gramCentCount ?? this.gramCentCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftResalePriceGram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
