part of '../tdapi.dart';

/// **ViewMessages** *(viewMessages)* - TDLib function
///
/// Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button).. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels).
///
/// * [chatId]: Chat identifier.
/// * [messageIds]: The identifiers of the messages being viewed.
/// * [source]: Source of the message view; pass null to guess the source based on chat open state *(optional)*.
/// * [forceRead]: Pass true to mark as read the specified messages even if the chat is closed.
///
/// [Ok] is returned on completion.
final class ViewMessages extends TdFunction {
  /// **ViewMessages** *(viewMessages)* - TDLib function
  ///
  /// Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button).. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels).
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageIds]: The identifiers of the messages being viewed.
  /// * [source]: Source of the message view; pass null to guess the source based on chat open state *(optional)*.
  /// * [forceRead]: Pass true to mark as read the specified messages even if the chat is closed.
  ///
  /// [Ok] is returned on completion.
  const ViewMessages({
    required this.chatId,
    required this.messageIds,
    this.source,
    required this.forceRead,
  });

  /// Chat identifier
  final int chatId;

  /// The identifiers of the messages being viewed
  final List<int> messageIds;

  /// Source of the message view; pass null to guess the source based on chat open state
  final MessageSource? source;

  /// Pass true to mark as read the specified messages even if the chat is closed
  final bool forceRead;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_ids": messageIds.map((i) => i).toList(),
      "source": source?.toJson(),
      "force_read": forceRead,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_ids]: The identifiers of the messages being viewed
  /// * [source]: Source of the message view; pass null to guess the source based on chat open state
  /// * [force_read]: Pass true to mark as read the specified messages even if the chat is closed
  ViewMessages copyWith({
    int? chatId,
    List<int>? messageIds,
    MessageSource? source,
    bool? forceRead,
  }) =>
      ViewMessages(
        chatId: chatId ?? this.chatId,
        messageIds: messageIds ?? this.messageIds,
        source: source ?? this.source,
        forceRead: forceRead ?? this.forceRead,
      );

  /// TDLib object type
  static const String defaultObjectId = 'viewMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
