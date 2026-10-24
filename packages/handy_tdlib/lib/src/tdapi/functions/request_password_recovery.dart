part of '../tdapi.dart';

/// **RequestPasswordRecovery** *(requestPasswordRecovery)* - TDLib function
///
/// Requests to send a 2-step verification password recovery code to an email address that was previously set up.
///
/// [EmailAddressAuthenticationCodeInfo] is returned on completion.
final class RequestPasswordRecovery extends TdFunction {
  /// **RequestPasswordRecovery** *(requestPasswordRecovery)* - TDLib function
  ///
  /// Requests to send a 2-step verification password recovery code to an email address that was previously set up.
  ///
  /// [EmailAddressAuthenticationCodeInfo] is returned on completion.
  const RequestPasswordRecovery();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  RequestPasswordRecovery copyWith() => const RequestPasswordRecovery();

  /// TDLib object type
  static const String defaultObjectId = 'requestPasswordRecovery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
