part of '../tdapi.dart';

/// **AddPendingPaidMessageReaction** *(addPendingPaidMessageReaction)* - TDLib function
///
/// Adds the paid message reaction to a message. Use getMessageAvailableReactions to check whether the reaction is available for the message.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [starCount]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_reaction_star_count_max").
/// * [type]: Type of the paid reaction; pass null if the user didn't choose reaction type explicitly, for example, the reaction is set from the message bubble *(optional)*.
///
/// [Ok] is returned on completion.
final class AddPendingPaidMessageReaction extends TdFunction {
  /// **AddPendingPaidMessageReaction** *(addPendingPaidMessageReaction)* - TDLib function
  ///
  /// Adds the paid message reaction to a message. Use getMessageAvailableReactions to check whether the reaction is available for the message.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [starCount]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_reaction_star_count_max").
  /// * [type]: Type of the paid reaction; pass null if the user didn't choose reaction type explicitly, for example, the reaction is set from the message bubble *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const AddPendingPaidMessageReaction({
    required this.chatId,
    required this.messageId,
    required this.starCount,
    this.type,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_reaction_star_count_max")
  final int starCount;

  /// Type of the paid reaction; pass null if the user didn't choose reaction type explicitly, for example, the reaction is set from the message bubble
  final PaidReactionType? type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "star_count": starCount,
      "type": type?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [star_count]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_reaction_star_count_max")
  /// * [type]: Type of the paid reaction; pass null if the user didn't choose reaction type explicitly, for example, the reaction is set from the message bubble
  AddPendingPaidMessageReaction copyWith({
    int? chatId,
    int? messageId,
    int? starCount,
    PaidReactionType? type,
  }) =>
      AddPendingPaidMessageReaction(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        starCount: starCount ?? this.starCount,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addPendingPaidMessageReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
