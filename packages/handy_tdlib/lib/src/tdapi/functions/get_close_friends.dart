part of '../tdapi.dart';

/// **GetCloseFriends** *(getCloseFriends)* - TDLib function
///
/// Returns all close friends of the current user.
///
/// [Users] is returned on completion.
final class GetCloseFriends extends TdFunction {
  /// **GetCloseFriends** *(getCloseFriends)* - TDLib function
  ///
  /// Returns all close friends of the current user.
  ///
  /// [Users] is returned on completion.
  const GetCloseFriends();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetCloseFriends copyWith() => const GetCloseFriends();

  /// TDLib object type
  static const String defaultObjectId = 'getCloseFriends';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
