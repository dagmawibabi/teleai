part of '../tdapi.dart';

/// **SetMessageSenderBotVerification** *(setMessageSenderBotVerification)* - TDLib function
///
/// Changes the verification status of a user or a chat by an owned bot.
///
/// * [botUserId]: Identifier of the owned bot, which will verify the user or the chat.
/// * [verifiedId]: Identifier of the user or the supergroup or channel chat, which will be verified by the bot.
/// * [customDescription]: Custom description of verification reason; 0-getOption("bot_verification_custom_description_length_max") characters. Only TextUrl entities are supported.. If empty, then "was verified by organization "organization_name"" will be used as description. Can be specified only if the bot is allowed to provide custom description.
///
/// [Ok] is returned on completion.
final class SetMessageSenderBotVerification extends TdFunction {
  /// **SetMessageSenderBotVerification** *(setMessageSenderBotVerification)* - TDLib function
  ///
  /// Changes the verification status of a user or a chat by an owned bot.
  ///
  /// * [botUserId]: Identifier of the owned bot, which will verify the user or the chat.
  /// * [verifiedId]: Identifier of the user or the supergroup or channel chat, which will be verified by the bot.
  /// * [customDescription]: Custom description of verification reason; 0-getOption("bot_verification_custom_description_length_max") characters. Only TextUrl entities are supported.. If empty, then "was verified by organization "organization_name"" will be used as description. Can be specified only if the bot is allowed to provide custom description.
  ///
  /// [Ok] is returned on completion.
  const SetMessageSenderBotVerification({
    required this.botUserId,
    required this.verifiedId,
    required this.customDescription,
  });

  /// Identifier of the owned bot, which will verify the user or the chat
  final int botUserId;

  /// Identifier of the user or the supergroup or channel chat, which will be verified by the bot
  final MessageSender verifiedId;

  /// Custom description of verification reason; 0-getOption("bot_verification_custom_description_length_max") characters. Only TextUrl entities are supported.. If empty, then "was verified by organization "organization_name"" will be used as description. Can be specified only if the bot is allowed to provide custom description
  final FormattedText customDescription;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "verified_id": verifiedId.toJson(),
      "custom_description": customDescription.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the owned bot, which will verify the user or the chat
  /// * [verified_id]: Identifier of the user or the supergroup or channel chat, which will be verified by the bot
  /// * [custom_description]: Custom description of verification reason; 0-getOption("bot_verification_custom_description_length_max") characters. Only TextUrl entities are supported.. If empty, then "was verified by organization "organization_name"" will be used as description. Can be specified only if the bot is allowed to provide custom description
  SetMessageSenderBotVerification copyWith({
    int? botUserId,
    MessageSender? verifiedId,
    FormattedText? customDescription,
  }) =>
      SetMessageSenderBotVerification(
        botUserId: botUserId ?? this.botUserId,
        verifiedId: verifiedId ?? this.verifiedId,
        customDescription: customDescription ?? this.customDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMessageSenderBotVerification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
