part of '../tdapi.dart';

/// **GetRecentInlineBots** *(getRecentInlineBots)* - TDLib function
///
/// Returns up to 20 recently used inline bots in the order of their last usage.
///
/// [Users] is returned on completion.
final class GetRecentInlineBots extends TdFunction {
  /// **GetRecentInlineBots** *(getRecentInlineBots)* - TDLib function
  ///
  /// Returns up to 20 recently used inline bots in the order of their last usage.
  ///
  /// [Users] is returned on completion.
  const GetRecentInlineBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetRecentInlineBots copyWith() => const GetRecentInlineBots();

  /// TDLib object type
  static const String defaultObjectId = 'getRecentInlineBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
