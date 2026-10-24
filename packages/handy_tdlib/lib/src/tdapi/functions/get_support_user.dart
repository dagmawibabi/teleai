part of '../tdapi.dart';

/// **GetSupportUser** *(getSupportUser)* - TDLib function
///
/// Returns a user who can be contacted to get support.
///
/// [User] is returned on completion.
final class GetSupportUser extends TdFunction {
  /// **GetSupportUser** *(getSupportUser)* - TDLib function
  ///
  /// Returns a user who can be contacted to get support.
  ///
  /// [User] is returned on completion.
  const GetSupportUser();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSupportUser copyWith() => const GetSupportUser();

  /// TDLib object type
  static const String defaultObjectId = 'getSupportUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
