part of '../tdapi.dart';

/// **SendGroupCallMessage** *(sendGroupCallMessage)* - TDLib function
///
/// Sends a message to other participants of a group call. Requires groupCall.can_send_messages right.
///
/// * [groupCallId]: Group call identifier.
/// * [text]: Text of the message to send; 1-getOption("group_call_message_text_length_max") characters for non-live-stories; see updateGroupCallMessageLevels for live story restrictions,. which depends on paid_message_star_count. Can't contain line feeds for live stories. Can contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities for live stories.
/// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the message; for live stories only; 0-getOption("paid_group_call_message_star_count_max").. Must be 0 for messages sent to live stories posted by the current user.
///
/// [Ok] is returned on completion.
final class SendGroupCallMessage extends TdFunction {
  /// **SendGroupCallMessage** *(sendGroupCallMessage)* - TDLib function
  ///
  /// Sends a message to other participants of a group call. Requires groupCall.can_send_messages right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [text]: Text of the message to send; 1-getOption("group_call_message_text_length_max") characters for non-live-stories; see updateGroupCallMessageLevels for live story restrictions,. which depends on paid_message_star_count. Can't contain line feeds for live stories. Can contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities for live stories.
  /// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the message; for live stories only; 0-getOption("paid_group_call_message_star_count_max").. Must be 0 for messages sent to live stories posted by the current user.
  ///
  /// [Ok] is returned on completion.
  const SendGroupCallMessage({
    required this.groupCallId,
    required this.text,
    required this.paidMessageStarCount,
  });

  /// Group call identifier
  final int groupCallId;

  /// Text of the message to send; 1-getOption("group_call_message_text_length_max") characters for non-live-stories; see updateGroupCallMessageLevels for live story restrictions,. which depends on paid_message_star_count. Can't contain line feeds for live stories. Can contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities for live stories
  final FormattedText text;

  /// The number of Telegram Stars the user agreed to pay to send the message; for live stories only; 0-getOption("paid_group_call_message_star_count_max").. Must be 0 for messages sent to live stories posted by the current user
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "text": text.toJson(),
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [text]: Text of the message to send; 1-getOption("group_call_message_text_length_max") characters for non-live-stories; see updateGroupCallMessageLevels for live story restrictions,. which depends on paid_message_star_count. Can't contain line feeds for live stories. Can contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities for live stories
  /// * [paid_message_star_count]: The number of Telegram Stars the user agreed to pay to send the message; for live stories only; 0-getOption("paid_group_call_message_star_count_max").. Must be 0 for messages sent to live stories posted by the current user
  SendGroupCallMessage copyWith({
    int? groupCallId,
    FormattedText? text,
    int? paidMessageStarCount,
  }) =>
      SendGroupCallMessage(
        groupCallId: groupCallId ?? this.groupCallId,
        text: text ?? this.text,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendGroupCallMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
