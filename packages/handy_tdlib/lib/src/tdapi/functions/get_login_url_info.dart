part of '../tdapi.dart';

/// **GetLoginUrlInfo** *(getLoginUrlInfo)* - TDLib function
///
/// Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button.
///
/// * [chatId]: Chat identifier of the message with the button.
/// * [messageId]: Message identifier of the message with the button. The message must not be scheduled.
/// * [buttonId]: Button identifier.
///
/// [LoginUrlInfo] is returned on completion.
final class GetLoginUrlInfo extends TdFunction {
  /// **GetLoginUrlInfo** *(getLoginUrlInfo)* - TDLib function
  ///
  /// Returns information about a button of type inlineKeyboardButtonTypeLoginUrl. The method needs to be called when the user presses the button.
  ///
  /// * [chatId]: Chat identifier of the message with the button.
  /// * [messageId]: Message identifier of the message with the button. The message must not be scheduled.
  /// * [buttonId]: Button identifier.
  ///
  /// [LoginUrlInfo] is returned on completion.
  const GetLoginUrlInfo({
    required this.chatId,
    required this.messageId,
    required this.buttonId,
  });

  /// Chat identifier of the message with the button
  final int chatId;

  /// Message identifier of the message with the button. The message must not be scheduled
  final int messageId;

  /// Button identifier
  final int buttonId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "button_id": buttonId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the message with the button
  /// * [message_id]: Message identifier of the message with the button. The message must not be scheduled
  /// * [button_id]: Button identifier
  GetLoginUrlInfo copyWith({
    int? chatId,
    int? messageId,
    int? buttonId,
  }) =>
      GetLoginUrlInfo(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        buttonId: buttonId ?? this.buttonId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLoginUrlInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
