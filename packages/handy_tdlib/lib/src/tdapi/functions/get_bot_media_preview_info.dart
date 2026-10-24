part of '../tdapi.dart';

/// **GetBotMediaPreviewInfo** *(getBotMediaPreviewInfo)* - TDLib function
///
/// Returns the list of media previews for the given language and the list of languages for which the bot has dedicated previews.
///
/// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
/// * [languageCode]: A two-letter ISO 639-1 language code for which to get previews. If empty, then default previews are returned.
///
/// [BotMediaPreviewInfo] is returned on completion.
final class GetBotMediaPreviewInfo extends TdFunction {
  /// **GetBotMediaPreviewInfo** *(getBotMediaPreviewInfo)* - TDLib function
  ///
  /// Returns the list of media previews for the given language and the list of languages for which the bot has dedicated previews.
  ///
  /// * [botUserId]: Identifier of the target bot. The bot must be owned and must have the main Web App.
  /// * [languageCode]: A two-letter ISO 639-1 language code for which to get previews. If empty, then default previews are returned.
  ///
  /// [BotMediaPreviewInfo] is returned on completion.
  const GetBotMediaPreviewInfo({
    required this.botUserId,
    required this.languageCode,
  });

  /// Identifier of the target bot. The bot must be owned and must have the main Web App
  final int botUserId;

  /// A two-letter ISO 639-1 language code for which to get previews. If empty, then default previews are returned
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
  /// * [bot_user_id]: Identifier of the target bot. The bot must be owned and must have the main Web App
  /// * [language_code]: A two-letter ISO 639-1 language code for which to get previews. If empty, then default previews are returned
  GetBotMediaPreviewInfo copyWith({
    int? botUserId,
    String? languageCode,
  }) =>
      GetBotMediaPreviewInfo(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBotMediaPreviewInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
