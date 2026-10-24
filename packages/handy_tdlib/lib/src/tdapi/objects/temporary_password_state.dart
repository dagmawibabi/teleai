part of '../tdapi.dart';

/// **TemporaryPasswordState** *(temporaryPasswordState)* - basic class
///
/// Contains information about the availability of a temporary password, which can be used for payments and withdrawal of upgraded gifts.
///
/// * [hasPassword]: True, if a temporary password is available.
/// * [validFor]: Time left before the temporary password expires, in seconds.
final class TemporaryPasswordState extends TdObject {
  /// **TemporaryPasswordState** *(temporaryPasswordState)* - basic class
  ///
  /// Contains information about the availability of a temporary password, which can be used for payments and withdrawal of upgraded gifts.
  ///
  /// * [hasPassword]: True, if a temporary password is available.
  /// * [validFor]: Time left before the temporary password expires, in seconds.
  const TemporaryPasswordState({
    required this.hasPassword,
    required this.validFor,
    this.extra,
    this.clientId,
  });

  /// True, if a temporary password is available
  final bool hasPassword;

  /// Time left before the temporary password expires, in seconds
  final int validFor;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TemporaryPasswordState.fromJson(Map<String, dynamic> json) =>
      TemporaryPasswordState(
        hasPassword: json['has_password'],
        validFor: json['valid_for'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_password": hasPassword,
      "valid_for": validFor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_password]: True, if a temporary password is available
  /// * [valid_for]: Time left before the temporary password expires, in seconds
  TemporaryPasswordState copyWith({
    bool? hasPassword,
    int? validFor,
    dynamic extra,
    int? clientId,
  }) =>
      TemporaryPasswordState(
        hasPassword: hasPassword ?? this.hasPassword,
        validFor: validFor ?? this.validFor,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'temporaryPasswordState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
