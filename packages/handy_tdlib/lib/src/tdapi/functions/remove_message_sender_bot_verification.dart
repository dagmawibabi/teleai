part of '../tdapi.dart';

/// **RemoveMessageSenderBotVerification** *(removeMessageSenderBotVerification)* - TDLib function
///
/// Removes the verification status of a user or a chat by an owned bot.
///
/// * [botUserId]: Identifier of the owned bot, which verified the user or the chat.
/// * [verifiedId]: Identifier of the user or the supergroup or channel chat, which verification is removed.
///
/// [Ok] is returned on completion.
final class RemoveMessageSenderBotVerification extends TdFunction {
  /// **RemoveMessageSenderBotVerification** *(removeMessageSenderBotVerification)* - TDLib function
  ///
  /// Removes the verification status of a user or a chat by an owned bot.
  ///
  /// * [botUserId]: Identifier of the owned bot, which verified the user or the chat.
  /// * [verifiedId]: Identifier of the user or the supergroup or channel chat, which verification is removed.
  ///
  /// [Ok] is returned on completion.
  const RemoveMessageSenderBotVerification({
    required this.botUserId,
    required this.verifiedId,
  });

  /// Identifier of the owned bot, which verified the user or the chat
  final int botUserId;

  /// Identifier of the user or the supergroup or channel chat, which verification is removed
  final MessageSender verifiedId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "verified_id": verifiedId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the owned bot, which verified the user or the chat
  /// * [verified_id]: Identifier of the user or the supergroup or channel chat, which verification is removed
  RemoveMessageSenderBotVerification copyWith({
    int? botUserId,
    MessageSender? verifiedId,
  }) =>
      RemoveMessageSenderBotVerification(
        botUserId: botUserId ?? this.botUserId,
        verifiedId: verifiedId ?? this.verifiedId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeMessageSenderBotVerification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
