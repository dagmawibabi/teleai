part of '../tdapi.dart';

/// **AlternativeVideo** *(alternativeVideo)* - basic class
///
/// Describes an alternative re-encoded quality of a video file.
///
/// * [id]: Unique identifier of the alternative video, which is used in the HLS file.
/// * [width]: Video width.
/// * [height]: Video height.
/// * [codec]: Codec used for video file encoding, for example, "h264", "h265", "av1", or "av01".
/// * [hlsFile]: HLS file describing the video.
/// * [video]: File containing the video.
final class AlternativeVideo extends TdObject {
  /// **AlternativeVideo** *(alternativeVideo)* - basic class
  ///
  /// Describes an alternative re-encoded quality of a video file.
  ///
  /// * [id]: Unique identifier of the alternative video, which is used in the HLS file.
  /// * [width]: Video width.
  /// * [height]: Video height.
  /// * [codec]: Codec used for video file encoding, for example, "h264", "h265", "av1", or "av01".
  /// * [hlsFile]: HLS file describing the video.
  /// * [video]: File containing the video.
  const AlternativeVideo({
    required this.id,
    required this.width,
    required this.height,
    required this.codec,
    required this.hlsFile,
    required this.video,
  });

  /// Unique identifier of the alternative video, which is used in the HLS file
  final int id;

  /// Video width
  final int width;

  /// Video height
  final int height;

  /// Codec used for video file encoding, for example, "h264", "h265", "av1", or "av01"
  final String codec;

  /// HLS file describing the video
  final File hlsFile;

  /// File containing the video
  final File video;

  /// Parse from a json
  factory AlternativeVideo.fromJson(Map<String, dynamic> json) =>
      AlternativeVideo(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        width: json['width'],
        height: json['height'],
        codec: json['codec'],
        hlsFile: File.fromJson(json['hls_file']),
        video: File.fromJson(json['video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "width": width,
      "height": height,
      "codec": codec,
      "hls_file": hlsFile.toJson(),
      "video": video.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the alternative video, which is used in the HLS file
  /// * [width]: Video width
  /// * [height]: Video height
  /// * [codec]: Codec used for video file encoding, for example, "h264", "h265", "av1", or "av01"
  /// * [hls_file]: HLS file describing the video
  /// * [video]: File containing the video
  AlternativeVideo copyWith({
    int? id,
    int? width,
    int? height,
    String? codec,
    File? hlsFile,
    File? video,
  }) =>
      AlternativeVideo(
        id: id ?? this.id,
        width: width ?? this.width,
        height: height ?? this.height,
        codec: codec ?? this.codec,
        hlsFile: hlsFile ?? this.hlsFile,
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'alternativeVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
