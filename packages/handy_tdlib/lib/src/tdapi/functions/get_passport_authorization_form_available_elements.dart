part of '../tdapi.dart';

/// **GetPassportAuthorizationFormAvailableElements** *(getPassportAuthorizationFormAvailableElements)* - TDLib function
///
/// Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form.
///
/// * [authorizationFormId]: Authorization form identifier.
/// * [password]: The 2-step verification password of the current user.
///
/// [PassportElementsWithErrors] is returned on completion.
final class GetPassportAuthorizationFormAvailableElements extends TdFunction {
  /// **GetPassportAuthorizationFormAvailableElements** *(getPassportAuthorizationFormAvailableElements)* - TDLib function
  ///
  /// Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form.
  ///
  /// * [authorizationFormId]: Authorization form identifier.
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [PassportElementsWithErrors] is returned on completion.
  const GetPassportAuthorizationFormAvailableElements({
    required this.authorizationFormId,
    required this.password,
  });

  /// Authorization form identifier
  final int authorizationFormId;

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "authorization_form_id": authorizationFormId,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [authorization_form_id]: Authorization form identifier
  /// * [password]: The 2-step verification password of the current user
  GetPassportAuthorizationFormAvailableElements copyWith({
    int? authorizationFormId,
    String? password,
  }) =>
      GetPassportAuthorizationFormAvailableElements(
        authorizationFormId: authorizationFormId ?? this.authorizationFormId,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'getPassportAuthorizationFormAvailableElements';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
