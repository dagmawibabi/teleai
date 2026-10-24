part of '../tdapi.dart';

/// **AnimatedChatPhoto** *(animatedChatPhoto)* - basic class
///
/// Animated variant of a chat photo in MPEG4 format.
///
/// * [length]: Animation width and height.
/// * [file]: Information about the animation file.
/// * [mainFrameTimestamp]: Timestamp of the frame, used as a static chat photo.
final class AnimatedChatPhoto extends TdObject {
  /// **AnimatedChatPhoto** *(animatedChatPhoto)* - basic class
  ///
  /// Animated variant of a chat photo in MPEG4 format.
  ///
  /// * [length]: Animation width and height.
  /// * [file]: Information about the animation file.
  /// * [mainFrameTimestamp]: Timestamp of the frame, used as a static chat photo.
  const AnimatedChatPhoto({
    required this.length,
    required this.file,
    required this.mainFrameTimestamp,
  });

  /// Animation width and height
  final int length;

  /// Information about the animation file
  final File file;

  /// Timestamp of the frame, used as a static chat photo
  final double mainFrameTimestamp;

  /// Parse from a json
  factory AnimatedChatPhoto.fromJson(Map<String, dynamic> json) =>
      AnimatedChatPhoto(
        length: json['length'],
        file: File.fromJson(json['file']),
        mainFrameTimestamp: json['main_frame_timestamp'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "length": length,
      "file": file.toJson(),
      "main_frame_timestamp": mainFrameTimestamp,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [length]: Animation width and height
  /// * [file]: Information about the animation file
  /// * [main_frame_timestamp]: Timestamp of the frame, used as a static chat photo
  AnimatedChatPhoto copyWith({
    int? length,
    File? file,
    double? mainFrameTimestamp,
  }) =>
      AnimatedChatPhoto(
        length: length ?? this.length,
        file: file ?? this.file,
        mainFrameTimestamp: mainFrameTimestamp ?? this.mainFrameTimestamp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'animatedChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
