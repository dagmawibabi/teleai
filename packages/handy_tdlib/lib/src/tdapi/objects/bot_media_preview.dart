part of '../tdapi.dart';

/// **BotMediaPreview** *(botMediaPreview)* - basic class
///
/// Describes media previews of a bot.
///
/// * [date]: Point in time (Unix timestamp) when the preview was added or changed last time.
/// * [content]: Content of the preview; may only be of the types storyContentPhoto, storyContentVideo, or storyContentUnsupported.
final class BotMediaPreview extends TdObject {
  /// **BotMediaPreview** *(botMediaPreview)* - basic class
  ///
  /// Describes media previews of a bot.
  ///
  /// * [date]: Point in time (Unix timestamp) when the preview was added or changed last time.
  /// * [content]: Content of the preview; may only be of the types storyContentPhoto, storyContentVideo, or storyContentUnsupported.
  const BotMediaPreview({
    required this.date,
    required this.content,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) when the preview was added or changed last time
  final int date;

  /// Content of the preview; may only be of the types storyContentPhoto, storyContentVideo, or storyContentUnsupported
  final StoryContent content;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BotMediaPreview.fromJson(Map<String, dynamic> json) =>
      BotMediaPreview(
        date: json['date'],
        content: StoryContent.fromJson(json['content']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "date": date,
      "content": content.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [date]: Point in time (Unix timestamp) when the preview was added or changed last time
  /// * [content]: Content of the preview; may only be of the types storyContentPhoto, storyContentVideo, or storyContentUnsupported
  BotMediaPreview copyWith({
    int? date,
    StoryContent? content,
    dynamic extra,
    int? clientId,
  }) =>
      BotMediaPreview(
        date: date ?? this.date,
        content: content ?? this.content,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botMediaPreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
