part of '../tdapi.dart';

/// **VideoStoryboard** *(videoStoryboard)* - basic class
///
/// Describes a storyboard for a video.
///
/// * [storyboardFile]: A JPEG file that contains tiled previews of video.
/// * [width]: Width of a tile.
/// * [height]: Height of a tile.
/// * [mapFile]: File that describes mapping of position in the video to a tile in the JPEG file.
final class VideoStoryboard extends TdObject {
  /// **VideoStoryboard** *(videoStoryboard)* - basic class
  ///
  /// Describes a storyboard for a video.
  ///
  /// * [storyboardFile]: A JPEG file that contains tiled previews of video.
  /// * [width]: Width of a tile.
  /// * [height]: Height of a tile.
  /// * [mapFile]: File that describes mapping of position in the video to a tile in the JPEG file.
  const VideoStoryboard({
    required this.storyboardFile,
    required this.width,
    required this.height,
    required this.mapFile,
  });

  /// A JPEG file that contains tiled previews of video
  final File storyboardFile;

  /// Width of a tile
  final int width;

  /// Height of a tile
  final int height;

  /// File that describes mapping of position in the video to a tile in the JPEG file
  final File mapFile;

  /// Parse from a json
  factory VideoStoryboard.fromJson(Map<String, dynamic> json) =>
      VideoStoryboard(
        storyboardFile: File.fromJson(json['storyboard_file']),
        width: json['width'],
        height: json['height'],
        mapFile: File.fromJson(json['map_file']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "storyboard_file": storyboardFile.toJson(),
      "width": width,
      "height": height,
      "map_file": mapFile.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [storyboard_file]: A JPEG file that contains tiled previews of video
  /// * [width]: Width of a tile
  /// * [height]: Height of a tile
  /// * [map_file]: File that describes mapping of position in the video to a tile in the JPEG file
  VideoStoryboard copyWith({
    File? storyboardFile,
    int? width,
    int? height,
    File? mapFile,
  }) =>
      VideoStoryboard(
        storyboardFile: storyboardFile ?? this.storyboardFile,
        width: width ?? this.width,
        height: height ?? this.height,
        mapFile: mapFile ?? this.mapFile,
      );

  /// TDLib object type
  static const String defaultObjectId = 'videoStoryboard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
