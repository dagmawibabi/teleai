part of '../tdapi.dart';

/// **DeleteSavedCredentials** *(deleteSavedCredentials)* - TDLib function
///
/// Deletes saved credentials for all payment provider bots.
///
/// [Ok] is returned on completion.
final class DeleteSavedCredentials extends TdFunction {
  /// **DeleteSavedCredentials** *(deleteSavedCredentials)* - TDLib function
  ///
  /// Deletes saved credentials for all payment provider bots.
  ///
  /// [Ok] is returned on completion.
  const DeleteSavedCredentials();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  DeleteSavedCredentials copyWith() => const DeleteSavedCredentials();

  /// TDLib object type
  static const String defaultObjectId = 'deleteSavedCredentials';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
