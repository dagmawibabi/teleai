part of '../tdapi.dart';

/// **ForumTopicIcon** *(forumTopicIcon)* - basic class
///
/// Describes a forum topic icon.
///
/// * [color]: Color of the topic icon in RGB format.
/// * [customEmojiId]: Unique identifier of the custom emoji shown on the topic icon; 0 if none.
final class ForumTopicIcon extends TdObject {
  /// **ForumTopicIcon** *(forumTopicIcon)* - basic class
  ///
  /// Describes a forum topic icon.
  ///
  /// * [color]: Color of the topic icon in RGB format.
  /// * [customEmojiId]: Unique identifier of the custom emoji shown on the topic icon; 0 if none.
  const ForumTopicIcon({
    required this.color,
    required this.customEmojiId,
  });

  /// Color of the topic icon in RGB format
  final int color;

  /// Unique identifier of the custom emoji shown on the topic icon; 0 if none
  final int customEmojiId;

  /// Parse from a json
  factory ForumTopicIcon.fromJson(Map<String, dynamic> json) => ForumTopicIcon(
        color: json['color'],
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.tryParse(json['custom_emoji_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "color": color,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [color]: Color of the topic icon in RGB format
  /// * [custom_emoji_id]: Unique identifier of the custom emoji shown on the topic icon; 0 if none
  ForumTopicIcon copyWith({
    int? color,
    int? customEmojiId,
  }) =>
      ForumTopicIcon(
        color: color ?? this.color,
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'forumTopicIcon';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
