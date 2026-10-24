part of '../tdapi.dart';

/// **SetUserPrivacySettingRules** *(setUserPrivacySettingRules)* - TDLib function
///
/// Changes user privacy settings.
///
/// * [setting]: The privacy setting.
/// * [rules]: The new privacy rules.
///
/// [Ok] is returned on completion.
final class SetUserPrivacySettingRules extends TdFunction {
  /// **SetUserPrivacySettingRules** *(setUserPrivacySettingRules)* - TDLib function
  ///
  /// Changes user privacy settings.
  ///
  /// * [setting]: The privacy setting.
  /// * [rules]: The new privacy rules.
  ///
  /// [Ok] is returned on completion.
  const SetUserPrivacySettingRules({
    required this.setting,
    required this.rules,
  });

  /// The privacy setting
  final UserPrivacySetting setting;

  /// The new privacy rules
  final UserPrivacySettingRules rules;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "setting": setting.toJson(),
      "rules": rules.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [setting]: The privacy setting
  /// * [rules]: The new privacy rules
  SetUserPrivacySettingRules copyWith({
    UserPrivacySetting? setting,
    UserPrivacySettingRules? rules,
  }) =>
      SetUserPrivacySettingRules(
        setting: setting ?? this.setting,
        rules: rules ?? this.rules,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUserPrivacySettingRules';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
