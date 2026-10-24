part of '../tdapi.dart';

/// **DeleteBotSecondaryUsername** *(deleteBotSecondaryUsername)* - TDLib function
///
/// Removes a secondary username from a bot. Can be called only if userTypeBot.can_be_edited == true and the bot has a secondary username.
///
/// * [botUserId]: Identifier of the target bot.
///
/// [Ok] is returned on completion.
final class DeleteBotSecondaryUsername extends TdFunction {
  /// **DeleteBotSecondaryUsername** *(deleteBotSecondaryUsername)* - TDLib function
  ///
  /// Removes a secondary username from a bot. Can be called only if userTypeBot.can_be_edited == true and the bot has a secondary username.
  ///
  /// * [botUserId]: Identifier of the target bot.
  ///
  /// [Ok] is returned on completion.
  const DeleteBotSecondaryUsername({
    required this.botUserId,
  });

  /// Identifier of the target bot
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
  /// * [bot_user_id]: Identifier of the target bot
  DeleteBotSecondaryUsername copyWith({
    int? botUserId,
  }) =>
      DeleteBotSecondaryUsername(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBotSecondaryUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
