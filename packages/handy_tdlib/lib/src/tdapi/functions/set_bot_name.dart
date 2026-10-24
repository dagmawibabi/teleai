part of '../tdapi.dart';

/// **SetBotName** *(setBotName)* - TDLib function
///
/// Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true.
///
/// * [botUserId]: Identifier of the target bot.
/// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name.
/// * [name]: New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty.
///
/// [Ok] is returned on completion.
final class SetBotName extends TdFunction {
  /// **SetBotName** *(setBotName)* - TDLib function
  ///
  /// Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [languageCode]: A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name.
  /// * [name]: New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty.
  ///
  /// [Ok] is returned on completion.
  const SetBotName({
    required this.botUserId,
    required this.languageCode,
    required this.name,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name
  final String languageCode;

  /// New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "language_code": languageCode,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [language_code]: A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name
  /// * [name]: New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty
  SetBotName copyWith({
    int? botUserId,
    String? languageCode,
    String? name,
  }) =>
      SetBotName(
        botUserId: botUserId ?? this.botUserId,
        languageCode: languageCode ?? this.languageCode,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBotName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
