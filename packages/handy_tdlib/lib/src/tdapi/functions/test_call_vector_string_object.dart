part of '../tdapi.dart';

/// **TestCallVectorStringObject** *(testCallVectorStringObject)* - TDLib function
///
/// Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Vector of objects to return.
///
/// [TestVectorStringObject] is returned on completion.
final class TestCallVectorStringObject extends TdFunction {
  /// **TestCallVectorStringObject** *(testCallVectorStringObject)* - TDLib function
  ///
  /// Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Vector of objects to return.
  ///
  /// [TestVectorStringObject] is returned on completion.
  const TestCallVectorStringObject({
    required this.x,
  });

  /// Vector of objects to return
  final List<TestString> x;

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
  TestCallVectorStringObject copyWith({
    List<TestString>? x,
  }) =>
      TestCallVectorStringObject(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallVectorStringObject';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
