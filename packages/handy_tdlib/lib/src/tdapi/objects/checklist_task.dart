part of '../tdapi.dart';

/// **ChecklistTask** *(checklistTask)* - basic class
///
/// Describes a task in a checklist.
///
/// * [id]: Unique identifier of the task.
/// * [text]: Text of the task; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, DateTime and automatically found entities.
/// * [completedBy]: Identifier of the user or chat that completed the task; may be null if the task isn't completed yet *(optional)*.
/// * [completionDate]: Point in time (Unix timestamp) when the task was completed; 0 if the task isn't completed.
final class ChecklistTask extends TdObject {
  /// **ChecklistTask** *(checklistTask)* - basic class
  ///
  /// Describes a task in a checklist.
  ///
  /// * [id]: Unique identifier of the task.
  /// * [text]: Text of the task; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, DateTime and automatically found entities.
  /// * [completedBy]: Identifier of the user or chat that completed the task; may be null if the task isn't completed yet *(optional)*.
  /// * [completionDate]: Point in time (Unix timestamp) when the task was completed; 0 if the task isn't completed.
  const ChecklistTask({
    required this.id,
    required this.text,
    this.completedBy,
    required this.completionDate,
  });

  /// Unique identifier of the task
  final int id;

  /// Text of the task; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, DateTime and automatically found entities
  final FormattedText text;

  /// Identifier of the user or chat that completed the task; may be null if the task isn't completed yet
  final MessageSender? completedBy;

  /// Point in time (Unix timestamp) when the task was completed; 0 if the task isn't completed
  final int completionDate;

  /// Parse from a json
  factory ChecklistTask.fromJson(Map<String, dynamic> json) => ChecklistTask(
        id: json['id'],
        text: FormattedText.fromJson(json['text']),
        completedBy: json['completed_by'] == null
            ? null
            : MessageSender.fromJson(json['completed_by']),
        completionDate: json['completion_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "text": text.toJson(),
      "completed_by": completedBy?.toJson(),
      "completion_date": completionDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the task
  /// * [text]: Text of the task; may contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, DateTime and automatically found entities
  /// * [completed_by]: Identifier of the user or chat that completed the task; may be null if the task isn't completed yet
  /// * [completion_date]: Point in time (Unix timestamp) when the task was completed; 0 if the task isn't completed
  ChecklistTask copyWith({
    int? id,
    FormattedText? text,
    MessageSender? completedBy,
    int? completionDate,
  }) =>
      ChecklistTask(
        id: id ?? this.id,
        text: text ?? this.text,
        completedBy: completedBy ?? this.completedBy,
        completionDate: completionDate ?? this.completionDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checklistTask';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
