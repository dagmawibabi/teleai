part of '../tdapi.dart';

/// **GetRepliedMessage** *(getRepliedMessage)* - TDLib function
///
/// Returns information about a non-bundled message that is replied by a given message. Also, returns the pinned message for messagePinMessage,. the game message for messageGameScore, the invoice message for messagePaymentSuccessful, the message with a previously set same background for messageChatSetBackground,. the giveaway message for messageGiveawayCompleted, the checklist message for messageChecklistTasksDone, messageChecklistTasksAdded, the message with suggested post information. for messageSuggestedPostApprovalFailed, messageSuggestedPostApproved, messageSuggestedPostDeclined, messageSuggestedPostPaid, messageSuggestedPostRefunded,. the message with the regular gift that was upgraded for messageUpgradedGift with origin of the type upgradedGiftOriginUpgrade,. the message with gift purchase offer for messageUpgradedGiftPurchaseOfferRejected,. the message with the request to disable content protection for messageChatHasProtectedContentToggled,. the message with the poll for messagePollOptionAdded and messagePollOptionDeleted,. and the topic creation message for topic messages without non-bundled replied message. Returns a 404 error if the message doesn't exist.
///
/// * [chatId]: Identifier of the chat the message belongs to.
/// * [messageId]: Identifier of the reply message.
///
/// [Message] is returned on completion.
final class GetRepliedMessage extends TdFunction {
  /// **GetRepliedMessage** *(getRepliedMessage)* - TDLib function
  ///
  /// Returns information about a non-bundled message that is replied by a given message. Also, returns the pinned message for messagePinMessage,. the game message for messageGameScore, the invoice message for messagePaymentSuccessful, the message with a previously set same background for messageChatSetBackground,. the giveaway message for messageGiveawayCompleted, the checklist message for messageChecklistTasksDone, messageChecklistTasksAdded, the message with suggested post information. for messageSuggestedPostApprovalFailed, messageSuggestedPostApproved, messageSuggestedPostDeclined, messageSuggestedPostPaid, messageSuggestedPostRefunded,. the message with the regular gift that was upgraded for messageUpgradedGift with origin of the type upgradedGiftOriginUpgrade,. the message with gift purchase offer for messageUpgradedGiftPurchaseOfferRejected,. the message with the request to disable content protection for messageChatHasProtectedContentToggled,. the message with the poll for messagePollOptionAdded and messagePollOptionDeleted,. and the topic creation message for topic messages without non-bundled replied message. Returns a 404 error if the message doesn't exist.
  ///
  /// * [chatId]: Identifier of the chat the message belongs to.
  /// * [messageId]: Identifier of the reply message.
  ///
  /// [Message] is returned on completion.
  const GetRepliedMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat the message belongs to
  final int chatId;

  /// Identifier of the reply message
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat the message belongs to
  /// * [message_id]: Identifier of the reply message
  GetRepliedMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetRepliedMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getRepliedMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
