part of '../tdapi.dart';

/// **GetBotMediaPreviews** *(getBotMediaPreviews)* - TDLib function
///
/// Returns the list of media previews of a bot.
///
/// * [botUserId]: Identifier of the target bot. The bot must have the main Web App.
///
/// [BotMediaPreviews] is returned on completion.
final class GetBotMediaPreviews extends TdFunction {
  /// **GetBotMediaPreviews** *(getBotMediaPreviews)* - TDLib function
  ///
  /// Returns the list of media previews of a bot.
  ///
  /// * [botUserId]: Identifier of the target bot. The bot must have the main Web App.
  ///
  /// [BotMediaPreviews] is returned on completion.
  const GetBotMediaPreviews({
    required this.botUserId,
  });

  /// Identifier of the target bot. The bot must have the main Web App
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
  /// * [bot_user_id]: Identifier of the target bot. The bot must have the main Web App
  GetBotMediaPreviews copyWith({
    int? botUserId,
  }) =>
      GetBotMediaPreviews(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBotMediaPreviews';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
