part of '../tdapi.dart';

/// **SetBotInfoShortDescription** *(setBotInfoShortDescription)* - TDLib function
///
/// Sets the text shown on a bot's profile page and sent together with the link when users share the bot. Can be called only if userTypeBot.can_be_edited == true.
///
/// * [botUserId]: Identifier of the target bot.
/// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description.
/// * [shortDescription]: New bot's short description on the specified language.
///
/// [Ok] is returned on completion.
final class SetBotInfoShortDescription extends TdFunction {
  /// **SetBotInfoShortDescription** *(setBotInfoShortDescription)* - TDLib function
  ///
  /// Sets the text shown on a bot's profile page and sent together with the link when users share the bot. Can be called only if userTypeBot.can_be_edited == true.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description.
  /// * [shortDescription]: New bot's short description on the specified language.
  ///
  /// [Ok] is returned on completion.
  const SetBotInfoShortDescription({
    required this.botUserId,
    required this.languageCode,
    required this.shortDescription,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description
  final String languageCode;

  /// New bot's short description on the specified language
  final String shortDescription;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "short_description": shortDescription,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [language_code]: A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description
  /// * [short_description]: New bot's short description on the specified language
  SetBotInfoShortDescription copyWith({
    int? botUserId,
    String? languageCode,
    String? shortDescription,
  }) =>
      SetBotInfoShortDescription(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        shortDescription: shortDescription ?? this.shortDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBotInfoShortDescription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
