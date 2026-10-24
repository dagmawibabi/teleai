part of '../tdapi.dart';

/// **GetBotSimilarBotCount** *(getBotSimilarBotCount)* - TDLib function
///
/// Returns approximate number of bots similar to the given bot.
///
/// * [botUserId]: User identifier of the target bot.
/// * [returnLocal]: Pass true to get the number of bots without sending network requests, or -1 if the number of bots is unknown locally.
///
/// [Count] is returned on completion.
final class GetBotSimilarBotCount extends TdFunction {
  /// **GetBotSimilarBotCount** *(getBotSimilarBotCount)* - TDLib function
  ///
  /// Returns approximate number of bots similar to the given bot.
  ///
  /// * [botUserId]: User identifier of the target bot.
  /// * [returnLocal]: Pass true to get the number of bots without sending network requests, or -1 if the number of bots is unknown locally.
  ///
  /// [Count] is returned on completion.
  const GetBotSimilarBotCount({
    required this.botUserId,
    required this.returnLocal,
  });

  /// User identifier of the target bot
  final int botUserId;

  /// Pass true to get the number of bots without sending network requests, or -1 if the number of bots is unknown locally
  final bool returnLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "return_local": returnLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the target bot
  /// * [return_local]: Pass true to get the number of bots without sending network requests, or -1 if the number of bots is unknown locally
  GetBotSimilarBotCount copyWith({
    int? botUserId,
    bool? returnLocal,
  }) =>
      GetBotSimilarBotCount(
        botUserId: botUserId ?? this.botUserId,
        returnLocal: returnLocal ?? this.returnLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBotSimilarBotCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
