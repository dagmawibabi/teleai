part of '../tdapi.dart';

/// **PassportElement** *(passportElement)* - parent
///
/// Contains information about a Telegram Passport element.
sealed class PassportElement extends TdObject {
  /// **PassportElement** *(passportElement)* - parent
  ///
  /// Contains information about a Telegram Passport element.
  const PassportElement();

  /// a PassportElement return type can be :
  /// * [PassportElementPersonalDetails]
  /// * [PassportElementPassport]
  /// * [PassportElementDriverLicense]
  /// * [PassportElementIdentityCard]
  /// * [PassportElementInternalPassport]
  /// * [PassportElementAddress]
  /// * [PassportElementUtilityBill]
  /// * [PassportElementBankStatement]
  /// * [PassportElementRentalAgreement]
  /// * [PassportElementPassportRegistration]
  /// * [PassportElementTemporaryRegistration]
  /// * [PassportElementPhoneNumber]
  /// * [PassportElementEmailAddress]
  factory PassportElement.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PassportElementPersonalDetails.defaultObjectId:
        return PassportElementPersonalDetails.fromJson(json);
      case PassportElementPassport.defaultObjectId:
        return PassportElementPassport.fromJson(json);
      case PassportElementDriverLicense.defaultObjectId:
        return PassportElementDriverLicense.fromJson(json);
      case PassportElementIdentityCard.defaultObjectId:
        return PassportElementIdentityCard.fromJson(json);
      case PassportElementInternalPassport.defaultObjectId:
        return PassportElementInternalPassport.fromJson(json);
      case PassportElementAddress.defaultObjectId:
        return PassportElementAddress.fromJson(json);
      case PassportElementUtilityBill.defaultObjectId:
        return PassportElementUtilityBill.fromJson(json);
      case PassportElementBankStatement.defaultObjectId:
        return PassportElementBankStatement.fromJson(json);
      case PassportElementRentalAgreement.defaultObjectId:
        return PassportElementRentalAgreement.fromJson(json);
      case PassportElementPassportRegistration.defaultObjectId:
        return PassportElementPassportRegistration.fromJson(json);
      case PassportElementTemporaryRegistration.defaultObjectId:
        return PassportElementTemporaryRegistration.fromJson(json);
      case PassportElementPhoneNumber.defaultObjectId:
        return PassportElementPhoneNumber.fromJson(json);
      case PassportElementEmailAddress.defaultObjectId:
        return PassportElementEmailAddress.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PassportElement)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PassportElement copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'passportElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementPersonalDetails** *(passportElementPersonalDetails)* - child of PassportElement
///
/// A Telegram Passport element containing the user's personal details.
///
/// * [personalDetails]: Personal details of the user.
final class PassportElementPersonalDetails extends PassportElement {
  /// **PassportElementPersonalDetails** *(passportElementPersonalDetails)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's personal details.
  ///
  /// * [personalDetails]: Personal details of the user.
  const PassportElementPersonalDetails({
    required this.personalDetails,
    this.extra,
    this.clientId,
  });

  /// Personal details of the user
  final PersonalDetails personalDetails;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementPersonalDetails.fromJson(Map<String, dynamic> json) =>
      PassportElementPersonalDetails(
        personalDetails: PersonalDetails.fromJson(json['personal_details']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  PassportElementPersonalDetails copyWith({
    PersonalDetails? personalDetails,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementPersonalDetails(
        personalDetails: personalDetails ?? this.personalDetails,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementPersonalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementPassport** *(passportElementPassport)* - child of PassportElement
///
/// A Telegram Passport element containing the user's passport.
///
/// * [passport]: Passport.
final class PassportElementPassport extends PassportElement {
  /// **PassportElementPassport** *(passportElementPassport)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's passport.
  ///
  /// * [passport]: Passport.
  const PassportElementPassport({
    required this.passport,
    this.extra,
    this.clientId,
  });

  /// Passport
  final IdentityDocument passport;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementPassport.fromJson(Map<String, dynamic> json) =>
      PassportElementPassport(
        passport: IdentityDocument.fromJson(json['passport']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [passport]: Passport
  @override
  PassportElementPassport copyWith({
    IdentityDocument? passport,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementPassport(
        passport: passport ?? this.passport,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementPassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementDriverLicense** *(passportElementDriverLicense)* - child of PassportElement
///
/// A Telegram Passport element containing the user's driver license.
///
/// * [driverLicense]: Driver license.
final class PassportElementDriverLicense extends PassportElement {
  /// **PassportElementDriverLicense** *(passportElementDriverLicense)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's driver license.
  ///
  /// * [driverLicense]: Driver license.
  const PassportElementDriverLicense({
    required this.driverLicense,
    this.extra,
    this.clientId,
  });

  /// Driver license
  final IdentityDocument driverLicense;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementDriverLicense.fromJson(Map<String, dynamic> json) =>
      PassportElementDriverLicense(
        driverLicense: IdentityDocument.fromJson(json['driver_license']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [driver_license]: Driver license
  @override
  PassportElementDriverLicense copyWith({
    IdentityDocument? driverLicense,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementDriverLicense(
        driverLicense: driverLicense ?? this.driverLicense,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementDriverLicense';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementIdentityCard** *(passportElementIdentityCard)* - child of PassportElement
///
/// A Telegram Passport element containing the user's identity card.
///
/// * [identityCard]: Identity card.
final class PassportElementIdentityCard extends PassportElement {
  /// **PassportElementIdentityCard** *(passportElementIdentityCard)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's identity card.
  ///
  /// * [identityCard]: Identity card.
  const PassportElementIdentityCard({
    required this.identityCard,
    this.extra,
    this.clientId,
  });

  /// Identity card
  final IdentityDocument identityCard;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementIdentityCard.fromJson(Map<String, dynamic> json) =>
      PassportElementIdentityCard(
        identityCard: IdentityDocument.fromJson(json['identity_card']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [identity_card]: Identity card
  @override
  PassportElementIdentityCard copyWith({
    IdentityDocument? identityCard,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementIdentityCard(
        identityCard: identityCard ?? this.identityCard,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementIdentityCard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementInternalPassport** *(passportElementInternalPassport)* - child of PassportElement
///
/// A Telegram Passport element containing the user's internal passport.
///
/// * [internalPassport]: Internal passport.
final class PassportElementInternalPassport extends PassportElement {
  /// **PassportElementInternalPassport** *(passportElementInternalPassport)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's internal passport.
  ///
  /// * [internalPassport]: Internal passport.
  const PassportElementInternalPassport({
    required this.internalPassport,
    this.extra,
    this.clientId,
  });

  /// Internal passport
  final IdentityDocument internalPassport;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementInternalPassport.fromJson(Map<String, dynamic> json) =>
      PassportElementInternalPassport(
        internalPassport: IdentityDocument.fromJson(json['internal_passport']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [internal_passport]: Internal passport
  @override
  PassportElementInternalPassport copyWith({
    IdentityDocument? internalPassport,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementInternalPassport(
        internalPassport: internalPassport ?? this.internalPassport,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementInternalPassport';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementAddress** *(passportElementAddress)* - child of PassportElement
///
/// A Telegram Passport element containing the user's address.
///
/// * [address]: Address.
final class PassportElementAddress extends PassportElement {
  /// **PassportElementAddress** *(passportElementAddress)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's address.
  ///
  /// * [address]: Address.
  const PassportElementAddress({
    required this.address,
    this.extra,
    this.clientId,
  });

  /// Address
  final Address address;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementAddress.fromJson(Map<String, dynamic> json) =>
      PassportElementAddress(
        address: Address.fromJson(json['address']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [address]: Address
  @override
  PassportElementAddress copyWith({
    Address? address,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementAddress(
        address: address ?? this.address,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementUtilityBill** *(passportElementUtilityBill)* - child of PassportElement
///
/// A Telegram Passport element containing the user's utility bill.
///
/// * [utilityBill]: Utility bill.
final class PassportElementUtilityBill extends PassportElement {
  /// **PassportElementUtilityBill** *(passportElementUtilityBill)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's utility bill.
  ///
  /// * [utilityBill]: Utility bill.
  const PassportElementUtilityBill({
    required this.utilityBill,
    this.extra,
    this.clientId,
  });

  /// Utility bill
  final PersonalDocument utilityBill;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementUtilityBill.fromJson(Map<String, dynamic> json) =>
      PassportElementUtilityBill(
        utilityBill: PersonalDocument.fromJson(json['utility_bill']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [utility_bill]: Utility bill
  @override
  PassportElementUtilityBill copyWith({
    PersonalDocument? utilityBill,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementUtilityBill(
        utilityBill: utilityBill ?? this.utilityBill,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementUtilityBill';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementBankStatement** *(passportElementBankStatement)* - child of PassportElement
///
/// A Telegram Passport element containing the user's bank statement.
///
/// * [bankStatement]: Bank statement.
final class PassportElementBankStatement extends PassportElement {
  /// **PassportElementBankStatement** *(passportElementBankStatement)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's bank statement.
  ///
  /// * [bankStatement]: Bank statement.
  const PassportElementBankStatement({
    required this.bankStatement,
    this.extra,
    this.clientId,
  });

  /// Bank statement
  final PersonalDocument bankStatement;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementBankStatement.fromJson(Map<String, dynamic> json) =>
      PassportElementBankStatement(
        bankStatement: PersonalDocument.fromJson(json['bank_statement']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [bank_statement]: Bank statement
  @override
  PassportElementBankStatement copyWith({
    PersonalDocument? bankStatement,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementBankStatement(
        bankStatement: bankStatement ?? this.bankStatement,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementBankStatement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementRentalAgreement** *(passportElementRentalAgreement)* - child of PassportElement
///
/// A Telegram Passport element containing the user's rental agreement.
///
/// * [rentalAgreement]: Rental agreement.
final class PassportElementRentalAgreement extends PassportElement {
  /// **PassportElementRentalAgreement** *(passportElementRentalAgreement)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's rental agreement.
  ///
  /// * [rentalAgreement]: Rental agreement.
  const PassportElementRentalAgreement({
    required this.rentalAgreement,
    this.extra,
    this.clientId,
  });

  /// Rental agreement
  final PersonalDocument rentalAgreement;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementRentalAgreement.fromJson(Map<String, dynamic> json) =>
      PassportElementRentalAgreement(
        rentalAgreement: PersonalDocument.fromJson(json['rental_agreement']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [rental_agreement]: Rental agreement
  @override
  PassportElementRentalAgreement copyWith({
    PersonalDocument? rentalAgreement,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementRentalAgreement(
        rentalAgreement: rentalAgreement ?? this.rentalAgreement,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementRentalAgreement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementPassportRegistration** *(passportElementPassportRegistration)* - child of PassportElement
///
/// A Telegram Passport element containing the user's passport registration pages.
///
/// * [passportRegistration]: Passport registration pages.
final class PassportElementPassportRegistration extends PassportElement {
  /// **PassportElementPassportRegistration** *(passportElementPassportRegistration)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's passport registration pages.
  ///
  /// * [passportRegistration]: Passport registration pages.
  const PassportElementPassportRegistration({
    required this.passportRegistration,
    this.extra,
    this.clientId,
  });

  /// Passport registration pages
  final PersonalDocument passportRegistration;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementPassportRegistration.fromJson(
          Map<String, dynamic> json) =>
      PassportElementPassportRegistration(
        passportRegistration:
            PersonalDocument.fromJson(json['passport_registration']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [passport_registration]: Passport registration pages
  @override
  PassportElementPassportRegistration copyWith({
    PersonalDocument? passportRegistration,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementPassportRegistration(
        passportRegistration: passportRegistration ?? this.passportRegistration,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementPassportRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementTemporaryRegistration** *(passportElementTemporaryRegistration)* - child of PassportElement
///
/// A Telegram Passport element containing the user's temporary registration.
///
/// * [temporaryRegistration]: Temporary registration.
final class PassportElementTemporaryRegistration extends PassportElement {
  /// **PassportElementTemporaryRegistration** *(passportElementTemporaryRegistration)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's temporary registration.
  ///
  /// * [temporaryRegistration]: Temporary registration.
  const PassportElementTemporaryRegistration({
    required this.temporaryRegistration,
    this.extra,
    this.clientId,
  });

  /// Temporary registration
  final PersonalDocument temporaryRegistration;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementTemporaryRegistration.fromJson(
          Map<String, dynamic> json) =>
      PassportElementTemporaryRegistration(
        temporaryRegistration:
            PersonalDocument.fromJson(json['temporary_registration']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [temporary_registration]: Temporary registration
  @override
  PassportElementTemporaryRegistration copyWith({
    PersonalDocument? temporaryRegistration,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementTemporaryRegistration(
        temporaryRegistration:
            temporaryRegistration ?? this.temporaryRegistration,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementTemporaryRegistration';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementPhoneNumber** *(passportElementPhoneNumber)* - child of PassportElement
///
/// A Telegram Passport element containing the user's phone number.
///
/// * [phoneNumber]: Phone number.
final class PassportElementPhoneNumber extends PassportElement {
  /// **PassportElementPhoneNumber** *(passportElementPhoneNumber)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's phone number.
  ///
  /// * [phoneNumber]: Phone number.
  const PassportElementPhoneNumber({
    required this.phoneNumber,
    this.extra,
    this.clientId,
  });

  /// Phone number
  final String phoneNumber;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementPhoneNumber.fromJson(Map<String, dynamic> json) =>
      PassportElementPhoneNumber(
        phoneNumber: json['phone_number'],
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [phone_number]: Phone number
  @override
  PassportElementPhoneNumber copyWith({
    String? phoneNumber,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementPhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PassportElementEmailAddress** *(passportElementEmailAddress)* - child of PassportElement
///
/// A Telegram Passport element containing the user's email address.
///
/// * [emailAddress]: Email address.
final class PassportElementEmailAddress extends PassportElement {
  /// **PassportElementEmailAddress** *(passportElementEmailAddress)* - child of PassportElement
  ///
  /// A Telegram Passport element containing the user's email address.
  ///
  /// * [emailAddress]: Email address.
  const PassportElementEmailAddress({
    required this.emailAddress,
    this.extra,
    this.clientId,
  });

  /// Email address
  final String emailAddress;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PassportElementEmailAddress.fromJson(Map<String, dynamic> json) =>
      PassportElementEmailAddress(
        emailAddress: json['email_address'],
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [email_address]: Email address
  @override
  PassportElementEmailAddress copyWith({
    String? emailAddress,
    dynamic extra,
    int? clientId,
  }) =>
      PassportElementEmailAddress(
        emailAddress: emailAddress ?? this.emailAddress,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passportElementEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
