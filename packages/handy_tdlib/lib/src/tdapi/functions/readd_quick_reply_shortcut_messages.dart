part of '../tdapi.dart';

/// **ReaddQuickReplyShortcutMessages** *(readdQuickReplyShortcutMessages)* - TDLib function
///
/// Re-adds quick reply messages which failed to add. Can be called only for messages for which messageSendingStateFailed.can_retry is true. and after specified in messageSendingStateFailed.retry_after time passed. If a message is re-added, the corresponding failed to send message is deleted.. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-added, null will be returned instead of the message.
///
/// * [shortcutName]: Name of the target shortcut.
/// * [messageIds]: Identifiers of the quick reply messages to re-add. Message identifiers must be in a strictly increasing order.
///
/// [QuickReplyMessages] is returned on completion.
final class ReaddQuickReplyShortcutMessages extends TdFunction {
  /// **ReaddQuickReplyShortcutMessages** *(readdQuickReplyShortcutMessages)* - TDLib function
  ///
  /// Re-adds quick reply messages which failed to add. Can be called only for messages for which messageSendingStateFailed.can_retry is true. and after specified in messageSendingStateFailed.retry_after time passed. If a message is re-added, the corresponding failed to send message is deleted.. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-added, null will be returned instead of the message.
  ///
  /// * [shortcutName]: Name of the target shortcut.
  /// * [messageIds]: Identifiers of the quick reply messages to re-add. Message identifiers must be in a strictly increasing order.
  ///
  /// [QuickReplyMessages] is returned on completion.
  const ReaddQuickReplyShortcutMessages({
    required this.shortcutName,
    required this.messageIds,
  });

  /// Name of the target shortcut
  final String shortcutName;

  /// Identifiers of the quick reply messages to re-add. Message identifiers must be in a strictly increasing order
  final List<int> messageIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_name": shortcutName,
      "message_ids": messageIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_name]: Name of the target shortcut
  /// * [message_ids]: Identifiers of the quick reply messages to re-add. Message identifiers must be in a strictly increasing order
  ReaddQuickReplyShortcutMessages copyWith({
    String? shortcutName,
    List<int>? messageIds,
  }) =>
      ReaddQuickReplyShortcutMessages(
        shortcutName: shortcutName ?? this.shortcutName,
        messageIds: messageIds ?? this.messageIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readdQuickReplyShortcutMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
