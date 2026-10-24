part of '../tdapi.dart';

/// **AddLoginPasskey** *(addLoginPasskey)* - TDLib function
///
/// Adds a passkey allowed to be used for the login by the current user and returns the added passkey. Call getPasskeyParameters to get parameters for creating of the passkey.
///
/// * [clientData]: JSON-encoded client data.
/// * [attestationObject]: Passkey attestation object.
///
/// [Passkey] is returned on completion.
final class AddLoginPasskey extends TdFunction {
  /// **AddLoginPasskey** *(addLoginPasskey)* - TDLib function
  ///
  /// Adds a passkey allowed to be used for the login by the current user and returns the added passkey. Call getPasskeyParameters to get parameters for creating of the passkey.
  ///
  /// * [clientData]: JSON-encoded client data.
  /// * [attestationObject]: Passkey attestation object.
  ///
  /// [Passkey] is returned on completion.
  const AddLoginPasskey({
    required this.clientData,
    required this.attestationObject,
  });

  /// JSON-encoded client data
  final String clientData;

  /// Passkey attestation object
  final String attestationObject;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "client_data": clientData,
      "attestation_object": attestationObject,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [client_data]: JSON-encoded client data
  /// * [attestation_object]: Passkey attestation object
  AddLoginPasskey copyWith({
    String? clientData,
    String? attestationObject,
  }) =>
      AddLoginPasskey(
        clientData: clientData ?? this.clientData,
        attestationObject: attestationObject ?? this.attestationObject,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addLoginPasskey';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
