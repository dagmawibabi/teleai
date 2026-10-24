part of '../tdapi.dart';

/// **GetBotSimilarBots** *(getBotSimilarBots)* - TDLib function
///
/// Returns a list of bots similar to the given bot.
///
/// * [botUserId]: User identifier of the target bot.
///
/// [Users] is returned on completion.
final class GetBotSimilarBots extends TdFunction {
  /// **GetBotSimilarBots** *(getBotSimilarBots)* - TDLib function
  ///
  /// Returns a list of bots similar to the given bot.
  ///
  /// * [botUserId]: User identifier of the target bot.
  ///
  /// [Users] is returned on completion.
  const GetBotSimilarBots({
    required this.botUserId,
  });

  /// User identifier of the target bot
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
  /// * [bot_user_id]: User identifier of the target bot
  GetBotSimilarBots copyWith({
    int? botUserId,
  }) =>
      GetBotSimilarBots(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBotSimilarBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
