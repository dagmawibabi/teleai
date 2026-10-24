part of '../tdapi.dart';

/// **SendBusinessMessage** *(sendBusinessMessage)* - TDLib function
///
/// Sends a message on behalf of a business account; for bots only. Returns the message after it was sent.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request.
/// * [chatId]: Target chat.
/// * [replyTo]: Information about the message to be replied; pass null if none *(optional)*.
/// * [disableNotification]: Pass true to disable notification for the message.
/// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving.
/// * [effectId]: Identifier of the effect to apply to the message.
/// * [replyMarkup]: Markup for replying to the message; pass null if none *(optional)*.
/// * [inputMessageContent]: The content of the message to be sent.
///
/// [BusinessMessage] is returned on completion.
final class SendBusinessMessage extends TdFunction {
  /// **SendBusinessMessage** *(sendBusinessMessage)* - TDLib function
  ///
  /// Sends a message on behalf of a business account; for bots only. Returns the message after it was sent.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request.
  /// * [chatId]: Target chat.
  /// * [replyTo]: Information about the message to be replied; pass null if none *(optional)*.
  /// * [disableNotification]: Pass true to disable notification for the message.
  /// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving.
  /// * [effectId]: Identifier of the effect to apply to the message.
  /// * [replyMarkup]: Markup for replying to the message; pass null if none *(optional)*.
  /// * [inputMessageContent]: The content of the message to be sent.
  ///
  /// [BusinessMessage] is returned on completion.
  const SendBusinessMessage({
    required this.businessConnectionId,
    required this.chatId,
    this.replyTo,
    required this.disableNotification,
    required this.protectContent,
    required this.effectId,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// Unique identifier of business connection on behalf of which to send the request
  final String businessConnectionId;

  /// Target chat
  final int chatId;

  /// Information about the message to be replied; pass null if none
  final InputMessageReplyTo? replyTo;

  /// Pass true to disable notification for the message
  final bool disableNotification;

  /// Pass true if the content of the message must be protected from forwarding and saving
  final bool protectContent;

  /// Identifier of the effect to apply to the message
  final int effectId;

  /// Markup for replying to the message; pass null if none
  final ReplyMarkup? replyMarkup;

  /// The content of the message to be sent
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "chat_id": chatId,
      "reply_to": replyTo?.toJson(),
      "disable_notification": disableNotification,
      "protect_content": protectContent,
      "effect_id": effectId,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request
  /// * [chat_id]: Target chat
  /// * [reply_to]: Information about the message to be replied; pass null if none
  /// * [disable_notification]: Pass true to disable notification for the message
  /// * [protect_content]: Pass true if the content of the message must be protected from forwarding and saving
  /// * [effect_id]: Identifier of the effect to apply to the message
  /// * [reply_markup]: Markup for replying to the message; pass null if none
  /// * [input_message_content]: The content of the message to be sent
  SendBusinessMessage copyWith({
    String? businessConnectionId,
    int? chatId,
    InputMessageReplyTo? replyTo,
    bool? disableNotification,
    bool? protectContent,
    int? effectId,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      SendBusinessMessage(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        replyTo: replyTo ?? this.replyTo,
        disableNotification: disableNotification ?? this.disableNotification,
        protectContent: protectContent ?? this.protectContent,
        effectId: effectId ?? this.effectId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendBusinessMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
