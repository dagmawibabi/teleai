part of '../tdapi.dart';

/// **InputCredentials** *(inputCredentials)* - parent
///
/// Contains information about the payment method chosen by the user.
sealed class InputCredentials extends TdObject {
  /// **InputCredentials** *(inputCredentials)* - parent
  ///
  /// Contains information about the payment method chosen by the user.
  const InputCredentials();

  /// a InputCredentials return type can be :
  /// * [InputCredentialsSaved]
  /// * [InputCredentialsNew]
  /// * [InputCredentialsApplePay]
  /// * [InputCredentialsGooglePay]
  factory InputCredentials.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputCredentialsSaved.defaultObjectId:
        return InputCredentialsSaved.fromJson(json);
      case InputCredentialsNew.defaultObjectId:
        return InputCredentialsNew.fromJson(json);
      case InputCredentialsApplePay.defaultObjectId:
        return InputCredentialsApplePay.fromJson(json);
      case InputCredentialsGooglePay.defaultObjectId:
        return InputCredentialsGooglePay.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputCredentials)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputCredentials copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputCredentials';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCredentialsSaved** *(inputCredentialsSaved)* - child of InputCredentials
///
/// Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password.
///
/// * [savedCredentialsId]: Identifier of the saved credentials.
final class InputCredentialsSaved extends InputCredentials {
  /// **InputCredentialsSaved** *(inputCredentialsSaved)* - child of InputCredentials
  ///
  /// Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password.
  ///
  /// * [savedCredentialsId]: Identifier of the saved credentials.
  const InputCredentialsSaved({
    required this.savedCredentialsId,
  });

  /// Identifier of the saved credentials
  final String savedCredentialsId;

  /// Parse from a json
  factory InputCredentialsSaved.fromJson(Map<String, dynamic> json) =>
      InputCredentialsSaved(
        savedCredentialsId: json['saved_credentials_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "saved_credentials_id": savedCredentialsId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_credentials_id]: Identifier of the saved credentials
  @override
  InputCredentialsSaved copyWith({
    String? savedCredentialsId,
  }) =>
      InputCredentialsSaved(
        savedCredentialsId: savedCredentialsId ?? this.savedCredentialsId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCredentialsSaved';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCredentialsNew** *(inputCredentialsNew)* - child of InputCredentials
///
/// Applies if a user enters new credentials on a payment provider website.
///
/// * [data]: JSON-encoded data with the credential identifier from the payment provider.
/// * [allowSave]: True, if the credential identifier can be saved on the server side.
final class InputCredentialsNew extends InputCredentials {
  /// **InputCredentialsNew** *(inputCredentialsNew)* - child of InputCredentials
  ///
  /// Applies if a user enters new credentials on a payment provider website.
  ///
  /// * [data]: JSON-encoded data with the credential identifier from the payment provider.
  /// * [allowSave]: True, if the credential identifier can be saved on the server side.
  const InputCredentialsNew({
    required this.data,
    required this.allowSave,
  });

  /// JSON-encoded data with the credential identifier from the payment provider
  final String data;

  /// True, if the credential identifier can be saved on the server side
  final bool allowSave;

  /// Parse from a json
  factory InputCredentialsNew.fromJson(Map<String, dynamic> json) =>
      InputCredentialsNew(
        data: json['data'],
        allowSave: json['allow_save'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
      "allow_save": allowSave,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: JSON-encoded data with the credential identifier from the payment provider
  /// * [allow_save]: True, if the credential identifier can be saved on the server side
  @override
  InputCredentialsNew copyWith({
    String? data,
    bool? allowSave,
  }) =>
      InputCredentialsNew(
        data: data ?? this.data,
        allowSave: allowSave ?? this.allowSave,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCredentialsNew';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCredentialsApplePay** *(inputCredentialsApplePay)* - child of InputCredentials
///
/// Applies if a user enters new credentials using Apple Pay.
///
/// * [data]: JSON-encoded data with the credential identifier.
final class InputCredentialsApplePay extends InputCredentials {
  /// **InputCredentialsApplePay** *(inputCredentialsApplePay)* - child of InputCredentials
  ///
  /// Applies if a user enters new credentials using Apple Pay.
  ///
  /// * [data]: JSON-encoded data with the credential identifier.
  const InputCredentialsApplePay({
    required this.data,
  });

  /// JSON-encoded data with the credential identifier
  final String data;

  /// Parse from a json
  factory InputCredentialsApplePay.fromJson(Map<String, dynamic> json) =>
      InputCredentialsApplePay(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: JSON-encoded data with the credential identifier
  @override
  InputCredentialsApplePay copyWith({
    String? data,
  }) =>
      InputCredentialsApplePay(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCredentialsApplePay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCredentialsGooglePay** *(inputCredentialsGooglePay)* - child of InputCredentials
///
/// Applies if a user enters new credentials using Google Pay.
///
/// * [data]: JSON-encoded data with the credential identifier.
final class InputCredentialsGooglePay extends InputCredentials {
  /// **InputCredentialsGooglePay** *(inputCredentialsGooglePay)* - child of InputCredentials
  ///
  /// Applies if a user enters new credentials using Google Pay.
  ///
  /// * [data]: JSON-encoded data with the credential identifier.
  const InputCredentialsGooglePay({
    required this.data,
  });

  /// JSON-encoded data with the credential identifier
  final String data;

  /// Parse from a json
  factory InputCredentialsGooglePay.fromJson(Map<String, dynamic> json) =>
      InputCredentialsGooglePay(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: JSON-encoded data with the credential identifier
  @override
  InputCredentialsGooglePay copyWith({
    String? data,
  }) =>
      InputCredentialsGooglePay(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCredentialsGooglePay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
