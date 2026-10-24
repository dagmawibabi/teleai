part of '../tdapi.dart';

/// **NewSticker** *(newSticker)* - basic class
///
/// A sticker to be added to a sticker set.
///
/// * [sticker]: File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements.
/// * [format]: Format of the sticker.
/// * [emojis]: String with 1-20 emoji corresponding to the sticker.
/// * [maskPosition]: Position where the mask is placed; pass null if not specified *(optional)*.
/// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker.
final class NewSticker extends TdObject {
  /// **NewSticker** *(newSticker)* - basic class
  ///
  /// A sticker to be added to a sticker set.
  ///
  /// * [sticker]: File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements.
  /// * [format]: Format of the sticker.
  /// * [emojis]: String with 1-20 emoji corresponding to the sticker.
  /// * [maskPosition]: Position where the mask is placed; pass null if not specified *(optional)*.
  /// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker.
  const NewSticker({
    required this.sticker,
    required this.format,
    required this.emojis,
    this.maskPosition,
    required this.keywords,
  });

  /// File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
  final InputFile sticker;

  /// Format of the sticker
  final StickerFormat format;

  /// String with 1-20 emoji corresponding to the sticker
  final String emojis;

  /// Position where the mask is placed; pass null if not specified
  final MaskPosition? maskPosition;

  /// List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
  final List<String> keywords;

  /// Parse from a json
  factory NewSticker.fromJson(Map<String, dynamic> json) => NewSticker(
        sticker: InputFile.fromJson(json['sticker']),
        format: StickerFormat.fromJson(json['format']),
        emojis: json['emojis'],
        maskPosition: json['mask_position'] == null
            ? null
            : MaskPosition.fromJson(json['mask_position']),
        keywords: List<String>.from(
            (json['keywords'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "format": format.toJson(),
      "emojis": emojis,
      "mask_position": maskPosition?.toJson(),
      "keywords": keywords.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: File with the sticker; must fit in a 512x512 square. For WEBP stickers the file must be in WEBP or PNG format, which will be converted to WEBP server-side.. See https://core.telegram.org/animated_stickers#technical-requirements for technical requirements
  /// * [format]: Format of the sticker
  /// * [emojis]: String with 1-20 emoji corresponding to the sticker
  /// * [mask_position]: Position where the mask is placed; pass null if not specified
  /// * [keywords]: List of up to 20 keywords with total length up to 64 characters, which can be used to find the sticker
  NewSticker copyWith({
    InputFile? sticker,
    StickerFormat? format,
    String? emojis,
    MaskPosition? maskPosition,
    List<String>? keywords,
  }) =>
      NewSticker(
        sticker: sticker ?? this.sticker,
        format: format ?? this.format,
        emojis: emojis ?? this.emojis,
        maskPosition: maskPosition ?? this.maskPosition,
        keywords: keywords ?? this.keywords,
      );

  /// TDLib object type
  static const String defaultObjectId = 'newSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
