part of '../tdapi.dart';

/// **ReorderQuickReplyShortcuts** *(reorderQuickReplyShortcuts)* - TDLib function
///
/// Changes the order of quick reply shortcuts.
///
/// * [shortcutIds]: The new order of quick reply shortcuts.
///
/// [Ok] is returned on completion.
final class ReorderQuickReplyShortcuts extends TdFunction {
  /// **ReorderQuickReplyShortcuts** *(reorderQuickReplyShortcuts)* - TDLib function
  ///
  /// Changes the order of quick reply shortcuts.
  ///
  /// * [shortcutIds]: The new order of quick reply shortcuts.
  ///
  /// [Ok] is returned on completion.
  const ReorderQuickReplyShortcuts({
    required this.shortcutIds,
  });

  /// The new order of quick reply shortcuts
  final List<int> shortcutIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_ids": shortcutIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_ids]: The new order of quick reply shortcuts
  ReorderQuickReplyShortcuts copyWith({
    List<int>? shortcutIds,
  }) =>
      ReorderQuickReplyShortcuts(
        shortcutIds: shortcutIds ?? this.shortcutIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderQuickReplyShortcuts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
