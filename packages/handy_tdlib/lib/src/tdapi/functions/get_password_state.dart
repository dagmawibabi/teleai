part of '../tdapi.dart';

/// **GetPasswordState** *(getPasswordState)* - TDLib function
///
/// Returns the current state of 2-step verification.
///
/// [PasswordState] is returned on completion.
final class GetPasswordState extends TdFunction {
  /// **GetPasswordState** *(getPasswordState)* - TDLib function
  ///
  /// Returns the current state of 2-step verification.
  ///
  /// [PasswordState] is returned on completion.
  const GetPasswordState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetPasswordState copyWith() => const GetPasswordState();

  /// TDLib object type
  static const String defaultObjectId = 'getPasswordState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
