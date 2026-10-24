part of '../tdapi.dart';

/// **SetLoginEmailAddress** *(setLoginEmailAddress)* - TDLib function
///
/// Changes the login email address of the user. The email address can be changed only if the current user already has login email and passwordState.login_email_address_pattern is non-empty,. or the user received suggestedActionSetLoginEmailAddress and isLoginEmailAddressRequired succeeds. The change will not be applied until the new login email address is confirmed with checkLoginEmailAddressCode.. To use Apple setLoginEmailAddress/Google setLoginEmailAddress instead of an email address, call checkLoginEmailAddressCode directly.
///
/// * [newLoginEmailAddress]: New login email address.
///
/// [EmailAddressAuthenticationCodeInfo] is returned on completion.
final class SetLoginEmailAddress extends TdFunction {
  /// **SetLoginEmailAddress** *(setLoginEmailAddress)* - TDLib function
  ///
  /// Changes the login email address of the user. The email address can be changed only if the current user already has login email and passwordState.login_email_address_pattern is non-empty,. or the user received suggestedActionSetLoginEmailAddress and isLoginEmailAddressRequired succeeds. The change will not be applied until the new login email address is confirmed with checkLoginEmailAddressCode.. To use Apple setLoginEmailAddress/Google setLoginEmailAddress instead of an email address, call checkLoginEmailAddressCode directly.
  ///
  /// * [newLoginEmailAddress]: New login email address.
  ///
  /// [EmailAddressAuthenticationCodeInfo] is returned on completion.
  const SetLoginEmailAddress({
    required this.newLoginEmailAddress,
  });

  /// New login email address
  final String newLoginEmailAddress;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "new_login_email_address": newLoginEmailAddress,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [new_login_email_address]: New login email address
  SetLoginEmailAddress copyWith({
    String? newLoginEmailAddress,
  }) =>
      SetLoginEmailAddress(
        newLoginEmailAddress: newLoginEmailAddress ?? this.newLoginEmailAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setLoginEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
