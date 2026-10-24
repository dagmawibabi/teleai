part of '../tdapi.dart';

/// **GetOwnedBots** *(getOwnedBots)* - TDLib function
///
/// Returns the list of bots owned by the current user.
///
/// [Users] is returned on completion.
final class GetOwnedBots extends TdFunction {
  /// **GetOwnedBots** *(getOwnedBots)* - TDLib function
  ///
  /// Returns the list of bots owned by the current user.
  ///
  /// [Users] is returned on completion.
  const GetOwnedBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetOwnedBots copyWith() => const GetOwnedBots();

  /// TDLib object type
  static const String defaultObjectId = 'getOwnedBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
