part of '../tdapi.dart';

/// **LoadQuickReplyShortcutMessages** *(loadQuickReplyShortcutMessages)* - TDLib function
///
/// Loads quick reply messages that can be sent by a given quick reply shortcut. The loaded messages will be sent through updateQuickReplyShortcutMessages.
///
/// * [shortcutId]: Unique identifier of the quick reply shortcut.
///
/// [Ok] is returned on completion.
final class LoadQuickReplyShortcutMessages extends TdFunction {
  /// **LoadQuickReplyShortcutMessages** *(loadQuickReplyShortcutMessages)* - TDLib function
  ///
  /// Loads quick reply messages that can be sent by a given quick reply shortcut. The loaded messages will be sent through updateQuickReplyShortcutMessages.
  ///
  /// * [shortcutId]: Unique identifier of the quick reply shortcut.
  ///
  /// [Ok] is returned on completion.
  const LoadQuickReplyShortcutMessages({
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
  LoadQuickReplyShortcutMessages copyWith({
    int? shortcutId,
  }) =>
      LoadQuickReplyShortcutMessages(
        shortcutId: shortcutId ?? this.shortcutId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadQuickReplyShortcutMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
