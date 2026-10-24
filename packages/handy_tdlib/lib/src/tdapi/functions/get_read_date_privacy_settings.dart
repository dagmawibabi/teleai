part of '../tdapi.dart';

/// **GetReadDatePrivacySettings** *(getReadDatePrivacySettings)* - TDLib function
///
/// Returns privacy settings for message read date.
///
/// [ReadDatePrivacySettings] is returned on completion.
final class GetReadDatePrivacySettings extends TdFunction {
  /// **GetReadDatePrivacySettings** *(getReadDatePrivacySettings)* - TDLib function
  ///
  /// Returns privacy settings for message read date.
  ///
  /// [ReadDatePrivacySettings] is returned on completion.
  const GetReadDatePrivacySettings();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetReadDatePrivacySettings copyWith() => const GetReadDatePrivacySettings();

  /// TDLib object type
  static const String defaultObjectId = 'getReadDatePrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
