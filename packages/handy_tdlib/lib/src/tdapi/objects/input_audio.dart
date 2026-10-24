part of '../tdapi.dart';

/// **InputAudio** *(inputAudio)* - basic class
///
/// An audio to be sent.
///
/// * [audio]: Audio file to be sent.
/// * [albumCoverThumbnail]: Thumbnail of the cover for the album; pass null to skip thumbnail uploading *(optional)*.
/// * [duration]: Duration of the audio, in seconds; may be replaced by the server.
/// * [title]: Title of the audio; 0-64 characters; may be replaced by the server.
/// * [performer]: Performer of the audio; 0-64 characters, may be replaced by the server.
final class InputAudio extends TdObject {
  /// **InputAudio** *(inputAudio)* - basic class
  ///
  /// An audio to be sent.
  ///
  /// * [audio]: Audio file to be sent.
  /// * [albumCoverThumbnail]: Thumbnail of the cover for the album; pass null to skip thumbnail uploading *(optional)*.
  /// * [duration]: Duration of the audio, in seconds; may be replaced by the server.
  /// * [title]: Title of the audio; 0-64 characters; may be replaced by the server.
  /// * [performer]: Performer of the audio; 0-64 characters, may be replaced by the server.
  const InputAudio({
    required this.audio,
    this.albumCoverThumbnail,
    required this.duration,
    required this.title,
    required this.performer,
  });

  /// Audio file to be sent
  final InputFile audio;

  /// Thumbnail of the cover for the album; pass null to skip thumbnail uploading
  final InputThumbnail? albumCoverThumbnail;

  /// Duration of the audio, in seconds; may be replaced by the server
  final int duration;

  /// Title of the audio; 0-64 characters; may be replaced by the server
  final String title;

  /// Performer of the audio; 0-64 characters, may be replaced by the server
  final String performer;

  /// Parse from a json
  factory InputAudio.fromJson(Map<String, dynamic> json) => InputAudio(
        audio: InputFile.fromJson(json['audio']),
        albumCoverThumbnail: json['album_cover_thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['album_cover_thumbnail']),
        duration: json['duration'],
        title: json['title'],
        performer: json['performer'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
      "album_cover_thumbnail": albumCoverThumbnail?.toJson(),
      "duration": duration,
      "title": title,
      "performer": performer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: Audio file to be sent
  /// * [album_cover_thumbnail]: Thumbnail of the cover for the album; pass null to skip thumbnail uploading
  /// * [duration]: Duration of the audio, in seconds; may be replaced by the server
  /// * [title]: Title of the audio; 0-64 characters; may be replaced by the server
  /// * [performer]: Performer of the audio; 0-64 characters, may be replaced by the server
  InputAudio copyWith({
    InputFile? audio,
    InputThumbnail? albumCoverThumbnail,
    int? duration,
    String? title,
    String? performer,
  }) =>
      InputAudio(
        audio: audio ?? this.audio,
        albumCoverThumbnail: albumCoverThumbnail ?? this.albumCoverThumbnail,
        duration: duration ?? this.duration,
        title: title ?? this.title,
        performer: performer ?? this.performer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
