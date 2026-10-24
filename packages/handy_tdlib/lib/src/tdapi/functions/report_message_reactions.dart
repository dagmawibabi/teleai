part of '../tdapi.dart';

/// **ReportMessageReactions** *(reportMessageReactions)* - TDLib function
///
/// Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reported only if messageProperties.can_report_reactions.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [senderId]: Identifier of the sender, which added the reaction.
///
/// [Ok] is returned on completion.
final class ReportMessageReactions extends TdFunction {
  /// **ReportMessageReactions** *(reportMessageReactions)* - TDLib function
  ///
  /// Reports reactions set on a message to the Telegram moderators. Reactions on a message can be reported only if messageProperties.can_report_reactions.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [senderId]: Identifier of the sender, which added the reaction.
  ///
  /// [Ok] is returned on completion.
  const ReportMessageReactions({
    required this.chatId,
    required this.messageId,
    required this.senderId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Identifier of the sender, which added the reaction
  final MessageSender senderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "sender_id": senderId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [sender_id]: Identifier of the sender, which added the reaction
  ReportMessageReactions copyWith({
    int? chatId,
    int? messageId,
    MessageSender? senderId,
  }) =>
      ReportMessageReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        senderId: senderId ?? this.senderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportMessageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
