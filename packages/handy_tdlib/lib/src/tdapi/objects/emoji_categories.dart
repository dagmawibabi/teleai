part of '../tdapi.dart';

/// **EmojiCategories** *(emojiCategories)* - basic class
///
/// Represents a list of emoji categories.
///
/// * [categories]: List of categories.
final class EmojiCategories extends TdObject {
  /// **EmojiCategories** *(emojiCategories)* - basic class
  ///
  /// Represents a list of emoji categories.
  ///
  /// * [categories]: List of categories.
  const EmojiCategories({
    required this.categories,
    this.extra,
    this.clientId,
  });

  /// List of categories
  final List<EmojiCategory> categories;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory EmojiCategories.fromJson(Map<String, dynamic> json) =>
      EmojiCategories(
        categories: List<EmojiCategory>.from((json['categories'] ?? [])
            .map((item) => EmojiCategory.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "categories": categories.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [categories]: List of categories
  EmojiCategories copyWith({
    List<EmojiCategory>? categories,
    dynamic extra,
    int? clientId,
  }) =>
      EmojiCategories(
        categories: categories ?? this.categories,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiCategories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
