part of '../tdapi.dart';

/// **GetMessageImportConfirmationText** *(getMessageImportConfirmationText)* - TDLib function
///
/// Returns a confirmation text to be shown to the user before starting message import.
///
/// * [chatId]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right.
///
/// [Text] is returned on completion.
final class GetMessageImportConfirmationText extends TdFunction {
  /// **GetMessageImportConfirmationText** *(getMessageImportConfirmationText)* - TDLib function
  ///
  /// Returns a confirmation text to be shown to the user before starting message import.
  ///
  /// * [chatId]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right.
  ///
  /// [Text] is returned on completion.
  const GetMessageImportConfirmationText({
    required this.chatId,
  });

  /// Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
  GetMessageImportConfirmationText copyWith({
    int? chatId,
  }) =>
      GetMessageImportConfirmationText(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageImportConfirmationText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
