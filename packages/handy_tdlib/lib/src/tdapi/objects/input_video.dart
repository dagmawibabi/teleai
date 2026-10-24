part of '../tdapi.dart';

/// **InputVideo** *(inputVideo)* - basic class
///
/// A video to be sent.
///
/// * [video]: Video file to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender.
/// * [thumbnail]: Video thumbnail; pass null to skip thumbnail uploading *(optional)*.
/// * [cover]: Cover of the video; pass null to skip cover uploading; not supported in secret chats and for self-destructing messages *(optional)*.
/// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the video, if applicable.
/// * [duration]: Duration of the video, in seconds.
/// * [width]: Video width.
/// * [height]: Video height.
/// * [supportsStreaming]: True, if the video is expected to be streamed.
final class InputVideo extends TdObject {
  /// **InputVideo** *(inputVideo)* - basic class
  ///
  /// A video to be sent.
  ///
  /// * [video]: Video file to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender.
  /// * [thumbnail]: Video thumbnail; pass null to skip thumbnail uploading *(optional)*.
  /// * [cover]: Cover of the video; pass null to skip cover uploading; not supported in secret chats and for self-destructing messages *(optional)*.
  /// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the video, if applicable.
  /// * [duration]: Duration of the video, in seconds.
  /// * [width]: Video width.
  /// * [height]: Video height.
  /// * [supportsStreaming]: True, if the video is expected to be streamed.
  const InputVideo({
    required this.video,
    this.thumbnail,
    this.cover,
    required this.startTimestamp,
    required this.addedStickerFileIds,
    required this.duration,
    required this.width,
    required this.height,
    required this.supportsStreaming,
  });

  /// Video file to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender
  final InputFile video;

  /// Video thumbnail; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// Cover of the video; pass null to skip cover uploading; not supported in secret chats and for self-destructing messages
  final InputFile? cover;

  /// Timestamp from which the video playing must start, in seconds
  final int startTimestamp;

  /// File identifiers of the stickers added to the video, if applicable
  final List<int> addedStickerFileIds;

  /// Duration of the video, in seconds
  final int duration;

  /// Video width
  final int width;

  /// Video height
  final int height;

  /// True, if the video is expected to be streamed
  final bool supportsStreaming;

  /// Parse from a json
  factory InputVideo.fromJson(Map<String, dynamic> json) => InputVideo(
        video: InputFile.fromJson(json['video']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        cover: json['cover'] == null ? null : InputFile.fromJson(json['cover']),
        startTimestamp: json['start_timestamp'],
        addedStickerFileIds: List<int>.from(
            (json['added_sticker_file_ids'] ?? [])
                .map((item) => item)
                .toList()),
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
        supportsStreaming: json['supports_streaming'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "cover": cover?.toJson(),
      "start_timestamp": startTimestamp,
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
      "duration": duration,
      "width": width,
      "height": height,
      "supports_streaming": supportsStreaming,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Video file to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender
  /// * [thumbnail]: Video thumbnail; pass null to skip thumbnail uploading
  /// * [cover]: Cover of the video; pass null to skip cover uploading; not supported in secret chats and for self-destructing messages
  /// * [start_timestamp]: Timestamp from which the video playing must start, in seconds
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the video, if applicable
  /// * [duration]: Duration of the video, in seconds
  /// * [width]: Video width
  /// * [height]: Video height
  /// * [supports_streaming]: True, if the video is expected to be streamed
  InputVideo copyWith({
    InputFile? video,
    InputThumbnail? thumbnail,
    InputFile? cover,
    int? startTimestamp,
    List<int>? addedStickerFileIds,
    int? duration,
    int? width,
    int? height,
    bool? supportsStreaming,
  }) =>
      InputVideo(
        video: video ?? this.video,
        thumbnail: thumbnail ?? this.thumbnail,
        cover: cover ?? this.cover,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
        supportsStreaming: supportsStreaming ?? this.supportsStreaming,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
