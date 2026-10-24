part of '../tdapi.dart';

/// **GetLogVerbosityLevel** *(getLogVerbosityLevel)* - TDLib function
///
/// Returns current verbosity level of the internal logging of TDLib. Can be called synchronously.
///
/// [LogVerbosityLevel] is returned on completion.
final class GetLogVerbosityLevel extends TdFunction {
  /// **GetLogVerbosityLevel** *(getLogVerbosityLevel)* - TDLib function
  ///
  /// Returns current verbosity level of the internal logging of TDLib. Can be called synchronously.
  ///
  /// [LogVerbosityLevel] is returned on completion.
  const GetLogVerbosityLevel();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetLogVerbosityLevel copyWith() => const GetLogVerbosityLevel();

  /// TDLib object type
  static const String defaultObjectId = 'getLogVerbosityLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
