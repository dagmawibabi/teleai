part of '../tdapi.dart';

/// **IsLoginEmailAddressRequired** *(isLoginEmailAddressRequired)* - TDLib function
///
/// Checks whether the current user is required to set login email address.
///
/// [Ok] is returned on completion.
final class IsLoginEmailAddressRequired extends TdFunction {
  /// **IsLoginEmailAddressRequired** *(isLoginEmailAddressRequired)* - TDLib function
  ///
  /// Checks whether the current user is required to set login email address.
  ///
  /// [Ok] is returned on completion.
  const IsLoginEmailAddressRequired();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  IsLoginEmailAddressRequired copyWith() => const IsLoginEmailAddressRequired();

  /// TDLib object type
  static const String defaultObjectId = 'isLoginEmailAddressRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
