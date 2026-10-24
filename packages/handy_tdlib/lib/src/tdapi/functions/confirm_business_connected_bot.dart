part of '../tdapi.dart';

/// **ConfirmBusinessConnectedBot** *(confirmBusinessConnectedBot)* - TDLib function
///
/// Confirms an unconfirmed business connection of the current user from another device.
///
/// * [botUserId]: User identifier of the bot.
///
/// [Ok] is returned on completion.
final class ConfirmBusinessConnectedBot extends TdFunction {
  /// **ConfirmBusinessConnectedBot** *(confirmBusinessConnectedBot)* - TDLib function
  ///
  /// Confirms an unconfirmed business connection of the current user from another device.
  ///
  /// * [botUserId]: User identifier of the bot.
  ///
  /// [Ok] is returned on completion.
  const ConfirmBusinessConnectedBot({
    required this.botUserId,
  });

  /// User identifier of the bot
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
  /// * [bot_user_id]: User identifier of the bot
  ConfirmBusinessConnectedBot copyWith({
    int? botUserId,
  }) =>
      ConfirmBusinessConnectedBot(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'confirmBusinessConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
