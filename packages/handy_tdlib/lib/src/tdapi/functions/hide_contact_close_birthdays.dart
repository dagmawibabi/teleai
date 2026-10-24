part of '../tdapi.dart';

/// **HideContactCloseBirthdays** *(hideContactCloseBirthdays)* - TDLib function
///
/// Hides the list of contacts that have close birthdays for 24 hours.
///
/// [Ok] is returned on completion.
final class HideContactCloseBirthdays extends TdFunction {
  /// **HideContactCloseBirthdays** *(hideContactCloseBirthdays)* - TDLib function
  ///
  /// Hides the list of contacts that have close birthdays for 24 hours.
  ///
  /// [Ok] is returned on completion.
  const HideContactCloseBirthdays();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  HideContactCloseBirthdays copyWith() => const HideContactCloseBirthdays();

  /// TDLib object type
  static const String defaultObjectId = 'hideContactCloseBirthdays';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
