part of '../tdapi.dart';

/// **GetForumTopicDefaultIcons** *(getForumTopicDefaultIcons)* - TDLib function
///
/// Returns the list of custom emoji, which can be used as forum topic icon by all users.
///
/// [Stickers] is returned on completion.
final class GetForumTopicDefaultIcons extends TdFunction {
  /// **GetForumTopicDefaultIcons** *(getForumTopicDefaultIcons)* - TDLib function
  ///
  /// Returns the list of custom emoji, which can be used as forum topic icon by all users.
  ///
  /// [Stickers] is returned on completion.
  const GetForumTopicDefaultIcons();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetForumTopicDefaultIcons copyWith() => const GetForumTopicDefaultIcons();

  /// TDLib object type
  static const String defaultObjectId = 'getForumTopicDefaultIcons';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
