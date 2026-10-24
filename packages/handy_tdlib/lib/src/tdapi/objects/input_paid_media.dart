part of '../tdapi.dart';

/// **InputPaidMedia** *(inputPaidMedia)* - basic class
///
/// Describes a paid media to be sent.
///
/// * [type]: Type of the media.
/// * [media]: Photo or video to be sent.
/// * [thumbnail]: Media thumbnail; pass null to skip thumbnail uploading *(optional)*.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the media, if applicable.
/// * [width]: Media width.
/// * [height]: Media height.
final class InputPaidMedia extends TdObject {
  /// **InputPaidMedia** *(inputPaidMedia)* - basic class
  ///
  /// Describes a paid media to be sent.
  ///
  /// * [type]: Type of the media.
  /// * [media]: Photo or video to be sent.
  /// * [thumbnail]: Media thumbnail; pass null to skip thumbnail uploading *(optional)*.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the media, if applicable.
  /// * [width]: Media width.
  /// * [height]: Media height.
  const InputPaidMedia({
    required this.type,
    required this.media,
    this.thumbnail,
    required this.addedStickerFileIds,
    required this.width,
    required this.height,
  });

  /// Type of the media
  final InputPaidMediaType type;

  /// Photo or video to be sent
  final InputFile media;

  /// Media thumbnail; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// File identifiers of the stickers added to the media, if applicable
  final List<int> addedStickerFileIds;

  /// Media width
  final int width;

  /// Media height
  final int height;

  /// Parse from a json
  factory InputPaidMedia.fromJson(Map<String, dynamic> json) => InputPaidMedia(
        type: InputPaidMediaType.fromJson(json['type']),
        media: InputFile.fromJson(json['media']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        addedStickerFileIds: List<int>.from(
            (json['added_sticker_file_ids'] ?? [])
                .map((item) => item)
                .toList()),
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "media": media.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the media
  /// * [media]: Photo or video to be sent
  /// * [thumbnail]: Media thumbnail; pass null to skip thumbnail uploading
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the media, if applicable
  /// * [width]: Media width
  /// * [height]: Media height
  InputPaidMedia copyWith({
    InputPaidMediaType? type,
    InputFile? media,
    InputThumbnail? thumbnail,
    List<int>? addedStickerFileIds,
    int? width,
    int? height,
  }) =>
      InputPaidMedia(
        type: type ?? this.type,
        media: media ?? this.media,
        thumbnail: thumbnail ?? this.thumbnail,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPaidMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
