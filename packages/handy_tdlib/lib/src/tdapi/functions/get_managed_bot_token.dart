part of '../tdapi.dart';

/// **GetManagedBotToken** *(getManagedBotToken)* - TDLib function
///
/// Returns token of a managed bot; for bots only.
///
/// * [botUserId]: Identifier of the managed bot.
/// * [revoke]: Pass true to revoke the current token and create a new one.
///
/// [Text] is returned on completion.
final class GetManagedBotToken extends TdFunction {
  /// **GetManagedBotToken** *(getManagedBotToken)* - TDLib function
  ///
  /// Returns token of a managed bot; for bots only.
  ///
  /// * [botUserId]: Identifier of the managed bot.
  /// * [revoke]: Pass true to revoke the current token and create a new one.
  ///
  /// [Text] is returned on completion.
  const GetManagedBotToken({
    required this.botUserId,
    required this.revoke,
  });

  /// Identifier of the managed bot
  final int botUserId;

  /// Pass true to revoke the current token and create a new one
  final bool revoke;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the managed bot
  /// * [revoke]: Pass true to revoke the current token and create a new one
  GetManagedBotToken copyWith({
    int? botUserId,
    bool? revoke,
  }) =>
      GetManagedBotToken(
        botUserId: botUserId ?? this.botUserId,
        revoke: revoke ?? this.revoke,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getManagedBotToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
