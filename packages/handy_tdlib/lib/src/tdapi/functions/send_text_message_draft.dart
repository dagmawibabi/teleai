part of '../tdapi.dart';

/// **SendTextMessageDraft** *(sendTextMessageDraft)* - TDLib function
///
/// Sends a draft for a being generated text message; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: The forum topic identifier in which the message will be sent; pass 0 if none.
/// * [draftId]: Unique identifier of the draft.
/// * [canStop]: Pass true to show the user a button to stop further drafts.
/// * [keepOnStop]: Pass true to keep the current draft when the user stops further generation.
/// * [text]: Draft text of the message; pass null to show a "Thinking..." placeholder *(optional)*.
///
/// [Ok] is returned on completion.
final class SendTextMessageDraft extends TdFunction {
  /// **SendTextMessageDraft** *(sendTextMessageDraft)* - TDLib function
  ///
  /// Sends a draft for a being generated text message; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: The forum topic identifier in which the message will be sent; pass 0 if none.
  /// * [draftId]: Unique identifier of the draft.
  /// * [canStop]: Pass true to show the user a button to stop further drafts.
  /// * [keepOnStop]: Pass true to keep the current draft when the user stops further generation.
  /// * [text]: Draft text of the message; pass null to show a "Thinking..." placeholder *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SendTextMessageDraft({
    required this.chatId,
    required this.forumTopicId,
    required this.draftId,
    required this.canStop,
    required this.keepOnStop,
    this.text,
  });

  /// Chat identifier
  final int chatId;

  /// The forum topic identifier in which the message will be sent; pass 0 if none
  final int forumTopicId;

  /// Unique identifier of the draft
  final int draftId;

  /// Pass true to show the user a button to stop further drafts
  final bool canStop;

  /// Pass true to keep the current draft when the user stops further generation
  final bool keepOnStop;

  /// Draft text of the message; pass null to show a "Thinking..." placeholder
  final FormattedText? text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "draft_id": draftId,
      "can_stop": canStop,
      "keep_on_stop": keepOnStop,
      "text": text?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: The forum topic identifier in which the message will be sent; pass 0 if none
  /// * [draft_id]: Unique identifier of the draft
  /// * [can_stop]: Pass true to show the user a button to stop further drafts
  /// * [keep_on_stop]: Pass true to keep the current draft when the user stops further generation
  /// * [text]: Draft text of the message; pass null to show a "Thinking..." placeholder
  SendTextMessageDraft copyWith({
    int? chatId,
    int? forumTopicId,
    int? draftId,
    bool? canStop,
    bool? keepOnStop,
    FormattedText? text,
  }) =>
      SendTextMessageDraft(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        draftId: draftId ?? this.draftId,
        canStop: canStop ?? this.canStop,
        keepOnStop: keepOnStop ?? this.keepOnStop,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendTextMessageDraft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
