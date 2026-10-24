part of '../tdapi.dart';

/// **ResendCodeReason** *(resendCodeReason)* - parent
///
/// Describes the reason why a code needs to be re-sent.
sealed class ResendCodeReason extends TdObject {
  /// **ResendCodeReason** *(resendCodeReason)* - parent
  ///
  /// Describes the reason why a code needs to be re-sent.
  const ResendCodeReason();

  /// a ResendCodeReason return type can be :
  /// * [ResendCodeReasonUserRequest]
  /// * [ResendCodeReasonVerificationFailed]
  factory ResendCodeReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ResendCodeReasonUserRequest.defaultObjectId:
        return ResendCodeReasonUserRequest.fromJson(json);
      case ResendCodeReasonVerificationFailed.defaultObjectId:
        return ResendCodeReasonVerificationFailed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ResendCodeReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ResendCodeReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'resendCodeReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ResendCodeReasonUserRequest** *(resendCodeReasonUserRequest)* - child of ResendCodeReason
///
/// The user requested to resend the code.
final class ResendCodeReasonUserRequest extends ResendCodeReason {
  /// **ResendCodeReasonUserRequest** *(resendCodeReasonUserRequest)* - child of ResendCodeReason
  ///
  /// The user requested to resend the code.
  const ResendCodeReasonUserRequest();

  /// Parse from a json
  factory ResendCodeReasonUserRequest.fromJson(Map<String, dynamic> json) =>
      const ResendCodeReasonUserRequest();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ResendCodeReasonUserRequest copyWith() => const ResendCodeReasonUserRequest();

  /// TDLib object type
  static const String defaultObjectId = 'resendCodeReasonUserRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ResendCodeReasonVerificationFailed** *(resendCodeReasonVerificationFailed)* - child of ResendCodeReason
///
/// The code is re-sent, because device verification has failed.
///
/// * [errorMessage]: Cause of the verification failure, for example, "PLAY_SERVICES_NOT_AVAILABLE", "APNS_RECEIVE_TIMEOUT", or "APNS_INIT_FAILED".
final class ResendCodeReasonVerificationFailed extends ResendCodeReason {
  /// **ResendCodeReasonVerificationFailed** *(resendCodeReasonVerificationFailed)* - child of ResendCodeReason
  ///
  /// The code is re-sent, because device verification has failed.
  ///
  /// * [errorMessage]: Cause of the verification failure, for example, "PLAY_SERVICES_NOT_AVAILABLE", "APNS_RECEIVE_TIMEOUT", or "APNS_INIT_FAILED".
  const ResendCodeReasonVerificationFailed({
    required this.errorMessage,
  });

  /// Cause of the verification failure, for example, "PLAY_SERVICES_NOT_AVAILABLE", "APNS_RECEIVE_TIMEOUT", or "APNS_INIT_FAILED"
  final String errorMessage;

  /// Parse from a json
  factory ResendCodeReasonVerificationFailed.fromJson(
          Map<String, dynamic> json) =>
      ResendCodeReasonVerificationFailed(
        errorMessage: json['error_message'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "error_message": errorMessage,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error_message]: Cause of the verification failure, for example, "PLAY_SERVICES_NOT_AVAILABLE", "APNS_RECEIVE_TIMEOUT", or "APNS_INIT_FAILED"
  @override
  ResendCodeReasonVerificationFailed copyWith({
    String? errorMessage,
  }) =>
      ResendCodeReasonVerificationFailed(
        errorMessage: errorMessage ?? this.errorMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resendCodeReasonVerificationFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
