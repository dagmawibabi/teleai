part of '../tdapi.dart';

/// **InputStoryContent** *(inputStoryContent)* - parent
///
/// The content of a story to post.
sealed class InputStoryContent extends TdObject {
  /// **InputStoryContent** *(inputStoryContent)* - parent
  ///
  /// The content of a story to post.
  const InputStoryContent();

  /// a InputStoryContent return type can be :
  /// * [InputStoryContentPhoto]
  /// * [InputStoryContentVideo]
  factory InputStoryContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputStoryContentPhoto.defaultObjectId:
        return InputStoryContentPhoto.fromJson(json);
      case InputStoryContentVideo.defaultObjectId:
        return InputStoryContentVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputStoryContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputStoryContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryContentPhoto** *(inputStoryContentPhoto)* - child of InputStoryContent
///
/// A photo story.
///
/// * [photo]: Photo to send. The photo must be at most 10 MB in size. The photo size must be 1080x1920.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the photo, if applicable.
final class InputStoryContentPhoto extends InputStoryContent {
  /// **InputStoryContentPhoto** *(inputStoryContentPhoto)* - child of InputStoryContent
  ///
  /// A photo story.
  ///
  /// * [photo]: Photo to send. The photo must be at most 10 MB in size. The photo size must be 1080x1920.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the photo, if applicable.
  const InputStoryContentPhoto({
    required this.photo,
    required this.addedStickerFileIds,
  });

  /// Photo to send. The photo must be at most 10 MB in size. The photo size must be 1080x1920
  final InputFile photo;

  /// File identifiers of the stickers added to the photo, if applicable
  final List<int> addedStickerFileIds;

  /// Parse from a json
  factory InputStoryContentPhoto.fromJson(Map<String, dynamic> json) =>
      InputStoryContentPhoto(
        photo: InputFile.fromJson(json['photo']),
        addedStickerFileIds: List<int>.from(
            (json['added_sticker_file_ids'] ?? [])
                .map((item) => item)
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo to send. The photo must be at most 10 MB in size. The photo size must be 1080x1920
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the photo, if applicable
  @override
  InputStoryContentPhoto copyWith({
    InputFile? photo,
    List<int>? addedStickerFileIds,
  }) =>
      InputStoryContentPhoto(
        photo: photo ?? this.photo,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryContentPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputStoryContentVideo** *(inputStoryContentVideo)* - child of InputStoryContent
///
/// A video story.
///
/// * [video]: Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with H.265 codec and key frames added each second.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the video, if applicable.
/// * [duration]: Precise duration of the video, in seconds; 0-60.
/// * [coverFrameTimestamp]: Timestamp of the frame, which will be used as video thumbnail.
/// * [isAnimation]: True, if the video has no sound.
final class InputStoryContentVideo extends InputStoryContent {
  /// **InputStoryContentVideo** *(inputStoryContentVideo)* - child of InputStoryContent
  ///
  /// A video story.
  ///
  /// * [video]: Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with H.265 codec and key frames added each second.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the video, if applicable.
  /// * [duration]: Precise duration of the video, in seconds; 0-60.
  /// * [coverFrameTimestamp]: Timestamp of the frame, which will be used as video thumbnail.
  /// * [isAnimation]: True, if the video has no sound.
  const InputStoryContentVideo({
    required this.video,
    required this.addedStickerFileIds,
    required this.duration,
    required this.coverFrameTimestamp,
    required this.isAnimation,
  });

  /// Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with H.265 codec and key frames added each second
  final InputFile video;

  /// File identifiers of the stickers added to the video, if applicable
  final List<int> addedStickerFileIds;

  /// Precise duration of the video, in seconds; 0-60
  final double duration;

  /// Timestamp of the frame, which will be used as video thumbnail
  final double coverFrameTimestamp;

  /// True, if the video has no sound
  final bool isAnimation;

  /// Parse from a json
  factory InputStoryContentVideo.fromJson(Map<String, dynamic> json) =>
      InputStoryContentVideo(
        video: InputFile.fromJson(json['video']),
        addedStickerFileIds: List<int>.from(
            (json['added_sticker_file_ids'] ?? [])
                .map((item) => item)
                .toList()),
        duration: json['duration'],
        coverFrameTimestamp: json['cover_frame_timestamp'],
        isAnimation: json['is_animation'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
      "duration": duration,
      "cover_frame_timestamp": coverFrameTimestamp,
      "is_animation": isAnimation,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Video to be sent. The video size must be 720x1280. The video must be streamable and stored in MPEG4 format, after encoding with H.265 codec and key frames added each second
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the video, if applicable
  /// * [duration]: Precise duration of the video, in seconds; 0-60
  /// * [cover_frame_timestamp]: Timestamp of the frame, which will be used as video thumbnail
  /// * [is_animation]: True, if the video has no sound
  @override
  InputStoryContentVideo copyWith({
    InputFile? video,
    List<int>? addedStickerFileIds,
    double? duration,
    double? coverFrameTimestamp,
    bool? isAnimation,
  }) =>
      InputStoryContentVideo(
        video: video ?? this.video,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
        duration: duration ?? this.duration,
        coverFrameTimestamp: coverFrameTimestamp ?? this.coverFrameTimestamp,
        isAnimation: isAnimation ?? this.isAnimation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryContentVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
