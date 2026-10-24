part of '../tdapi.dart';

/// **TestCallEmpty** *(testCallEmpty)* - TDLib function
///
/// Does nothing; for testing only. This is an offline method. Can be called before authorization.
///
/// [Ok] is returned on completion.
final class TestCallEmpty extends TdFunction {
  /// **TestCallEmpty** *(testCallEmpty)* - TDLib function
  ///
  /// Does nothing; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// [Ok] is returned on completion.
  const TestCallEmpty();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  TestCallEmpty copyWith() => const TestCallEmpty();

  /// TDLib object type
  static const String defaultObjectId = 'testCallEmpty';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
