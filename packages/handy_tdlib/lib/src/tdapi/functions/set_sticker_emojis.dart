part of '../tdapi.dart';

/// **SetStickerEmojis** *(setStickerEmojis)* - TDLib function
///
/// Changes the list of emojis corresponding to a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user.
///
/// * [sticker]: Sticker.
/// * [emojis]: New string with 1-20 emoji corresponding to the sticker.
///
/// [Ok] is returned on completion.
final class SetStickerEmojis extends TdFunction {
  /// **SetStickerEmojis** *(setStickerEmojis)* - TDLib function
  ///
  /// Changes the list of emojis corresponding to a sticker. The sticker must belong to a regular or custom emoji sticker set that is owned by the current user.
  ///
  /// * [sticker]: Sticker.
  /// * [emojis]: New string with 1-20 emoji corresponding to the sticker.
  ///
  /// [Ok] is returned on completion.
  const SetStickerEmojis({
    required this.sticker,
    required this.emojis,
  });

  /// Sticker
  final InputFile sticker;

  /// New string with 1-20 emoji corresponding to the sticker
  final String emojis;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "emojis": emojis,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker
  /// * [emojis]: New string with 1-20 emoji corresponding to the sticker
  SetStickerEmojis copyWith({
    InputFile? sticker,
    String? emojis,
  }) =>
      SetStickerEmojis(
        sticker: sticker ?? this.sticker,
        emojis: emojis ?? this.emojis,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
