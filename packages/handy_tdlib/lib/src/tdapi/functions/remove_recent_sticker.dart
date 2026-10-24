part of '../tdapi.dart';

/// **RemoveRecentSticker** *(removeRecentSticker)* - TDLib function
///
/// Removes a sticker from the list of recently used stickers.
///
/// * [isAttached]: Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers.
/// * [sticker]: Sticker file to delete.
///
/// [Ok] is returned on completion.
final class RemoveRecentSticker extends TdFunction {
  /// **RemoveRecentSticker** *(removeRecentSticker)* - TDLib function
  ///
  /// Removes a sticker from the list of recently used stickers.
  ///
  /// * [isAttached]: Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers.
  /// * [sticker]: Sticker file to delete.
  ///
  /// [Ok] is returned on completion.
  const RemoveRecentSticker({
    required this.isAttached,
    required this.sticker,
  });

  /// Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
  final bool isAttached;

  /// Sticker file to delete
  final InputFile sticker;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "is_attached": isAttached,
      "sticker": sticker.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_attached]: Pass true to remove the sticker from the list of stickers recently attached to photo or video files; pass false to remove the sticker from the list of recently sent stickers
  /// * [sticker]: Sticker file to delete
  RemoveRecentSticker copyWith({
    bool? isAttached,
    InputFile? sticker,
  }) =>
      RemoveRecentSticker(
        isAttached: isAttached ?? this.isAttached,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeRecentSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
