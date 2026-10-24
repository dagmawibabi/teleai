part of '../tdapi.dart';

/// **PhoneNumberCodeType** *(phoneNumberCodeType)* - parent
///
/// Describes type of the request for which a code is sent to a phone number.
sealed class PhoneNumberCodeType extends TdObject {
  /// **PhoneNumberCodeType** *(phoneNumberCodeType)* - parent
  ///
  /// Describes type of the request for which a code is sent to a phone number.
  const PhoneNumberCodeType();

  /// a PhoneNumberCodeType return type can be :
  /// * [PhoneNumberCodeTypeChange]
  /// * [PhoneNumberCodeTypeVerify]
  /// * [PhoneNumberCodeTypeConfirmOwnership]
  factory PhoneNumberCodeType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PhoneNumberCodeTypeChange.defaultObjectId:
        return PhoneNumberCodeTypeChange.fromJson(json);
      case PhoneNumberCodeTypeVerify.defaultObjectId:
        return PhoneNumberCodeTypeVerify.fromJson(json);
      case PhoneNumberCodeTypeConfirmOwnership.defaultObjectId:
        return PhoneNumberCodeTypeConfirmOwnership.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PhoneNumberCodeType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PhoneNumberCodeType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'phoneNumberCodeType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PhoneNumberCodeTypeChange** *(phoneNumberCodeTypeChange)* - child of PhoneNumberCodeType
///
/// Checks ownership of a new phone number to change the user's authentication phone number; for official Android and iOS applications only.
final class PhoneNumberCodeTypeChange extends PhoneNumberCodeType {
  /// **PhoneNumberCodeTypeChange** *(phoneNumberCodeTypeChange)* - child of PhoneNumberCodeType
  ///
  /// Checks ownership of a new phone number to change the user's authentication phone number; for official Android and iOS applications only.
  const PhoneNumberCodeTypeChange();

  /// Parse from a json
  factory PhoneNumberCodeTypeChange.fromJson(Map<String, dynamic> json) =>
      const PhoneNumberCodeTypeChange();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PhoneNumberCodeTypeChange copyWith() => const PhoneNumberCodeTypeChange();

  /// TDLib object type
  static const String defaultObjectId = 'phoneNumberCodeTypeChange';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PhoneNumberCodeTypeVerify** *(phoneNumberCodeTypeVerify)* - child of PhoneNumberCodeType
///
/// Verifies ownership of a phone number to be added to the user's Telegram Passport.
final class PhoneNumberCodeTypeVerify extends PhoneNumberCodeType {
  /// **PhoneNumberCodeTypeVerify** *(phoneNumberCodeTypeVerify)* - child of PhoneNumberCodeType
  ///
  /// Verifies ownership of a phone number to be added to the user's Telegram Passport.
  const PhoneNumberCodeTypeVerify();

  /// Parse from a json
  factory PhoneNumberCodeTypeVerify.fromJson(Map<String, dynamic> json) =>
      const PhoneNumberCodeTypeVerify();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PhoneNumberCodeTypeVerify copyWith() => const PhoneNumberCodeTypeVerify();

  /// TDLib object type
  static const String defaultObjectId = 'phoneNumberCodeTypeVerify';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PhoneNumberCodeTypeConfirmOwnership** *(phoneNumberCodeTypeConfirmOwnership)* - child of PhoneNumberCodeType
///
/// Confirms ownership of a phone number to prevent account deletion while handling links of the type internalLinkTypePhoneNumberConfirmation.
///
/// * [hash]: Hash value from the link.
final class PhoneNumberCodeTypeConfirmOwnership extends PhoneNumberCodeType {
  /// **PhoneNumberCodeTypeConfirmOwnership** *(phoneNumberCodeTypeConfirmOwnership)* - child of PhoneNumberCodeType
  ///
  /// Confirms ownership of a phone number to prevent account deletion while handling links of the type internalLinkTypePhoneNumberConfirmation.
  ///
  /// * [hash]: Hash value from the link.
  const PhoneNumberCodeTypeConfirmOwnership({
    required this.hash,
  });

  /// Hash value from the link
  final String hash;

  /// Parse from a json
  factory PhoneNumberCodeTypeConfirmOwnership.fromJson(
          Map<String, dynamic> json) =>
      PhoneNumberCodeTypeConfirmOwnership(
        hash: json['hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "hash": hash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [hash]: Hash value from the link
  @override
  PhoneNumberCodeTypeConfirmOwnership copyWith({
    String? hash,
  }) =>
      PhoneNumberCodeTypeConfirmOwnership(
        hash: hash ?? this.hash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'phoneNumberCodeTypeConfirmOwnership';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
