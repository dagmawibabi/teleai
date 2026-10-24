part of '../tdapi.dart';

/// **InputVideoNote** *(inputVideoNote)* - basic class
///
/// A video note to be sent.
///
/// * [videoNote]: Video note file to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle.
/// * [thumbnail]: Video thumbnail; may be null if empty; pass null to skip thumbnail uploading *(optional)*.
/// * [duration]: Duration of the video, in seconds; 0-60.
/// * [length]: Video width and height; must be positive and not greater than 640.
final class InputVideoNote extends TdObject {
  /// **InputVideoNote** *(inputVideoNote)* - basic class
  ///
  /// A video note to be sent.
  ///
  /// * [videoNote]: Video note file to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle.
  /// * [thumbnail]: Video thumbnail; may be null if empty; pass null to skip thumbnail uploading *(optional)*.
  /// * [duration]: Duration of the video, in seconds; 0-60.
  /// * [length]: Video width and height; must be positive and not greater than 640.
  const InputVideoNote({
    required this.videoNote,
    this.thumbnail,
    required this.duration,
    required this.length,
  });

  /// Video note file to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle
  final InputFile videoNote;

  /// Video thumbnail; may be null if empty; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// Duration of the video, in seconds; 0-60
  final int duration;

  /// Video width and height; must be positive and not greater than 640
  final int length;

  /// Parse from a json
  factory InputVideoNote.fromJson(Map<String, dynamic> json) => InputVideoNote(
        videoNote: InputFile.fromJson(json['video_note']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        duration: json['duration'],
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video_note": videoNote.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "duration": duration,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video_note]: Video note file to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle
  /// * [thumbnail]: Video thumbnail; may be null if empty; pass null to skip thumbnail uploading
  /// * [duration]: Duration of the video, in seconds; 0-60
  /// * [length]: Video width and height; must be positive and not greater than 640
  InputVideoNote copyWith({
    InputFile? videoNote,
    InputThumbnail? thumbnail,
    int? duration,
    int? length,
  }) =>
      InputVideoNote(
        videoNote: videoNote ?? this.videoNote,
        thumbnail: thumbnail ?? this.thumbnail,
        duration: duration ?? this.duration,
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
