part of '../tdapi.dart';

/// **TestCallVectorIntObject** *(testCallVectorIntObject)* - TDLib function
///
/// Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Vector of objects to return.
///
/// [TestVectorIntObject] is returned on completion.
final class TestCallVectorIntObject extends TdFunction {
  /// **TestCallVectorIntObject** *(testCallVectorIntObject)* - TDLib function
  ///
  /// Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Vector of objects to return.
  ///
  /// [TestVectorIntObject] is returned on completion.
  const TestCallVectorIntObject({
    required this.x,
  });

  /// Vector of objects to return
  final List<TestInt> x;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "x": x.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [x]: Vector of objects to return
  TestCallVectorIntObject copyWith({
    List<TestInt>? x,
  }) =>
      TestCallVectorIntObject(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallVectorIntObject';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
