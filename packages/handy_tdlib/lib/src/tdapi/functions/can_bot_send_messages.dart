part of '../tdapi.dart';

/// **CanBotSendMessages** *(canBotSendMessages)* - TDLib function
///
/// Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages.
///
/// * [botUserId]: Identifier of the target bot.
///
/// [Ok] is returned on completion.
final class CanBotSendMessages extends TdFunction {
  /// **CanBotSendMessages** *(canBotSendMessages)* - TDLib function
  ///
  /// Checks whether the specified bot can send messages to the user. Returns a 404 error if can't and the access can be granted by call to allowBotToSendMessages.
  ///
  /// * [botUserId]: Identifier of the target bot.
  ///
  /// [Ok] is returned on completion.
  const CanBotSendMessages({
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
  CanBotSendMessages copyWith({
    int? botUserId,
  }) =>
      CanBotSendMessages(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canBotSendMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
