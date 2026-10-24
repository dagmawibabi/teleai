part of '../tdapi.dart';

/// **InputPhoto** *(inputPhoto)* - basic class
///
/// A photo to be sent.
///
/// * [photo]: Photo to be sent. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
/// * [thumbnail]: Photo thumbnail; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats *(optional)*.
/// * [video]: Video of the live photo; not supported in secret chats; pass null if the photo isn't a live photo *(optional)*.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the photo, if applicable.
/// * [width]: Photo width; may be replaced by the server.
/// * [height]: Photo height; may be replaced by the server.
final class InputPhoto extends TdObject {
  /// **InputPhoto** *(inputPhoto)* - basic class
  ///
  /// A photo to be sent.
  ///
  /// * [photo]: Photo to be sent. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
  /// * [thumbnail]: Photo thumbnail; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats *(optional)*.
  /// * [video]: Video of the live photo; not supported in secret chats; pass null if the photo isn't a live photo *(optional)*.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the photo, if applicable.
  /// * [width]: Photo width; may be replaced by the server.
  /// * [height]: Photo height; may be replaced by the server.
  const InputPhoto({
    required this.photo,
    this.thumbnail,
    this.video,
    required this.addedStickerFileIds,
    required this.width,
    required this.height,
  });

  /// Photo to be sent. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
  final InputFile photo;

  /// Photo thumbnail; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats
  final InputThumbnail? thumbnail;

  /// Video of the live photo; not supported in secret chats; pass null if the photo isn't a live photo
  final InputFile? video;

  /// File identifiers of the stickers added to the photo, if applicable
  final List<int> addedStickerFileIds;

  /// Photo width; may be replaced by the server
  final int width;

  /// Photo height; may be replaced by the server
  final int height;

  /// Parse from a json
  factory InputPhoto.fromJson(Map<String, dynamic> json) => InputPhoto(
        photo: InputFile.fromJson(json['photo']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        video: json['video'] == null ? null : InputFile.fromJson(json['video']),
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
      "photo": photo.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "video": video?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo to be sent. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
  /// * [thumbnail]: Photo thumbnail; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats
  /// * [video]: Video of the live photo; not supported in secret chats; pass null if the photo isn't a live photo
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the photo, if applicable
  /// * [width]: Photo width; may be replaced by the server
  /// * [height]: Photo height; may be replaced by the server
  InputPhoto copyWith({
    InputFile? photo,
    InputThumbnail? thumbnail,
    InputFile? video,
    List<int>? addedStickerFileIds,
    int? width,
    int? height,
  }) =>
      InputPhoto(
        photo: photo ?? this.photo,
        thumbnail: thumbnail ?? this.thumbnail,
        video: video ?? this.video,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
