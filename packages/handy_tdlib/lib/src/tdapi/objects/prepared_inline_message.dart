part of '../tdapi.dart';

/// **PreparedInlineMessage** *(preparedInlineMessage)* - basic class
///
/// Represents a ready to send inline message. Use sendInlineQueryResultMessage to send the message.
///
/// * [inlineQueryId]: Unique identifier of the inline query to pass to sendInlineQueryResultMessage.
/// * [result]: Resulted inline message of the query.
/// * [chatTypes]: Types of the chats to which the message can be sent.
final class PreparedInlineMessage extends TdObject {
  /// **PreparedInlineMessage** *(preparedInlineMessage)* - basic class
  ///
  /// Represents a ready to send inline message. Use sendInlineQueryResultMessage to send the message.
  ///
  /// * [inlineQueryId]: Unique identifier of the inline query to pass to sendInlineQueryResultMessage.
  /// * [result]: Resulted inline message of the query.
  /// * [chatTypes]: Types of the chats to which the message can be sent.
  const PreparedInlineMessage({
    required this.inlineQueryId,
    required this.result,
    required this.chatTypes,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the inline query to pass to sendInlineQueryResultMessage
  final int inlineQueryId;

  /// Resulted inline message of the query
  final InlineQueryResult result;

  /// Types of the chats to which the message can be sent
  final TargetChatTypes chatTypes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PreparedInlineMessage.fromJson(Map<String, dynamic> json) =>
      PreparedInlineMessage(
        inlineQueryId: json['inline_query_id'] is int
            ? json['inline_query_id']
            : int.parse(json['inline_query_id']),
        result: InlineQueryResult.fromJson(json['result']),
        chatTypes: TargetChatTypes.fromJson(json['chat_types']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "inline_query_id": inlineQueryId,
      "result": result.toJson(),
      "chat_types": chatTypes.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_query_id]: Unique identifier of the inline query to pass to sendInlineQueryResultMessage
  /// * [result]: Resulted inline message of the query
  /// * [chat_types]: Types of the chats to which the message can be sent
  PreparedInlineMessage copyWith({
    int? inlineQueryId,
    InlineQueryResult? result,
    TargetChatTypes? chatTypes,
    dynamic extra,
    int? clientId,
  }) =>
      PreparedInlineMessage(
        inlineQueryId: inlineQueryId ?? this.inlineQueryId,
        result: result ?? this.result,
        chatTypes: chatTypes ?? this.chatTypes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'preparedInlineMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
