part of '../tdapi.dart';

/// **SetMessageReactions** *(setMessageReactions)* - TDLib function
///
/// Sets reactions on a message; for bots only.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [reactionTypes]: Types of the reaction to set; pass an empty list to remove the reactions.
/// * [isBig]: Pass true if the reactions are added with a big animation.
///
/// [Ok] is returned on completion.
final class SetMessageReactions extends TdFunction {
  /// **SetMessageReactions** *(setMessageReactions)* - TDLib function
  ///
  /// Sets reactions on a message; for bots only.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [reactionTypes]: Types of the reaction to set; pass an empty list to remove the reactions.
  /// * [isBig]: Pass true if the reactions are added with a big animation.
  ///
  /// [Ok] is returned on completion.
  const SetMessageReactions({
    required this.chatId,
    required this.messageId,
    required this.reactionTypes,
    required this.isBig,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Types of the reaction to set; pass an empty list to remove the reactions
  final List<ReactionType> reactionTypes;

  /// Pass true if the reactions are added with a big animation
  final bool isBig;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reaction_types": reactionTypes.map((i) => i.toJson()).toList(),
      "is_big": isBig,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [reaction_types]: Types of the reaction to set; pass an empty list to remove the reactions
  /// * [is_big]: Pass true if the reactions are added with a big animation
  SetMessageReactions copyWith({
    int? chatId,
    int? messageId,
    List<ReactionType>? reactionTypes,
    bool? isBig,
  }) =>
      SetMessageReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        reactionTypes: reactionTypes ?? this.reactionTypes,
        isBig: isBig ?? this.isBig,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setMessageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
