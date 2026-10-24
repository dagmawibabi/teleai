part of '../tdapi.dart';

/// **AddFavoriteSticker** *(addFavoriteSticker)* - TDLib function
///
/// Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to favorite stickers.
///
/// * [sticker]: Sticker file to add.
///
/// [Ok] is returned on completion.
final class AddFavoriteSticker extends TdFunction {
  /// **AddFavoriteSticker** *(addFavoriteSticker)* - TDLib function
  ///
  /// Adds a new sticker to the list of favorite stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to favorite stickers.
  ///
  /// * [sticker]: Sticker file to add.
  ///
  /// [Ok] is returned on completion.
  const AddFavoriteSticker({
    required this.sticker,
  });

  /// Sticker file to add
  final InputFile sticker;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker file to add
  AddFavoriteSticker copyWith({
    InputFile? sticker,
  }) =>
      AddFavoriteSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addFavoriteSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
