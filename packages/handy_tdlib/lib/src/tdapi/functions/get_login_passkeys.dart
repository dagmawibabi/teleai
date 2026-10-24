part of '../tdapi.dart';

/// **GetLoginPasskeys** *(getLoginPasskeys)* - TDLib function
///
/// Returns the list of passkeys allowed to be used for the login by the current user.
///
/// [Passkeys] is returned on completion.
final class GetLoginPasskeys extends TdFunction {
  /// **GetLoginPasskeys** *(getLoginPasskeys)* - TDLib function
  ///
  /// Returns the list of passkeys allowed to be used for the login by the current user.
  ///
  /// [Passkeys] is returned on completion.
  const GetLoginPasskeys();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetLoginPasskeys copyWith() => const GetLoginPasskeys();

  /// TDLib object type
  static const String defaultObjectId = 'getLoginPasskeys';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
