part of '../tdapi.dart';

/// **GetLogStream** *(getLogStream)* - TDLib function
///
/// Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously.
///
/// [LogStream] is returned on completion.
final class GetLogStream extends TdFunction {
  /// **GetLogStream** *(getLogStream)* - TDLib function
  ///
  /// Returns information about currently used log stream for internal logging of TDLib. Can be called synchronously.
  ///
  /// [LogStream] is returned on completion.
  const GetLogStream();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetLogStream copyWith() => const GetLogStream();

  /// TDLib object type
  static const String defaultObjectId = 'getLogStream';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
