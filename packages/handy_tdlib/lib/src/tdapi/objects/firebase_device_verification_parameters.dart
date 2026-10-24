part of '../tdapi.dart';

/// **FirebaseDeviceVerificationParameters** *(firebaseDeviceVerificationParameters)* - parent
///
/// Describes parameters to be used for device verification.
sealed class FirebaseDeviceVerificationParameters extends TdObject {
  /// **FirebaseDeviceVerificationParameters** *(firebaseDeviceVerificationParameters)* - parent
  ///
  /// Describes parameters to be used for device verification.
  const FirebaseDeviceVerificationParameters();

  /// a FirebaseDeviceVerificationParameters return type can be :
  /// * [FirebaseDeviceVerificationParametersSafetyNet]
  /// * [FirebaseDeviceVerificationParametersPlayIntegrity]
  factory FirebaseDeviceVerificationParameters.fromJson(
      Map<String, dynamic> json) {
    switch (json["@type"]) {
      case FirebaseDeviceVerificationParametersSafetyNet.defaultObjectId:
        return FirebaseDeviceVerificationParametersSafetyNet.fromJson(json);
      case FirebaseDeviceVerificationParametersPlayIntegrity.defaultObjectId:
        return FirebaseDeviceVerificationParametersPlayIntegrity.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of FirebaseDeviceVerificationParameters)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  FirebaseDeviceVerificationParameters copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'firebaseDeviceVerificationParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FirebaseDeviceVerificationParametersSafetyNet** *(firebaseDeviceVerificationParametersSafetyNet)* - child of FirebaseDeviceVerificationParameters
///
/// Device verification must be performed with the SafetyNet Attestation API.
///
/// * [nonce]: Nonce to pass to the SafetyNet Attestation API.
final class FirebaseDeviceVerificationParametersSafetyNet
    extends FirebaseDeviceVerificationParameters {
  /// **FirebaseDeviceVerificationParametersSafetyNet** *(firebaseDeviceVerificationParametersSafetyNet)* - child of FirebaseDeviceVerificationParameters
  ///
  /// Device verification must be performed with the SafetyNet Attestation API.
  ///
  /// * [nonce]: Nonce to pass to the SafetyNet Attestation API.
  const FirebaseDeviceVerificationParametersSafetyNet({
    required this.nonce,
  });

  /// Nonce to pass to the SafetyNet Attestation API
  final String nonce;

  /// Parse from a json
  factory FirebaseDeviceVerificationParametersSafetyNet.fromJson(
          Map<String, dynamic> json) =>
      FirebaseDeviceVerificationParametersSafetyNet(
        nonce: json['nonce'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nonce": nonce,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nonce]: Nonce to pass to the SafetyNet Attestation API
  @override
  FirebaseDeviceVerificationParametersSafetyNet copyWith({
    String? nonce,
  }) =>
      FirebaseDeviceVerificationParametersSafetyNet(
        nonce: nonce ?? this.nonce,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'firebaseDeviceVerificationParametersSafetyNet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FirebaseDeviceVerificationParametersPlayIntegrity** *(firebaseDeviceVerificationParametersPlayIntegrity)* - child of FirebaseDeviceVerificationParameters
///
/// Device verification must be performed with the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic).
///
/// * [nonce]: Base64url-encoded nonce to pass to the Play Integrity API.
/// * [cloudProjectNumber]: Cloud project number to pass to the Play Integrity API.
final class FirebaseDeviceVerificationParametersPlayIntegrity
    extends FirebaseDeviceVerificationParameters {
  /// **FirebaseDeviceVerificationParametersPlayIntegrity** *(firebaseDeviceVerificationParametersPlayIntegrity)* - child of FirebaseDeviceVerificationParameters
  ///
  /// Device verification must be performed with the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic).
  ///
  /// * [nonce]: Base64url-encoded nonce to pass to the Play Integrity API.
  /// * [cloudProjectNumber]: Cloud project number to pass to the Play Integrity API.
  const FirebaseDeviceVerificationParametersPlayIntegrity({
    required this.nonce,
    required this.cloudProjectNumber,
  });

  /// Base64url-encoded nonce to pass to the Play Integrity API
  final String nonce;

  /// Cloud project number to pass to the Play Integrity API
  final int cloudProjectNumber;

  /// Parse from a json
  factory FirebaseDeviceVerificationParametersPlayIntegrity.fromJson(
          Map<String, dynamic> json) =>
      FirebaseDeviceVerificationParametersPlayIntegrity(
        nonce: json['nonce'],
        cloudProjectNumber: json['cloud_project_number'] is int
            ? json['cloud_project_number']
            : int.parse(json['cloud_project_number']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nonce": nonce,
      "cloud_project_number": cloudProjectNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nonce]: Base64url-encoded nonce to pass to the Play Integrity API
  /// * [cloud_project_number]: Cloud project number to pass to the Play Integrity API
  @override
  FirebaseDeviceVerificationParametersPlayIntegrity copyWith({
    String? nonce,
    int? cloudProjectNumber,
  }) =>
      FirebaseDeviceVerificationParametersPlayIntegrity(
        nonce: nonce ?? this.nonce,
        cloudProjectNumber: cloudProjectNumber ?? this.cloudProjectNumber,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'firebaseDeviceVerificationParametersPlayIntegrity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
