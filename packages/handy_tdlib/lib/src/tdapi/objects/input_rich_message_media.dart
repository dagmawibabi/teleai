part of '../tdapi.dart';

/// **InputRichMessageMedia** *(inputRichMessageMedia)* - basic class
///
/// Describes a media to be used in a sent rich message.
///
/// * [id]: Unique identifier of the media; 1-64 base64url characters.
/// * [media]: The media to send. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessagePhoto, inputMessageVideo, or inputMessageVoiceNote.
final class InputRichMessageMedia extends TdObject {
  /// **InputRichMessageMedia** *(inputRichMessageMedia)* - basic class
  ///
  /// Describes a media to be used in a sent rich message.
  ///
  /// * [id]: Unique identifier of the media; 1-64 base64url characters.
  /// * [media]: The media to send. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessagePhoto, inputMessageVideo, or inputMessageVoiceNote.
  const InputRichMessageMedia({
    required this.id,
    required this.media,
  });

  /// Unique identifier of the media; 1-64 base64url characters
  final String id;

  /// The media to send. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessagePhoto, inputMessageVideo, or inputMessageVoiceNote
  final InputMessageContent media;

  /// Parse from a json
  factory InputRichMessageMedia.fromJson(Map<String, dynamic> json) =>
      InputRichMessageMedia(
        id: json['id'],
        media: InputMessageContent.fromJson(json['media']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "media": media.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the media; 1-64 base64url characters
  /// * [media]: The media to send. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessagePhoto, inputMessageVideo, or inputMessageVoiceNote
  InputRichMessageMedia copyWith({
    String? id,
    InputMessageContent? media,
  }) =>
      InputRichMessageMedia(
        id: id ?? this.id,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputRichMessageMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
