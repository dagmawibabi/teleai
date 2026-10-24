part of '../tdapi.dart';

/// **GetImportedContactCount** *(getImportedContactCount)* - TDLib function
///
/// Returns the total number of imported contacts.
///
/// [Count] is returned on completion.
final class GetImportedContactCount extends TdFunction {
  /// **GetImportedContactCount** *(getImportedContactCount)* - TDLib function
  ///
  /// Returns the total number of imported contacts.
  ///
  /// [Count] is returned on completion.
  const GetImportedContactCount();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetImportedContactCount copyWith() => const GetImportedContactCount();

  /// TDLib object type
  static const String defaultObjectId = 'getImportedContactCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
