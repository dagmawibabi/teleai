part of '../tdapi.dart';

/// **GetTimeZones** *(getTimeZones)* - TDLib function
///
/// Returns the list of supported time zones.
///
/// [TimeZones] is returned on completion.
final class GetTimeZones extends TdFunction {
  /// **GetTimeZones** *(getTimeZones)* - TDLib function
  ///
  /// Returns the list of supported time zones.
  ///
  /// [TimeZones] is returned on completion.
  const GetTimeZones();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTimeZones copyWith() => const GetTimeZones();

  /// TDLib object type
  static const String defaultObjectId = 'getTimeZones';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
