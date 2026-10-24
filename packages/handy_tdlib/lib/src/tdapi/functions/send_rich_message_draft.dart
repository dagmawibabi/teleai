part of '../tdapi.dart';

/// **SendRichMessageDraft** *(sendRichMessageDraft)* - TDLib function
///
/// Sends a draft for a being generated rich message; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: The forum topic identifier in which the message will be sent; pass 0 if none.
/// * [draftId]: Unique identifier of the draft.
/// * [canStop]: Pass true to show the user a button to stop further drafts.
/// * [keepOnStop]: Pass true to keep the current draft when the user stops further generation.
/// * [message]: Draft of the message; file upload isn't supported.
///
/// [Ok] is returned on completion.
final class SendRichMessageDraft extends TdFunction {
  /// **SendRichMessageDraft** *(sendRichMessageDraft)* - TDLib function
  ///
  /// Sends a draft for a being generated rich message; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: The forum topic identifier in which the message will be sent; pass 0 if none.
  /// * [draftId]: Unique identifier of the draft.
  /// * [canStop]: Pass true to show the user a button to stop further drafts.
  /// * [keepOnStop]: Pass true to keep the current draft when the user stops further generation.
  /// * [message]: Draft of the message; file upload isn't supported.
  ///
  /// [Ok] is returned on completion.
  const SendRichMessageDraft({
    required this.chatId,
    required this.forumTopicId,
    required this.draftId,
    required this.canStop,
    required this.keepOnStop,
    required this.message,
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

  /// Draft of the message; file upload isn't supported
  final InputRichMessage message;

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
      "message": message.toJson(),
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
  /// * [message]: Draft of the message; file upload isn't supported
  SendRichMessageDraft copyWith({
    int? chatId,
    int? forumTopicId,
    int? draftId,
    bool? canStop,
    bool? keepOnStop,
    InputRichMessage? message,
  }) =>
      SendRichMessageDraft(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        draftId: draftId ?? this.draftId,
        canStop: canStop ?? this.canStop,
        keepOnStop: keepOnStop ?? this.keepOnStop,
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendRichMessageDraft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
