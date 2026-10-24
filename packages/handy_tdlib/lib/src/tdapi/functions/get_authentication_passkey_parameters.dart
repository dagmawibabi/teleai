part of '../tdapi.dart';

/// **GetAuthenticationPasskeyParameters** *(getAuthenticationPasskeyParameters)* - TDLib function
///
/// Returns parameters for authentication using a passkey as JSON-serialized string.
///
/// [Text] is returned on completion.
final class GetAuthenticationPasskeyParameters extends TdFunction {
  /// **GetAuthenticationPasskeyParameters** *(getAuthenticationPasskeyParameters)* - TDLib function
  ///
  /// Returns parameters for authentication using a passkey as JSON-serialized string.
  ///
  /// [Text] is returned on completion.
  const GetAuthenticationPasskeyParameters();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAuthenticationPasskeyParameters copyWith() =>
      const GetAuthenticationPasskeyParameters();

  /// TDLib object type
  static const String defaultObjectId = 'getAuthenticationPasskeyParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
