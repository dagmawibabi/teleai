part of '../tdapi.dart';

/// **ActivateStoryStealthMode** *(activateStoryStealthMode)* - TDLib function
///
/// Activates stealth mode for stories, which hides all views of stories from the current user in the last "story_stealth_mode_past_period" seconds. and for the next "story_stealth_mode_future_period" seconds; for Telegram Premium users only.
///
/// [Ok] is returned on completion.
final class ActivateStoryStealthMode extends TdFunction {
  /// **ActivateStoryStealthMode** *(activateStoryStealthMode)* - TDLib function
  ///
  /// Activates stealth mode for stories, which hides all views of stories from the current user in the last "story_stealth_mode_past_period" seconds. and for the next "story_stealth_mode_future_period" seconds; for Telegram Premium users only.
  ///
  /// [Ok] is returned on completion.
  const ActivateStoryStealthMode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ActivateStoryStealthMode copyWith() => const ActivateStoryStealthMode();

  /// TDLib object type
  static const String defaultObjectId = 'activateStoryStealthMode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
