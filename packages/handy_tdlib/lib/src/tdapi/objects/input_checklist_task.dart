part of '../tdapi.dart';

/// **InputChecklistTask** *(inputChecklistTask)* - basic class
///
/// Describes a task in a checklist to be sent.
///
/// * [id]: Unique identifier of the task; must be positive.
/// * [text]: Text of the task; 1-getOption("checklist_task_text_length_max") characters without line feeds. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
final class InputChecklistTask extends TdObject {
  /// **InputChecklistTask** *(inputChecklistTask)* - basic class
  ///
  /// Describes a task in a checklist to be sent.
  ///
  /// * [id]: Unique identifier of the task; must be positive.
  /// * [text]: Text of the task; 1-getOption("checklist_task_text_length_max") characters without line feeds. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities.
  const InputChecklistTask({
    required this.id,
    required this.text,
  });

  /// Unique identifier of the task; must be positive
  final int id;

  /// Text of the task; 1-getOption("checklist_task_text_length_max") characters without line feeds. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  final FormattedText text;

  /// Parse from a json
  factory InputChecklistTask.fromJson(Map<String, dynamic> json) =>
      InputChecklistTask(
        id: json['id'],
        text: FormattedText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the task; must be positive
  /// * [text]: Text of the task; 1-getOption("checklist_task_text_length_max") characters without line feeds. May contain only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities
  InputChecklistTask copyWith({
    int? id,
    FormattedText? text,
  }) =>
      InputChecklistTask(
        id: id ?? this.id,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChecklistTask';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
