part of '../tdapi.dart';

/// **MarkChecklistTasksAsDone** *(markChecklistTasksAsDone)* - TDLib function
///
/// Marks tasks of a checklist in a message as done or not done.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message containing the checklist. Use messageProperties.can_mark_tasks_as_done to check whether the tasks can be marked as done or not done.
/// * [markedAsDoneTaskIds]: Identifiers of tasks that were marked as done.
/// * [markedAsNotDoneTaskIds]: Identifiers of tasks that were marked as not done.
///
/// [Ok] is returned on completion.
final class MarkChecklistTasksAsDone extends TdFunction {
  /// **MarkChecklistTasksAsDone** *(markChecklistTasksAsDone)* - TDLib function
  ///
  /// Marks tasks of a checklist in a message as done or not done.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message containing the checklist. Use messageProperties.can_mark_tasks_as_done to check whether the tasks can be marked as done or not done.
  /// * [markedAsDoneTaskIds]: Identifiers of tasks that were marked as done.
  /// * [markedAsNotDoneTaskIds]: Identifiers of tasks that were marked as not done.
  ///
  /// [Ok] is returned on completion.
  const MarkChecklistTasksAsDone({
    required this.chatId,
    required this.messageId,
    required this.markedAsDoneTaskIds,
    required this.markedAsNotDoneTaskIds,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message containing the checklist. Use messageProperties.can_mark_tasks_as_done to check whether the tasks can be marked as done or not done
  final int messageId;

  /// Identifiers of tasks that were marked as done
  final List<int> markedAsDoneTaskIds;

  /// Identifiers of tasks that were marked as not done
  final List<int> markedAsNotDoneTaskIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "marked_as_done_task_ids": markedAsDoneTaskIds.map((i) => i).toList(),
      "marked_as_not_done_task_ids":
          markedAsNotDoneTaskIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message containing the checklist. Use messageProperties.can_mark_tasks_as_done to check whether the tasks can be marked as done or not done
  /// * [marked_as_done_task_ids]: Identifiers of tasks that were marked as done
  /// * [marked_as_not_done_task_ids]: Identifiers of tasks that were marked as not done
  MarkChecklistTasksAsDone copyWith({
    int? chatId,
    int? messageId,
    List<int>? markedAsDoneTaskIds,
    List<int>? markedAsNotDoneTaskIds,
  }) =>
      MarkChecklistTasksAsDone(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        markedAsDoneTaskIds: markedAsDoneTaskIds ?? this.markedAsDoneTaskIds,
        markedAsNotDoneTaskIds:
            markedAsNotDoneTaskIds ?? this.markedAsNotDoneTaskIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'markChecklistTasksAsDone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
