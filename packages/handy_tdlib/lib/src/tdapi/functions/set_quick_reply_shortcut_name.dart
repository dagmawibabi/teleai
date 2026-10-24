part of '../tdapi.dart';

/// **SetQuickReplyShortcutName** *(setQuickReplyShortcutName)* - TDLib function
///
/// Changes name of a quick reply shortcut.
///
/// * [shortcutId]: Unique identifier of the quick reply shortcut.
/// * [name]: New name for the shortcut. Use checkQuickReplyShortcutName to check its validness.
///
/// [Ok] is returned on completion.
final class SetQuickReplyShortcutName extends TdFunction {
  /// **SetQuickReplyShortcutName** *(setQuickReplyShortcutName)* - TDLib function
  ///
  /// Changes name of a quick reply shortcut.
  ///
  /// * [shortcutId]: Unique identifier of the quick reply shortcut.
  /// * [name]: New name for the shortcut. Use checkQuickReplyShortcutName to check its validness.
  ///
  /// [Ok] is returned on completion.
  const SetQuickReplyShortcutName({
    required this.shortcutId,
    required this.name,
  });

  /// Unique identifier of the quick reply shortcut
  final int shortcutId;

  /// New name for the shortcut. Use checkQuickReplyShortcutName to check its validness
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique identifier of the quick reply shortcut
  /// * [name]: New name for the shortcut. Use checkQuickReplyShortcutName to check its validness
  SetQuickReplyShortcutName copyWith({
    int? shortcutId,
    String? name,
  }) =>
      SetQuickReplyShortcutName(
        shortcutId: shortcutId ?? this.shortcutId,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setQuickReplyShortcutName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
