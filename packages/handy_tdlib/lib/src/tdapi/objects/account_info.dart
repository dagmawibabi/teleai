part of '../tdapi.dart';

/// **AccountInfo** *(accountInfo)* - basic class
///
/// Contains basic information about another user who started a chat with the current user.
///
/// * [registrationMonth]: Month when the user was registered in Telegram; 0-12; may be 0 if unknown.
/// * [registrationYear]: Year when the user was registered in Telegram; 0-9999; may be 0 if unknown.
/// * [phoneNumberCountryCode]: A two-letter ISO 3166-1 alpha-2 country code based on the phone number of the user; may be empty if unknown.
/// * [lastNameChangeDate]: Point in time (Unix timestamp) when the user changed name last time; 0 if unknown.
/// * [lastPhotoChangeDate]: Point in time (Unix timestamp) when the user changed photo last time; 0 if unknown.
final class AccountInfo extends TdObject {
  /// **AccountInfo** *(accountInfo)* - basic class
  ///
  /// Contains basic information about another user who started a chat with the current user.
  ///
  /// * [registrationMonth]: Month when the user was registered in Telegram; 0-12; may be 0 if unknown.
  /// * [registrationYear]: Year when the user was registered in Telegram; 0-9999; may be 0 if unknown.
  /// * [phoneNumberCountryCode]: A two-letter ISO 3166-1 alpha-2 country code based on the phone number of the user; may be empty if unknown.
  /// * [lastNameChangeDate]: Point in time (Unix timestamp) when the user changed name last time; 0 if unknown.
  /// * [lastPhotoChangeDate]: Point in time (Unix timestamp) when the user changed photo last time; 0 if unknown.
  const AccountInfo({
    required this.registrationMonth,
    required this.registrationYear,
    required this.phoneNumberCountryCode,
    required this.lastNameChangeDate,
    required this.lastPhotoChangeDate,
  });

  /// Month when the user was registered in Telegram; 0-12; may be 0 if unknown
  final int registrationMonth;

  /// Year when the user was registered in Telegram; 0-9999; may be 0 if unknown
  final int registrationYear;

  /// A two-letter ISO 3166-1 alpha-2 country code based on the phone number of the user; may be empty if unknown
  final String phoneNumberCountryCode;

  /// Point in time (Unix timestamp) when the user changed name last time; 0 if unknown
  final int lastNameChangeDate;

  /// Point in time (Unix timestamp) when the user changed photo last time; 0 if unknown
  final int lastPhotoChangeDate;

  /// Parse from a json
  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
        registrationMonth: json['registration_month'],
        registrationYear: json['registration_year'],
        phoneNumberCountryCode: json['phone_number_country_code'],
        lastNameChangeDate: json['last_name_change_date'],
        lastPhotoChangeDate: json['last_photo_change_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "registration_month": registrationMonth,
      "registration_year": registrationYear,
      "phone_number_country_code": phoneNumberCountryCode,
      "last_name_change_date": lastNameChangeDate,
      "last_photo_change_date": lastPhotoChangeDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [registration_month]: Month when the user was registered in Telegram; 0-12; may be 0 if unknown
  /// * [registration_year]: Year when the user was registered in Telegram; 0-9999; may be 0 if unknown
  /// * [phone_number_country_code]: A two-letter ISO 3166-1 alpha-2 country code based on the phone number of the user; may be empty if unknown
  /// * [last_name_change_date]: Point in time (Unix timestamp) when the user changed name last time; 0 if unknown
  /// * [last_photo_change_date]: Point in time (Unix timestamp) when the user changed photo last time; 0 if unknown
  AccountInfo copyWith({
    int? registrationMonth,
    int? registrationYear,
    String? phoneNumberCountryCode,
    int? lastNameChangeDate,
    int? lastPhotoChangeDate,
  }) =>
      AccountInfo(
        registrationMonth: registrationMonth ?? this.registrationMonth,
        registrationYear: registrationYear ?? this.registrationYear,
        phoneNumberCountryCode:
            phoneNumberCountryCode ?? this.phoneNumberCountryCode,
        lastNameChangeDate: lastNameChangeDate ?? this.lastNameChangeDate,
        lastPhotoChangeDate: lastPhotoChangeDate ?? this.lastPhotoChangeDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'accountInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
