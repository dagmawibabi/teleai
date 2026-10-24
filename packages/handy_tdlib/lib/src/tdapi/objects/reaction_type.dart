part of '../tdapi.dart';

/// **ReactionType** *(reactionType)* - parent
///
/// Describes type of message reaction.
sealed class ReactionType extends TdObject {
  /// **ReactionType** *(reactionType)* - parent
  ///
  /// Describes type of message reaction.
  const ReactionType();

  /// a ReactionType return type can be :
  /// * [ReactionTypeEmoji]
  /// * [ReactionTypeCustomEmoji]
  /// * [ReactionTypePaid]
  factory ReactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReactionTypeEmoji.defaultObjectId:
        return ReactionTypeEmoji.fromJson(json);
      case ReactionTypeCustomEmoji.defaultObjectId:
        return ReactionTypeCustomEmoji.fromJson(json);
      case ReactionTypePaid.defaultObjectId:
        return ReactionTypePaid.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionTypeEmoji** *(reactionTypeEmoji)* - child of ReactionType
///
/// A reaction with an emoji.
///
/// * [emoji]: Text representation of the reaction.
final class ReactionTypeEmoji extends ReactionType {
  /// **ReactionTypeEmoji** *(reactionTypeEmoji)* - child of ReactionType
  ///
  /// A reaction with an emoji.
  ///
  /// * [emoji]: Text representation of the reaction.
  const ReactionTypeEmoji({
    required this.emoji,
  });

  /// Text representation of the reaction
  final String emoji;

  /// Parse from a json
  factory ReactionTypeEmoji.fromJson(Map<String, dynamic> json) =>
      ReactionTypeEmoji(
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
  /// * [emoji]: Text representation of the reaction
  @override
  ReactionTypeEmoji copyWith({
    String? emoji,
  }) =>
      ReactionTypeEmoji(
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reactionTypeEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionTypeCustomEmoji** *(reactionTypeCustomEmoji)* - child of ReactionType
///
/// A reaction with a custom emoji.
///
/// * [customEmojiId]: Unique identifier of the custom emoji.
final class ReactionTypeCustomEmoji extends ReactionType {
  /// **ReactionTypeCustomEmoji** *(reactionTypeCustomEmoji)* - child of ReactionType
  ///
  /// A reaction with a custom emoji.
  ///
  /// * [customEmojiId]: Unique identifier of the custom emoji.
  const ReactionTypeCustomEmoji({
    required this.customEmojiId,
  });

  /// Unique identifier of the custom emoji
  final int customEmojiId;

  /// Parse from a json
  factory ReactionTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      ReactionTypeCustomEmoji(
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
  /// * [custom_emoji_id]: Unique identifier of the custom emoji
  @override
  ReactionTypeCustomEmoji copyWith({
    int? customEmojiId,
  }) =>
      ReactionTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reactionTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionTypePaid** *(reactionTypePaid)* - child of ReactionType
///
/// The paid reaction in a channel chat.
final class ReactionTypePaid extends ReactionType {
  /// **ReactionTypePaid** *(reactionTypePaid)* - child of ReactionType
  ///
  /// The paid reaction in a channel chat.
  const ReactionTypePaid();

  /// Parse from a json
  factory ReactionTypePaid.fromJson(Map<String, dynamic> json) =>
      const ReactionTypePaid();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReactionTypePaid copyWith() => const ReactionTypePaid();

  /// TDLib object type
  static const String defaultObjectId = 'reactionTypePaid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
