part of '../tdapi.dart';

/// **SetBusinessConnectedBot** *(setBusinessConnectedBot)* - TDLib function
///
/// Adds or changes business bot that is connected to the current user account.
///
/// * [bot]: Connection settings for the bot.
///
/// [Ok] is returned on completion.
final class SetBusinessConnectedBot extends TdFunction {
  /// **SetBusinessConnectedBot** *(setBusinessConnectedBot)* - TDLib function
  ///
  /// Adds or changes business bot that is connected to the current user account.
  ///
  /// * [bot]: Connection settings for the bot.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessConnectedBot({
    required this.bot,
  });

  /// Connection settings for the bot
  final BusinessConnectedBot bot;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot": bot.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot]: Connection settings for the bot
  SetBusinessConnectedBot copyWith({
    BusinessConnectedBot? bot,
  }) =>
      SetBusinessConnectedBot(
        bot: bot ?? this.bot,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
