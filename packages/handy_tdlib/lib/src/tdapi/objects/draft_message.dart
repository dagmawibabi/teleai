part of '../tdapi.dart';

/// **DraftMessage** *(draftMessage)* - basic class
///
/// Contains information about a message draft.
///
/// * [replyTo]: Information about the message to be replied; inputMessageReplyToStory is unsupported; may be null if none *(optional)*.
/// * [date]: Point in time (Unix timestamp) when the draft was created.
/// * [content]: Content of the message draft.
/// * [effectId]: Identifier of the effect to apply to the message when it is sent; 0 if none.
/// * [suggestedPostInfo]: Information about the suggested post; may be null if none *(optional)*.
final class DraftMessage extends TdObject {
  /// **DraftMessage** *(draftMessage)* - basic class
  ///
  /// Contains information about a message draft.
  ///
  /// * [replyTo]: Information about the message to be replied; inputMessageReplyToStory is unsupported; may be null if none *(optional)*.
  /// * [date]: Point in time (Unix timestamp) when the draft was created.
  /// * [content]: Content of the message draft.
  /// * [effectId]: Identifier of the effect to apply to the message when it is sent; 0 if none.
  /// * [suggestedPostInfo]: Information about the suggested post; may be null if none *(optional)*.
  const DraftMessage({
    this.replyTo,
    required this.date,
    required this.content,
    required this.effectId,
    this.suggestedPostInfo,
  });

  /// Information about the message to be replied; inputMessageReplyToStory is unsupported; may be null if none
  final InputMessageReplyTo? replyTo;

  /// Point in time (Unix timestamp) when the draft was created
  final int date;

  /// Content of the message draft
  final DraftMessageContent content;

  /// Identifier of the effect to apply to the message when it is sent; 0 if none
  final int effectId;

  /// Information about the suggested post; may be null if none
  final InputSuggestedPostInfo? suggestedPostInfo;

  /// Parse from a json
  factory DraftMessage.fromJson(Map<String, dynamic> json) => DraftMessage(
        replyTo: json['reply_to'] == null
            ? null
            : InputMessageReplyTo.fromJson(json['reply_to']),
        date: json['date'],
        content: DraftMessageContent.fromJson(json['content']),
        effectId: json['effect_id'] is int
            ? json['effect_id']
            : int.tryParse(json['effect_id'] ?? "") ?? 0,
        suggestedPostInfo: json['suggested_post_info'] == null
            ? null
            : InputSuggestedPostInfo.fromJson(json['suggested_post_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reply_to": replyTo?.toJson(),
      "date": date,
      "content": content.toJson(),
      "effect_id": effectId,
      "suggested_post_info": suggestedPostInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reply_to]: Information about the message to be replied; inputMessageReplyToStory is unsupported; may be null if none
  /// * [date]: Point in time (Unix timestamp) when the draft was created
  /// * [content]: Content of the message draft
  /// * [effect_id]: Identifier of the effect to apply to the message when it is sent; 0 if none
  /// * [suggested_post_info]: Information about the suggested post; may be null if none
  DraftMessage copyWith({
    InputMessageReplyTo? replyTo,
    int? date,
    DraftMessageContent? content,
    int? effectId,
    InputSuggestedPostInfo? suggestedPostInfo,
  }) =>
      DraftMessage(
        replyTo: replyTo ?? this.replyTo,
        date: date ?? this.date,
        content: content ?? this.content,
        effectId: effectId ?? this.effectId,
        suggestedPostInfo: suggestedPostInfo ?? this.suggestedPostInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'draftMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
