part of '../tdapi.dart';

/// **GetStickerSet** *(getStickerSet)* - TDLib function
///
/// Returns information about a sticker set by its identifier.
///
/// * [setId]: Identifier of the sticker set.
///
/// [StickerSet] is returned on completion.
final class GetStickerSet extends TdFunction {
  /// **GetStickerSet** *(getStickerSet)* - TDLib function
  ///
  /// Returns information about a sticker set by its identifier.
  ///
  /// * [setId]: Identifier of the sticker set.
  ///
  /// [StickerSet] is returned on completion.
  const GetStickerSet({
    required this.setId,
  });

  /// Identifier of the sticker set
  final int setId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "set_id": setId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [set_id]: Identifier of the sticker set
  GetStickerSet copyWith({
    int? setId,
  }) =>
      GetStickerSet(
        setId: setId ?? this.setId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
