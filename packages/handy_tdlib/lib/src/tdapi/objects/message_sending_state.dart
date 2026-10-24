part of '../tdapi.dart';

/// **MessageSendingState** *(messageSendingState)* - parent
///
/// Contains information about the sending state of the message.
sealed class MessageSendingState extends TdObject {
  /// **MessageSendingState** *(messageSendingState)* - parent
  ///
  /// Contains information about the sending state of the message.
  const MessageSendingState();

  /// a MessageSendingState return type can be :
  /// * [MessageSendingStatePending]
  /// * [MessageSendingStateFailed]
  factory MessageSendingState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageSendingStatePending.defaultObjectId:
        return MessageSendingStatePending.fromJson(json);
      case MessageSendingStateFailed.defaultObjectId:
        return MessageSendingStateFailed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageSendingState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageSendingState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageSendingState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSendingStatePending** *(messageSendingStatePending)* - child of MessageSendingState
///
/// The message is being sent now, but has not yet been delivered to the server.
///
/// * [sendingId]: Non-persistent message sending identifier, specified by the application.
final class MessageSendingStatePending extends MessageSendingState {
  /// **MessageSendingStatePending** *(messageSendingStatePending)* - child of MessageSendingState
  ///
  /// The message is being sent now, but has not yet been delivered to the server.
  ///
  /// * [sendingId]: Non-persistent message sending identifier, specified by the application.
  const MessageSendingStatePending({
    required this.sendingId,
  });

  /// Non-persistent message sending identifier, specified by the application
  final int sendingId;

  /// Parse from a json
  factory MessageSendingStatePending.fromJson(Map<String, dynamic> json) =>
      MessageSendingStatePending(
        sendingId: json['sending_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sending_id": sendingId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sending_id]: Non-persistent message sending identifier, specified by the application
  @override
  MessageSendingStatePending copyWith({
    int? sendingId,
  }) =>
      MessageSendingStatePending(
        sendingId: sendingId ?? this.sendingId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSendingStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSendingStateFailed** *(messageSendingStateFailed)* - child of MessageSendingState
///
/// The message failed to be sent.
///
/// * [error]: The cause of the message sending failure.
/// * [canRetry]: True, if the message can be re-sent using resendMessages or readdQuickReplyShortcutMessages.
/// * [needAnotherSender]: True, if the message can be re-sent only on behalf of a different sender.
/// * [needAnotherReplyQuote]: True, if the message can be re-sent only if another quote is chosen in the message that is replied by the given message.
/// * [needDropReply]: True, if the message can be re-sent only if the message to be replied is removed. This will be done automatically by resendMessages.
/// * [requiredPaidMessageStarCount]: The number of Telegram Stars that must be paid to send the message; 0 if the current amount is correct.
/// * [retryAfter]: Time left before the message can be re-sent, in seconds. No update is sent when this field changes.
final class MessageSendingStateFailed extends MessageSendingState {
  /// **MessageSendingStateFailed** *(messageSendingStateFailed)* - child of MessageSendingState
  ///
  /// The message failed to be sent.
  ///
  /// * [error]: The cause of the message sending failure.
  /// * [canRetry]: True, if the message can be re-sent using resendMessages or readdQuickReplyShortcutMessages.
  /// * [needAnotherSender]: True, if the message can be re-sent only on behalf of a different sender.
  /// * [needAnotherReplyQuote]: True, if the message can be re-sent only if another quote is chosen in the message that is replied by the given message.
  /// * [needDropReply]: True, if the message can be re-sent only if the message to be replied is removed. This will be done automatically by resendMessages.
  /// * [requiredPaidMessageStarCount]: The number of Telegram Stars that must be paid to send the message; 0 if the current amount is correct.
  /// * [retryAfter]: Time left before the message can be re-sent, in seconds. No update is sent when this field changes.
  const MessageSendingStateFailed({
    required this.error,
    required this.canRetry,
    required this.needAnotherSender,
    required this.needAnotherReplyQuote,
    required this.needDropReply,
    required this.requiredPaidMessageStarCount,
    required this.retryAfter,
  });

  /// The cause of the message sending failure
  final TdError error;

  /// True, if the message can be re-sent using resendMessages or readdQuickReplyShortcutMessages
  final bool canRetry;

  /// True, if the message can be re-sent only on behalf of a different sender
  final bool needAnotherSender;

  /// True, if the message can be re-sent only if another quote is chosen in the message that is replied by the given message
  final bool needAnotherReplyQuote;

  /// True, if the message can be re-sent only if the message to be replied is removed. This will be done automatically by resendMessages
  final bool needDropReply;

  /// The number of Telegram Stars that must be paid to send the message; 0 if the current amount is correct
  final int requiredPaidMessageStarCount;

  /// Time left before the message can be re-sent, in seconds. No update is sent when this field changes
  final double retryAfter;

  /// Parse from a json
  factory MessageSendingStateFailed.fromJson(Map<String, dynamic> json) =>
      MessageSendingStateFailed(
        error: TdError.fromJson(json['error']),
        canRetry: json['can_retry'],
        needAnotherSender: json['need_another_sender'],
        needAnotherReplyQuote: json['need_another_reply_quote'],
        needDropReply: json['need_drop_reply'],
        requiredPaidMessageStarCount: json['required_paid_message_star_count'],
        retryAfter: json['retry_after'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "error": error.toJson(),
      "can_retry": canRetry,
      "need_another_sender": needAnotherSender,
      "need_another_reply_quote": needAnotherReplyQuote,
      "need_drop_reply": needDropReply,
      "required_paid_message_star_count": requiredPaidMessageStarCount,
      "retry_after": retryAfter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error]: The cause of the message sending failure
  /// * [can_retry]: True, if the message can be re-sent using resendMessages or readdQuickReplyShortcutMessages
  /// * [need_another_sender]: True, if the message can be re-sent only on behalf of a different sender
  /// * [need_another_reply_quote]: True, if the message can be re-sent only if another quote is chosen in the message that is replied by the given message
  /// * [need_drop_reply]: True, if the message can be re-sent only if the message to be replied is removed. This will be done automatically by resendMessages
  /// * [required_paid_message_star_count]: The number of Telegram Stars that must be paid to send the message; 0 if the current amount is correct
  /// * [retry_after]: Time left before the message can be re-sent, in seconds. No update is sent when this field changes
  @override
  MessageSendingStateFailed copyWith({
    TdError? error,
    bool? canRetry,
    bool? needAnotherSender,
    bool? needAnotherReplyQuote,
    bool? needDropReply,
    int? requiredPaidMessageStarCount,
    double? retryAfter,
  }) =>
      MessageSendingStateFailed(
        error: error ?? this.error,
        canRetry: canRetry ?? this.canRetry,
        needAnotherSender: needAnotherSender ?? this.needAnotherSender,
        needAnotherReplyQuote:
            needAnotherReplyQuote ?? this.needAnotherReplyQuote,
        needDropReply: needDropReply ?? this.needDropReply,
        requiredPaidMessageStarCount:
            requiredPaidMessageStarCount ?? this.requiredPaidMessageStarCount,
        retryAfter: retryAfter ?? this.retryAfter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSendingStateFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
