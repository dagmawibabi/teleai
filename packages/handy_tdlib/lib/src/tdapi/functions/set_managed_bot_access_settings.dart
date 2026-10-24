part of '../tdapi.dart';

/// **SetManagedBotAccessSettings** *(setManagedBotAccessSettings)* - TDLib function
///
/// Sets access settings of a managed bot; for bots only.
///
/// * [botUserId]: Identifier of the managed bot.
/// * [settings]: New access settings.
///
/// [Ok] is returned on completion.
final class SetManagedBotAccessSettings extends TdFunction {
  /// **SetManagedBotAccessSettings** *(setManagedBotAccessSettings)* - TDLib function
  ///
  /// Sets access settings of a managed bot; for bots only.
  ///
  /// * [botUserId]: Identifier of the managed bot.
  /// * [settings]: New access settings.
  ///
  /// [Ok] is returned on completion.
  const SetManagedBotAccessSettings({
    required this.botUserId,
    required this.settings,
  });

  /// Identifier of the managed bot
  final int botUserId;

  /// New access settings
  final BotAccessSettings settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "settings": settings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the managed bot
  /// * [settings]: New access settings
  SetManagedBotAccessSettings copyWith({
    int? botUserId,
    BotAccessSettings? settings,
  }) =>
      SetManagedBotAccessSettings(
        botUserId: botUserId ?? this.botUserId,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setManagedBotAccessSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
