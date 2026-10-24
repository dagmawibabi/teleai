part of '../tdapi.dart';

/// **InputPollOption** *(inputPollOption)* - basic class
///
/// Describes one answer option of a poll to be created.
///
/// * [text]: Option text; 1-100 characters. Only custom emoji entities are allowed to be added and only by Premium users.
/// * [media]: Option media; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaLink, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaSticker, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
final class InputPollOption extends TdObject {
  /// **InputPollOption** *(inputPollOption)* - basic class
  ///
  /// Describes one answer option of a poll to be created.
  ///
  /// * [text]: Option text; 1-100 characters. Only custom emoji entities are allowed to be added and only by Premium users.
  /// * [media]: Option media; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaLink, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaSticker, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
  const InputPollOption({
    required this.text,
    this.media,
  });

  /// Option text; 1-100 characters. Only custom emoji entities are allowed to be added and only by Premium users
  final FormattedText text;

  /// Option media; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaLink, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaSticker, inputPollMediaVenue, or inputPollMediaVideo without caption
  final InputPollMedia? media;

  /// Parse from a json
  factory InputPollOption.fromJson(Map<String, dynamic> json) =>
      InputPollOption(
        text: FormattedText.fromJson(json['text']),
        media: json['media'] == null
            ? null
            : InputPollMedia.fromJson(json['media']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "media": media?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Option text; 1-100 characters. Only custom emoji entities are allowed to be added and only by Premium users
  /// * [media]: Option media; pass null if none. Must be one of the following types:. inputPollMediaAnimation, inputPollMediaLink, inputPollMediaLocation, inputPollMediaPhoto, inputPollMediaSticker, inputPollMediaVenue, or inputPollMediaVideo without caption
  InputPollOption copyWith({
    FormattedText? text,
    InputPollMedia? media,
  }) =>
      InputPollOption(
        text: text ?? this.text,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
