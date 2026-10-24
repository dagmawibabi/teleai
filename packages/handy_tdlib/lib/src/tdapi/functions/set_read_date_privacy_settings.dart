part of '../tdapi.dart';

/// **SetReadDatePrivacySettings** *(setReadDatePrivacySettings)* - TDLib function
///
/// Changes privacy settings for message read date.
///
/// * [settings]: New settings.
///
/// [Ok] is returned on completion.
final class SetReadDatePrivacySettings extends TdFunction {
  /// **SetReadDatePrivacySettings** *(setReadDatePrivacySettings)* - TDLib function
  ///
  /// Changes privacy settings for message read date.
  ///
  /// * [settings]: New settings.
  ///
  /// [Ok] is returned on completion.
  const SetReadDatePrivacySettings({
    required this.settings,
  });

  /// New settings
  final ReadDatePrivacySettings settings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "settings": settings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [settings]: New settings
  SetReadDatePrivacySettings copyWith({
    ReadDatePrivacySettings? settings,
  }) =>
      SetReadDatePrivacySettings(
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setReadDatePrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
