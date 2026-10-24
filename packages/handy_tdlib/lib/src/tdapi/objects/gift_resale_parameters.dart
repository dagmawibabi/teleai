part of '../tdapi.dart';

/// **GiftResaleParameters** *(giftResaleParameters)* - basic class
///
/// Describes parameters of a unique gift available for resale.
///
/// * [starCount]: Resale price of the gift in Telegram Stars.
/// * [gramCentCount]: Resale price of the gift in 1/100 of TON Gram.
/// * [gramOnly]: True, if the gift can be bought only using Grams.
final class GiftResaleParameters extends TdObject {
  /// **GiftResaleParameters** *(giftResaleParameters)* - basic class
  ///
  /// Describes parameters of a unique gift available for resale.
  ///
  /// * [starCount]: Resale price of the gift in Telegram Stars.
  /// * [gramCentCount]: Resale price of the gift in 1/100 of TON Gram.
  /// * [gramOnly]: True, if the gift can be bought only using Grams.
  const GiftResaleParameters({
    required this.starCount,
    required this.gramCentCount,
    required this.gramOnly,
  });

  /// Resale price of the gift in Telegram Stars
  final int starCount;

  /// Resale price of the gift in 1/100 of TON Gram
  final int gramCentCount;

  /// True, if the gift can be bought only using Grams
  final bool gramOnly;

  /// Parse from a json
  factory GiftResaleParameters.fromJson(Map<String, dynamic> json) =>
      GiftResaleParameters(
        starCount: json['star_count'],
        gramCentCount: json['gram_cent_count'],
        gramOnly: json['gram_only'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "gram_cent_count": gramCentCount,
      "gram_only": gramOnly,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Resale price of the gift in Telegram Stars
  /// * [gram_cent_count]: Resale price of the gift in 1/100 of TON Gram
  /// * [gram_only]: True, if the gift can be bought only using Grams
  GiftResaleParameters copyWith({
    int? starCount,
    int? gramCentCount,
    bool? gramOnly,
  }) =>
      GiftResaleParameters(
        starCount: starCount ?? this.starCount,
        gramCentCount: gramCentCount ?? this.gramCentCount,
        gramOnly: gramOnly ?? this.gramOnly,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftResaleParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
