part of '../tdapi.dart';

/// **DeleteQuickReplyShortcutMessages** *(deleteQuickReplyShortcutMessages)* - TDLib function
///
/// Deletes specified quick reply messages.
///
/// * [shortcutId]: Unique identifier of the quick reply shortcut to which the messages belong.
/// * [messageIds]: Unique identifiers of the messages.
///
/// [Ok] is returned on completion.
final class DeleteQuickReplyShortcutMessages extends TdFunction {
  /// **DeleteQuickReplyShortcutMessages** *(deleteQuickReplyShortcutMessages)* - TDLib function
  ///
  /// Deletes specified quick reply messages.
  ///
  /// * [shortcutId]: Unique identifier of the quick reply shortcut to which the messages belong.
  /// * [messageIds]: Unique identifiers of the messages.
  ///
  /// [Ok] is returned on completion.
  const DeleteQuickReplyShortcutMessages({
    required this.shortcutId,
    required this.messageIds,
  });

  /// Unique identifier of the quick reply shortcut to which the messages belong
  final int shortcutId;

  /// Unique identifiers of the messages
  final List<int> messageIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "message_ids": messageIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique identifier of the quick reply shortcut to which the messages belong
  /// * [message_ids]: Unique identifiers of the messages
  DeleteQuickReplyShortcutMessages copyWith({
    int? shortcutId,
    List<int>? messageIds,
  }) =>
      DeleteQuickReplyShortcutMessages(
        shortcutId: shortcutId ?? this.shortcutId,
        messageIds: messageIds ?? this.messageIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteQuickReplyShortcutMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
