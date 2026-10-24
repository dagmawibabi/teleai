part of '../tdapi.dart';

/// **InputPassportElement** *(inputPassportElement)* - parent
///
/// Contains information about a Telegram Passport element to be saved.
sealed class InputPassportElement extends TdObject {
  /// **InputPassportElement** *(inputPassportElement)* - parent
  ///
  /// Contains information about a Telegram Passport element to be saved.
  const InputPassportElement();

  /// a InputPassportElement return type can be :
  /// * [InputPassportElementPersonalDetails]
  /// * [InputPassportElementPassport]
  /// * [InputPassportElementDriverLicense]
  /// * [InputPassportElementIdentityCard]
  /// * [InputPassportElementInternalPassport]
  /// * [InputPassportElementAddress]
  /// * [InputPassportElementUtilityBill]
  /// * [InputPassportElementBankStatement]
  /// * [InputPassportElementRentalAgreement]
  /// * [InputPassportElementPassportRegistration]
  /// * [InputPassportElementTemporaryRegistration]
  /// * [InputPassportElementPhoneNumber]
  /// * [InputPassportElementEmailAddress]
  factory InputPassportElement.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPassportElementPersonalDetails.defaultObjectId:
        return InputPassportElementPersonalDetails.fromJson(json);
      case InputPassportElementPassport.defaultObjectId:
        return InputPassportElementPassport.fromJson(json);
      case InputPassportElementDriverLicense.defaultObjectId:
        return InputPassportElementDriverLicense.fromJson(json);
      case InputPassportElementIdentityCard.defaultObjectId:
        return InputPassportElementIdentityCard.fromJson(json);
      case InputPassportElementInternalPassport.defaultObjectId:
        return InputPassportElementInternalPassport.fromJson(json);
      case InputPassportElementAddress.defaultObjectId:
        return InputPassportElementAddress.fromJson(json);
      case InputPassportElementUtilityBill.defaultObjectId:
        return InputPassportElementUtilityBill.fromJson(json);
      case InputPassportElementBankStatement.defaultObjectId:
        return InputPassportElementBankStatement.fromJson(json);
      case InputPassportElementRentalAgreement.defaultObjectId:
        return InputPassportElementRentalAgreement.fromJson(json);
      case InputPassportElementPassportRegistration.defaultObjectId:
        return InputPassportElementPassportRegistration.fromJson(json);
      case InputPassportElementTemporaryRegistration.defaultObjectId:
        return InputPassportElementTemporaryRegistration.fromJson(json);
      case InputPassportElementPhoneNumber.defaultObjectId:
        return InputPassportElementPhoneNumber.fromJson(json);
      case InputPassportElementEmailAddress.defaultObjectId:
        return InputPassportElementEmailAddress.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPassportElement)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPassportElement copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementPersonalDetails** *(inputPassportElementPersonalDetails)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's personal details.
///
/// * [personalDetails]: Personal details of the user.
final class InputPassportElementPersonalDetails extends InputPassportElement {
  /// **InputPassportElementPersonalDetails** *(inputPassportElementPersonalDetails)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's personal details.
  ///
  /// * [personalDetails]: Personal details of the user.
  const InputPassportElementPersonalDetails({
    required this.personalDetails,
  });

  /// Personal details of the user
  final PersonalDetails personalDetails;

  /// Parse from a json
  factory InputPassportElementPersonalDetails.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementPersonalDetails(
        personalDetails: PersonalDetails.fromJson(json['personal_details']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "personal_details": personalDetails.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [personal_details]: Personal details of the user
  @override
  InputPassportElementPersonalDetails copyWith({
    PersonalDetails? personalDetails,
  }) =>
      InputPassportElementPersonalDetails(
        personalDetails: personalDetails ?? this.personalDetails,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementPersonalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementPassport** *(inputPassportElementPassport)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's passport.
///
/// * [passport]: The passport to be saved.
final class InputPassportElementPassport extends InputPassportElement {
  /// **InputPassportElementPassport** *(inputPassportElementPassport)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's passport.
  ///
  /// * [passport]: The passport to be saved.
  const InputPassportElementPassport({
    required this.passport,
  });

  /// The passport to be saved
  final InputIdentityDocument passport;

  /// Parse from a json
  factory InputPassportElementPassport.fromJson(Map<String, dynamic> json) =>
      InputPassportElementPassport(
        passport: InputIdentityDocument.fromJson(json['passport']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "passport": passport.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [passport]: The passport to be saved
  @override
  InputPassportElementPassport copyWith({
    InputIdentityDocument? passport,
  }) =>
      InputPassportElementPassport(
        passport: passport ?? this.passport,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementPassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementDriverLicense** *(inputPassportElementDriverLicense)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's driver license.
///
/// * [driverLicense]: The driver license to be saved.
final class InputPassportElementDriverLicense extends InputPassportElement {
  /// **InputPassportElementDriverLicense** *(inputPassportElementDriverLicense)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's driver license.
  ///
  /// * [driverLicense]: The driver license to be saved.
  const InputPassportElementDriverLicense({
    required this.driverLicense,
  });

  /// The driver license to be saved
  final InputIdentityDocument driverLicense;

  /// Parse from a json
  factory InputPassportElementDriverLicense.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementDriverLicense(
        driverLicense: InputIdentityDocument.fromJson(json['driver_license']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "driver_license": driverLicense.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [driver_license]: The driver license to be saved
  @override
  InputPassportElementDriverLicense copyWith({
    InputIdentityDocument? driverLicense,
  }) =>
      InputPassportElementDriverLicense(
        driverLicense: driverLicense ?? this.driverLicense,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementDriverLicense';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementIdentityCard** *(inputPassportElementIdentityCard)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's identity card.
///
/// * [identityCard]: The identity card to be saved.
final class InputPassportElementIdentityCard extends InputPassportElement {
  /// **InputPassportElementIdentityCard** *(inputPassportElementIdentityCard)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's identity card.
  ///
  /// * [identityCard]: The identity card to be saved.
  const InputPassportElementIdentityCard({
    required this.identityCard,
  });

  /// The identity card to be saved
  final InputIdentityDocument identityCard;

  /// Parse from a json
  factory InputPassportElementIdentityCard.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementIdentityCard(
        identityCard: InputIdentityDocument.fromJson(json['identity_card']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "identity_card": identityCard.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [identity_card]: The identity card to be saved
  @override
  InputPassportElementIdentityCard copyWith({
    InputIdentityDocument? identityCard,
  }) =>
      InputPassportElementIdentityCard(
        identityCard: identityCard ?? this.identityCard,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementIdentityCard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementInternalPassport** *(inputPassportElementInternalPassport)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's internal passport.
///
/// * [internalPassport]: The internal passport to be saved.
final class InputPassportElementInternalPassport extends InputPassportElement {
  /// **InputPassportElementInternalPassport** *(inputPassportElementInternalPassport)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's internal passport.
  ///
  /// * [internalPassport]: The internal passport to be saved.
  const InputPassportElementInternalPassport({
    required this.internalPassport,
  });

  /// The internal passport to be saved
  final InputIdentityDocument internalPassport;

  /// Parse from a json
  factory InputPassportElementInternalPassport.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementInternalPassport(
        internalPassport:
            InputIdentityDocument.fromJson(json['internal_passport']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "internal_passport": internalPassport.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [internal_passport]: The internal passport to be saved
  @override
  InputPassportElementInternalPassport copyWith({
    InputIdentityDocument? internalPassport,
  }) =>
      InputPassportElementInternalPassport(
        internalPassport: internalPassport ?? this.internalPassport,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementInternalPassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementAddress** *(inputPassportElementAddress)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's address.
///
/// * [address]: The address to be saved.
final class InputPassportElementAddress extends InputPassportElement {
  /// **InputPassportElementAddress** *(inputPassportElementAddress)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's address.
  ///
  /// * [address]: The address to be saved.
  const InputPassportElementAddress({
    required this.address,
  });

  /// The address to be saved
  final Address address;

  /// Parse from a json
  factory InputPassportElementAddress.fromJson(Map<String, dynamic> json) =>
      InputPassportElementAddress(
        address: Address.fromJson(json['address']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "address": address.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: The address to be saved
  @override
  InputPassportElementAddress copyWith({
    Address? address,
  }) =>
      InputPassportElementAddress(
        address: address ?? this.address,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementUtilityBill** *(inputPassportElementUtilityBill)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's utility bill.
///
/// * [utilityBill]: The utility bill to be saved.
final class InputPassportElementUtilityBill extends InputPassportElement {
  /// **InputPassportElementUtilityBill** *(inputPassportElementUtilityBill)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's utility bill.
  ///
  /// * [utilityBill]: The utility bill to be saved.
  const InputPassportElementUtilityBill({
    required this.utilityBill,
  });

  /// The utility bill to be saved
  final InputPersonalDocument utilityBill;

  /// Parse from a json
  factory InputPassportElementUtilityBill.fromJson(Map<String, dynamic> json) =>
      InputPassportElementUtilityBill(
        utilityBill: InputPersonalDocument.fromJson(json['utility_bill']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "utility_bill": utilityBill.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [utility_bill]: The utility bill to be saved
  @override
  InputPassportElementUtilityBill copyWith({
    InputPersonalDocument? utilityBill,
  }) =>
      InputPassportElementUtilityBill(
        utilityBill: utilityBill ?? this.utilityBill,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementUtilityBill';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementBankStatement** *(inputPassportElementBankStatement)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's bank statement.
///
/// * [bankStatement]: The bank statement to be saved.
final class InputPassportElementBankStatement extends InputPassportElement {
  /// **InputPassportElementBankStatement** *(inputPassportElementBankStatement)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's bank statement.
  ///
  /// * [bankStatement]: The bank statement to be saved.
  const InputPassportElementBankStatement({
    required this.bankStatement,
  });

  /// The bank statement to be saved
  final InputPersonalDocument bankStatement;

  /// Parse from a json
  factory InputPassportElementBankStatement.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementBankStatement(
        bankStatement: InputPersonalDocument.fromJson(json['bank_statement']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bank_statement": bankStatement.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bank_statement]: The bank statement to be saved
  @override
  InputPassportElementBankStatement copyWith({
    InputPersonalDocument? bankStatement,
  }) =>
      InputPassportElementBankStatement(
        bankStatement: bankStatement ?? this.bankStatement,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementBankStatement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementRentalAgreement** *(inputPassportElementRentalAgreement)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's rental agreement.
///
/// * [rentalAgreement]: The rental agreement to be saved.
final class InputPassportElementRentalAgreement extends InputPassportElement {
  /// **InputPassportElementRentalAgreement** *(inputPassportElementRentalAgreement)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's rental agreement.
  ///
  /// * [rentalAgreement]: The rental agreement to be saved.
  const InputPassportElementRentalAgreement({
    required this.rentalAgreement,
  });

  /// The rental agreement to be saved
  final InputPersonalDocument rentalAgreement;

  /// Parse from a json
  factory InputPassportElementRentalAgreement.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementRentalAgreement(
        rentalAgreement:
            InputPersonalDocument.fromJson(json['rental_agreement']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "rental_agreement": rentalAgreement.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [rental_agreement]: The rental agreement to be saved
  @override
  InputPassportElementRentalAgreement copyWith({
    InputPersonalDocument? rentalAgreement,
  }) =>
      InputPassportElementRentalAgreement(
        rentalAgreement: rentalAgreement ?? this.rentalAgreement,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementRentalAgreement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementPassportRegistration** *(inputPassportElementPassportRegistration)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's passport registration.
///
/// * [passportRegistration]: The passport registration page to be saved.
final class InputPassportElementPassportRegistration
    extends InputPassportElement {
  /// **InputPassportElementPassportRegistration** *(inputPassportElementPassportRegistration)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's passport registration.
  ///
  /// * [passportRegistration]: The passport registration page to be saved.
  const InputPassportElementPassportRegistration({
    required this.passportRegistration,
  });

  /// The passport registration page to be saved
  final InputPersonalDocument passportRegistration;

  /// Parse from a json
  factory InputPassportElementPassportRegistration.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementPassportRegistration(
        passportRegistration:
            InputPersonalDocument.fromJson(json['passport_registration']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "passport_registration": passportRegistration.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [passport_registration]: The passport registration page to be saved
  @override
  InputPassportElementPassportRegistration copyWith({
    InputPersonalDocument? passportRegistration,
  }) =>
      InputPassportElementPassportRegistration(
        passportRegistration: passportRegistration ?? this.passportRegistration,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementPassportRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementTemporaryRegistration** *(inputPassportElementTemporaryRegistration)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's temporary registration.
///
/// * [temporaryRegistration]: The temporary registration document to be saved.
final class InputPassportElementTemporaryRegistration
    extends InputPassportElement {
  /// **InputPassportElementTemporaryRegistration** *(inputPassportElementTemporaryRegistration)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's temporary registration.
  ///
  /// * [temporaryRegistration]: The temporary registration document to be saved.
  const InputPassportElementTemporaryRegistration({
    required this.temporaryRegistration,
  });

  /// The temporary registration document to be saved
  final InputPersonalDocument temporaryRegistration;

  /// Parse from a json
  factory InputPassportElementTemporaryRegistration.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementTemporaryRegistration(
        temporaryRegistration:
            InputPersonalDocument.fromJson(json['temporary_registration']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "temporary_registration": temporaryRegistration.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [temporary_registration]: The temporary registration document to be saved
  @override
  InputPassportElementTemporaryRegistration copyWith({
    InputPersonalDocument? temporaryRegistration,
  }) =>
      InputPassportElementTemporaryRegistration(
        temporaryRegistration:
            temporaryRegistration ?? this.temporaryRegistration,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inputPassportElementTemporaryRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementPhoneNumber** *(inputPassportElementPhoneNumber)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's phone number.
///
/// * [phoneNumber]: The phone number to be saved.
final class InputPassportElementPhoneNumber extends InputPassportElement {
  /// **InputPassportElementPhoneNumber** *(inputPassportElementPhoneNumber)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's phone number.
  ///
  /// * [phoneNumber]: The phone number to be saved.
  const InputPassportElementPhoneNumber({
    required this.phoneNumber,
  });

  /// The phone number to be saved
  final String phoneNumber;

  /// Parse from a json
  factory InputPassportElementPhoneNumber.fromJson(Map<String, dynamic> json) =>
      InputPassportElementPhoneNumber(
        phoneNumber: json['phone_number'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: The phone number to be saved
  @override
  InputPassportElementPhoneNumber copyWith({
    String? phoneNumber,
  }) =>
      InputPassportElementPhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPassportElementEmailAddress** *(inputPassportElementEmailAddress)* - child of InputPassportElement
///
/// A Telegram Passport element to be saved containing the user's email address.
///
/// * [emailAddress]: The email address to be saved.
final class InputPassportElementEmailAddress extends InputPassportElement {
  /// **InputPassportElementEmailAddress** *(inputPassportElementEmailAddress)* - child of InputPassportElement
  ///
  /// A Telegram Passport element to be saved containing the user's email address.
  ///
  /// * [emailAddress]: The email address to be saved.
  const InputPassportElementEmailAddress({
    required this.emailAddress,
  });

  /// The email address to be saved
  final String emailAddress;

  /// Parse from a json
  factory InputPassportElementEmailAddress.fromJson(
          Map<String, dynamic> json) =>
      InputPassportElementEmailAddress(
        emailAddress: json['email_address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "email_address": emailAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [email_address]: The email address to be saved
  @override
  InputPassportElementEmailAddress copyWith({
    String? emailAddress,
  }) =>
      InputPassportElementEmailAddress(
        emailAddress: emailAddress ?? this.emailAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPassportElementEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
