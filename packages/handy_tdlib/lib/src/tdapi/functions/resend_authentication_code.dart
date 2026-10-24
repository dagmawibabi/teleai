part of '../tdapi.dart';

/// **ResendAuthenticationCode** *(resendAuthenticationCode)* - TDLib function
///
/// Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, authorization_state.code_info.next_type is not null. and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode.
///
/// * [reason]: Reason of code resending; pass null if unknown *(optional)*.
///
/// [Ok] is returned on completion.
final class ResendAuthenticationCode extends TdFunction {
  /// **ResendAuthenticationCode** *(resendAuthenticationCode)* - TDLib function
  ///
  /// Resends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitCode, authorization_state.code_info.next_type is not null. and the server-specified timeout has passed, or when the current authorization state is authorizationStateWaitEmailCode.
  ///
  /// * [reason]: Reason of code resending; pass null if unknown *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const ResendAuthenticationCode({
    this.reason,
  });

  /// Reason of code resending; pass null if unknown
  final ResendCodeReason? reason;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "reason": reason?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: Reason of code resending; pass null if unknown
  ResendAuthenticationCode copyWith({
    ResendCodeReason? reason,
  }) =>
      ResendAuthenticationCode(
        reason: reason ?? this.reason,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resendAuthenticationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
