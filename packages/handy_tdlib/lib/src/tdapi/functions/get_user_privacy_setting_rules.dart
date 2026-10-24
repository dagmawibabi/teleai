part of '../tdapi.dart';

/// **GetUserPrivacySettingRules** *(getUserPrivacySettingRules)* - TDLib function
///
/// Returns the current privacy settings.
///
/// * [setting]: The privacy setting.
///
/// [UserPrivacySettingRules] is returned on completion.
final class GetUserPrivacySettingRules extends TdFunction {
  /// **GetUserPrivacySettingRules** *(getUserPrivacySettingRules)* - TDLib function
  ///
  /// Returns the current privacy settings.
  ///
  /// * [setting]: The privacy setting.
  ///
  /// [UserPrivacySettingRules] is returned on completion.
  const GetUserPrivacySettingRules({
    required this.setting,
  });

  /// The privacy setting
  final UserPrivacySetting setting;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "setting": setting.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [setting]: The privacy setting
  GetUserPrivacySettingRules copyWith({
    UserPrivacySetting? setting,
  }) =>
      GetUserPrivacySettingRules(
        setting: setting ?? this.setting,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserPrivacySettingRules';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
