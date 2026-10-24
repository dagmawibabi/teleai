part of '../tdapi.dart';

/// **SetPassportElement** *(setPassportElement)* - TDLib function
///
/// Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first.
///
/// * [element]: Input Telegram Passport element.
/// * [password]: The 2-step verification password of the current user.
///
/// [PassportElement] is returned on completion.
final class SetPassportElement extends TdFunction {
  /// **SetPassportElement** *(setPassportElement)* - TDLib function
  ///
  /// Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first.
  ///
  /// * [element]: Input Telegram Passport element.
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [PassportElement] is returned on completion.
  const SetPassportElement({
    required this.element,
    required this.password,
  });

  /// Input Telegram Passport element
  final InputPassportElement element;

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "element": element.toJson(),
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [element]: Input Telegram Passport element
  /// * [password]: The 2-step verification password of the current user
  SetPassportElement copyWith({
    InputPassportElement? element,
    String? password,
  }) =>
      SetPassportElement(
        element: element ?? this.element,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPassportElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
