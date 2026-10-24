part of '../tdapi.dart';

/// **PassportElementType** *(passportElementType)* - parent
///
/// Contains the type of Telegram Passport element.
sealed class PassportElementType extends TdObject {
  /// **PassportElementType** *(passportElementType)* - parent
  ///
  /// Contains the type of Telegram Passport element.
  const PassportElementType();

  /// a PassportElementType return type can be :
  /// * [PassportElementTypePersonalDetails]
  /// * [PassportElementTypePassport]
  /// * [PassportElementTypeDriverLicense]
  /// * [PassportElementTypeIdentityCard]
  /// * [PassportElementTypeInternalPassport]
  /// * [PassportElementTypeAddress]
  /// * [PassportElementTypeUtilityBill]
  /// * [PassportElementTypeBankStatement]
  /// * [PassportElementTypeRentalAgreement]
  /// * [PassportElementTypePassportRegistration]
  /// * [PassportElementTypeTemporaryRegistration]
  /// * [PassportElementTypePhoneNumber]
  /// * [PassportElementTypeEmailAddress]
  factory PassportElementType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PassportElementTypePersonalDetails.defaultObjectId:
        return PassportElementTypePersonalDetails.fromJson(json);
      case PassportElementTypePassport.defaultObjectId:
        return PassportElementTypePassport.fromJson(json);
      case PassportElementTypeDriverLicense.defaultObjectId:
        return PassportElementTypeDriverLicense.fromJson(json);
      case PassportElementTypeIdentityCard.defaultObjectId:
        return PassportElementTypeIdentityCard.fromJson(json);
      case PassportElementTypeInternalPassport.defaultObjectId:
        return PassportElementTypeInternalPassport.fromJson(json);
      case PassportElementTypeAddress.defaultObjectId:
        return PassportElementTypeAddress.fromJson(json);
      case PassportElementTypeUtilityBill.defaultObjectId:
        return PassportElementTypeUtilityBill.fromJson(json);
      case PassportElementTypeBankStatement.defaultObjectId:
        return PassportElementTypeBankStatement.fromJson(json);
      case PassportElementTypeRentalAgreement.defaultObjectId:
        return PassportElementTypeRentalAgreement.fromJson(json);
      case PassportElementTypePassportRegistration.defaultObjectId:
        return PassportElementTypePassportRegistration.fromJson(json);
      case PassportElementTypeTemporaryRegistration.defaultObjectId:
        return PassportElementTypeTemporaryRegistration.fromJson(json);
      case PassportElementTypePhoneNumber.defaultObjectId:
        return PassportElementTypePhoneNumber.fromJson(json);
      case PassportElementTypeEmailAddress.defaultObjectId:
        return PassportElementTypeEmailAddress.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PassportElementType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PassportElementType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypePersonalDetails** *(passportElementTypePersonalDetails)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's personal details.
final class PassportElementTypePersonalDetails extends PassportElementType {
  /// **PassportElementTypePersonalDetails** *(passportElementTypePersonalDetails)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's personal details.
  const PassportElementTypePersonalDetails();

  /// Parse from a json
  factory PassportElementTypePersonalDetails.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypePersonalDetails();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypePersonalDetails copyWith() =>
      const PassportElementTypePersonalDetails();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypePersonalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypePassport** *(passportElementTypePassport)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's passport.
final class PassportElementTypePassport extends PassportElementType {
  /// **PassportElementTypePassport** *(passportElementTypePassport)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's passport.
  const PassportElementTypePassport();

  /// Parse from a json
  factory PassportElementTypePassport.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypePassport();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypePassport copyWith() => const PassportElementTypePassport();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypePassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeDriverLicense** *(passportElementTypeDriverLicense)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's driver license.
final class PassportElementTypeDriverLicense extends PassportElementType {
  /// **PassportElementTypeDriverLicense** *(passportElementTypeDriverLicense)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's driver license.
  const PassportElementTypeDriverLicense();

  /// Parse from a json
  factory PassportElementTypeDriverLicense.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypeDriverLicense();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeDriverLicense copyWith() =>
      const PassportElementTypeDriverLicense();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeDriverLicense';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeIdentityCard** *(passportElementTypeIdentityCard)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's identity card.
final class PassportElementTypeIdentityCard extends PassportElementType {
  /// **PassportElementTypeIdentityCard** *(passportElementTypeIdentityCard)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's identity card.
  const PassportElementTypeIdentityCard();

  /// Parse from a json
  factory PassportElementTypeIdentityCard.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypeIdentityCard();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeIdentityCard copyWith() =>
      const PassportElementTypeIdentityCard();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeIdentityCard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeInternalPassport** *(passportElementTypeInternalPassport)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's internal passport.
final class PassportElementTypeInternalPassport extends PassportElementType {
  /// **PassportElementTypeInternalPassport** *(passportElementTypeInternalPassport)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's internal passport.
  const PassportElementTypeInternalPassport();

  /// Parse from a json
  factory PassportElementTypeInternalPassport.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypeInternalPassport();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeInternalPassport copyWith() =>
      const PassportElementTypeInternalPassport();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeInternalPassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeAddress** *(passportElementTypeAddress)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's address.
final class PassportElementTypeAddress extends PassportElementType {
  /// **PassportElementTypeAddress** *(passportElementTypeAddress)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's address.
  const PassportElementTypeAddress();

  /// Parse from a json
  factory PassportElementTypeAddress.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypeAddress();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeAddress copyWith() => const PassportElementTypeAddress();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeUtilityBill** *(passportElementTypeUtilityBill)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's utility bill.
final class PassportElementTypeUtilityBill extends PassportElementType {
  /// **PassportElementTypeUtilityBill** *(passportElementTypeUtilityBill)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's utility bill.
  const PassportElementTypeUtilityBill();

  /// Parse from a json
  factory PassportElementTypeUtilityBill.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypeUtilityBill();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeUtilityBill copyWith() =>
      const PassportElementTypeUtilityBill();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeUtilityBill';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeBankStatement** *(passportElementTypeBankStatement)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's bank statement.
final class PassportElementTypeBankStatement extends PassportElementType {
  /// **PassportElementTypeBankStatement** *(passportElementTypeBankStatement)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's bank statement.
  const PassportElementTypeBankStatement();

  /// Parse from a json
  factory PassportElementTypeBankStatement.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypeBankStatement();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeBankStatement copyWith() =>
      const PassportElementTypeBankStatement();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeBankStatement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeRentalAgreement** *(passportElementTypeRentalAgreement)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's rental agreement.
final class PassportElementTypeRentalAgreement extends PassportElementType {
  /// **PassportElementTypeRentalAgreement** *(passportElementTypeRentalAgreement)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's rental agreement.
  const PassportElementTypeRentalAgreement();

  /// Parse from a json
  factory PassportElementTypeRentalAgreement.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypeRentalAgreement();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeRentalAgreement copyWith() =>
      const PassportElementTypeRentalAgreement();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeRentalAgreement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypePassportRegistration** *(passportElementTypePassportRegistration)* - child of PassportElementType
///
/// A Telegram Passport element containing the registration page of the user's passport.
final class PassportElementTypePassportRegistration
    extends PassportElementType {
  /// **PassportElementTypePassportRegistration** *(passportElementTypePassportRegistration)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the registration page of the user's passport.
  const PassportElementTypePassportRegistration();

  /// Parse from a json
  factory PassportElementTypePassportRegistration.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypePassportRegistration();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypePassportRegistration copyWith() =>
      const PassportElementTypePassportRegistration();

  /// TDLib object type
  static const String defaultObjectId =
      'passportElementTypePassportRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeTemporaryRegistration** *(passportElementTypeTemporaryRegistration)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's temporary registration.
final class PassportElementTypeTemporaryRegistration
    extends PassportElementType {
  /// **PassportElementTypeTemporaryRegistration** *(passportElementTypeTemporaryRegistration)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's temporary registration.
  const PassportElementTypeTemporaryRegistration();

  /// Parse from a json
  factory PassportElementTypeTemporaryRegistration.fromJson(
          Map<String, dynamic> json) =>
      const PassportElementTypeTemporaryRegistration();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeTemporaryRegistration copyWith() =>
      const PassportElementTypeTemporaryRegistration();

  /// TDLib object type
  static const String defaultObjectId =
      'passportElementTypeTemporaryRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypePhoneNumber** *(passportElementTypePhoneNumber)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's phone number.
final class PassportElementTypePhoneNumber extends PassportElementType {
  /// **PassportElementTypePhoneNumber** *(passportElementTypePhoneNumber)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's phone number.
  const PassportElementTypePhoneNumber();

  /// Parse from a json
  factory PassportElementTypePhoneNumber.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypePhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypePhoneNumber copyWith() =>
      const PassportElementTypePhoneNumber();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypePhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTypeEmailAddress** *(passportElementTypeEmailAddress)* - child of PassportElementType
///
/// A Telegram Passport element containing the user's email address.
final class PassportElementTypeEmailAddress extends PassportElementType {
  /// **PassportElementTypeEmailAddress** *(passportElementTypeEmailAddress)* - child of PassportElementType
  ///
  /// A Telegram Passport element containing the user's email address.
  const PassportElementTypeEmailAddress();

  /// Parse from a json
  factory PassportElementTypeEmailAddress.fromJson(Map<String, dynamic> json) =>
      const PassportElementTypeEmailAddress();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PassportElementTypeEmailAddress copyWith() =>
      const PassportElementTypeEmailAddress();

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTypeEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
