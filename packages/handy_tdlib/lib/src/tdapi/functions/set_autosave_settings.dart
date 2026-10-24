part of '../tdapi.dart';

/// **SetAutosaveSettings** *(setAutosaveSettings)* - TDLib function
///
/// Sets autosave settings for the given scope. The method is guaranteed to work only after at least one call to getAutosaveSettings.
///
/// * [scope]: Autosave settings scope.
/// * [settings]: New autosave settings for the scope; pass null to set autosave settings to default *(optional)*.
///
/// [Ok] is returned on completion.
final class SetAutosaveSettings extends TdFunction {
  /// **SetAutosaveSettings** *(setAutosaveSettings)* - TDLib function
  ///
  /// Sets autosave settings for the given scope. The method is guaranteed to work only after at least one call to getAutosaveSettings.
  ///
  /// * [scope]: Autosave settings scope.
  /// * [settings]: New autosave settings for the scope; pass null to set autosave settings to default *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetAutosaveSettings({
    required this.scope,
    this.settings,
  });

  /// Autosave settings scope
  final AutosaveSettingsScope scope;

  /// New autosave settings for the scope; pass null to set autosave settings to default
  final ScopeAutosaveSettings? settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "scope": scope.toJson(),
      "settings": settings?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: Autosave settings scope
  /// * [settings]: New autosave settings for the scope; pass null to set autosave settings to default
  SetAutosaveSettings copyWith({
    AutosaveSettingsScope? scope,
    ScopeAutosaveSettings? settings,
  }) =>
      SetAutosaveSettings(
        scope: scope ?? this.scope,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAutosaveSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
