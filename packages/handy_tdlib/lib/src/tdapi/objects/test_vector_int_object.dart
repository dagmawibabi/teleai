part of '../tdapi.dart';

/// **TestVectorIntObject** *(testVectorIntObject)* - basic class
///
/// A simple object containing a vector of objects that hold a number; for testing only.
///
/// * [value]: Vector of objects.
final class TestVectorIntObject extends TdObject {
  /// **TestVectorIntObject** *(testVectorIntObject)* - basic class
  ///
  /// A simple object containing a vector of objects that hold a number; for testing only.
  ///
  /// * [value]: Vector of objects.
  const TestVectorIntObject({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// Vector of objects
  final List<TestInt> value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TestVectorIntObject.fromJson(Map<String, dynamic> json) =>
      TestVectorIntObject(
        value: List<TestInt>.from((json['value'] ?? [])
            .map((item) => TestInt.fromJson(item))
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
  TestVectorIntObject copyWith({
    List<TestInt>? value,
    dynamic extra,
    int? clientId,
  }) =>
      TestVectorIntObject(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testVectorIntObject';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
