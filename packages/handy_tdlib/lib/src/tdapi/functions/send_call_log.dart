part of '../tdapi.dart';

/// **SendCallLog** *(sendCallLog)* - TDLib function
///
/// Sends log file for a call to Telegram servers.
///
/// * [callId]: Call identifier.
/// * [logFile]: Call log file. Only inputFileLocal and inputFileGenerated are supported.
///
/// [Ok] is returned on completion.
final class SendCallLog extends TdFunction {
  /// **SendCallLog** *(sendCallLog)* - TDLib function
  ///
  /// Sends log file for a call to Telegram servers.
  ///
  /// * [callId]: Call identifier.
  /// * [logFile]: Call log file. Only inputFileLocal and inputFileGenerated are supported.
  ///
  /// [Ok] is returned on completion.
  const SendCallLog({
    required this.callId,
    required this.logFile,
  });

  /// Call identifier
  final InputCall callId;

  /// Call log file. Only inputFileLocal and inputFileGenerated are supported
  final InputFile logFile;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "call_id": callId.toJson(),
      "log_file": logFile.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: Call identifier
  /// * [log_file]: Call log file. Only inputFileLocal and inputFileGenerated are supported
  SendCallLog copyWith({
    InputCall? callId,
    InputFile? logFile,
  }) =>
      SendCallLog(
        callId: callId ?? this.callId,
        logFile: logFile ?? this.logFile,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendCallLog';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
