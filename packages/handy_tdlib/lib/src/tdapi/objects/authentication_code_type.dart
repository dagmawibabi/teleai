part of '../tdapi.dart';

/// **AuthenticationCodeType** *(authenticationCodeType)* - parent
///
/// Provides information about the method by which an authentication code is delivered to the user.
sealed class AuthenticationCodeType extends TdObject {
  /// **AuthenticationCodeType** *(authenticationCodeType)* - parent
  ///
  /// Provides information about the method by which an authentication code is delivered to the user.
  const AuthenticationCodeType();

  /// a AuthenticationCodeType return type can be :
  /// * [AuthenticationCodeTypeTelegramMessage]
  /// * [AuthenticationCodeTypeSms]
  /// * [AuthenticationCodeTypeSmsWord]
  /// * [AuthenticationCodeTypeSmsPhrase]
  /// * [AuthenticationCodeTypeCall]
  /// * [AuthenticationCodeTypeFlashCall]
  /// * [AuthenticationCodeTypeMissedCall]
  /// * [AuthenticationCodeTypeFragment]
  /// * [AuthenticationCodeTypeFirebaseAndroid]
  /// * [AuthenticationCodeTypeFirebaseIos]
  factory AuthenticationCodeType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case AuthenticationCodeTypeTelegramMessage.defaultObjectId:
        return AuthenticationCodeTypeTelegramMessage.fromJson(json);
      case AuthenticationCodeTypeSms.defaultObjectId:
        return AuthenticationCodeTypeSms.fromJson(json);
      case AuthenticationCodeTypeSmsWord.defaultObjectId:
        return AuthenticationCodeTypeSmsWord.fromJson(json);
      case AuthenticationCodeTypeSmsPhrase.defaultObjectId:
        return AuthenticationCodeTypeSmsPhrase.fromJson(json);
      case AuthenticationCodeTypeCall.defaultObjectId:
        return AuthenticationCodeTypeCall.fromJson(json);
      case AuthenticationCodeTypeFlashCall.defaultObjectId:
        return AuthenticationCodeTypeFlashCall.fromJson(json);
      case AuthenticationCodeTypeMissedCall.defaultObjectId:
        return AuthenticationCodeTypeMissedCall.fromJson(json);
      case AuthenticationCodeTypeFragment.defaultObjectId:
        return AuthenticationCodeTypeFragment.fromJson(json);
      case AuthenticationCodeTypeFirebaseAndroid.defaultObjectId:
        return AuthenticationCodeTypeFirebaseAndroid.fromJson(json);
      case AuthenticationCodeTypeFirebaseIos.defaultObjectId:
        return AuthenticationCodeTypeFirebaseIos.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of AuthenticationCodeType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  AuthenticationCodeType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeTelegramMessage** *(authenticationCodeTypeTelegramMessage)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered via a private Telegram message, which can be viewed from another active session.
///
/// * [length]: Length of the code.
final class AuthenticationCodeTypeTelegramMessage
    extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeTelegramMessage** *(authenticationCodeTypeTelegramMessage)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered via a private Telegram message, which can be viewed from another active session.
  ///
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeTelegramMessage({
    required this.length,
  });

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeTelegramMessage.fromJson(
          Map<String, dynamic> json) =>
      AuthenticationCodeTypeTelegramMessage(
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeTelegramMessage copyWith({
    int? length,
  }) =>
      AuthenticationCodeTypeTelegramMessage(
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeTelegramMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeSms** *(authenticationCodeTypeSms)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
///
/// * [length]: Length of the code.
final class AuthenticationCodeTypeSms extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeSms** *(authenticationCodeTypeSms)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
  ///
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeSms({
    required this.length,
  });

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeSms.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeSms(
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeSms copyWith({
    int? length,
  }) =>
      AuthenticationCodeTypeSms(
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeSms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeSmsWord** *(authenticationCodeTypeSmsWord)* - child of AuthenticationCodeType
///
/// An authentication code is a word delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
///
/// * [firstLetter]: The first letters of the word if known.
final class AuthenticationCodeTypeSmsWord extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeSmsWord** *(authenticationCodeTypeSmsWord)* - child of AuthenticationCodeType
  ///
  /// An authentication code is a word delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
  ///
  /// * [firstLetter]: The first letters of the word if known.
  const AuthenticationCodeTypeSmsWord({
    required this.firstLetter,
  });

  /// The first letters of the word if known
  final String firstLetter;

  /// Parse from a json
  factory AuthenticationCodeTypeSmsWord.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeSmsWord(
        firstLetter: json['first_letter'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "first_letter": firstLetter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [first_letter]: The first letters of the word if known
  @override
  AuthenticationCodeTypeSmsWord copyWith({
    String? firstLetter,
  }) =>
      AuthenticationCodeTypeSmsWord(
        firstLetter: firstLetter ?? this.firstLetter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeSmsWord';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeSmsPhrase** *(authenticationCodeTypeSmsPhrase)* - child of AuthenticationCodeType
///
/// An authentication code is a phrase from multiple words delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
///
/// * [firstWord]: The first word of the phrase if known.
final class AuthenticationCodeTypeSmsPhrase extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeSmsPhrase** *(authenticationCodeTypeSmsPhrase)* - child of AuthenticationCodeType
  ///
  /// An authentication code is a phrase from multiple words delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code.
  ///
  /// * [firstWord]: The first word of the phrase if known.
  const AuthenticationCodeTypeSmsPhrase({
    required this.firstWord,
  });

  /// The first word of the phrase if known
  final String firstWord;

  /// Parse from a json
  factory AuthenticationCodeTypeSmsPhrase.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeSmsPhrase(
        firstWord: json['first_word'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "first_word": firstWord,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [first_word]: The first word of the phrase if known
  @override
  AuthenticationCodeTypeSmsPhrase copyWith({
    String? firstWord,
  }) =>
      AuthenticationCodeTypeSmsPhrase(
        firstWord: firstWord ?? this.firstWord,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeSmsPhrase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeCall** *(authenticationCodeTypeCall)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered via a phone call to the specified phone number.
///
/// * [length]: Length of the code.
final class AuthenticationCodeTypeCall extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeCall** *(authenticationCodeTypeCall)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered via a phone call to the specified phone number.
  ///
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeCall({
    required this.length,
  });

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeCall.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeCall(
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeCall copyWith({
    int? length,
  }) =>
      AuthenticationCodeTypeCall(
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeFlashCall** *(authenticationCodeTypeFlashCall)* - child of AuthenticationCodeType
///
/// An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically.
///
/// * [pattern]: Pattern of the phone number from which the call will be made.
final class AuthenticationCodeTypeFlashCall extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeFlashCall** *(authenticationCodeTypeFlashCall)* - child of AuthenticationCodeType
  ///
  /// An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically.
  ///
  /// * [pattern]: Pattern of the phone number from which the call will be made.
  const AuthenticationCodeTypeFlashCall({
    required this.pattern,
  });

  /// Pattern of the phone number from which the call will be made
  final String pattern;

  /// Parse from a json
  factory AuthenticationCodeTypeFlashCall.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeFlashCall(
        pattern: json['pattern'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "pattern": pattern,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pattern]: Pattern of the phone number from which the call will be made
  @override
  AuthenticationCodeTypeFlashCall copyWith({
    String? pattern,
  }) =>
      AuthenticationCodeTypeFlashCall(
        pattern: pattern ?? this.pattern,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeFlashCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeMissedCall** *(authenticationCodeTypeMissedCall)* - child of AuthenticationCodeType
///
/// An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user.
///
/// * [phoneNumberPrefix]: Prefix of the phone number from which the call will be made.
/// * [length]: Number of digits in the code, excluding the prefix.
final class AuthenticationCodeTypeMissedCall extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeMissedCall** *(authenticationCodeTypeMissedCall)* - child of AuthenticationCodeType
  ///
  /// An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user.
  ///
  /// * [phoneNumberPrefix]: Prefix of the phone number from which the call will be made.
  /// * [length]: Number of digits in the code, excluding the prefix.
  const AuthenticationCodeTypeMissedCall({
    required this.phoneNumberPrefix,
    required this.length,
  });

  /// Prefix of the phone number from which the call will be made
  final String phoneNumberPrefix;

  /// Number of digits in the code, excluding the prefix
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeMissedCall.fromJson(
          Map<String, dynamic> json) =>
      AuthenticationCodeTypeMissedCall(
        phoneNumberPrefix: json['phone_number_prefix'],
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number_prefix": phoneNumberPrefix,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number_prefix]: Prefix of the phone number from which the call will be made
  /// * [length]: Number of digits in the code, excluding the prefix
  @override
  AuthenticationCodeTypeMissedCall copyWith({
    String? phoneNumberPrefix,
    int? length,
  }) =>
      AuthenticationCodeTypeMissedCall(
        phoneNumberPrefix: phoneNumberPrefix ?? this.phoneNumberPrefix,
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeMissedCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeFragment** *(authenticationCodeTypeFragment)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered to https://fragment.com. The user must be logged in there via a wallet owning the phone number's NFT.
///
/// * [url]: URL to open to receive the code.
/// * [length]: Length of the code.
final class AuthenticationCodeTypeFragment extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeFragment** *(authenticationCodeTypeFragment)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered to https://fragment.com. The user must be logged in there via a wallet owning the phone number's NFT.
  ///
  /// * [url]: URL to open to receive the code.
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeFragment({
    required this.url,
    required this.length,
  });

  /// URL to open to receive the code
  final String url;

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeFragment.fromJson(Map<String, dynamic> json) =>
      AuthenticationCodeTypeFragment(
        url: json['url'],
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL to open to receive the code
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeFragment copyWith({
    String? url,
    int? length,
  }) =>
      AuthenticationCodeTypeFragment(
        url: url ?? this.url,
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeFragment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeFirebaseAndroid** *(authenticationCodeTypeFirebaseAndroid)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered via Firebase Authentication to the official Android application.
///
/// * [deviceVerificationParameters]: Parameters to be used for device verification.
/// * [length]: Length of the code.
final class AuthenticationCodeTypeFirebaseAndroid
    extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeFirebaseAndroid** *(authenticationCodeTypeFirebaseAndroid)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered via Firebase Authentication to the official Android application.
  ///
  /// * [deviceVerificationParameters]: Parameters to be used for device verification.
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeFirebaseAndroid({
    required this.deviceVerificationParameters,
    required this.length,
  });

  /// Parameters to be used for device verification
  final FirebaseDeviceVerificationParameters deviceVerificationParameters;

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeFirebaseAndroid.fromJson(
          Map<String, dynamic> json) =>
      AuthenticationCodeTypeFirebaseAndroid(
        deviceVerificationParameters:
            FirebaseDeviceVerificationParameters.fromJson(
                json['device_verification_parameters']),
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "device_verification_parameters": deviceVerificationParameters.toJson(),
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [device_verification_parameters]: Parameters to be used for device verification
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeFirebaseAndroid copyWith({
    FirebaseDeviceVerificationParameters? deviceVerificationParameters,
    int? length,
  }) =>
      AuthenticationCodeTypeFirebaseAndroid(
        deviceVerificationParameters:
            deviceVerificationParameters ?? this.deviceVerificationParameters,
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeFirebaseAndroid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AuthenticationCodeTypeFirebaseIos** *(authenticationCodeTypeFirebaseIos)* - child of AuthenticationCodeType
///
/// A digit-only authentication code is delivered via Firebase Authentication to the official iOS application.
///
/// * [receipt]: Receipt of successful application token validation to compare with receipt from push notification.
/// * [pushTimeout]: Time after the next authentication method is expected to be used if verification push notification isn't received, in seconds.
/// * [length]: Length of the code.
final class AuthenticationCodeTypeFirebaseIos extends AuthenticationCodeType {
  /// **AuthenticationCodeTypeFirebaseIos** *(authenticationCodeTypeFirebaseIos)* - child of AuthenticationCodeType
  ///
  /// A digit-only authentication code is delivered via Firebase Authentication to the official iOS application.
  ///
  /// * [receipt]: Receipt of successful application token validation to compare with receipt from push notification.
  /// * [pushTimeout]: Time after the next authentication method is expected to be used if verification push notification isn't received, in seconds.
  /// * [length]: Length of the code.
  const AuthenticationCodeTypeFirebaseIos({
    required this.receipt,
    required this.pushTimeout,
    required this.length,
  });

  /// Receipt of successful application token validation to compare with receipt from push notification
  final String receipt;

  /// Time after the next authentication method is expected to be used if verification push notification isn't received, in seconds
  final int pushTimeout;

  /// Length of the code
  final int length;

  /// Parse from a json
  factory AuthenticationCodeTypeFirebaseIos.fromJson(
          Map<String, dynamic> json) =>
      AuthenticationCodeTypeFirebaseIos(
        receipt: json['receipt'],
        pushTimeout: json['push_timeout'],
        length: json['length'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "receipt": receipt,
      "push_timeout": pushTimeout,
      "length": length,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [receipt]: Receipt of successful application token validation to compare with receipt from push notification
  /// * [push_timeout]: Time after the next authentication method is expected to be used if verification push notification isn't received, in seconds
  /// * [length]: Length of the code
  @override
  AuthenticationCodeTypeFirebaseIos copyWith({
    String? receipt,
    int? pushTimeout,
    int? length,
  }) =>
      AuthenticationCodeTypeFirebaseIos(
        receipt: receipt ?? this.receipt,
        pushTimeout: pushTimeout ?? this.pushTimeout,
        length: length ?? this.length,
      );

  /// TDLib object type
  static const String defaultObjectId = 'authenticationCodeTypeFirebaseIos';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
