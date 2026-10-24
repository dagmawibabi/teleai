part of '../tdapi.dart';

/// **ClearRecentReactions** *(clearRecentReactions)* - TDLib function
///
/// Clears the list of recently used reactions.
///
/// [Ok] is returned on completion.
final class ClearRecentReactions extends TdFunction {
  /// **ClearRecentReactions** *(clearRecentReactions)* - TDLib function
  ///
  /// Clears the list of recently used reactions.
  ///
  /// [Ok] is returned on completion.
  const ClearRecentReactions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ClearRecentReactions copyWith() => const ClearRecentReactions();

  /// TDLib object type
  static const String defaultObjectId = 'clearRecentReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
