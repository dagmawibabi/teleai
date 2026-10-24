part of '../tdapi.dart';

/// **LoadQuickReplyShortcuts** *(loadQuickReplyShortcuts)* - TDLib function
///
/// Loads quick reply shortcuts created by the current user. The loaded data will be sent through updateQuickReplyShortcut and updateQuickReplyShortcuts.
///
/// [Ok] is returned on completion.
final class LoadQuickReplyShortcuts extends TdFunction {
  /// **LoadQuickReplyShortcuts** *(loadQuickReplyShortcuts)* - TDLib function
  ///
  /// Loads quick reply shortcuts created by the current user. The loaded data will be sent through updateQuickReplyShortcut and updateQuickReplyShortcuts.
  ///
  /// [Ok] is returned on completion.
  const LoadQuickReplyShortcuts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  LoadQuickReplyShortcuts copyWith() => const LoadQuickReplyShortcuts();

  /// TDLib object type
  static const String defaultObjectId = 'loadQuickReplyShortcuts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
