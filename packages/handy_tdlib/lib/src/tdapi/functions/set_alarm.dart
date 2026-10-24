part of '../tdapi.dart';

/// **SetAlarm** *(setAlarm)* - TDLib function
///
/// Succeeds after a specified amount of time has passed. Can be called before initialization.
///
/// * [seconds]: Number of seconds before the function returns.
///
/// [Ok] is returned on completion.
final class SetAlarm extends TdFunction {
  /// **SetAlarm** *(setAlarm)* - TDLib function
  ///
  /// Succeeds after a specified amount of time has passed. Can be called before initialization.
  ///
  /// * [seconds]: Number of seconds before the function returns.
  ///
  /// [Ok] is returned on completion.
  const SetAlarm({
    required this.seconds,
  });

  /// Number of seconds before the function returns
  final double seconds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "seconds": seconds,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [seconds]: Number of seconds before the function returns
  SetAlarm copyWith({
    double? seconds,
  }) =>
      SetAlarm(
        seconds: seconds ?? this.seconds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAlarm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
