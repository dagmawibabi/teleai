part of '../tdapi.dart';

/// **SetInactiveSessionTtl** *(setInactiveSessionTtl)* - TDLib function
///
/// Changes the period of inactivity after which sessions will automatically be terminated.
///
/// * [inactiveSessionTtlDays]: New number of days of inactivity before sessions will be automatically terminated; 1-366 days.
///
/// [Ok] is returned on completion.
final class SetInactiveSessionTtl extends TdFunction {
  /// **SetInactiveSessionTtl** *(setInactiveSessionTtl)* - TDLib function
  ///
  /// Changes the period of inactivity after which sessions will automatically be terminated.
  ///
  /// * [inactiveSessionTtlDays]: New number of days of inactivity before sessions will be automatically terminated; 1-366 days.
  ///
  /// [Ok] is returned on completion.
  const SetInactiveSessionTtl({
    required this.inactiveSessionTtlDays,
  });

  /// New number of days of inactivity before sessions will be automatically terminated; 1-366 days
  final int inactiveSessionTtlDays;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inactive_session_ttl_days": inactiveSessionTtlDays,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inactive_session_ttl_days]: New number of days of inactivity before sessions will be automatically terminated; 1-366 days
  SetInactiveSessionTtl copyWith({
    int? inactiveSessionTtlDays,
  }) =>
      SetInactiveSessionTtl(
        inactiveSessionTtlDays:
            inactiveSessionTtlDays ?? this.inactiveSessionTtlDays,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setInactiveSessionTtl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
