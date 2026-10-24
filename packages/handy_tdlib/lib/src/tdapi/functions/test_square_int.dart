part of '../tdapi.dart';

/// **TestSquareInt** *(testSquareInt)* - TDLib function
///
/// Returns the squared received number; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Number to square.
///
/// [TestInt] is returned on completion.
final class TestSquareInt extends TdFunction {
  /// **TestSquareInt** *(testSquareInt)* - TDLib function
  ///
  /// Returns the squared received number; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Number to square.
  ///
  /// [TestInt] is returned on completion.
  const TestSquareInt({
    required this.x,
  });

  /// Number to square
  final int x;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "x": x,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [x]: Number to square
  TestSquareInt copyWith({
    int? x,
  }) =>
      TestSquareInt(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testSquareInt';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
