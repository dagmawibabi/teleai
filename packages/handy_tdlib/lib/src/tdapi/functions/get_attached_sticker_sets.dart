part of '../tdapi.dart';

/// **GetAttachedStickerSets** *(getAttachedStickerSets)* - TDLib function
///
/// Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets.
///
/// * [fileId]: File identifier.
///
/// [StickerSets] is returned on completion.
final class GetAttachedStickerSets extends TdFunction {
  /// **GetAttachedStickerSets** *(getAttachedStickerSets)* - TDLib function
  ///
  /// Returns a list of sticker sets attached to a file, including regular, mask, and emoji sticker sets. Currently, only animations, photos, and videos can have attached sticker sets.
  ///
  /// * [fileId]: File identifier.
  ///
  /// [StickerSets] is returned on completion.
  const GetAttachedStickerSets({
    required this.fileId,
  });

  /// File identifier
  final int fileId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: File identifier
  GetAttachedStickerSets copyWith({
    int? fileId,
  }) =>
      GetAttachedStickerSets(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAttachedStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
