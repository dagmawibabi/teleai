part of '../tdapi.dart';

/// **TestInt** *(testInt)* - basic class
///
/// A simple object containing a number; for testing only.
///
/// * [value]: Number.
final class TestInt extends TdObject {
  /// **TestInt** *(testInt)* - basic class
  ///
  /// A simple object containing a number; for testing only.
  ///
  /// * [value]: Number.
  const TestInt({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// Number
  final int value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TestInt.fromJson(Map<String, dynamic> json) => TestInt(
        value: json['value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: Number
  TestInt copyWith({
    int? value,
    dynamic extra,
    int? clientId,
  }) =>
      TestInt(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testInt';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
