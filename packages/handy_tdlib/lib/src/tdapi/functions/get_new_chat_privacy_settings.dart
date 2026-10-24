part of '../tdapi.dart';

/// **GetNewChatPrivacySettings** *(getNewChatPrivacySettings)* - TDLib function
///
/// Returns privacy settings for new chat creation.
///
/// [NewChatPrivacySettings] is returned on completion.
final class GetNewChatPrivacySettings extends TdFunction {
  /// **GetNewChatPrivacySettings** *(getNewChatPrivacySettings)* - TDLib function
  ///
  /// Returns privacy settings for new chat creation.
  ///
  /// [NewChatPrivacySettings] is returned on completion.
  const GetNewChatPrivacySettings();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetNewChatPrivacySettings copyWith() => const GetNewChatPrivacySettings();

  /// TDLib object type
  static const String defaultObjectId = 'getNewChatPrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
