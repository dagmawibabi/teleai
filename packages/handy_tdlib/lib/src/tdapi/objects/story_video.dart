part of '../tdapi.dart';

/// **StoryVideo** *(storyVideo)* - basic class
///
/// Describes a video file posted as a story.
///
/// * [duration]: Duration of the video, in seconds.
/// * [width]: Video width.
/// * [height]: Video height.
/// * [hasStickers]: True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets.
/// * [isAnimation]: True, if the video has no sound.
/// * [minithumbnail]: Video minithumbnail; may be null *(optional)*.
/// * [thumbnail]: Video thumbnail in JPEG or MPEG4 format; may be null *(optional)*.
/// * [preloadPrefixSize]: Size of file prefix, which is expected to be preloaded, in bytes.
/// * [coverFrameTimestamp]: Timestamp of the frame used as video thumbnail.
/// * [video]: File containing the video.
final class StoryVideo extends TdObject {
  /// **StoryVideo** *(storyVideo)* - basic class
  ///
  /// Describes a video file posted as a story.
  ///
  /// * [duration]: Duration of the video, in seconds.
  /// * [width]: Video width.
  /// * [height]: Video height.
  /// * [hasStickers]: True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets.
  /// * [isAnimation]: True, if the video has no sound.
  /// * [minithumbnail]: Video minithumbnail; may be null *(optional)*.
  /// * [thumbnail]: Video thumbnail in JPEG or MPEG4 format; may be null *(optional)*.
  /// * [preloadPrefixSize]: Size of file prefix, which is expected to be preloaded, in bytes.
  /// * [coverFrameTimestamp]: Timestamp of the frame used as video thumbnail.
  /// * [video]: File containing the video.
  const StoryVideo({
    required this.duration,
    required this.width,
    required this.height,
    required this.hasStickers,
    required this.isAnimation,
    this.minithumbnail,
    this.thumbnail,
    required this.preloadPrefixSize,
    required this.coverFrameTimestamp,
    required this.video,
  });

  /// Duration of the video, in seconds
  final double duration;

  /// Video width
  final int width;

  /// Video height
  final int height;

  /// True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
  final bool hasStickers;

  /// True, if the video has no sound
  final bool isAnimation;

  /// Video minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// Video thumbnail in JPEG or MPEG4 format; may be null
  final Thumbnail? thumbnail;

  /// Size of file prefix, which is expected to be preloaded, in bytes
  final int preloadPrefixSize;

  /// Timestamp of the frame used as video thumbnail
  final double coverFrameTimestamp;

  /// File containing the video
  final File video;

  /// Parse from a json
  factory StoryVideo.fromJson(Map<String, dynamic> json) => StoryVideo(
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
        hasStickers: json['has_stickers'],
        isAnimation: json['is_animation'],
        minithumbnail: json['minithumbnail'] == null
            ? null
            : Minithumbnail.fromJson(json['minithumbnail']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
        preloadPrefixSize: json['preload_prefix_size'],
        coverFrameTimestamp: json['cover_frame_timestamp'],
        video: File.fromJson(json['video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "duration": duration,
      "width": width,
      "height": height,
      "has_stickers": hasStickers,
      "is_animation": isAnimation,
      "minithumbnail": minithumbnail?.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "preload_prefix_size": preloadPrefixSize,
      "cover_frame_timestamp": coverFrameTimestamp,
      "video": video.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [duration]: Duration of the video, in seconds
  /// * [width]: Video width
  /// * [height]: Video height
  /// * [has_stickers]: True, if stickers were added to the video. The list of corresponding sticker sets can be received using getAttachedStickerSets
  /// * [is_animation]: True, if the video has no sound
  /// * [minithumbnail]: Video minithumbnail; may be null
  /// * [thumbnail]: Video thumbnail in JPEG or MPEG4 format; may be null
  /// * [preload_prefix_size]: Size of file prefix, which is expected to be preloaded, in bytes
  /// * [cover_frame_timestamp]: Timestamp of the frame used as video thumbnail
  /// * [video]: File containing the video
  StoryVideo copyWith({
    double? duration,
    int? width,
    int? height,
    bool? hasStickers,
    bool? isAnimation,
    Minithumbnail? minithumbnail,
    Thumbnail? thumbnail,
    int? preloadPrefixSize,
    double? coverFrameTimestamp,
    File? video,
  }) =>
      StoryVideo(
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
        hasStickers: hasStickers ?? this.hasStickers,
        isAnimation: isAnimation ?? this.isAnimation,
        minithumbnail: minithumbnail ?? this.minithumbnail,
        thumbnail: thumbnail ?? this.thumbnail,
        preloadPrefixSize: preloadPrefixSize ?? this.preloadPrefixSize,
        coverFrameTimestamp: coverFrameTimestamp ?? this.coverFrameTimestamp,
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
