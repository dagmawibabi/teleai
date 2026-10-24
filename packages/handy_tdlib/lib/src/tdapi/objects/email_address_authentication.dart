part of '../tdapi.dart';

/// **EmailAddressAuthentication** *(emailAddressAuthentication)* - parent
///
/// Contains authentication data for an email address.
sealed class EmailAddressAuthentication extends TdObject {
  /// **EmailAddressAuthentication** *(emailAddressAuthentication)* - parent
  ///
  /// Contains authentication data for an email address.
  const EmailAddressAuthentication();

  /// a EmailAddressAuthentication return type can be :
  /// * [EmailAddressAuthenticationCode]
  /// * [EmailAddressAuthenticationAppleId]
  /// * [EmailAddressAuthenticationGoogleId]
  factory EmailAddressAuthentication.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case EmailAddressAuthenticationCode.defaultObjectId:
        return EmailAddressAuthenticationCode.fromJson(json);
      case EmailAddressAuthenticationAppleId.defaultObjectId:
        return EmailAddressAuthenticationAppleId.fromJson(json);
      case EmailAddressAuthenticationGoogleId.defaultObjectId:
        return EmailAddressAuthenticationGoogleId.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of EmailAddressAuthentication)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  EmailAddressAuthentication copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressAuthentication';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmailAddressAuthenticationCode** *(emailAddressAuthenticationCode)* - child of EmailAddressAuthentication
///
/// An authentication code delivered to a user's email address.
///
/// * [code]: The code.
final class EmailAddressAuthenticationCode extends EmailAddressAuthentication {
  /// **EmailAddressAuthenticationCode** *(emailAddressAuthenticationCode)* - child of EmailAddressAuthentication
  ///
  /// An authentication code delivered to a user's email address.
  ///
  /// * [code]: The code.
  const EmailAddressAuthenticationCode({
    required this.code,
  });

  /// The code
  final String code;

  /// Parse from a json
  factory EmailAddressAuthenticationCode.fromJson(Map<String, dynamic> json) =>
      EmailAddressAuthenticationCode(
        code: json['code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "code": code,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: The code
  @override
  EmailAddressAuthenticationCode copyWith({
    String? code,
  }) =>
      EmailAddressAuthenticationCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressAuthenticationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmailAddressAuthenticationAppleId** *(emailAddressAuthenticationAppleId)* - child of EmailAddressAuthentication
///
/// An authentication token received through Apple emailAddressAuthenticationAppleId.
///
/// * [token]: The token.
final class EmailAddressAuthenticationAppleId
    extends EmailAddressAuthentication {
  /// **EmailAddressAuthenticationAppleId** *(emailAddressAuthenticationAppleId)* - child of EmailAddressAuthentication
  ///
  /// An authentication token received through Apple emailAddressAuthenticationAppleId.
  ///
  /// * [token]: The token.
  const EmailAddressAuthenticationAppleId({
    required this.token,
  });

  /// The token
  final String token;

  /// Parse from a json
  factory EmailAddressAuthenticationAppleId.fromJson(
          Map<String, dynamic> json) =>
      EmailAddressAuthenticationAppleId(
        token: json['token'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "token": token,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The token
  @override
  EmailAddressAuthenticationAppleId copyWith({
    String? token,
  }) =>
      EmailAddressAuthenticationAppleId(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressAuthenticationAppleId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmailAddressAuthenticationGoogleId** *(emailAddressAuthenticationGoogleId)* - child of EmailAddressAuthentication
///
/// An authentication token received through Google emailAddressAuthenticationGoogleId.
///
/// * [token]: The token.
final class EmailAddressAuthenticationGoogleId
    extends EmailAddressAuthentication {
  /// **EmailAddressAuthenticationGoogleId** *(emailAddressAuthenticationGoogleId)* - child of EmailAddressAuthentication
  ///
  /// An authentication token received through Google emailAddressAuthenticationGoogleId.
  ///
  /// * [token]: The token.
  const EmailAddressAuthenticationGoogleId({
    required this.token,
  });

  /// The token
  final String token;

  /// Parse from a json
  factory EmailAddressAuthenticationGoogleId.fromJson(
          Map<String, dynamic> json) =>
      EmailAddressAuthenticationGoogleId(
        token: json['token'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "token": token,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The token
  @override
  EmailAddressAuthenticationGoogleId copyWith({
    String? token,
  }) =>
      EmailAddressAuthenticationGoogleId(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressAuthenticationGoogleId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
