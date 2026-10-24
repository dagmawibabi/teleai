part of '../tdapi.dart';

/// **ResetPasswordResult** *(resetPasswordResult)* - parent
///
/// Represents result of 2-step verification password reset.
sealed class ResetPasswordResult extends TdObject {
  /// **ResetPasswordResult** *(resetPasswordResult)* - parent
  ///
  /// Represents result of 2-step verification password reset.
  const ResetPasswordResult();

  /// a ResetPasswordResult return type can be :
  /// * [ResetPasswordResultOk]
  /// * [ResetPasswordResultPending]
  /// * [ResetPasswordResultDeclined]
  factory ResetPasswordResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ResetPasswordResultOk.defaultObjectId:
        return ResetPasswordResultOk.fromJson(json);
      case ResetPasswordResultPending.defaultObjectId:
        return ResetPasswordResultPending.fromJson(json);
      case ResetPasswordResultDeclined.defaultObjectId:
        return ResetPasswordResultDeclined.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ResetPasswordResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ResetPasswordResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'resetPasswordResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ResetPasswordResultOk** *(resetPasswordResultOk)* - child of ResetPasswordResult
///
/// The password was reset.
final class ResetPasswordResultOk extends ResetPasswordResult {
  /// **ResetPasswordResultOk** *(resetPasswordResultOk)* - child of ResetPasswordResult
  ///
  /// The password was reset.
  const ResetPasswordResultOk({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ResetPasswordResultOk.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResultOk(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ResetPasswordResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ResetPasswordResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resetPasswordResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ResetPasswordResultPending** *(resetPasswordResultPending)* - child of ResetPasswordResult
///
/// The password reset request is pending.
///
/// * [pendingResetDate]: Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword.
final class ResetPasswordResultPending extends ResetPasswordResult {
  /// **ResetPasswordResultPending** *(resetPasswordResultPending)* - child of ResetPasswordResult
  ///
  /// The password reset request is pending.
  ///
  /// * [pendingResetDate]: Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword.
  const ResetPasswordResultPending({
    required this.pendingResetDate,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
  final int pendingResetDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ResetPasswordResultPending.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResultPending(
        pendingResetDate: json['pending_reset_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "pending_reset_date": pendingResetDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pending_reset_date]: Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
  @override
  ResetPasswordResultPending copyWith({
    int? pendingResetDate,
    dynamic extra,
    int? clientId,
  }) =>
      ResetPasswordResultPending(
        pendingResetDate: pendingResetDate ?? this.pendingResetDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resetPasswordResultPending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ResetPasswordResultDeclined** *(resetPasswordResultDeclined)* - child of ResetPasswordResult
///
/// The password reset request was declined.
///
/// * [retryDate]: Point in time (Unix timestamp) when the password reset can be retried.
final class ResetPasswordResultDeclined extends ResetPasswordResult {
  /// **ResetPasswordResultDeclined** *(resetPasswordResultDeclined)* - child of ResetPasswordResult
  ///
  /// The password reset request was declined.
  ///
  /// * [retryDate]: Point in time (Unix timestamp) when the password reset can be retried.
  const ResetPasswordResultDeclined({
    required this.retryDate,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) when the password reset can be retried
  final int retryDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ResetPasswordResultDeclined.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResultDeclined(
        retryDate: json['retry_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "retry_date": retryDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [retry_date]: Point in time (Unix timestamp) when the password reset can be retried
  @override
  ResetPasswordResultDeclined copyWith({
    int? retryDate,
    dynamic extra,
    int? clientId,
  }) =>
      ResetPasswordResultDeclined(
        retryDate: retryDate ?? this.retryDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resetPasswordResultDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
