part of '../tdapi.dart';

/// **TestNetwork** *(testNetwork)* - TDLib function
///
/// Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization.
///
/// [Ok] is returned on completion.
final class TestNetwork extends TdFunction {
  /// **TestNetwork** *(testNetwork)* - TDLib function
  ///
  /// Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization.
  ///
  /// [Ok] is returned on completion.
  const TestNetwork();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  TestNetwork copyWith() => const TestNetwork();

  /// TDLib object type
  static const String defaultObjectId = 'testNetwork';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
