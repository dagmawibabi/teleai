part of '../tdapi.dart';

/// **GetTemporaryPasswordState** *(getTemporaryPasswordState)* - TDLib function
///
/// Returns information about the current temporary password.
///
/// [TemporaryPasswordState] is returned on completion.
final class GetTemporaryPasswordState extends TdFunction {
  /// **GetTemporaryPasswordState** *(getTemporaryPasswordState)* - TDLib function
  ///
  /// Returns information about the current temporary password.
  ///
  /// [TemporaryPasswordState] is returned on completion.
  const GetTemporaryPasswordState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTemporaryPasswordState copyWith() => const GetTemporaryPasswordState();

  /// TDLib object type
  static const String defaultObjectId = 'getTemporaryPasswordState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
