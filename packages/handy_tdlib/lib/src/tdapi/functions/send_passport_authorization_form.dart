part of '../tdapi.dart';

/// **SendPassportAuthorizationForm** *(sendPassportAuthorizationForm)* - TDLib function
///
/// Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused.
///
/// * [authorizationFormId]: Authorization form identifier.
/// * [types]: Types of Telegram Passport elements chosen by user to complete the authorization form.
///
/// [Ok] is returned on completion.
final class SendPassportAuthorizationForm extends TdFunction {
  /// **SendPassportAuthorizationForm** *(sendPassportAuthorizationForm)* - TDLib function
  ///
  /// Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements are going to be reused.
  ///
  /// * [authorizationFormId]: Authorization form identifier.
  /// * [types]: Types of Telegram Passport elements chosen by user to complete the authorization form.
  ///
  /// [Ok] is returned on completion.
  const SendPassportAuthorizationForm({
    required this.authorizationFormId,
    required this.types,
  });

  /// Authorization form identifier
  final int authorizationFormId;

  /// Types of Telegram Passport elements chosen by user to complete the authorization form
  final List<PassportElementType> types;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "authorization_form_id": authorizationFormId,
      "types": types.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [authorization_form_id]: Authorization form identifier
  /// * [types]: Types of Telegram Passport elements chosen by user to complete the authorization form
  SendPassportAuthorizationForm copyWith({
    int? authorizationFormId,
    List<PassportElementType>? types,
  }) =>
      SendPassportAuthorizationForm(
        authorizationFormId: authorizationFormId ?? this.authorizationFormId,
        types: types ?? this.types,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendPassportAuthorizationForm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
