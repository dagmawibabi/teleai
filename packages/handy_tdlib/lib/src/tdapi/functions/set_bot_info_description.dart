part of '../tdapi.dart';

/// **SetBotInfoDescription** *(setBotInfoDescription)* - TDLib function
///
/// Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.can_be_edited == true.
///
/// * [botUserId]: Identifier of the target bot.
/// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description.
/// * [description]: New bot's description on the specified language.
///
/// [Ok] is returned on completion.
final class SetBotInfoDescription extends TdFunction {
  /// **SetBotInfoDescription** *(setBotInfoDescription)* - TDLib function
  ///
  /// Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.can_be_edited == true.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description.
  /// * [description]: New bot's description on the specified language.
  ///
  /// [Ok] is returned on completion.
  const SetBotInfoDescription({
    required this.botUserId,
    required this.languageCode,
    required this.description,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description
  final String languageCode;

  /// New bot's description on the specified language
  final String description;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "description": description,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [language_code]: A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description
  /// * [description]: New bot's description on the specified language
  SetBotInfoDescription copyWith({
    int? botUserId,
    String? languageCode,
    String? description,
  }) =>
      SetBotInfoDescription(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBotInfoDescription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
