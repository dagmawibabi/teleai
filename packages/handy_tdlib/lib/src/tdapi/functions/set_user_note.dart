part of '../tdapi.dart';

/// **SetUserNote** *(setUserNote)* - TDLib function
///
/// Changes a note of a contact user.
///
/// * [userId]: User identifier.
/// * [note]: Note to set for the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
///
/// [Ok] is returned on completion.
final class SetUserNote extends TdFunction {
  /// **SetUserNote** *(setUserNote)* - TDLib function
  ///
  /// Changes a note of a contact user.
  ///
  /// * [userId]: User identifier.
  /// * [note]: Note to set for the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  ///
  /// [Ok] is returned on completion.
  const SetUserNote({
    required this.userId,
    required this.note,
  });

  /// User identifier
  final int userId;

  /// Note to set for the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText note;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "note": note.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [note]: Note to set for the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  SetUserNote copyWith({
    int? userId,
    FormattedText? note,
  }) =>
      SetUserNote(
        userId: userId ?? this.userId,
        note: note ?? this.note,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUserNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
