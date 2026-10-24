part of '../tdapi.dart';

/// **Contact** *(contact)* - basic class
///
/// Describes a contact of a user.
///
/// * [phoneNumber]: Phone number of the user.
/// * [firstName]: First name of the user; 1-64 characters.
/// * [lastName]: Last name of the user; 0-64 characters.
/// * [vcard]: Additional data about the user in a form of vCard; 0-2048 bytes in length.
/// * [userId]: Identifier of the user, if known; 0 otherwise.
final class Contact extends TdObject {
  /// **Contact** *(contact)* - basic class
  ///
  /// Describes a contact of a user.
  ///
  /// * [phoneNumber]: Phone number of the user.
  /// * [firstName]: First name of the user; 1-64 characters.
  /// * [lastName]: Last name of the user; 0-64 characters.
  /// * [vcard]: Additional data about the user in a form of vCard; 0-2048 bytes in length.
  /// * [userId]: Identifier of the user, if known; 0 otherwise.
  const Contact({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.vcard,
    required this.userId,
  });

  /// Phone number of the user
  final String phoneNumber;

  /// First name of the user; 1-64 characters
  final String firstName;

  /// Last name of the user; 0-64 characters
  final String lastName;

  /// Additional data about the user in a form of vCard; 0-2048 bytes in length
  final String vcard;

  /// Identifier of the user, if known; 0 otherwise
  final int userId;

  /// Parse from a json
  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phoneNumber: json['phone_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        vcard: json['vcard'],
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "first_name": firstName,
      "last_name": lastName,
      "vcard": vcard,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: Phone number of the user
  /// * [first_name]: First name of the user; 1-64 characters
  /// * [last_name]: Last name of the user; 0-64 characters
  /// * [vcard]: Additional data about the user in a form of vCard; 0-2048 bytes in length
  /// * [user_id]: Identifier of the user, if known; 0 otherwise
  Contact copyWith({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? vcard,
    int? userId,
  }) =>
      Contact(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        vcard: vcard ?? this.vcard,
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'contact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
