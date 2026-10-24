part of '../tdapi.dart';

/// **Checklist** *(checklist)* - basic class
///
/// Describes a checklist.
///
/// * [title]: Title of the checklist; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
/// * [tasks]: List of tasks in the checklist.
/// * [othersCanAddTasks]: True, if users other than creator of the list can add tasks to the list.
/// * [canAddTasks]: True, if the current user can add tasks to the list if they have Telegram Premium subscription.
/// * [othersCanMarkTasksAsDone]: True, if users other than creator of the list can mark tasks as done or not done. If true, then the checklist is called "group checklist".
/// * [canMarkTasksAsDone]: True, if the current user can mark tasks as done or not done if they have Telegram Premium subscription.
final class Checklist extends TdObject {
  /// **Checklist** *(checklist)* - basic class
  ///
  /// Describes a checklist.
  ///
  /// * [title]: Title of the checklist; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
  /// * [tasks]: List of tasks in the checklist.
  /// * [othersCanAddTasks]: True, if users other than creator of the list can add tasks to the list.
  /// * [canAddTasks]: True, if the current user can add tasks to the list if they have Telegram Premium subscription.
  /// * [othersCanMarkTasksAsDone]: True, if users other than creator of the list can mark tasks as done or not done. If true, then the checklist is called "group checklist".
  /// * [canMarkTasksAsDone]: True, if the current user can mark tasks as done or not done if they have Telegram Premium subscription.
  const Checklist({
    required this.title,
    required this.tasks,
    required this.othersCanAddTasks,
    required this.canAddTasks,
    required this.othersCanMarkTasksAsDone,
    required this.canMarkTasksAsDone,
  });

  /// Title of the checklist; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  final FormattedText title;

  /// List of tasks in the checklist
  final List<ChecklistTask> tasks;

  /// True, if users other than creator of the list can add tasks to the list
  final bool othersCanAddTasks;

  /// True, if the current user can add tasks to the list if they have Telegram Premium subscription
  final bool canAddTasks;

  /// True, if users other than creator of the list can mark tasks as done or not done. If true, then the checklist is called "group checklist"
  final bool othersCanMarkTasksAsDone;

  /// True, if the current user can mark tasks as done or not done if they have Telegram Premium subscription
  final bool canMarkTasksAsDone;

  /// Parse from a json
  factory Checklist.fromJson(Map<String, dynamic> json) => Checklist(
        title: FormattedText.fromJson(json['title']),
        tasks: List<ChecklistTask>.from((json['tasks'] ?? [])
            .map((item) => ChecklistTask.fromJson(item))
            .toList()),
        othersCanAddTasks: json['others_can_add_tasks'],
        canAddTasks: json['can_add_tasks'],
        othersCanMarkTasksAsDone: json['others_can_mark_tasks_as_done'],
        canMarkTasksAsDone: json['can_mark_tasks_as_done'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title.toJson(),
      "tasks": tasks.map((i) => i.toJson()).toList(),
      "others_can_add_tasks": othersCanAddTasks,
      "can_add_tasks": canAddTasks,
      "others_can_mark_tasks_as_done": othersCanMarkTasksAsDone,
      "can_mark_tasks_as_done": canMarkTasksAsDone,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the checklist; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  /// * [tasks]: List of tasks in the checklist
  /// * [others_can_add_tasks]: True, if users other than creator of the list can add tasks to the list
  /// * [can_add_tasks]: True, if the current user can add tasks to the list if they have Telegram Premium subscription
  /// * [others_can_mark_tasks_as_done]: True, if users other than creator of the list can mark tasks as done or not done. If true, then the checklist is called "group checklist"
  /// * [can_mark_tasks_as_done]: True, if the current user can mark tasks as done or not done if they have Telegram Premium subscription
  Checklist copyWith({
    FormattedText? title,
    List<ChecklistTask>? tasks,
    bool? othersCanAddTasks,
    bool? canAddTasks,
    bool? othersCanMarkTasksAsDone,
    bool? canMarkTasksAsDone,
  }) =>
      Checklist(
        title: title ?? this.title,
        tasks: tasks ?? this.tasks,
        othersCanAddTasks: othersCanAddTasks ?? this.othersCanAddTasks,
        canAddTasks: canAddTasks ?? this.canAddTasks,
        othersCanMarkTasksAsDone:
            othersCanMarkTasksAsDone ?? this.othersCanMarkTasksAsDone,
        canMarkTasksAsDone: canMarkTasksAsDone ?? this.canMarkTasksAsDone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
