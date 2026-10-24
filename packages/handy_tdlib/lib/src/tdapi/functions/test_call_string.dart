part of '../tdapi.dart';

/// **TestCallString** *(testCallString)* - TDLib function
///
/// Returns the received string; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: String to return.
///
/// [TestString] is returned on completion.
final class TestCallString extends TdFunction {
  /// **TestCallString** *(testCallString)* - TDLib function
  ///
  /// Returns the received string; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: String to return.
  ///
  /// [TestString] is returned on completion.
  const TestCallString({
    required this.x,
  });

  /// String to return
  final String x;

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
  /// * [x]: String to return
  TestCallString copyWith({
    String? x,
  }) =>
      TestCallString(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
