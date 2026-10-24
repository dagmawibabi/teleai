part of '../tdapi.dart';

/// **GetGiveawayInfo** *(getGiveawayInfo)* - TDLib function
///
/// Returns information about a giveaway.
///
/// * [chatId]: Identifier of the channel chat which started the giveaway.
/// * [messageId]: Identifier of the giveaway or a giveaway winners message in the chat.
///
/// [GiveawayInfo] is returned on completion.
final class GetGiveawayInfo extends TdFunction {
  /// **GetGiveawayInfo** *(getGiveawayInfo)* - TDLib function
  ///
  /// Returns information about a giveaway.
  ///
  /// * [chatId]: Identifier of the channel chat which started the giveaway.
  /// * [messageId]: Identifier of the giveaway or a giveaway winners message in the chat.
  ///
  /// [GiveawayInfo] is returned on completion.
  const GetGiveawayInfo({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the channel chat which started the giveaway
  final int chatId;

  /// Identifier of the giveaway or a giveaway winners message in the chat
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
  /// * [chat_id]: Identifier of the channel chat which started the giveaway
  /// * [message_id]: Identifier of the giveaway or a giveaway winners message in the chat
  GetGiveawayInfo copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetGiveawayInfo(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiveawayInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
