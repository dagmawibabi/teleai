part of '../tdapi.dart';

/// **EmojiStatusCustomEmojis** *(emojiStatusCustomEmojis)* - basic class
///
/// Contains a list of custom emoji identifiers for emoji statuses.
///
/// * [customEmojiIds]: The list of custom emoji identifiers.
final class EmojiStatusCustomEmojis extends TdObject {
  /// **EmojiStatusCustomEmojis** *(emojiStatusCustomEmojis)* - basic class
  ///
  /// Contains a list of custom emoji identifiers for emoji statuses.
  ///
  /// * [customEmojiIds]: The list of custom emoji identifiers.
  const EmojiStatusCustomEmojis({
    required this.customEmojiIds,
    this.extra,
    this.clientId,
  });

  /// The list of custom emoji identifiers
  final List<int> customEmojiIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory EmojiStatusCustomEmojis.fromJson(Map<String, dynamic> json) =>
      EmojiStatusCustomEmojis(
        customEmojiIds: List<int>.from((json['custom_emoji_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_ids": customEmojiIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_ids]: The list of custom emoji identifiers
  EmojiStatusCustomEmojis copyWith({
    List<int>? customEmojiIds,
    dynamic extra,
    int? clientId,
  }) =>
      EmojiStatusCustomEmojis(
        customEmojiIds: customEmojiIds ?? this.customEmojiIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatusCustomEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
