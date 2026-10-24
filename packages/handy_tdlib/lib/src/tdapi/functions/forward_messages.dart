part of '../tdapi.dart';

/// **ForwardMessages** *(forwardMessages)* - TDLib function
///
/// Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message.
///
/// * [chatId]: Identifier of the chat to which to forward messages.
/// * [topicId]: Topic in which the messages will be forwarded; message threads aren't supported; pass null if none *(optional)*.
/// * [fromChatId]: Identifier of the chat from which to forward messages.
/// * [messageIds]: Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if messageProperties.can_be_forwarded.
/// * [options]: Options to be used to send the messages; pass null to use default options *(optional)*.
/// * [sendCopy]: Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable.
/// * [removeCaption]: Pass true to remove media captions of message copies. Ignored if send_copy is false.
///
/// [Messages] is returned on completion.
final class ForwardMessages extends TdFunction {
  /// **ForwardMessages** *(forwardMessages)* - TDLib function
  ///
  /// Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message.
  ///
  /// * [chatId]: Identifier of the chat to which to forward messages.
  /// * [topicId]: Topic in which the messages will be forwarded; message threads aren't supported; pass null if none *(optional)*.
  /// * [fromChatId]: Identifier of the chat from which to forward messages.
  /// * [messageIds]: Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if messageProperties.can_be_forwarded.
  /// * [options]: Options to be used to send the messages; pass null to use default options *(optional)*.
  /// * [sendCopy]: Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable.
  /// * [removeCaption]: Pass true to remove media captions of message copies. Ignored if send_copy is false.
  ///
  /// [Messages] is returned on completion.
  const ForwardMessages({
    required this.chatId,
    this.topicId,
    required this.fromChatId,
    required this.messageIds,
    this.options,
    required this.sendCopy,
    required this.removeCaption,
  });

  /// Identifier of the chat to which to forward messages
  final int chatId;

  /// Topic in which the messages will be forwarded; message threads aren't supported; pass null if none
  final MessageTopic? topicId;

  /// Identifier of the chat from which to forward messages
  final int fromChatId;

  /// Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if messageProperties.can_be_forwarded
  final List<int> messageIds;

  /// Options to be used to send the messages; pass null to use default options
  final MessageSendOptions? options;

  /// Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
  final bool sendCopy;

  /// Pass true to remove media captions of message copies. Ignored if send_copy is false
  final bool removeCaption;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "from_chat_id": fromChatId,
      "message_ids": messageIds.map((i) => i).toList(),
      "options": options?.toJson(),
      "send_copy": sendCopy,
      "remove_caption": removeCaption,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which to forward messages
  /// * [topic_id]: Topic in which the messages will be forwarded; message threads aren't supported; pass null if none
  /// * [from_chat_id]: Identifier of the chat from which to forward messages
  /// * [message_ids]: Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously. A message can be forwarded only if messageProperties.can_be_forwarded
  /// * [options]: Options to be used to send the messages; pass null to use default options
  /// * [send_copy]: Pass true to copy content of the messages without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
  /// * [remove_caption]: Pass true to remove media captions of message copies. Ignored if send_copy is false
  ForwardMessages copyWith({
    int? chatId,
    MessageTopic? topicId,
    int? fromChatId,
    List<int>? messageIds,
    MessageSendOptions? options,
    bool? sendCopy,
    bool? removeCaption,
  }) =>
      ForwardMessages(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        fromChatId: fromChatId ?? this.fromChatId,
        messageIds: messageIds ?? this.messageIds,
        options: options ?? this.options,
        sendCopy: sendCopy ?? this.sendCopy,
        removeCaption: removeCaption ?? this.removeCaption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'forwardMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
