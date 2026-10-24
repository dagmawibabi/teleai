part of '../tdapi.dart';

/// **SummarizeMessage** *(summarizeMessage)* - TDLib function
///
/// Summarizes content of the message with non-empty summary_language_code.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [translateToLanguageCode]: Pass a language code to which the summary will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
/// * [tone]: Tone of the summarization; see translateText.tone for the list of supported values.
///
/// [FormattedText] is returned on completion.
final class SummarizeMessage extends TdFunction {
  /// **SummarizeMessage** *(summarizeMessage)* - TDLib function
  ///
  /// Summarizes content of the message with non-empty summary_language_code.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [translateToLanguageCode]: Pass a language code to which the summary will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
  /// * [tone]: Tone of the summarization; see translateText.tone for the list of supported values.
  ///
  /// [FormattedText] is returned on completion.
  const SummarizeMessage({
    required this.chatId,
    required this.messageId,
    required this.translateToLanguageCode,
    required this.tone,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Pass a language code to which the summary will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  final String translateToLanguageCode;

  /// Tone of the summarization; see translateText.tone for the list of supported values
  final String tone;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "translate_to_language_code": translateToLanguageCode,
      "tone": tone,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [translate_to_language_code]: Pass a language code to which the summary will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  /// * [tone]: Tone of the summarization; see translateText.tone for the list of supported values
  SummarizeMessage copyWith({
    int? chatId,
    int? messageId,
    String? translateToLanguageCode,
    String? tone,
  }) =>
      SummarizeMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        translateToLanguageCode:
            translateToLanguageCode ?? this.translateToLanguageCode,
        tone: tone ?? this.tone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'summarizeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
