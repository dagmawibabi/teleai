part of '../tdapi.dart';

/// **SuggestedPostPrice** *(suggestedPostPrice)* - parent
///
/// Describes price of a suggested post.
sealed class SuggestedPostPrice extends TdObject {
  /// **SuggestedPostPrice** *(suggestedPostPrice)* - parent
  ///
  /// Describes price of a suggested post.
  const SuggestedPostPrice();

  /// a SuggestedPostPrice return type can be :
  /// * [SuggestedPostPriceStar]
  /// * [SuggestedPostPriceGram]
  factory SuggestedPostPrice.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SuggestedPostPriceStar.defaultObjectId:
        return SuggestedPostPriceStar.fromJson(json);
      case SuggestedPostPriceGram.defaultObjectId:
        return SuggestedPostPriceGram.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SuggestedPostPrice)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SuggestedPostPrice copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostPrice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostPriceStar** *(suggestedPostPriceStar)* - child of SuggestedPostPrice
///
/// Describes price of a suggested post in Telegram Stars.
///
/// * [starCount]: The Telegram Star amount expected to be paid for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max").
final class SuggestedPostPriceStar extends SuggestedPostPrice {
  /// **SuggestedPostPriceStar** *(suggestedPostPriceStar)* - child of SuggestedPostPrice
  ///
  /// Describes price of a suggested post in Telegram Stars.
  ///
  /// * [starCount]: The Telegram Star amount expected to be paid for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max").
  const SuggestedPostPriceStar({
    required this.starCount,
  });

  /// The Telegram Star amount expected to be paid for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max")
  final int starCount;

  /// Parse from a json
  factory SuggestedPostPriceStar.fromJson(Map<String, dynamic> json) =>
      SuggestedPostPriceStar(
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
  /// * [star_count]: The Telegram Star amount expected to be paid for the post; getOption("suggested_post_star_count_min")-getOption("suggested_post_star_count_max")
  @override
  SuggestedPostPriceStar copyWith({
    int? starCount,
  }) =>
      SuggestedPostPriceStar(
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostPriceStar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SuggestedPostPriceGram** *(suggestedPostPriceGram)* - child of SuggestedPostPrice
///
/// Describes price of a suggested post in TON Grams.
///
/// * [gramCentCount]: The amount of 1/100 of Gram expected to be paid for the post; getOption("suggested_post_gram_cent_count_min")-getOption("suggested_post_gram_cent_count_max").
final class SuggestedPostPriceGram extends SuggestedPostPrice {
  /// **SuggestedPostPriceGram** *(suggestedPostPriceGram)* - child of SuggestedPostPrice
  ///
  /// Describes price of a suggested post in TON Grams.
  ///
  /// * [gramCentCount]: The amount of 1/100 of Gram expected to be paid for the post; getOption("suggested_post_gram_cent_count_min")-getOption("suggested_post_gram_cent_count_max").
  const SuggestedPostPriceGram({
    required this.gramCentCount,
  });

  /// The amount of 1/100 of Gram expected to be paid for the post; getOption("suggested_post_gram_cent_count_min")-getOption("suggested_post_gram_cent_count_max")
  final int gramCentCount;

  /// Parse from a json
  factory SuggestedPostPriceGram.fromJson(Map<String, dynamic> json) =>
      SuggestedPostPriceGram(
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
  /// * [gram_cent_count]: The amount of 1/100 of Gram expected to be paid for the post; getOption("suggested_post_gram_cent_count_min")-getOption("suggested_post_gram_cent_count_max")
  @override
  SuggestedPostPriceGram copyWith({
    int? gramCentCount,
  }) =>
      SuggestedPostPriceGram(
        gramCentCount: gramCentCount ?? this.gramCentCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestedPostPriceGram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
