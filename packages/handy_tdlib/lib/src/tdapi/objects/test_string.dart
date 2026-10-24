part of '../tdapi.dart';

/// **TestString** *(testString)* - basic class
///
/// A simple object containing a string; for testing only.
///
/// * [value]: String.
final class TestString extends TdObject {
  /// **TestString** *(testString)* - basic class
  ///
  /// A simple object containing a string; for testing only.
  ///
  /// * [value]: String.
  const TestString({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// String
  final String value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TestString.fromJson(Map<String, dynamic> json) => TestString(
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
  /// * [value]: String
  TestString copyWith({
    String? value,
    dynamic extra,
    int? clientId,
  }) =>
      TestString(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
