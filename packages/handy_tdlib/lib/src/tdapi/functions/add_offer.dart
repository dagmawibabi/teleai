part of '../tdapi.dart';

/// **AddOffer** *(addOffer)* - TDLib function
///
/// Sends a suggested post based on a previously sent message in a channel direct messages chat. Can be also used to suggest price or time change for an existing suggested post.. Returns the sent message.
///
/// * [chatId]: Identifier of the channel direct messages chat.
/// * [messageId]: Identifier of the message in the chat which will be sent as suggested post. Use messageProperties.can_add_offer to check whether an offer can be added. or messageProperties.can_edit_suggested_post_info to check whether price or time of sending of the post can be changed.
/// * [options]: Options to be used to send the message. New information about the suggested post must always be specified.
///
/// [Message] is returned on completion.
final class AddOffer extends TdFunction {
  /// **AddOffer** *(addOffer)* - TDLib function
  ///
  /// Sends a suggested post based on a previously sent message in a channel direct messages chat. Can be also used to suggest price or time change for an existing suggested post.. Returns the sent message.
  ///
  /// * [chatId]: Identifier of the channel direct messages chat.
  /// * [messageId]: Identifier of the message in the chat which will be sent as suggested post. Use messageProperties.can_add_offer to check whether an offer can be added. or messageProperties.can_edit_suggested_post_info to check whether price or time of sending of the post can be changed.
  /// * [options]: Options to be used to send the message. New information about the suggested post must always be specified.
  ///
  /// [Message] is returned on completion.
  const AddOffer({
    required this.chatId,
    required this.messageId,
    required this.options,
  });

  /// Identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the message in the chat which will be sent as suggested post. Use messageProperties.can_add_offer to check whether an offer can be added. or messageProperties.can_edit_suggested_post_info to check whether price or time of sending of the post can be changed
  final int messageId;

  /// Options to be used to send the message. New information about the suggested post must always be specified
  final MessageSendOptions options;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "options": options.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel direct messages chat
  /// * [message_id]: Identifier of the message in the chat which will be sent as suggested post. Use messageProperties.can_add_offer to check whether an offer can be added. or messageProperties.can_edit_suggested_post_info to check whether price or time of sending of the post can be changed
  /// * [options]: Options to be used to send the message. New information about the suggested post must always be specified
  AddOffer copyWith({
    int? chatId,
    int? messageId,
    MessageSendOptions? options,
  }) =>
      AddOffer(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        options: options ?? this.options,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
