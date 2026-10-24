part of '../tdapi.dart';

/// **SetAutoDownloadSettings** *(setAutoDownloadSettings)* - TDLib function
///
/// Sets auto-download settings.
///
/// * [settings]: New user auto-download settings.
/// * [type]: Type of the network for which the new settings are relevant.
///
/// [Ok] is returned on completion.
final class SetAutoDownloadSettings extends TdFunction {
  /// **SetAutoDownloadSettings** *(setAutoDownloadSettings)* - TDLib function
  ///
  /// Sets auto-download settings.
  ///
  /// * [settings]: New user auto-download settings.
  /// * [type]: Type of the network for which the new settings are relevant.
  ///
  /// [Ok] is returned on completion.
  const SetAutoDownloadSettings({
    required this.settings,
    required this.type,
  });

  /// New user auto-download settings
  final AutoDownloadSettings settings;

  /// Type of the network for which the new settings are relevant
  final NetworkType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "settings": settings.toJson(),
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [settings]: New user auto-download settings
  /// * [type]: Type of the network for which the new settings are relevant
  SetAutoDownloadSettings copyWith({
    AutoDownloadSettings? settings,
    NetworkType? type,
  }) =>
      SetAutoDownloadSettings(
        settings: settings ?? this.settings,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAutoDownloadSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
