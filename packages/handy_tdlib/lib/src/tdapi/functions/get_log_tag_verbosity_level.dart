part of '../tdapi.dart';

/// **GetLogTagVerbosityLevel** *(getLogTagVerbosityLevel)* - TDLib function
///
/// Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously.
///
/// * [tag]: Logging tag to change verbosity level.
///
/// [LogVerbosityLevel] is returned on completion.
final class GetLogTagVerbosityLevel extends TdFunction {
  /// **GetLogTagVerbosityLevel** *(getLogTagVerbosityLevel)* - TDLib function
  ///
  /// Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously.
  ///
  /// * [tag]: Logging tag to change verbosity level.
  ///
  /// [LogVerbosityLevel] is returned on completion.
  const GetLogTagVerbosityLevel({
    required this.tag,
  });

  /// Logging tag to change verbosity level
  final String tag;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag": tag,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: Logging tag to change verbosity level
  GetLogTagVerbosityLevel copyWith({
    String? tag,
  }) =>
      GetLogTagVerbosityLevel(
        tag: tag ?? this.tag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLogTagVerbosityLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
