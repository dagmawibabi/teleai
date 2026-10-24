part of '../tdapi.dart';

/// **ResetInstalledBackgrounds** *(resetInstalledBackgrounds)* - TDLib function
///
/// Resets list of installed backgrounds to its default value.
///
/// [Ok] is returned on completion.
final class ResetInstalledBackgrounds extends TdFunction {
  /// **ResetInstalledBackgrounds** *(resetInstalledBackgrounds)* - TDLib function
  ///
  /// Resets list of installed backgrounds to its default value.
  ///
  /// [Ok] is returned on completion.
  const ResetInstalledBackgrounds();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResetInstalledBackgrounds copyWith() => const ResetInstalledBackgrounds();

  /// TDLib object type
  static const String defaultObjectId = 'resetInstalledBackgrounds';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
