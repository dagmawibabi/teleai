part of '../tdapi.dart';

/// **AddContact** *(addContact)* - TDLib function
///
/// Adds a user to the contact list or edits an existing contact by their user identifier.
///
/// * [userId]: Identifier of the user.
/// * [contact]: The contact to add or edit; phone number may be empty and needs to be specified only if known.
/// * [sharePhoneNumber]: Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number.
///
/// [Ok] is returned on completion.
final class AddContact extends TdFunction {
  /// **AddContact** *(addContact)* - TDLib function
  ///
  /// Adds a user to the contact list or edits an existing contact by their user identifier.
  ///
  /// * [userId]: Identifier of the user.
  /// * [contact]: The contact to add or edit; phone number may be empty and needs to be specified only if known.
  /// * [sharePhoneNumber]: Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number.
  ///
  /// [Ok] is returned on completion.
  const AddContact({
    required this.userId,
    required this.contact,
    required this.sharePhoneNumber,
  });

  /// Identifier of the user
  final int userId;

  /// The contact to add or edit; phone number may be empty and needs to be specified only if known
  final ImportedContact contact;

  /// Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
  final bool sharePhoneNumber;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "contact": contact.toJson(),
      "share_phone_number": sharePhoneNumber,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [contact]: The contact to add or edit; phone number may be empty and needs to be specified only if known
  /// * [share_phone_number]: Pass true to share the current user's phone number with the new contact. A corresponding rule to userPrivacySettingShowPhoneNumber will be added if needed.. Use the field userFullInfo.need_phone_number_privacy_exception to check whether the current user needs to be asked to share their phone number
  AddContact copyWith({
    int? userId,
    ImportedContact? contact,
    bool? sharePhoneNumber,
  }) =>
      AddContact(
        userId: userId ?? this.userId,
        contact: contact ?? this.contact,
        sharePhoneNumber: sharePhoneNumber ?? this.sharePhoneNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
