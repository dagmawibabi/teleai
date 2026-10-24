part of '../tdapi.dart';

/// **SetAccountTtl** *(setAccountTtl)* - TDLib function
///
/// Changes the period of inactivity after which the account of the current user will automatically be deleted.
///
/// * [ttl]: New account TTL.
///
/// [Ok] is returned on completion.
final class SetAccountTtl extends TdFunction {
  /// **SetAccountTtl** *(setAccountTtl)* - TDLib function
  ///
  /// Changes the period of inactivity after which the account of the current user will automatically be deleted.
  ///
  /// * [ttl]: New account TTL.
  ///
  /// [Ok] is returned on completion.
  const SetAccountTtl({
    required this.ttl,
  });

  /// New account TTL
  final AccountTtl ttl;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "ttl": ttl.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [ttl]: New account TTL
  SetAccountTtl copyWith({
    AccountTtl? ttl,
  }) =>
      SetAccountTtl(
        ttl: ttl ?? this.ttl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAccountTtl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
