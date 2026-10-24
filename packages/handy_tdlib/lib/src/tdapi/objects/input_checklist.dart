part of '../tdapi.dart';

/// **InputChecklist** *(inputChecklist)* - basic class
///
/// Describes a checklist to be sent.
///
/// * [title]: Title of the checklist; 1-getOption("checklist_title_length_max") characters. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
/// * [tasks]: List of tasks in the checklist; 1-getOption("checklist_task_count_max") tasks.
/// * [othersCanAddTasks]: True, if other users can add tasks to the list.
/// * [othersCanMarkTasksAsDone]: True, if other users can mark tasks as done or not done.
final class InputChecklist extends TdObject {
  /// **InputChecklist** *(inputChecklist)* - basic class
  ///
  /// Describes a checklist to be sent.
  ///
  /// * [title]: Title of the checklist; 1-getOption("checklist_title_length_max") characters. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
  /// * [tasks]: List of tasks in the checklist; 1-getOption("checklist_task_count_max") tasks.
  /// * [othersCanAddTasks]: True, if other users can add tasks to the list.
  /// * [othersCanMarkTasksAsDone]: True, if other users can mark tasks as done or not done.
  const InputChecklist({
    required this.title,
    required this.tasks,
    required this.othersCanAddTasks,
    required this.othersCanMarkTasksAsDone,
  });

  /// Title of the checklist; 1-getOption("checklist_title_length_max") characters. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  final FormattedText title;

  /// List of tasks in the checklist; 1-getOption("checklist_task_count_max") tasks
  final List<InputChecklistTask> tasks;

  /// True, if other users can add tasks to the list
  final bool othersCanAddTasks;

  /// True, if other users can mark tasks as done or not done
  final bool othersCanMarkTasksAsDone;

  /// Parse from a json
  factory InputChecklist.fromJson(Map<String, dynamic> json) => InputChecklist(
        title: FormattedText.fromJson(json['title']),
        tasks: List<InputChecklistTask>.from((json['tasks'] ?? [])
            .map((item) => InputChecklistTask.fromJson(item))
            .toList()),
        othersCanAddTasks: json['others_can_add_tasks'],
        othersCanMarkTasksAsDone: json['others_can_mark_tasks_as_done'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title.toJson(),
      "tasks": tasks.map((i) => i.toJson()).toList(),
      "others_can_add_tasks": othersCanAddTasks,
      "others_can_mark_tasks_as_done": othersCanMarkTasksAsDone,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the checklist; 1-getOption("checklist_title_length_max") characters. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  /// * [tasks]: List of tasks in the checklist; 1-getOption("checklist_task_count_max") tasks
  /// * [others_can_add_tasks]: True, if other users can add tasks to the list
  /// * [others_can_mark_tasks_as_done]: True, if other users can mark tasks as done or not done
  InputChecklist copyWith({
    FormattedText? title,
    List<InputChecklistTask>? tasks,
    bool? othersCanAddTasks,
    bool? othersCanMarkTasksAsDone,
  }) =>
      InputChecklist(
        title: title ?? this.title,
        tasks: tasks ?? this.tasks,
        othersCanAddTasks: othersCanAddTasks ?? this.othersCanAddTasks,
        othersCanMarkTasksAsDone:
            othersCanMarkTasksAsDone ?? this.othersCanMarkTasksAsDone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChecklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
