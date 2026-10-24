part of '../tdapi.dart';

/// **RemoveFavoriteSticker** *(removeFavoriteSticker)* - TDLib function
///
/// Removes a sticker from the list of favorite stickers.
///
/// * [sticker]: Sticker file to delete from the list.
///
/// [Ok] is returned on completion.
final class RemoveFavoriteSticker extends TdFunction {
  /// **RemoveFavoriteSticker** *(removeFavoriteSticker)* - TDLib function
  ///
  /// Removes a sticker from the list of favorite stickers.
  ///
  /// * [sticker]: Sticker file to delete from the list.
  ///
  /// [Ok] is returned on completion.
  const RemoveFavoriteSticker({
    required this.sticker,
  });

  /// Sticker file to delete from the list
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
  /// * [sticker]: Sticker file to delete from the list
  RemoveFavoriteSticker copyWith({
    InputFile? sticker,
  }) =>
      RemoveFavoriteSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeFavoriteSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
