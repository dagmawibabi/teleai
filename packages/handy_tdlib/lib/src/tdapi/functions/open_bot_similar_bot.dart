part of '../tdapi.dart';

/// **OpenBotSimilarBot** *(openBotSimilarBot)* - TDLib function
///
/// Informs TDLib that a bot was opened from the list of similar bots.
///
/// * [botUserId]: Identifier of the original bot, which similar bots were requested.
/// * [openedBotUserId]: Identifier of the opened bot.
///
/// [Ok] is returned on completion.
final class OpenBotSimilarBot extends TdFunction {
  /// **OpenBotSimilarBot** *(openBotSimilarBot)* - TDLib function
  ///
  /// Informs TDLib that a bot was opened from the list of similar bots.
  ///
  /// * [botUserId]: Identifier of the original bot, which similar bots were requested.
  /// * [openedBotUserId]: Identifier of the opened bot.
  ///
  /// [Ok] is returned on completion.
  const OpenBotSimilarBot({
    required this.botUserId,
    required this.openedBotUserId,
  });

  /// Identifier of the original bot, which similar bots were requested
  final int botUserId;

  /// Identifier of the opened bot
  final int openedBotUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "opened_bot_user_id": openedBotUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the original bot, which similar bots were requested
  /// * [opened_bot_user_id]: Identifier of the opened bot
  OpenBotSimilarBot copyWith({
    int? botUserId,
    int? openedBotUserId,
  }) =>
      OpenBotSimilarBot(
        botUserId: botUserId ?? this.botUserId,
        openedBotUserId: openedBotUserId ?? this.openedBotUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'openBotSimilarBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
