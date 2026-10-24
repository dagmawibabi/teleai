part of '../tdapi.dart';

/// **GetBotInfoShortDescription** *(getBotInfoShortDescription)* - TDLib function
///
/// Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true.
///
/// * [botUserId]: Identifier of the target bot.
/// * [languageCode]: A two-letter ISO 639-1 language code or an empty string.
///
/// [Text] is returned on completion.
final class GetBotInfoShortDescription extends TdFunction {
  /// **GetBotInfoShortDescription** *(getBotInfoShortDescription)* - TDLib function
  ///
  /// Returns the text shown on a bot's profile page and sent together with the link when users share the bot in the given language. Can be called only if userTypeBot.can_be_edited == true.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [languageCode]: A two-letter ISO 639-1 language code or an empty string.
  ///
  /// [Text] is returned on completion.
  const GetBotInfoShortDescription({
    required this.botUserId,
    required this.languageCode,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// A two-letter ISO 639-1 language code or an empty string
  final String languageCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [language_code]: A two-letter ISO 639-1 language code or an empty string
  GetBotInfoShortDescription copyWith({
    int? botUserId,
    String? languageCode,
  }) =>
      GetBotInfoShortDescription(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBotInfoShortDescription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
