part of '../tdapi.dart';

/// **TranslateMessageText** *(translateMessageText)* - TDLib function
///
/// Extracts text or caption of the given message and translates it to the given language; must not be used in secret chats. If the current user is a Telegram Premium user, then text formatting is preserved.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
/// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
///
/// [FormattedText] is returned on completion.
final class TranslateMessageText extends TdFunction {
  /// **TranslateMessageText** *(translateMessageText)* - TDLib function
  ///
  /// Extracts text or caption of the given message and translates it to the given language; must not be used in secret chats. If the current user is a Telegram Premium user, then text formatting is preserved.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
  /// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
  ///
  /// [FormattedText] is returned on completion.
  const TranslateMessageText({
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
  TranslateMessageText copyWith({
    int? chatId,
    int? messageId,
    String? toLanguageCode,
    String? tone,
  }) =>
      TranslateMessageText(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        toLanguageCode: toLanguageCode ?? this.toLanguageCode,
        tone: tone ?? this.tone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'translateMessageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
