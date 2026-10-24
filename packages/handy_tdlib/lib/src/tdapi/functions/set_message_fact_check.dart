part of '../tdapi.dart';

/// **SetMessageFactCheck** *(setMessageFactCheck)* - TDLib function
///
/// Changes the fact-check of a message. Can be only used if messageProperties.can_set_fact_check == true.
///
/// * [chatId]: The channel chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [text]: New text of the fact-check; 0-getOption("fact_check_length_max") characters; pass null to remove it. Only Bold, Italic, and TextUrl entities with https://t.me/ links are supported *(optional)*.
///
/// [Ok] is returned on completion.
final class SetMessageFactCheck extends TdFunction {
  /// **SetMessageFactCheck** *(setMessageFactCheck)* - TDLib function
  ///
  /// Changes the fact-check of a message. Can be only used if messageProperties.can_set_fact_check == true.
  ///
  /// * [chatId]: The channel chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [text]: New text of the fact-check; 0-getOption("fact_check_length_max") characters; pass null to remove it. Only Bold, Italic, and TextUrl entities with https://t.me/ links are supported *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetMessageFactCheck({
    required this.chatId,
    required this.messageId,
    this.text,
  });

  /// The channel chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// New text of the fact-check; 0-getOption("fact_check_length_max") characters; pass null to remove it. Only Bold, Italic, and TextUrl entities with https://t.me/ links are supported
  final FormattedText? text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "text": text?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The channel chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [text]: New text of the fact-check; 0-getOption("fact_check_length_max") characters; pass null to remove it. Only Bold, Italic, and TextUrl entities with https://t.me/ links are supported
  SetMessageFactCheck copyWith({
    int? chatId,
    int? messageId,
    FormattedText? text,
  }) =>
      SetMessageFactCheck(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMessageFactCheck';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
