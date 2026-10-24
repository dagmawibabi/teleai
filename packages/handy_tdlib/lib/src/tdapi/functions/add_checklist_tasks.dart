part of '../tdapi.dart';

/// **AddChecklistTasks** *(addChecklistTasks)* - TDLib function
///
/// Adds tasks to a checklist in a message.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message containing the checklist. Use messageProperties.can_add_tasks to check whether the tasks can be added.
/// * [tasks]: List of added tasks.
///
/// [Ok] is returned on completion.
final class AddChecklistTasks extends TdFunction {
  /// **AddChecklistTasks** *(addChecklistTasks)* - TDLib function
  ///
  /// Adds tasks to a checklist in a message.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message containing the checklist. Use messageProperties.can_add_tasks to check whether the tasks can be added.
  /// * [tasks]: List of added tasks.
  ///
  /// [Ok] is returned on completion.
  const AddChecklistTasks({
    required this.chatId,
    required this.messageId,
    required this.tasks,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message containing the checklist. Use messageProperties.can_add_tasks to check whether the tasks can be added
  final int messageId;

  /// List of added tasks
  final List<InputChecklistTask> tasks;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "tasks": tasks.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message containing the checklist. Use messageProperties.can_add_tasks to check whether the tasks can be added
  /// * [tasks]: List of added tasks
  AddChecklistTasks copyWith({
    int? chatId,
    int? messageId,
    List<InputChecklistTask>? tasks,
  }) =>
      AddChecklistTasks(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        tasks: tasks ?? this.tasks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChecklistTasks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
