part of '../tdapi.dart';

/// **TestCallVectorInt** *(testCallVectorInt)* - TDLib function
///
/// Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Vector of numbers to return.
///
/// [TestVectorInt] is returned on completion.
final class TestCallVectorInt extends TdFunction {
  /// **TestCallVectorInt** *(testCallVectorInt)* - TDLib function
  ///
  /// Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Vector of numbers to return.
  ///
  /// [TestVectorInt] is returned on completion.
  const TestCallVectorInt({
    required this.x,
  });

  /// Vector of numbers to return
  final List<int> x;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "x": x.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [x]: Vector of numbers to return
  TestCallVectorInt copyWith({
    List<int>? x,
  }) =>
      TestCallVectorInt(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallVectorInt';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
