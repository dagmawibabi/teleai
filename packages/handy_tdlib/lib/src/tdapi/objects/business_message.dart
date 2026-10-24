part of '../tdapi.dart';

/// **BusinessMessage** *(businessMessage)* - basic class
///
/// Describes a message from a business account as received by a bot.
///
/// * [message]: The message.
/// * [replyToMessage]: Message that is replied by the message in the same chat; may be null if none *(optional)*.
final class BusinessMessage extends TdObject {
  /// **BusinessMessage** *(businessMessage)* - basic class
  ///
  /// Describes a message from a business account as received by a bot.
  ///
  /// * [message]: The message.
  /// * [replyToMessage]: Message that is replied by the message in the same chat; may be null if none *(optional)*.
  const BusinessMessage({
    required this.message,
    this.replyToMessage,
    this.extra,
    this.clientId,
  });

  /// The message
  final Message message;

  /// Message that is replied by the message in the same chat; may be null if none
  final Message? replyToMessage;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessMessage.fromJson(Map<String, dynamic> json) =>
      BusinessMessage(
        message: Message.fromJson(json['message']),
        replyToMessage: json['reply_to_message'] == null
            ? null
            : Message.fromJson(json['reply_to_message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "reply_to_message": replyToMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The message
  /// * [reply_to_message]: Message that is replied by the message in the same chat; may be null if none
  BusinessMessage copyWith({
    Message? message,
    Message? replyToMessage,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessMessage(
        message: message ?? this.message,
        replyToMessage: replyToMessage ?? this.replyToMessage,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
