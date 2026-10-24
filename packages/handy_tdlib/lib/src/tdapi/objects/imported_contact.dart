part of '../tdapi.dart';

/// **ImportedContact** *(importedContact)* - basic class
///
/// Describes a contact to import.
///
/// * [phoneNumber]: Phone number of the user.
/// * [firstName]: First name of the user; 1-64 characters.
/// * [lastName]: Last name of the user; 0-64 characters.
/// * [note]: Note to add about the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed;. pass null to keep the current user's note *(optional)*.
final class ImportedContact extends TdObject {
  /// **ImportedContact** *(importedContact)* - basic class
  ///
  /// Describes a contact to import.
  ///
  /// * [phoneNumber]: Phone number of the user.
  /// * [firstName]: First name of the user; 1-64 characters.
  /// * [lastName]: Last name of the user; 0-64 characters.
  /// * [note]: Note to add about the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed;. pass null to keep the current user's note *(optional)*.
  const ImportedContact({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    this.note,
  });

  /// Phone number of the user
  final String phoneNumber;

  /// First name of the user; 1-64 characters
  final String firstName;

  /// Last name of the user; 0-64 characters
  final String lastName;

  /// Note to add about the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed;. pass null to keep the current user's note
  final FormattedText? note;

  /// Parse from a json
  factory ImportedContact.fromJson(Map<String, dynamic> json) =>
      ImportedContact(
        phoneNumber: json['phone_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        note:
            json['note'] == null ? null : FormattedText.fromJson(json['note']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "first_name": firstName,
      "last_name": lastName,
      "note": note?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: Phone number of the user
  /// * [first_name]: First name of the user; 1-64 characters
  /// * [last_name]: Last name of the user; 0-64 characters
  /// * [note]: Note to add about the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed;. pass null to keep the current user's note
  ImportedContact copyWith({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    FormattedText? note,
  }) =>
      ImportedContact(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        note: note ?? this.note,
      );

  /// TDLib object type
  static const String defaultObjectId = 'importedContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
