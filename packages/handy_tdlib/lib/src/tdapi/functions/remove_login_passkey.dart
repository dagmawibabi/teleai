part of '../tdapi.dart';

/// **RemoveLoginPasskey** *(removeLoginPasskey)* - TDLib function
///
/// Removes a passkey from the list of passkeys allowed to be used for the login by the current user.
///
/// * [passkeyId]: Unique identifier of the passkey to remove.
///
/// [Ok] is returned on completion.
final class RemoveLoginPasskey extends TdFunction {
  /// **RemoveLoginPasskey** *(removeLoginPasskey)* - TDLib function
  ///
  /// Removes a passkey from the list of passkeys allowed to be used for the login by the current user.
  ///
  /// * [passkeyId]: Unique identifier of the passkey to remove.
  ///
  /// [Ok] is returned on completion.
  const RemoveLoginPasskey({
    required this.passkeyId,
  });

  /// Unique identifier of the passkey to remove
  final String passkeyId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "passkey_id": passkeyId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [passkey_id]: Unique identifier of the passkey to remove
  RemoveLoginPasskey copyWith({
    String? passkeyId,
  }) =>
      RemoveLoginPasskey(
        passkeyId: passkeyId ?? this.passkeyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeLoginPasskey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
