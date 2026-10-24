part of '../tdapi.dart';

/// **EphemeralMessageContent** *(ephemeralMessageContent)* - basic class
///
/// Describes an ephemeral content of a regular message, which must be shown instead of the regular content.
///
/// * [canBeSaved]: True, if content of the message can be saved locally.
/// * [hasTimestampedMedia]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message.
/// * [content]: Content of the message.
/// * [replyMarkup]: Reply markup for the message; may be null if none *(optional)*.
final class EphemeralMessageContent extends TdObject {
  /// **EphemeralMessageContent** *(ephemeralMessageContent)* - basic class
  ///
  /// Describes an ephemeral content of a regular message, which must be shown instead of the regular content.
  ///
  /// * [canBeSaved]: True, if content of the message can be saved locally.
  /// * [hasTimestampedMedia]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message.
  /// * [content]: Content of the message.
  /// * [replyMarkup]: Reply markup for the message; may be null if none *(optional)*.
  const EphemeralMessageContent({
    required this.canBeSaved,
    required this.hasTimestampedMedia,
    required this.content,
    this.replyMarkup,
  });

  /// True, if content of the message can be saved locally
  final bool canBeSaved;

  /// True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
  final bool hasTimestampedMedia;

  /// Content of the message
  final MessageContent content;

  /// Reply markup for the message; may be null if none
  final ReplyMarkup? replyMarkup;

  /// Parse from a json
  factory EphemeralMessageContent.fromJson(Map<String, dynamic> json) =>
      EphemeralMessageContent(
        canBeSaved: json['can_be_saved'],
        hasTimestampedMedia: json['has_timestamped_media'],
        content: MessageContent.fromJson(json['content']),
        replyMarkup: json['reply_markup'] == null
            ? null
            : ReplyMarkup.fromJson(json['reply_markup']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_be_saved": canBeSaved,
      "has_timestamped_media": hasTimestampedMedia,
      "content": content.toJson(),
      "reply_markup": replyMarkup?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_be_saved]: True, if content of the message can be saved locally
  /// * [has_timestamped_media]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
  /// * [content]: Content of the message
  /// * [reply_markup]: Reply markup for the message; may be null if none
  EphemeralMessageContent copyWith({
    bool? canBeSaved,
    bool? hasTimestampedMedia,
    MessageContent? content,
    ReplyMarkup? replyMarkup,
  }) =>
      EphemeralMessageContent(
        canBeSaved: canBeSaved ?? this.canBeSaved,
        hasTimestampedMedia: hasTimestampedMedia ?? this.hasTimestampedMedia,
        content: content ?? this.content,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'ephemeralMessageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
