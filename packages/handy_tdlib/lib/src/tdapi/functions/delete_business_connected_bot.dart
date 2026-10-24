part of '../tdapi.dart';

/// **DeleteBusinessConnectedBot** *(deleteBusinessConnectedBot)* - TDLib function
///
/// Deletes the business bot that is connected to the current user account.
///
/// * [botUserId]: Unique user identifier for the bot.
///
/// [Ok] is returned on completion.
final class DeleteBusinessConnectedBot extends TdFunction {
  /// **DeleteBusinessConnectedBot** *(deleteBusinessConnectedBot)* - TDLib function
  ///
  /// Deletes the business bot that is connected to the current user account.
  ///
  /// * [botUserId]: Unique user identifier for the bot.
  ///
  /// [Ok] is returned on completion.
  const DeleteBusinessConnectedBot({
    required this.botUserId,
  });

  /// Unique user identifier for the bot
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
  /// * [bot_user_id]: Unique user identifier for the bot
  DeleteBusinessConnectedBot copyWith({
    int? botUserId,
  }) =>
      DeleteBusinessConnectedBot(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBusinessConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
