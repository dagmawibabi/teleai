part of '../tdapi.dart';

/// **ClearImportedContacts** *(clearImportedContacts)* - TDLib function
///
/// Clears all imported contacts, contact list remains unchanged.
///
/// [Ok] is returned on completion.
final class ClearImportedContacts extends TdFunction {
  /// **ClearImportedContacts** *(clearImportedContacts)* - TDLib function
  ///
  /// Clears all imported contacts, contact list remains unchanged.
  ///
  /// [Ok] is returned on completion.
  const ClearImportedContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ClearImportedContacts copyWith() => const ClearImportedContacts();

  /// TDLib object type
  static const String defaultObjectId = 'clearImportedContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
