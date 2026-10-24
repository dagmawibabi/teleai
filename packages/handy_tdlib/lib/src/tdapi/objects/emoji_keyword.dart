part of '../tdapi.dart';

/// **EmojiKeyword** *(emojiKeyword)* - basic class
///
/// Represents an emoji with its keyword.
///
/// * [emoji]: The emoji.
/// * [keyword]: The keyword.
final class EmojiKeyword extends TdObject {
  /// **EmojiKeyword** *(emojiKeyword)* - basic class
  ///
  /// Represents an emoji with its keyword.
  ///
  /// * [emoji]: The emoji.
  /// * [keyword]: The keyword.
  const EmojiKeyword({
    required this.emoji,
    required this.keyword,
  });

  /// The emoji
  final String emoji;

  /// The keyword
  final String keyword;

  /// Parse from a json
  factory EmojiKeyword.fromJson(Map<String, dynamic> json) => EmojiKeyword(
        emoji: json['emoji'],
        keyword: json['keyword'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emoji": emoji,
      "keyword": keyword,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji]: The emoji
  /// * [keyword]: The keyword
  EmojiKeyword copyWith({
    String? emoji,
    String? keyword,
  }) =>
      EmojiKeyword(
        emoji: emoji ?? this.emoji,
        keyword: keyword ?? this.keyword,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiKeyword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
