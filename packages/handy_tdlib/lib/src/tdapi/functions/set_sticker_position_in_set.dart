part of '../tdapi.dart';

/// **SetStickerPositionInSet** *(setStickerPositionInSet)* - TDLib function
///
/// Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user.
///
/// * [sticker]: Sticker.
/// * [position]: New position of the sticker in the set, 0-based.
///
/// [Ok] is returned on completion.
final class SetStickerPositionInSet extends TdFunction {
  /// **SetStickerPositionInSet** *(setStickerPositionInSet)* - TDLib function
  ///
  /// Changes the position of a sticker in the set to which it belongs. The sticker set must be owned by the current user.
  ///
  /// * [sticker]: Sticker.
  /// * [position]: New position of the sticker in the set, 0-based.
  ///
  /// [Ok] is returned on completion.
  const SetStickerPositionInSet({
    required this.sticker,
    required this.position,
  });

  /// Sticker
  final InputFile sticker;

  /// New position of the sticker in the set, 0-based
  final int position;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "position": position,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker
  /// * [position]: New position of the sticker in the set, 0-based
  SetStickerPositionInSet copyWith({
    InputFile? sticker,
    int? position,
  }) =>
      SetStickerPositionInSet(
        sticker: sticker ?? this.sticker,
        position: position ?? this.position,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerPositionInSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
