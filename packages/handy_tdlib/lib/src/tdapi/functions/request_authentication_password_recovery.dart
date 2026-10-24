part of '../tdapi.dart';

/// **RequestAuthenticationPasswordRecovery** *(requestAuthenticationPasswordRecovery)* - TDLib function
///
/// Requests to send a 2-step verification password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword.
///
/// [Ok] is returned on completion.
final class RequestAuthenticationPasswordRecovery extends TdFunction {
  /// **RequestAuthenticationPasswordRecovery** *(requestAuthenticationPasswordRecovery)* - TDLib function
  ///
  /// Requests to send a 2-step verification password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword.
  ///
  /// [Ok] is returned on completion.
  const RequestAuthenticationPasswordRecovery();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  RequestAuthenticationPasswordRecovery copyWith() =>
      const RequestAuthenticationPasswordRecovery();

  /// TDLib object type
  static const String defaultObjectId = 'requestAuthenticationPasswordRecovery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
