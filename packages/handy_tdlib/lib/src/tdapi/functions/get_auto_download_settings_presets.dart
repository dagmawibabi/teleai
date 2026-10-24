part of '../tdapi.dart';

/// **GetAutoDownloadSettingsPresets** *(getAutoDownloadSettingsPresets)* - TDLib function
///
/// Returns auto-download settings presets for the current user.
///
/// [AutoDownloadSettingsPresets] is returned on completion.
final class GetAutoDownloadSettingsPresets extends TdFunction {
  /// **GetAutoDownloadSettingsPresets** *(getAutoDownloadSettingsPresets)* - TDLib function
  ///
  /// Returns auto-download settings presets for the current user.
  ///
  /// [AutoDownloadSettingsPresets] is returned on completion.
  const GetAutoDownloadSettingsPresets();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAutoDownloadSettingsPresets copyWith() =>
      const GetAutoDownloadSettingsPresets();

  /// TDLib object type
  static const String defaultObjectId = 'getAutoDownloadSettingsPresets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
