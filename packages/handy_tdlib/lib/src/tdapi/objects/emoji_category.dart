part of '../tdapi.dart';

/// **EmojiCategory** *(emojiCategory)* - basic class
///
/// Describes an emoji category.
///
/// * [name]: Name of the category.
/// * [icon]: Custom emoji sticker, which represents icon of the category.
/// * [source]: Source of stickers for the emoji category.
/// * [isGreeting]: True, if the category must be shown first when choosing a sticker for the start page.
final class EmojiCategory extends TdObject {
  /// **EmojiCategory** *(emojiCategory)* - basic class
  ///
  /// Describes an emoji category.
  ///
  /// * [name]: Name of the category.
  /// * [icon]: Custom emoji sticker, which represents icon of the category.
  /// * [source]: Source of stickers for the emoji category.
  /// * [isGreeting]: True, if the category must be shown first when choosing a sticker for the start page.
  const EmojiCategory({
    required this.name,
    required this.icon,
    required this.source,
    required this.isGreeting,
  });

  /// Name of the category
  final String name;

  /// Custom emoji sticker, which represents icon of the category
  final Sticker icon;

  /// Source of stickers for the emoji category
  final EmojiCategorySource source;

  /// True, if the category must be shown first when choosing a sticker for the start page
  final bool isGreeting;

  /// Parse from a json
  factory EmojiCategory.fromJson(Map<String, dynamic> json) => EmojiCategory(
        name: json['name'],
        icon: Sticker.fromJson(json['icon']),
        source: EmojiCategorySource.fromJson(json['source']),
        isGreeting: json['is_greeting'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "icon": icon.toJson(),
      "source": source.toJson(),
      "is_greeting": isGreeting,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the category
  /// * [icon]: Custom emoji sticker, which represents icon of the category
  /// * [source]: Source of stickers for the emoji category
  /// * [is_greeting]: True, if the category must be shown first when choosing a sticker for the start page
  EmojiCategory copyWith({
    String? name,
    Sticker? icon,
    EmojiCategorySource? source,
    bool? isGreeting,
  }) =>
      EmojiCategory(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        source: source ?? this.source,
        isGreeting: isGreeting ?? this.isGreeting,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiCategory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
