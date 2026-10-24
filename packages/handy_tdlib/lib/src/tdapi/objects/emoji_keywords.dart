part of '../tdapi.dart';

/// **EmojiKeywords** *(emojiKeywords)* - basic class
///
/// Represents a list of emojis with their keywords.
///
/// * [emojiKeywords]: List of emojis with their keywords.
final class EmojiKeywords extends TdObject {
  /// **EmojiKeywords** *(emojiKeywords)* - basic class
  ///
  /// Represents a list of emojis with their keywords.
  ///
  /// * [emojiKeywords]: List of emojis with their keywords.
  const EmojiKeywords({
    required this.emojiKeywords,
    this.extra,
    this.clientId,
  });

  /// List of emojis with their keywords
  final List<EmojiKeyword> emojiKeywords;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory EmojiKeywords.fromJson(Map<String, dynamic> json) => EmojiKeywords(
        emojiKeywords: List<EmojiKeyword>.from((json['emoji_keywords'] ?? [])
            .map((item) => EmojiKeyword.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emoji_keywords": emojiKeywords.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji_keywords]: List of emojis with their keywords
  EmojiKeywords copyWith({
    List<EmojiKeyword>? emojiKeywords,
    dynamic extra,
    int? clientId,
  }) =>
      EmojiKeywords(
        emojiKeywords: emojiKeywords ?? this.emojiKeywords,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiKeywords';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
