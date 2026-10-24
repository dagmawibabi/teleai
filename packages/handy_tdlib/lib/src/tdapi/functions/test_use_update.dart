part of '../tdapi.dart';

/// **TestUseUpdate** *(testUseUpdate)* - TDLib function
///
/// Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization.
///
/// [Update] is returned on completion.
final class TestUseUpdate extends TdFunction {
  /// **TestUseUpdate** *(testUseUpdate)* - TDLib function
  ///
  /// Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization.
  ///
  /// [Update] is returned on completion.
  const TestUseUpdate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  TestUseUpdate copyWith() => const TestUseUpdate();

  /// TDLib object type
  static const String defaultObjectId = 'testUseUpdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
