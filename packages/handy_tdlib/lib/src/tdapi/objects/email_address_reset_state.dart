part of '../tdapi.dart';

/// **EmailAddressResetState** *(emailAddressResetState)* - parent
///
/// Describes reset state of an email address.
sealed class EmailAddressResetState extends TdObject {
  /// **EmailAddressResetState** *(emailAddressResetState)* - parent
  ///
  /// Describes reset state of an email address.
  const EmailAddressResetState();

  /// a EmailAddressResetState return type can be :
  /// * [EmailAddressResetStateAvailable]
  /// * [EmailAddressResetStatePending]
  factory EmailAddressResetState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case EmailAddressResetStateAvailable.defaultObjectId:
        return EmailAddressResetStateAvailable.fromJson(json);
      case EmailAddressResetStatePending.defaultObjectId:
        return EmailAddressResetStatePending.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of EmailAddressResetState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  EmailAddressResetState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressResetState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmailAddressResetStateAvailable** *(emailAddressResetStateAvailable)* - child of EmailAddressResetState
///
/// Email address can be reset after the given period. Call resetAuthenticationEmailAddress to reset it and allow the user to authorize with a code sent to the user's phone number.
///
/// * [waitPeriod]: Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium.
final class EmailAddressResetStateAvailable extends EmailAddressResetState {
  /// **EmailAddressResetStateAvailable** *(emailAddressResetStateAvailable)* - child of EmailAddressResetState
  ///
  /// Email address can be reset after the given period. Call resetAuthenticationEmailAddress to reset it and allow the user to authorize with a code sent to the user's phone number.
  ///
  /// * [waitPeriod]: Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium.
  const EmailAddressResetStateAvailable({
    required this.waitPeriod,
  });

  /// Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium
  final int waitPeriod;

  /// Parse from a json
  factory EmailAddressResetStateAvailable.fromJson(Map<String, dynamic> json) =>
      EmailAddressResetStateAvailable(
        waitPeriod: json['wait_period'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "wait_period": waitPeriod,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [wait_period]: Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium
  @override
  EmailAddressResetStateAvailable copyWith({
    int? waitPeriod,
  }) =>
      EmailAddressResetStateAvailable(
        waitPeriod: waitPeriod ?? this.waitPeriod,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressResetStateAvailable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **EmailAddressResetStatePending** *(emailAddressResetStatePending)* - child of EmailAddressResetState
///
/// Email address reset has already been requested. Call resetAuthenticationEmailAddress to check whether immediate reset is possible.
///
/// * [resetIn]: Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes.
final class EmailAddressResetStatePending extends EmailAddressResetState {
  /// **EmailAddressResetStatePending** *(emailAddressResetStatePending)* - child of EmailAddressResetState
  ///
  /// Email address reset has already been requested. Call resetAuthenticationEmailAddress to check whether immediate reset is possible.
  ///
  /// * [resetIn]: Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes.
  const EmailAddressResetStatePending({
    required this.resetIn,
  });

  /// Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes
  final int resetIn;

  /// Parse from a json
  factory EmailAddressResetStatePending.fromJson(Map<String, dynamic> json) =>
      EmailAddressResetStatePending(
        resetIn: json['reset_in'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reset_in": resetIn,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reset_in]: Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes
  @override
  EmailAddressResetStatePending copyWith({
    int? resetIn,
  }) =>
      EmailAddressResetStatePending(
        resetIn: resetIn ?? this.resetIn,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emailAddressResetStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
