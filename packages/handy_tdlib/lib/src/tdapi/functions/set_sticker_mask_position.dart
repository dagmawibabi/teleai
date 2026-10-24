part of '../tdapi.dart';

/// **SetStickerMaskPosition** *(setStickerMaskPosition)* - TDLib function
///
/// Changes the mask position of a mask sticker. The sticker must belong to a mask sticker set that is owned by the current user.
///
/// * [sticker]: Sticker.
/// * [maskPosition]: Position where the mask is placed; pass null to remove mask position *(optional)*.
///
/// [Ok] is returned on completion.
final class SetStickerMaskPosition extends TdFunction {
  /// **SetStickerMaskPosition** *(setStickerMaskPosition)* - TDLib function
  ///
  /// Changes the mask position of a mask sticker. The sticker must belong to a mask sticker set that is owned by the current user.
  ///
  /// * [sticker]: Sticker.
  /// * [maskPosition]: Position where the mask is placed; pass null to remove mask position *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetStickerMaskPosition({
    required this.sticker,
    this.maskPosition,
  });

  /// Sticker
  final InputFile sticker;

  /// Position where the mask is placed; pass null to remove mask position
  final MaskPosition? maskPosition;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "mask_position": maskPosition?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker
  /// * [mask_position]: Position where the mask is placed; pass null to remove mask position
  SetStickerMaskPosition copyWith({
    InputFile? sticker,
    MaskPosition? maskPosition,
  }) =>
      SetStickerMaskPosition(
        sticker: sticker ?? this.sticker,
        maskPosition: maskPosition ?? this.maskPosition,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerMaskPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
