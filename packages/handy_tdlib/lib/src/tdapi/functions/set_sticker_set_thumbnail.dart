part of '../tdapi.dart';

/// **SetStickerSetThumbnail** *(setStickerSetThumbnail)* - TDLib function
///
/// Sets a sticker set thumbnail.
///
/// * [userId]: Sticker set owner; ignored for regular users.
/// * [name]: Sticker set name. The sticker set must be owned by the current user.
/// * [thumbnail]: Thumbnail to set; pass null to remove the sticker set thumbnail *(optional)*.
/// * [format]: Format of the thumbnail; pass null if thumbnail is removed *(optional)*.
///
/// [Ok] is returned on completion.
final class SetStickerSetThumbnail extends TdFunction {
  /// **SetStickerSetThumbnail** *(setStickerSetThumbnail)* - TDLib function
  ///
  /// Sets a sticker set thumbnail.
  ///
  /// * [userId]: Sticker set owner; ignored for regular users.
  /// * [name]: Sticker set name. The sticker set must be owned by the current user.
  /// * [thumbnail]: Thumbnail to set; pass null to remove the sticker set thumbnail *(optional)*.
  /// * [format]: Format of the thumbnail; pass null if thumbnail is removed *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetStickerSetThumbnail({
    required this.userId,
    required this.name,
    this.thumbnail,
    this.format,
  });

  /// Sticker set owner; ignored for regular users
  final int userId;

  /// Sticker set name. The sticker set must be owned by the current user
  final String name;

  /// Thumbnail to set; pass null to remove the sticker set thumbnail
  final InputFile? thumbnail;

  /// Format of the thumbnail; pass null if thumbnail is removed
  final StickerFormat? format;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "name": name,
      "thumbnail": thumbnail?.toJson(),
      "format": format?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Sticker set owner; ignored for regular users
  /// * [name]: Sticker set name. The sticker set must be owned by the current user
  /// * [thumbnail]: Thumbnail to set; pass null to remove the sticker set thumbnail
  /// * [format]: Format of the thumbnail; pass null if thumbnail is removed
  SetStickerSetThumbnail copyWith({
    int? userId,
    String? name,
    InputFile? thumbnail,
    StickerFormat? format,
  }) =>
      SetStickerSetThumbnail(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        format: format ?? this.format,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerSetThumbnail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
