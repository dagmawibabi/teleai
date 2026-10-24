part of '../tdapi.dart';

/// **AccountTtl** *(accountTtl)* - basic class
///
/// Contains information about the period of inactivity after which the current user's account will automatically be deleted.
///
/// * [days]: Number of days of inactivity before the account will be flagged for deletion; 30-730 days.
final class AccountTtl extends TdObject {
  /// **AccountTtl** *(accountTtl)* - basic class
  ///
  /// Contains information about the period of inactivity after which the current user's account will automatically be deleted.
  ///
  /// * [days]: Number of days of inactivity before the account will be flagged for deletion; 30-730 days.
  const AccountTtl({
    required this.days,
    this.extra,
    this.clientId,
  });

  /// Number of days of inactivity before the account will be flagged for deletion; 30-730 days
  final int days;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AccountTtl.fromJson(Map<String, dynamic> json) => AccountTtl(
        days: json['days'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "days": days,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [days]: Number of days of inactivity before the account will be flagged for deletion; 30-730 days
  AccountTtl copyWith({
    int? days,
    dynamic extra,
    int? clientId,
  }) =>
      AccountTtl(
        days: days ?? this.days,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'accountTtl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
