part of '../tdapi.dart';

/// **TestGetDifference** *(testGetDifference)* - TDLib function
///
/// Forces an updates.getDifference call to the Telegram servers; for testing only.
///
/// [Ok] is returned on completion.
final class TestGetDifference extends TdFunction {
  /// **TestGetDifference** *(testGetDifference)* - TDLib function
  ///
  /// Forces an updates.getDifference call to the Telegram servers; for testing only.
  ///
  /// [Ok] is returned on completion.
  const TestGetDifference();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  TestGetDifference copyWith() => const TestGetDifference();

  /// TDLib object type
  static const String defaultObjectId = 'testGetDifference';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
