part of '../tdapi.dart';

/// **AllowBotToSendMessages** *(allowBotToSendMessages)* - TDLib function
///
/// Allows the specified bot to send messages to the user.
///
/// * [botUserId]: Identifier of the target bot.
///
/// [Ok] is returned on completion.
final class AllowBotToSendMessages extends TdFunction {
  /// **AllowBotToSendMessages** *(allowBotToSendMessages)* - TDLib function
  ///
  /// Allows the specified bot to send messages to the user.
  ///
  /// * [botUserId]: Identifier of the target bot.
  ///
  /// [Ok] is returned on completion.
  const AllowBotToSendMessages({
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
  AllowBotToSendMessages copyWith({
    int? botUserId,
  }) =>
      AllowBotToSendMessages(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'allowBotToSendMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
