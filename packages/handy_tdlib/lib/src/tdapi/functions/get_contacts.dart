part of '../tdapi.dart';

/// **GetContacts** *(getContacts)* - TDLib function
///
/// Returns all contacts of the user.
///
/// [Users] is returned on completion.
final class GetContacts extends TdFunction {
  /// **GetContacts** *(getContacts)* - TDLib function
  ///
  /// Returns all contacts of the user.
  ///
  /// [Users] is returned on completion.
  const GetContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetContacts copyWith() => const GetContacts();

  /// TDLib object type
  static const String defaultObjectId = 'getContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
