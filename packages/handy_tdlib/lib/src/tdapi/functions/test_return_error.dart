part of '../tdapi.dart';

/// **TestReturnError** *(testReturnError)* - TDLib function
///
/// Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously.
///
/// * [error]: The error to be returned.
///
/// [Error] is returned on completion.
final class TestReturnError extends TdFunction {
  /// **TestReturnError** *(testReturnError)* - TDLib function
  ///
  /// Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously.
  ///
  /// * [error]: The error to be returned.
  ///
  /// [Error] is returned on completion.
  const TestReturnError({
    required this.error,
  });

  /// The error to be returned
  final TdError error;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "error": error.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error]: The error to be returned
  TestReturnError copyWith({
    TdError? error,
  }) =>
      TestReturnError(
        error: error ?? this.error,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testReturnError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
