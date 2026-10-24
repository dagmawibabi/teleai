part of '../tdapi.dart';

/// **FirebaseAuthenticationSettings** *(firebaseAuthenticationSettings)* - parent
///
/// Contains settings for Firebase Authentication in the official applications.
sealed class FirebaseAuthenticationSettings extends TdObject {
  /// **FirebaseAuthenticationSettings** *(firebaseAuthenticationSettings)* - parent
  ///
  /// Contains settings for Firebase Authentication in the official applications.
  const FirebaseAuthenticationSettings();

  /// a FirebaseAuthenticationSettings return type can be :
  /// * [FirebaseAuthenticationSettingsAndroid]
  /// * [FirebaseAuthenticationSettingsIos]
  factory FirebaseAuthenticationSettings.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case FirebaseAuthenticationSettingsAndroid.defaultObjectId:
        return FirebaseAuthenticationSettingsAndroid.fromJson(json);
      case FirebaseAuthenticationSettingsIos.defaultObjectId:
        return FirebaseAuthenticationSettingsIos.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of FirebaseAuthenticationSettings)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  FirebaseAuthenticationSettings copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'firebaseAuthenticationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FirebaseAuthenticationSettingsAndroid** *(firebaseAuthenticationSettingsAndroid)* - child of FirebaseAuthenticationSettings
///
/// Settings for Firebase Authentication in the official Android application.
final class FirebaseAuthenticationSettingsAndroid
    extends FirebaseAuthenticationSettings {
  /// **FirebaseAuthenticationSettingsAndroid** *(firebaseAuthenticationSettingsAndroid)* - child of FirebaseAuthenticationSettings
  ///
  /// Settings for Firebase Authentication in the official Android application.
  const FirebaseAuthenticationSettingsAndroid();

  /// Parse from a json
  factory FirebaseAuthenticationSettingsAndroid.fromJson(
          Map<String, dynamic> json) =>
      const FirebaseAuthenticationSettingsAndroid();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FirebaseAuthenticationSettingsAndroid copyWith() =>
      const FirebaseAuthenticationSettingsAndroid();

  /// TDLib object type
  static const String defaultObjectId = 'firebaseAuthenticationSettingsAndroid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FirebaseAuthenticationSettingsIos** *(firebaseAuthenticationSettingsIos)* - child of FirebaseAuthenticationSettings
///
/// Settings for Firebase Authentication in the official iOS application.
///
/// * [deviceToken]: Device token from Apple Push Notification service.
/// * [isAppSandbox]: True, if App Sandbox is enabled.
final class FirebaseAuthenticationSettingsIos
    extends FirebaseAuthenticationSettings {
  /// **FirebaseAuthenticationSettingsIos** *(firebaseAuthenticationSettingsIos)* - child of FirebaseAuthenticationSettings
  ///
  /// Settings for Firebase Authentication in the official iOS application.
  ///
  /// * [deviceToken]: Device token from Apple Push Notification service.
  /// * [isAppSandbox]: True, if App Sandbox is enabled.
  const FirebaseAuthenticationSettingsIos({
    required this.deviceToken,
    required this.isAppSandbox,
  });

  /// Device token from Apple Push Notification service
  final String deviceToken;

  /// True, if App Sandbox is enabled
  final bool isAppSandbox;

  /// Parse from a json
  factory FirebaseAuthenticationSettingsIos.fromJson(
          Map<String, dynamic> json) =>
      FirebaseAuthenticationSettingsIos(
        deviceToken: json['device_token'],
        isAppSandbox: json['is_app_sandbox'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "device_token": deviceToken,
      "is_app_sandbox": isAppSandbox,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [device_token]: Device token from Apple Push Notification service
  /// * [is_app_sandbox]: True, if App Sandbox is enabled
  @override
  FirebaseAuthenticationSettingsIos copyWith({
    String? deviceToken,
    bool? isAppSandbox,
  }) =>
      FirebaseAuthenticationSettingsIos(
        deviceToken: deviceToken ?? this.deviceToken,
        isAppSandbox: isAppSandbox ?? this.isAppSandbox,
      );

  /// TDLib object type
  static const String defaultObjectId = 'firebaseAuthenticationSettingsIos';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
