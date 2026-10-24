part of '../tdapi.dart';

/// **SetStoryPrivacySettings** *(setStoryPrivacySettings)* - TDLib function
///
/// Changes privacy settings of a story. The method can be called only for stories posted on behalf of the current user and if story.can_set_privacy_settings == true.
///
/// * [storyId]: Identifier of the story.
/// * [privacySettings]: The new privacy settings for the story.
///
/// [Ok] is returned on completion.
final class SetStoryPrivacySettings extends TdFunction {
  /// **SetStoryPrivacySettings** *(setStoryPrivacySettings)* - TDLib function
  ///
  /// Changes privacy settings of a story. The method can be called only for stories posted on behalf of the current user and if story.can_set_privacy_settings == true.
  ///
  /// * [storyId]: Identifier of the story.
  /// * [privacySettings]: The new privacy settings for the story.
  ///
  /// [Ok] is returned on completion.
  const SetStoryPrivacySettings({
    required this.storyId,
    required this.privacySettings,
  });

  /// Identifier of the story
  final int storyId;

  /// The new privacy settings for the story
  final StoryPrivacySettings privacySettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_id": storyId,
      "privacy_settings": privacySettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_id]: Identifier of the story
  /// * [privacy_settings]: The new privacy settings for the story
  SetStoryPrivacySettings copyWith({
    int? storyId,
    StoryPrivacySettings? privacySettings,
  }) =>
      SetStoryPrivacySettings(
        storyId: storyId ?? this.storyId,
        privacySettings: privacySettings ?? this.privacySettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStoryPrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
