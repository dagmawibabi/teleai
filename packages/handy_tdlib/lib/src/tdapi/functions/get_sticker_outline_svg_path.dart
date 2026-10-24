part of '../tdapi.dart';

/// **GetStickerOutlineSvgPath** *(getStickerOutlineSvgPath)* - TDLib function
///
/// Returns outline of a sticker as an SVG path. This is an offline method. Returns an empty string if the outline isn't known.
///
/// * [stickerFileId]: File identifier of the sticker.
/// * [forAnimatedEmoji]: Pass true to get the outline scaled for animated emoji.
/// * [forClickedAnimatedEmojiMessage]: Pass true to get the outline scaled for clicked animated emoji message.
///
/// [Text] is returned on completion.
final class GetStickerOutlineSvgPath extends TdFunction {
  /// **GetStickerOutlineSvgPath** *(getStickerOutlineSvgPath)* - TDLib function
  ///
  /// Returns outline of a sticker as an SVG path. This is an offline method. Returns an empty string if the outline isn't known.
  ///
  /// * [stickerFileId]: File identifier of the sticker.
  /// * [forAnimatedEmoji]: Pass true to get the outline scaled for animated emoji.
  /// * [forClickedAnimatedEmojiMessage]: Pass true to get the outline scaled for clicked animated emoji message.
  ///
  /// [Text] is returned on completion.
  const GetStickerOutlineSvgPath({
    required this.stickerFileId,
    required this.forAnimatedEmoji,
    required this.forClickedAnimatedEmojiMessage,
  });

  /// File identifier of the sticker
  final int stickerFileId;

  /// Pass true to get the outline scaled for animated emoji
  final bool forAnimatedEmoji;

  /// Pass true to get the outline scaled for clicked animated emoji message
  final bool forClickedAnimatedEmojiMessage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_file_id": stickerFileId,
      "for_animated_emoji": forAnimatedEmoji,
      "for_clicked_animated_emoji_message": forClickedAnimatedEmojiMessage,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_file_id]: File identifier of the sticker
  /// * [for_animated_emoji]: Pass true to get the outline scaled for animated emoji
  /// * [for_clicked_animated_emoji_message]: Pass true to get the outline scaled for clicked animated emoji message
  GetStickerOutlineSvgPath copyWith({
    int? stickerFileId,
    bool? forAnimatedEmoji,
    bool? forClickedAnimatedEmojiMessage,
  }) =>
      GetStickerOutlineSvgPath(
        stickerFileId: stickerFileId ?? this.stickerFileId,
        forAnimatedEmoji: forAnimatedEmoji ?? this.forAnimatedEmoji,
        forClickedAnimatedEmojiMessage: forClickedAnimatedEmojiMessage ??
            this.forClickedAnimatedEmojiMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStickerOutlineSvgPath';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
