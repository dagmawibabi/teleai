part of '../tdapi.dart';

/// **GetAutosaveSettings** *(getAutosaveSettings)* - TDLib function
///
/// Returns autosave settings for the current user.
///
/// [AutosaveSettings] is returned on completion.
final class GetAutosaveSettings extends TdFunction {
  /// **GetAutosaveSettings** *(getAutosaveSettings)* - TDLib function
  ///
  /// Returns autosave settings for the current user.
  ///
  /// [AutosaveSettings] is returned on completion.
  const GetAutosaveSettings();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetAutosaveSettings copyWith() => const GetAutosaveSettings();

  /// TDLib object type
  static const String defaultObjectId = 'getAutosaveSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
