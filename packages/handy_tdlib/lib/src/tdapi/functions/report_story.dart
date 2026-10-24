part of '../tdapi.dart';

/// **ReportStory** *(reportStory)* - TDLib function
///
/// Reports a story to the Telegram moderators.
///
/// * [storyPosterChatId]: The identifier of the poster of the story to report.
/// * [storyId]: The identifier of the story to report.
/// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
/// * [text]: Additional report details; 0-1024 characters; leave empty for the initial request.
///
/// [ReportStoryResult] is returned on completion.
final class ReportStory extends TdFunction {
  /// **ReportStory** *(reportStory)* - TDLib function
  ///
  /// Reports a story to the Telegram moderators.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story to report.
  /// * [storyId]: The identifier of the story to report.
  /// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
  /// * [text]: Additional report details; 0-1024 characters; leave empty for the initial request.
  ///
  /// [ReportStoryResult] is returned on completion.
  const ReportStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.optionId,
    required this.text,
  });

  /// The identifier of the poster of the story to report
  final int storyPosterChatId;

  /// The identifier of the story to report
  final int storyId;

  /// Option identifier chosen by the user; leave empty for the initial request
  final String optionId;

  /// Additional report details; 0-1024 characters; leave empty for the initial request
  final String text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "option_id": optionId,
      "text": text,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story to report
  /// * [story_id]: The identifier of the story to report
  /// * [option_id]: Option identifier chosen by the user; leave empty for the initial request
  /// * [text]: Additional report details; 0-1024 characters; leave empty for the initial request
  ReportStory copyWith({
    int? storyPosterChatId,
    int? storyId,
    String? optionId,
    String? text,
  }) =>
      ReportStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        optionId: optionId ?? this.optionId,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
