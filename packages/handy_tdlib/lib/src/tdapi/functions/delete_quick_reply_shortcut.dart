part of '../tdapi.dart';

/// **DeleteQuickReplyShortcut** *(deleteQuickReplyShortcut)* - TDLib function
///
/// Deletes a quick reply shortcut.
///
/// * [shortcutId]: Unique identifier of the quick reply shortcut.
///
/// [Ok] is returned on completion.
final class DeleteQuickReplyShortcut extends TdFunction {
  /// **DeleteQuickReplyShortcut** *(deleteQuickReplyShortcut)* - TDLib function
  ///
  /// Deletes a quick reply shortcut.
  ///
  /// * [shortcutId]: Unique identifier of the quick reply shortcut.
  ///
  /// [Ok] is returned on completion.
  const DeleteQuickReplyShortcut({
    required this.shortcutId,
  });

  /// Unique identifier of the quick reply shortcut
  final int shortcutId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique identifier of the quick reply shortcut
  DeleteQuickReplyShortcut copyWith({
    int? shortcutId,
  }) =>
      DeleteQuickReplyShortcut(
        shortcutId: shortcutId ?? this.shortcutId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteQuickReplyShortcut';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
