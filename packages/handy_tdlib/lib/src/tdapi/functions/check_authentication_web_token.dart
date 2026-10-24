part of '../tdapi.dart';

/// **CheckAuthenticationWebToken** *(checkAuthenticationWebToken)* - TDLib function
///
/// Checks a web token to log in to the corresponding account; for official Telegram apps only. Works only when the current authorization state is. authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation.
///
/// * [token]: The token to check.
/// * [dcId]: Identifier of the datacenter of the user.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationWebToken extends TdFunction {
  /// **CheckAuthenticationWebToken** *(checkAuthenticationWebToken)* - TDLib function
  ///
  /// Checks a web token to log in to the corresponding account; for official Telegram apps only. Works only when the current authorization state is. authorizationStateWaitPhoneNumber or authorizationStateWaitOtherDeviceConfirmation.
  ///
  /// * [token]: The token to check.
  /// * [dcId]: Identifier of the datacenter of the user.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationWebToken({
    required this.token,
    required this.dcId,
  });

  /// The token to check
  final String token;

  /// Identifier of the datacenter of the user
  final int dcId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "token": token,
      "dc_id": dcId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The token to check
  /// * [dc_id]: Identifier of the datacenter of the user
  CheckAuthenticationWebToken copyWith({
    String? token,
    int? dcId,
  }) =>
      CheckAuthenticationWebToken(
        token: token ?? this.token,
        dcId: dcId ?? this.dcId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationWebToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
