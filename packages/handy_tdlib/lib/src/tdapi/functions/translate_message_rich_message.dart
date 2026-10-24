part of '../tdapi.dart';

/// **TranslateMessageRichMessage** *(translateMessageRichMessage)* - TDLib function
///
/// Extracts rich message of the given message and translates it to the given language.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
/// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
///
/// [RichMessage] is returned on completion.
final class TranslateMessageRichMessage extends TdFunction {
  /// **TranslateMessageRichMessage** *(translateMessageRichMessage)* - TDLib function
  ///
  /// Extracts rich message of the given message and translates it to the given language.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
  /// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
  ///
  /// [RichMessage] is returned on completion.
  const TranslateMessageRichMessage({
    required this.chatId,
    required this.messageId,
    required this.toLanguageCode,
    required this.tone,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values
  final String toLanguageCode;

  /// Tone of the translation; see translateText.tone for the list of supported values
  final String tone;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "to_language_code": toLanguageCode,
      "tone": tone,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [to_language_code]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values
  /// * [tone]: Tone of the translation; see translateText.tone for the list of supported values
  TranslateMessageRichMessage copyWith({
    int? chatId,
    int? messageId,
    String? toLanguageCode,
    String? tone,
  }) =>
      TranslateMessageRichMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        toLanguageCode: toLanguageCode ?? this.toLanguageCode,
        tone: tone ?? this.tone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'translateMessageRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
