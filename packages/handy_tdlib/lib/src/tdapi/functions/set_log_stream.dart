part of '../tdapi.dart';

/// **SetLogStream** *(setLogStream)* - TDLib function
///
/// Sets new log stream for internal logging of TDLib. Can be called synchronously.
///
/// * [logStream]: New log stream.
///
/// [Ok] is returned on completion.
final class SetLogStream extends TdFunction {
  /// **SetLogStream** *(setLogStream)* - TDLib function
  ///
  /// Sets new log stream for internal logging of TDLib. Can be called synchronously.
  ///
  /// * [logStream]: New log stream.
  ///
  /// [Ok] is returned on completion.
  const SetLogStream({
    required this.logStream,
  });

  /// New log stream
  final LogStream logStream;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "log_stream": logStream.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [log_stream]: New log stream
  SetLogStream copyWith({
    LogStream? logStream,
  }) =>
      SetLogStream(
        logStream: logStream ?? this.logStream,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setLogStream';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
