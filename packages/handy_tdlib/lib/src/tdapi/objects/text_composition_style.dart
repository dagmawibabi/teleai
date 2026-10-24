part of '../tdapi.dart';

/// **TextCompositionStyle** *(textCompositionStyle)* - basic class
///
/// Describes a style that can be used to compose a text.
///
/// * [name]: Name of the style.
/// * [customEmojiId]: Identifier of the custom emoji corresponding to the style; 0 if none.
/// * [title]: Title of the style in the user application's language.
/// * [isCustom]: True, if the style is created by a user.
/// * [isCreator]: True, if the user is creator of the style.
/// * [installCount]: Number of users that installed the style; for created custom styles only; 0 if unknown.
/// * [prompt]: Prompt of the style; for created custom styles only.
/// * [creatorUserId]: User identifier of the creator of the style; 0 if none or unknown.
/// * [englishExample]: Example of the style usage in English; may be null if unknown *(optional)*.
final class TextCompositionStyle extends TdObject {
  /// **TextCompositionStyle** *(textCompositionStyle)* - basic class
  ///
  /// Describes a style that can be used to compose a text.
  ///
  /// * [name]: Name of the style.
  /// * [customEmojiId]: Identifier of the custom emoji corresponding to the style; 0 if none.
  /// * [title]: Title of the style in the user application's language.
  /// * [isCustom]: True, if the style is created by a user.
  /// * [isCreator]: True, if the user is creator of the style.
  /// * [installCount]: Number of users that installed the style; for created custom styles only; 0 if unknown.
  /// * [prompt]: Prompt of the style; for created custom styles only.
  /// * [creatorUserId]: User identifier of the creator of the style; 0 if none or unknown.
  /// * [englishExample]: Example of the style usage in English; may be null if unknown *(optional)*.
  const TextCompositionStyle({
    required this.name,
    required this.customEmojiId,
    required this.title,
    required this.isCustom,
    required this.isCreator,
    required this.installCount,
    required this.prompt,
    required this.creatorUserId,
    this.englishExample,
    this.extra,
    this.clientId,
  });

  /// Name of the style
  final String name;

  /// Identifier of the custom emoji corresponding to the style; 0 if none
  final int customEmojiId;

  /// Title of the style in the user application's language
  final String title;

  /// True, if the style is created by a user
  final bool isCustom;

  /// True, if the user is creator of the style
  final bool isCreator;

  /// Number of users that installed the style; for created custom styles only; 0 if unknown
  final int installCount;

  /// Prompt of the style; for created custom styles only
  final String prompt;

  /// User identifier of the creator of the style; 0 if none or unknown
  final int creatorUserId;

  /// Example of the style usage in English; may be null if unknown
  final TextCompositionStyleExample? englishExample;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TextCompositionStyle.fromJson(Map<String, dynamic> json) =>
      TextCompositionStyle(
        name: json['name'],
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.tryParse(json['custom_emoji_id'] ?? "") ?? 0,
        title: json['title'],
        isCustom: json['is_custom'],
        isCreator: json['is_creator'],
        installCount: json['install_count'],
        prompt: json['prompt'],
        creatorUserId: json['creator_user_id'] ?? 0,
        englishExample: json['english_example'] == null
            ? null
            : TextCompositionStyleExample.fromJson(json['english_example']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "custom_emoji_id": customEmojiId,
      "title": title,
      "is_custom": isCustom,
      "is_creator": isCreator,
      "install_count": installCount,
      "prompt": prompt,
      "creator_user_id": creatorUserId,
      "english_example": englishExample?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the style
  /// * [custom_emoji_id]: Identifier of the custom emoji corresponding to the style; 0 if none
  /// * [title]: Title of the style in the user application's language
  /// * [is_custom]: True, if the style is created by a user
  /// * [is_creator]: True, if the user is creator of the style
  /// * [install_count]: Number of users that installed the style; for created custom styles only; 0 if unknown
  /// * [prompt]: Prompt of the style; for created custom styles only
  /// * [creator_user_id]: User identifier of the creator of the style; 0 if none or unknown
  /// * [english_example]: Example of the style usage in English; may be null if unknown
  TextCompositionStyle copyWith({
    String? name,
    int? customEmojiId,
    String? title,
    bool? isCustom,
    bool? isCreator,
    int? installCount,
    String? prompt,
    int? creatorUserId,
    TextCompositionStyleExample? englishExample,
    dynamic extra,
    int? clientId,
  }) =>
      TextCompositionStyle(
        name: name ?? this.name,
        customEmojiId: customEmojiId ?? this.customEmojiId,
        title: title ?? this.title,
        isCustom: isCustom ?? this.isCustom,
        isCreator: isCreator ?? this.isCreator,
        installCount: installCount ?? this.installCount,
        prompt: prompt ?? this.prompt,
        creatorUserId: creatorUserId ?? this.creatorUserId,
        englishExample: englishExample ?? this.englishExample,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
