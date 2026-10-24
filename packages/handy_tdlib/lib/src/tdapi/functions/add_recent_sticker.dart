part of '../tdapi.dart';

/// **AddRecentSticker** *(addRecentSticker)* - TDLib function
///
/// Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to recent stickers.
///
/// * [isAttached]: Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers.
/// * [sticker]: Sticker file to add.
///
/// [Stickers] is returned on completion.
final class AddRecentSticker extends TdFunction {
  /// **AddRecentSticker** *(addRecentSticker)* - TDLib function
  ///
  /// Manually adds a new sticker to the list of recently used stickers. The new sticker is added to the top of the list. If the sticker was already in the list, it is removed from the list first.. Only stickers belonging to a sticker set or in WEBP or WEBM format can be added to this list. Emoji stickers can't be added to recent stickers.
  ///
  /// * [isAttached]: Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers.
  /// * [sticker]: Sticker file to add.
  ///
  /// [Stickers] is returned on completion.
  const AddRecentSticker({
    required this.isAttached,
    required this.sticker,
  });

  /// Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
  final bool isAttached;

  /// Sticker file to add
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
  /// * [is_attached]: Pass true to add the sticker to the list of stickers recently attached to photo or video files; pass false to add the sticker to the list of recently sent stickers
  /// * [sticker]: Sticker file to add
  AddRecentSticker copyWith({
    bool? isAttached,
    InputFile? sticker,
  }) =>
      AddRecentSticker(
        isAttached: isAttached ?? this.isAttached,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addRecentSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
