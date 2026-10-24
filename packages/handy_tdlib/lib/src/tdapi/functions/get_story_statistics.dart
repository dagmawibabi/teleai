part of '../tdapi.dart';

/// **GetStoryStatistics** *(getStoryStatistics)* - TDLib function
///
/// Returns detailed statistics about a story. Can be used only if story.can_get_statistics == true.
///
/// * [chatId]: Chat identifier.
/// * [storyId]: Story identifier.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [StoryStatistics] is returned on completion.
final class GetStoryStatistics extends TdFunction {
  /// **GetStoryStatistics** *(getStoryStatistics)* - TDLib function
  ///
  /// Returns detailed statistics about a story. Can be used only if story.can_get_statistics == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [storyId]: Story identifier.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [StoryStatistics] is returned on completion.
  const GetStoryStatistics({
    required this.chatId,
    required this.storyId,
    required this.isDark,
  });

  /// Chat identifier
  final int chatId;

  /// Story identifier
  final int storyId;

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_id": storyId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [story_id]: Story identifier
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetStoryStatistics copyWith({
    int? chatId,
    int? storyId,
    bool? isDark,
  }) =>
      GetStoryStatistics(
        chatId: chatId ?? this.chatId,
        storyId: storyId ?? this.storyId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStoryStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
