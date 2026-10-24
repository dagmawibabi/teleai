part of '../tdapi.dart';

/// **RecoveryEmailAddress** *(recoveryEmailAddress)* - basic class
///
/// Contains information about the current recovery email address.
///
/// * [recoveryEmailAddress]: Recovery email address.
final class RecoveryEmailAddress extends TdObject {
  /// **RecoveryEmailAddress** *(recoveryEmailAddress)* - basic class
  ///
  /// Contains information about the current recovery email address.
  ///
  /// * [recoveryEmailAddress]: Recovery email address.
  const RecoveryEmailAddress({
    required this.recoveryEmailAddress,
    this.extra,
    this.clientId,
  });

  /// Recovery email address
  final String recoveryEmailAddress;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory RecoveryEmailAddress.fromJson(Map<String, dynamic> json) =>
      RecoveryEmailAddress(
        recoveryEmailAddress: json['recovery_email_address'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "recovery_email_address": recoveryEmailAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [recovery_email_address]: Recovery email address
  RecoveryEmailAddress copyWith({
    String? recoveryEmailAddress,
    dynamic extra,
    int? clientId,
  }) =>
      RecoveryEmailAddress(
        recoveryEmailAddress: recoveryEmailAddress ?? this.recoveryEmailAddress,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'recoveryEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
