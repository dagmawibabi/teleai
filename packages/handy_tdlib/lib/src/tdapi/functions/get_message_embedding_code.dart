part of '../tdapi.dart';

/// **GetMessageEmbeddingCode** *(getMessageEmbeddingCode)* - TDLib function
///
/// Returns an HTML code for embedding the message. Available only if messageProperties.can_get_embedding_code.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [forAlbum]: Pass true to return an HTML code for embedding of the whole media album.
///
/// [Text] is returned on completion.
final class GetMessageEmbeddingCode extends TdFunction {
  /// **GetMessageEmbeddingCode** *(getMessageEmbeddingCode)* - TDLib function
  ///
  /// Returns an HTML code for embedding the message. Available only if messageProperties.can_get_embedding_code.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [forAlbum]: Pass true to return an HTML code for embedding of the whole media album.
  ///
  /// [Text] is returned on completion.
  const GetMessageEmbeddingCode({
    required this.chatId,
    required this.messageId,
    required this.forAlbum,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Pass true to return an HTML code for embedding of the whole media album
  final bool forAlbum;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "for_album": forAlbum,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [for_album]: Pass true to return an HTML code for embedding of the whole media album
  GetMessageEmbeddingCode copyWith({
    int? chatId,
    int? messageId,
    bool? forAlbum,
  }) =>
      GetMessageEmbeddingCode(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        forAlbum: forAlbum ?? this.forAlbum,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageEmbeddingCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
