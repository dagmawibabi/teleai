part of '../tdapi.dart';

/// **TestCallBytes** *(testCallBytes)* - TDLib function
///
/// Returns the received bytes; for testing only. This is an offline method. Can be called before authorization.
///
/// * [x]: Bytes to return.
///
/// [TestBytes] is returned on completion.
final class TestCallBytes extends TdFunction {
  /// **TestCallBytes** *(testCallBytes)* - TDLib function
  ///
  /// Returns the received bytes; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// * [x]: Bytes to return.
  ///
  /// [TestBytes] is returned on completion.
  const TestCallBytes({
    required this.x,
  });

  /// Bytes to return
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
  /// * [x]: Bytes to return
  TestCallBytes copyWith({
    String? x,
  }) =>
      TestCallBytes(
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testCallBytes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
