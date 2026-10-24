part of '../tdapi.dart';

/// **GetDatabaseStatistics** *(getDatabaseStatistics)* - TDLib function
///
/// Returns database statistics.
///
/// [DatabaseStatistics] is returned on completion.
final class GetDatabaseStatistics extends TdFunction {
  /// **GetDatabaseStatistics** *(getDatabaseStatistics)* - TDLib function
  ///
  /// Returns database statistics.
  ///
  /// [DatabaseStatistics] is returned on completion.
  const GetDatabaseStatistics();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetDatabaseStatistics copyWith() => const GetDatabaseStatistics();

  /// TDLib object type
  static const String defaultObjectId = 'getDatabaseStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
