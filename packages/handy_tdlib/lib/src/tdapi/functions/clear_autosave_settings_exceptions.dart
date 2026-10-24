part of '../tdapi.dart';

/// **ClearAutosaveSettingsExceptions** *(clearAutosaveSettingsExceptions)* - TDLib function
///
/// Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings.
///
/// [Ok] is returned on completion.
final class ClearAutosaveSettingsExceptions extends TdFunction {
  /// **ClearAutosaveSettingsExceptions** *(clearAutosaveSettingsExceptions)* - TDLib function
  ///
  /// Clears the list of all autosave settings exceptions. The method is guaranteed to work only after at least one call to getAutosaveSettings.
  ///
  /// [Ok] is returned on completion.
  const ClearAutosaveSettingsExceptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ClearAutosaveSettingsExceptions copyWith() =>
      const ClearAutosaveSettingsExceptions();

  /// TDLib object type
  static const String defaultObjectId = 'clearAutosaveSettingsExceptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
