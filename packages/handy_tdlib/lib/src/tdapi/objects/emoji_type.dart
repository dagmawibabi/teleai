part of '../tdapi.dart';

/// **EmojiType** *(emojiType)* - parent
///
/// Describes an emoji.
sealed class EmojiType extends TdObject {
  /// **EmojiType** *(emojiType)* - parent
  ///
  /// Describes an emoji.
  const EmojiType();

  /// a EmojiType return type can be :
  /// * [EmojiTypeRegular]
  /// * [EmojiTypeCustomEmoji]
  factory EmojiType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case EmojiTypeRegular.defaultObjectId:
        return EmojiTypeRegular.fromJson(json);
      case EmojiTypeCustomEmoji.defaultObjectId:
        return EmojiTypeCustomEmoji.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of EmojiType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  EmojiType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'emojiType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiTypeRegular** *(emojiTypeRegular)* - child of EmojiType
///
/// A regular emoji.
///
/// * [emoji]: Text representation of the emoji.
final class EmojiTypeRegular extends EmojiType {
  /// **EmojiTypeRegular** *(emojiTypeRegular)* - child of EmojiType
  ///
  /// A regular emoji.
  ///
  /// * [emoji]: Text representation of the emoji.
  const EmojiTypeRegular({
    required this.emoji,
  });

  /// Text representation of the emoji
  final String emoji;

  /// Parse from a json
  factory EmojiTypeRegular.fromJson(Map<String, dynamic> json) =>
      EmojiTypeRegular(
        emoji: json['emoji'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emoji": emoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji]: Text representation of the emoji
  @override
  EmojiTypeRegular copyWith({
    String? emoji,
  }) =>
      EmojiTypeRegular(
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiTypeCustomEmoji** *(emojiTypeCustomEmoji)* - child of EmojiType
///
/// A custom emoji.
///
/// * [customEmojiId]: Identifier of the custom emoji.
final class EmojiTypeCustomEmoji extends EmojiType {
  /// **EmojiTypeCustomEmoji** *(emojiTypeCustomEmoji)* - child of EmojiType
  ///
  /// A custom emoji.
  ///
  /// * [customEmojiId]: Identifier of the custom emoji.
  const EmojiTypeCustomEmoji({
    required this.customEmojiId,
  });

  /// Identifier of the custom emoji
  final int customEmojiId;

  /// Parse from a json
  factory EmojiTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      EmojiTypeCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Identifier of the custom emoji
  @override
  EmojiTypeCustomEmoji copyWith({
    int? customEmojiId,
  }) =>
      EmojiTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
