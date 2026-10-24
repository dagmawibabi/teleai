part of '../tdapi.dart';

/// **SetStickerKeywords** *(setStickerKeywords)* - TDLib function
///
/// Changes the list of keywords of a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user.
///
/// * [sticker]: Sticker.
/// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker.
///
/// [Ok] is returned on completion.
final class SetStickerKeywords extends TdFunction {
  /// **SetStickerKeywords** *(setStickerKeywords)* - TDLib function
  ///
  /// Changes the list of keywords of a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user.
  ///
  /// * [sticker]: Sticker.
  /// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker.
  ///
  /// [Ok] is returned on completion.
  const SetStickerKeywords({
    required this.sticker,
    required this.keywords,
  });

  /// Sticker
  final InputFile sticker;

  /// List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
  final List<String> keywords;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "keywords": keywords.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker
  /// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
  SetStickerKeywords copyWith({
    InputFile? sticker,
    List<String>? keywords,
  }) =>
      SetStickerKeywords(
        sticker: sticker ?? this.sticker,
        keywords: keywords ?? this.keywords,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerKeywords';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
