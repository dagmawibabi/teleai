part of '../tdapi.dart';

/// **TestCallVectorString** *(testCallVectorString)* - TDLib function
///
/// Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Vector of strings to return.
///
/// [TestVectorString] is returned on completion.
final class TestCallVectorString extends TdFunction {
  /// **TestCallVectorString** *(testCallVectorString)* - TDLib function
  ///
  /// Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Vector of strings to return.
  ///
  /// [TestVectorString] is returned on completion.
  const TestCallVectorString({
    required this.x,
  });

  /// Vector of strings to return
  final List<String> x;

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
  /// * [x]: Vector of strings to return
  TestCallVectorString copyWith({
    List<String>? x,
  }) =>
      TestCallVectorString(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallVectorString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
