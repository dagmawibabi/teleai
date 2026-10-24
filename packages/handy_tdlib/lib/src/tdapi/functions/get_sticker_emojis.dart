part of '../tdapi.dart';

/// **GetStickerEmojis** *(getStickerEmojis)* - TDLib function
///
/// Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object.
///
/// * [sticker]: Sticker file identifier.
///
/// [Emojis] is returned on completion.
final class GetStickerEmojis extends TdFunction {
  /// **GetStickerEmojis** *(getStickerEmojis)* - TDLib function
  ///
  /// Returns emoji corresponding to a sticker. The list is only for informational purposes, because a sticker is always sent with a fixed emoji from the corresponding Sticker object.
  ///
  /// * [sticker]: Sticker file identifier.
  ///
  /// [Emojis] is returned on completion.
  const GetStickerEmojis({
    required this.sticker,
  });

  /// Sticker file identifier
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
  /// * [sticker]: Sticker file identifier
  GetStickerEmojis copyWith({
    InputFile? sticker,
  }) =>
      GetStickerEmojis(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStickerEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
