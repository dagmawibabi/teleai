part of '../tdapi.dart';

/// **EmojiCategorySource** *(emojiCategorySource)* - parent
///
/// Describes source of stickers for an emoji category.
sealed class EmojiCategorySource extends TdObject {
  /// **EmojiCategorySource** *(emojiCategorySource)* - parent
  ///
  /// Describes source of stickers for an emoji category.
  const EmojiCategorySource();

  /// a EmojiCategorySource return type can be :
  /// * [EmojiCategorySourceSearch]
  /// * [EmojiCategorySourcePremium]
  factory EmojiCategorySource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case EmojiCategorySourceSearch.defaultObjectId:
        return EmojiCategorySourceSearch.fromJson(json);
      case EmojiCategorySourcePremium.defaultObjectId:
        return EmojiCategorySourcePremium.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of EmojiCategorySource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  EmojiCategorySource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'emojiCategorySource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiCategorySourceSearch** *(emojiCategorySourceSearch)* - child of EmojiCategorySource
///
/// The category contains a list of similar emoji to search for in getStickers and searchStickers for stickers,. or getInlineQueryResults with the bot getOption("animation_search_bot_username") for animations.
///
/// * [emojis]: List of emojis to search for.
final class EmojiCategorySourceSearch extends EmojiCategorySource {
  /// **EmojiCategorySourceSearch** *(emojiCategorySourceSearch)* - child of EmojiCategorySource
  ///
  /// The category contains a list of similar emoji to search for in getStickers and searchStickers for stickers,. or getInlineQueryResults with the bot getOption("animation_search_bot_username") for animations.
  ///
  /// * [emojis]: List of emojis to search for.
  const EmojiCategorySourceSearch({
    required this.emojis,
  });

  /// List of emojis to search for
  final List<String> emojis;

  /// Parse from a json
  factory EmojiCategorySourceSearch.fromJson(Map<String, dynamic> json) =>
      EmojiCategorySourceSearch(
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emojis]: List of emojis to search for
  @override
  EmojiCategorySourceSearch copyWith({
    List<String>? emojis,
  }) =>
      EmojiCategorySourceSearch(
        emojis: emojis ?? this.emojis,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiCategorySourceSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmojiCategorySourcePremium** *(emojiCategorySourcePremium)* - child of EmojiCategorySource
///
/// The category contains premium stickers that must be found by getPremiumStickers.
final class EmojiCategorySourcePremium extends EmojiCategorySource {
  /// **EmojiCategorySourcePremium** *(emojiCategorySourcePremium)* - child of EmojiCategorySource
  ///
  /// The category contains premium stickers that must be found by getPremiumStickers.
  const EmojiCategorySourcePremium();

  /// Parse from a json
  factory EmojiCategorySourcePremium.fromJson(Map<String, dynamic> json) =>
      const EmojiCategorySourcePremium();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  EmojiCategorySourcePremium copyWith() => const EmojiCategorySourcePremium();

  /// TDLib object type
  static const String defaultObjectId = 'emojiCategorySourcePremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
