part of '../tdapi.dart';

/// **TestVectorStringObject** *(testVectorStringObject)* - basic class
///
/// A simple object containing a vector of objects that hold a string; for testing only.
///
/// * [value]: Vector of objects.
final class TestVectorStringObject extends TdObject {
  /// **TestVectorStringObject** *(testVectorStringObject)* - basic class
  ///
  /// A simple object containing a vector of objects that hold a string; for testing only.
  ///
  /// * [value]: Vector of objects.
  const TestVectorStringObject({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// Vector of objects
  final List<TestString> value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TestVectorStringObject.fromJson(Map<String, dynamic> json) =>
      TestVectorStringObject(
        value: List<TestString>.from((json['value'] ?? [])
            .map((item) => TestString.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: Vector of objects
  TestVectorStringObject copyWith({
    List<TestString>? value,
    dynamic extra,
    int? clientId,
  }) =>
      TestVectorStringObject(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testVectorStringObject';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
