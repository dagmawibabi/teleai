part of '../tdapi.dart';

/// **SetLogTagVerbosityLevel** *(setLogTagVerbosityLevel)* - TDLib function
///
/// Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously.
///
/// * [tag]: Logging tag to change verbosity level.
/// * [newVerbosityLevel]: New verbosity level; 1-1024.
///
/// [Ok] is returned on completion.
final class SetLogTagVerbosityLevel extends TdFunction {
  /// **SetLogTagVerbosityLevel** *(setLogTagVerbosityLevel)* - TDLib function
  ///
  /// Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously.
  ///
  /// * [tag]: Logging tag to change verbosity level.
  /// * [newVerbosityLevel]: New verbosity level; 1-1024.
  ///
  /// [Ok] is returned on completion.
  const SetLogTagVerbosityLevel({
    required this.tag,
    required this.newVerbosityLevel,
  });

  /// Logging tag to change verbosity level
  final String tag;

  /// New verbosity level; 1-1024
  final int newVerbosityLevel;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag": tag,
      "new_verbosity_level": newVerbosityLevel,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: Logging tag to change verbosity level
  /// * [new_verbosity_level]: New verbosity level; 1-1024
  SetLogTagVerbosityLevel copyWith({
    String? tag,
    int? newVerbosityLevel,
  }) =>
      SetLogTagVerbosityLevel(
        tag: tag ?? this.tag,
        newVerbosityLevel: newVerbosityLevel ?? this.newVerbosityLevel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setLogTagVerbosityLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
