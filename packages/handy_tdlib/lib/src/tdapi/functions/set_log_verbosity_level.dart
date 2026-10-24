part of '../tdapi.dart';

/// **SetLogVerbosityLevel** *(setLogVerbosityLevel)* - TDLib function
///
/// Sets the verbosity level of the internal logging of TDLib. Can be called synchronously.
///
/// * [newVerbosityLevel]: New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings,. value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging.
///
/// [Ok] is returned on completion.
final class SetLogVerbosityLevel extends TdFunction {
  /// **SetLogVerbosityLevel** *(setLogVerbosityLevel)* - TDLib function
  ///
  /// Sets the verbosity level of the internal logging of TDLib. Can be called synchronously.
  ///
  /// * [newVerbosityLevel]: New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings,. value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging.
  ///
  /// [Ok] is returned on completion.
  const SetLogVerbosityLevel({
    required this.newVerbosityLevel,
  });

  /// New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings,. value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
  final int newVerbosityLevel;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "new_verbosity_level": newVerbosityLevel,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [new_verbosity_level]: New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings,. value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
  SetLogVerbosityLevel copyWith({
    int? newVerbosityLevel,
  }) =>
      SetLogVerbosityLevel(
        newVerbosityLevel: newVerbosityLevel ?? this.newVerbosityLevel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setLogVerbosityLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
