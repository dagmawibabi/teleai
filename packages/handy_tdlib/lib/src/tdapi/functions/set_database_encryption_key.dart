part of '../tdapi.dart';

/// **SetDatabaseEncryptionKey** *(setDatabaseEncryptionKey)* - TDLib function
///
/// Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain.
///
/// * [newEncryptionKey]: New encryption key.
///
/// [Ok] is returned on completion.
final class SetDatabaseEncryptionKey extends TdFunction {
  /// **SetDatabaseEncryptionKey** *(setDatabaseEncryptionKey)* - TDLib function
  ///
  /// Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain.
  ///
  /// * [newEncryptionKey]: New encryption key.
  ///
  /// [Ok] is returned on completion.
  const SetDatabaseEncryptionKey({
    required this.newEncryptionKey,
  });

  /// New encryption key
  final String newEncryptionKey;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "new_encryption_key": newEncryptionKey,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [new_encryption_key]: New encryption key
  SetDatabaseEncryptionKey copyWith({
    String? newEncryptionKey,
  }) =>
      SetDatabaseEncryptionKey(
        newEncryptionKey: newEncryptionKey ?? this.newEncryptionKey,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setDatabaseEncryptionKey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
