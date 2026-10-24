part of '../tdapi.dart';

/// **SendMessageViewMetrics** *(sendMessageViewMetrics)* - TDLib function
///
/// Informs TDLib about details of a message view by the user from a chat, a message thread or a forum topic history. The method must be called if. the message wasn't seen for more than 300 milliseconds, the viewport was destroyed, or the total view duration exceeded 5 minutes.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: The identifier of the message being viewed.
/// * [timeInViewMs]: The amount of time the message was seen by at least 1 pixel; in milliseconds.
/// * [activeTimeInViewMs]: The amount of time the message was seen by at least 1 pixel within 15 seconds after any action from the user; in milliseconds.
/// * [heightToViewportRatioPerMille]: The ratio of the post height to the viewport height in 1/1000 fractions.
/// * [seenRangeRatioPerMille]: The ratio of the viewed post height to the full post height in 1/1000 fractions; 0-1000.
///
/// [Ok] is returned on completion.
final class SendMessageViewMetrics extends TdFunction {
  /// **SendMessageViewMetrics** *(sendMessageViewMetrics)* - TDLib function
  ///
  /// Informs TDLib about details of a message view by the user from a chat, a message thread or a forum topic history. The method must be called if. the message wasn't seen for more than 300 milliseconds, the viewport was destroyed, or the total view duration exceeded 5 minutes.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: The identifier of the message being viewed.
  /// * [timeInViewMs]: The amount of time the message was seen by at least 1 pixel; in milliseconds.
  /// * [activeTimeInViewMs]: The amount of time the message was seen by at least 1 pixel within 15 seconds after any action from the user; in milliseconds.
  /// * [heightToViewportRatioPerMille]: The ratio of the post height to the viewport height in 1/1000 fractions.
  /// * [seenRangeRatioPerMille]: The ratio of the viewed post height to the full post height in 1/1000 fractions; 0-1000.
  ///
  /// [Ok] is returned on completion.
  const SendMessageViewMetrics({
    required this.chatId,
    required this.messageId,
    required this.timeInViewMs,
    required this.activeTimeInViewMs,
    required this.heightToViewportRatioPerMille,
    required this.seenRangeRatioPerMille,
  });

  /// Chat identifier
  final int chatId;

  /// The identifier of the message being viewed
  final int messageId;

  /// The amount of time the message was seen by at least 1 pixel; in milliseconds
  final int timeInViewMs;

  /// The amount of time the message was seen by at least 1 pixel within 15 seconds after any action from the user; in milliseconds
  final int activeTimeInViewMs;

  /// The ratio of the post height to the viewport height in 1/1000 fractions
  final int heightToViewportRatioPerMille;

  /// The ratio of the viewed post height to the full post height in 1/1000 fractions; 0-1000
  final int seenRangeRatioPerMille;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "time_in_view_ms": timeInViewMs,
      "active_time_in_view_ms": activeTimeInViewMs,
      "height_to_viewport_ratio_per_mille": heightToViewportRatioPerMille,
      "seen_range_ratio_per_mille": seenRangeRatioPerMille,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: The identifier of the message being viewed
  /// * [time_in_view_ms]: The amount of time the message was seen by at least 1 pixel; in milliseconds
  /// * [active_time_in_view_ms]: The amount of time the message was seen by at least 1 pixel within 15 seconds after any action from the user; in milliseconds
  /// * [height_to_viewport_ratio_per_mille]: The ratio of the post height to the viewport height in 1/1000 fractions
  /// * [seen_range_ratio_per_mille]: The ratio of the viewed post height to the full post height in 1/1000 fractions; 0-1000
  SendMessageViewMetrics copyWith({
    int? chatId,
    int? messageId,
    int? timeInViewMs,
    int? activeTimeInViewMs,
    int? heightToViewportRatioPerMille,
    int? seenRangeRatioPerMille,
  }) =>
      SendMessageViewMetrics(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        timeInViewMs: timeInViewMs ?? this.timeInViewMs,
        activeTimeInViewMs: activeTimeInViewMs ?? this.activeTimeInViewMs,
        heightToViewportRatioPerMille:
            heightToViewportRatioPerMille ?? this.heightToViewportRatioPerMille,
        seenRangeRatioPerMille:
            seenRangeRatioPerMille ?? this.seenRangeRatioPerMille,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendMessageViewMetrics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
