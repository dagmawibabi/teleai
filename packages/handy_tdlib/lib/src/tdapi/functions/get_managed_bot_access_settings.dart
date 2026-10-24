part of '../tdapi.dart';

/// **GetManagedBotAccessSettings** *(getManagedBotAccessSettings)* - TDLib function
///
/// Returns access settings of a managed bot; for bots only.
///
/// * [botUserId]: Identifier of the managed bot.
///
/// [BotAccessSettings] is returned on completion.
final class GetManagedBotAccessSettings extends TdFunction {
  /// **GetManagedBotAccessSettings** *(getManagedBotAccessSettings)* - TDLib function
  ///
  /// Returns access settings of a managed bot; for bots only.
  ///
  /// * [botUserId]: Identifier of the managed bot.
  ///
  /// [BotAccessSettings] is returned on completion.
  const GetManagedBotAccessSettings({
    required this.botUserId,
  });

  /// Identifier of the managed bot
  final int botUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the managed bot
  GetManagedBotAccessSettings copyWith({
    int? botUserId,
  }) =>
      GetManagedBotAccessSettings(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getManagedBotAccessSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
