part of '../tdapi.dart';

/// **GetPasskeyParameters** *(getPasskeyParameters)* - TDLib function
///
/// Returns parameters for creating of a new passkey as JSON-serialized string.
///
/// [Text] is returned on completion.
final class GetPasskeyParameters extends TdFunction {
  /// **GetPasskeyParameters** *(getPasskeyParameters)* - TDLib function
  ///
  /// Returns parameters for creating of a new passkey as JSON-serialized string.
  ///
  /// [Text] is returned on completion.
  const GetPasskeyParameters();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetPasskeyParameters copyWith() => const GetPasskeyParameters();

  /// TDLib object type
  static const String defaultObjectId = 'getPasskeyParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
