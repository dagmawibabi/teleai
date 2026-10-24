part of '../tdapi.dart';

/// **AddMessageReaction** *(addMessageReaction)* - TDLib function
///
/// Adds a reaction or a tag to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [reactionType]: Type of the reaction to add. Use addPendingPaidMessageReaction instead to add the paid reaction.
/// * [isBig]: Pass true if the reaction is added with a big animation.
/// * [updateRecentReactions]: Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions.
///
/// [Ok] is returned on completion.
final class AddMessageReaction extends TdFunction {
  /// **AddMessageReaction** *(addMessageReaction)* - TDLib function
  ///
  /// Adds a reaction or a tag to a message. Use getMessageAvailableReactions to receive the list of available reactions for the message.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [reactionType]: Type of the reaction to add. Use addPendingPaidMessageReaction instead to add the paid reaction.
  /// * [isBig]: Pass true if the reaction is added with a big animation.
  /// * [updateRecentReactions]: Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions.
  ///
  /// [Ok] is returned on completion.
  const AddMessageReaction({
    required this.chatId,
    required this.messageId,
    required this.reactionType,
    required this.isBig,
    required this.updateRecentReactions,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Type of the reaction to add. Use addPendingPaidMessageReaction instead to add the paid reaction
  final ReactionType reactionType;

  /// Pass true if the reaction is added with a big animation
  final bool isBig;

  /// Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions
  final bool updateRecentReactions;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reaction_type": reactionType.toJson(),
      "is_big": isBig,
      "update_recent_reactions": updateRecentReactions,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [reaction_type]: Type of the reaction to add. Use addPendingPaidMessageReaction instead to add the paid reaction
  /// * [is_big]: Pass true if the reaction is added with a big animation
  /// * [update_recent_reactions]: Pass true if the reaction needs to be added to recent reactions; tags are never added to the list of recent reactions
  AddMessageReaction copyWith({
    int? chatId,
    int? messageId,
    ReactionType? reactionType,
    bool? isBig,
    bool? updateRecentReactions,
  }) =>
      AddMessageReaction(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        reactionType: reactionType ?? this.reactionType,
        isBig: isBig ?? this.isBig,
        updateRecentReactions:
            updateRecentReactions ?? this.updateRecentReactions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addMessageReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
