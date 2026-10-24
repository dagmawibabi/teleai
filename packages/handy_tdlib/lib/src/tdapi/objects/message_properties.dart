part of '../tdapi.dart';

/// **MessageProperties** *(messageProperties)* - basic class
///
/// Contains properties of a message and describes actions that can be done with the message right now.
///
/// * [canAddOffer]: True, if an offer can be added to the message using addOffer.
/// * [canAddTasks]: True, if tasks can be added to the message's checklist using addChecklistTasks if the current user has Telegram Premium subscription.
/// * [canBeApproved]: True, if the message is a suggested post that can be approved by the user using approveSuggestedPost.
/// * [canBeCopied]: True, if content of the message can be copied using inputMessageForwarded or forwardMessages with copy options.
/// * [canBeCopiedToSecretChat]: True, if content of the message can be copied to a secret chat using inputMessageForwarded or forwardMessages with copy options.
/// * [canBeDeclined]: True, if the message is a suggested post that can be declined by the user using declineSuggestedPost.
/// * [canBeDeletedOnlyForSelf]: True, if the message can be deleted only for the current user while other users will continue to see it using the method deleteMessages with revoke == false.
/// * [canBeDeletedForAllUsers]: True, if the message can be deleted for all users using the method deleteMessages with revoke == true.
/// * [canBeEdited]: True, if the message can be edited using the methods editMessageText, editMessageCaption, or editMessageReplyMarkup.. For live location, poll, and checklist messages this field shows whether editMessageLiveLocation, stopPoll, or editMessageChecklist respectively can be used with this message.
/// * [canBeForwarded]: True, if the message can be forwarded using inputMessageForwarded or forwardMessages without copy options.
/// * [canBePaid]: True, if the message can be paid using inputInvoiceMessage.
/// * [canBePinned]: True, if the message can be pinned or unpinned in the chat using pinChatMessage or unpinChatMessage.
/// * [canBeReplied]: True, if the message can be replied in the same chat and forum topic using inputMessageReplyToMessage. Ephemeral messages can be replied only by other ephemeral messages.
/// * [canBeRepliedInAnotherChat]: True, if the message can be replied in another chat or forum topic using inputMessageReplyToExternalMessage.
/// * [canBeSaved]: True, if content of the message can be saved locally.
/// * [canBeSharedInStory]: True, if the message can be shared in a story using inputStoryAreaTypeMessage.
/// * [canDeleteReactions]: True, if the user can delete reactions of other users in the message using the method deleteMessageReactionsFromSender.
/// * [canEditMedia]: True, if the message can be edited using the method editMessageMedia.
/// * [canEditSchedulingState]: True, if scheduling state of the message can be edited.
/// * [canEditSuggestedPostInfo]: True, if another price or post send time can be suggested using addOffer.
/// * [canGetAuthor]: True, if author of the message sent on behalf of a chat can be received through getMessageAuthor.
/// * [canGetEmbeddingCode]: True, if code for message embedding can be received using getMessageEmbeddingCode.
/// * [canGetLink]: True, if a link can be generated for the message using getMessageLink.
/// * [canGetMediaTimestampLinks]: True, if media timestamp links can be generated for media timestamp entities in the message text, caption, or link preview description using getMessageLink.
/// * [canGetMessageThread]: True, if information about the message thread is available through getMessageThread and getMessageThreadHistory.
/// * [canGetPollVoteStatistics]: True, if the message is a poll and vote statistics are available through getPollVoteStatistics.
/// * [canGetReadDate]: True, if read date of the message can be received through getMessageReadDate.
/// * [canGetStatistics]: True, if message statistics are available through getMessageStatistics and message forwards can be received using getMessagePublicForwards.
/// * [canGetVideoAdvertisements]: True, if advertisements for video of the message can be received through getVideoMessageAdvertisements.
/// * [canGetViewers]: True, if chat members already viewed the message can be received through getMessageViewers.
/// * [canMarkTasksAsDone]: True, if tasks can be marked as done or not done in the message's checklist using markChecklistTasksAsDone if the current user has Telegram Premium subscription.
/// * [canRecognizeSpeech]: True, if speech can be recognized for the message through recognizeSpeech.
/// * [canReportChat]: True, if the message can be reported using reportChat.
/// * [canReportReactions]: True, if reactions on the message can be reported through reportMessageReactions.
/// * [canReportSupergroupSpam]: True, if the message can be reported using reportSupergroupSpam.
/// * [canSetFactCheck]: True, if fact check for the message can be changed through setMessageFactCheck.
/// * [customEmojiIds]: Identifiers of custom emoji used in the message.
/// * [hasProtectedContentByCurrentUser]: True, if content of the message can't be saved locally, because it is protected by the current user; if true, then can_be_saved is false.
/// * [hasProtectedContentByOtherUser]: True, if content of the message can't be saved locally, because it is protected by the other user; if true, then can_be_saved is false.
/// * [needShowStatistics]: True, if message statistics must be available from context menu of the message.
final class MessageProperties extends TdObject {
  /// **MessageProperties** *(messageProperties)* - basic class
  ///
  /// Contains properties of a message and describes actions that can be done with the message right now.
  ///
  /// * [canAddOffer]: True, if an offer can be added to the message using addOffer.
  /// * [canAddTasks]: True, if tasks can be added to the message's checklist using addChecklistTasks if the current user has Telegram Premium subscription.
  /// * [canBeApproved]: True, if the message is a suggested post that can be approved by the user using approveSuggestedPost.
  /// * [canBeCopied]: True, if content of the message can be copied using inputMessageForwarded or forwardMessages with copy options.
  /// * [canBeCopiedToSecretChat]: True, if content of the message can be copied to a secret chat using inputMessageForwarded or forwardMessages with copy options.
  /// * [canBeDeclined]: True, if the message is a suggested post that can be declined by the user using declineSuggestedPost.
  /// * [canBeDeletedOnlyForSelf]: True, if the message can be deleted only for the current user while other users will continue to see it using the method deleteMessages with revoke == false.
  /// * [canBeDeletedForAllUsers]: True, if the message can be deleted for all users using the method deleteMessages with revoke == true.
  /// * [canBeEdited]: True, if the message can be edited using the methods editMessageText, editMessageCaption, or editMessageReplyMarkup.. For live location, poll, and checklist messages this field shows whether editMessageLiveLocation, stopPoll, or editMessageChecklist respectively can be used with this message.
  /// * [canBeForwarded]: True, if the message can be forwarded using inputMessageForwarded or forwardMessages without copy options.
  /// * [canBePaid]: True, if the message can be paid using inputInvoiceMessage.
  /// * [canBePinned]: True, if the message can be pinned or unpinned in the chat using pinChatMessage or unpinChatMessage.
  /// * [canBeReplied]: True, if the message can be replied in the same chat and forum topic using inputMessageReplyToMessage. Ephemeral messages can be replied only by other ephemeral messages.
  /// * [canBeRepliedInAnotherChat]: True, if the message can be replied in another chat or forum topic using inputMessageReplyToExternalMessage.
  /// * [canBeSaved]: True, if content of the message can be saved locally.
  /// * [canBeSharedInStory]: True, if the message can be shared in a story using inputStoryAreaTypeMessage.
  /// * [canDeleteReactions]: True, if the user can delete reactions of other users in the message using the method deleteMessageReactionsFromSender.
  /// * [canEditMedia]: True, if the message can be edited using the method editMessageMedia.
  /// * [canEditSchedulingState]: True, if scheduling state of the message can be edited.
  /// * [canEditSuggestedPostInfo]: True, if another price or post send time can be suggested using addOffer.
  /// * [canGetAuthor]: True, if author of the message sent on behalf of a chat can be received through getMessageAuthor.
  /// * [canGetEmbeddingCode]: True, if code for message embedding can be received using getMessageEmbeddingCode.
  /// * [canGetLink]: True, if a link can be generated for the message using getMessageLink.
  /// * [canGetMediaTimestampLinks]: True, if media timestamp links can be generated for media timestamp entities in the message text, caption, or link preview description using getMessageLink.
  /// * [canGetMessageThread]: True, if information about the message thread is available through getMessageThread and getMessageThreadHistory.
  /// * [canGetPollVoteStatistics]: True, if the message is a poll and vote statistics are available through getPollVoteStatistics.
  /// * [canGetReadDate]: True, if read date of the message can be received through getMessageReadDate.
  /// * [canGetStatistics]: True, if message statistics are available through getMessageStatistics and message forwards can be received using getMessagePublicForwards.
  /// * [canGetVideoAdvertisements]: True, if advertisements for video of the message can be received through getVideoMessageAdvertisements.
  /// * [canGetViewers]: True, if chat members already viewed the message can be received through getMessageViewers.
  /// * [canMarkTasksAsDone]: True, if tasks can be marked as done or not done in the message's checklist using markChecklistTasksAsDone if the current user has Telegram Premium subscription.
  /// * [canRecognizeSpeech]: True, if speech can be recognized for the message through recognizeSpeech.
  /// * [canReportChat]: True, if the message can be reported using reportChat.
  /// * [canReportReactions]: True, if reactions on the message can be reported through reportMessageReactions.
  /// * [canReportSupergroupSpam]: True, if the message can be reported using reportSupergroupSpam.
  /// * [canSetFactCheck]: True, if fact check for the message can be changed through setMessageFactCheck.
  /// * [customEmojiIds]: Identifiers of custom emoji used in the message.
  /// * [hasProtectedContentByCurrentUser]: True, if content of the message can't be saved locally, because it is protected by the current user; if true, then can_be_saved is false.
  /// * [hasProtectedContentByOtherUser]: True, if content of the message can't be saved locally, because it is protected by the other user; if true, then can_be_saved is false.
  /// * [needShowStatistics]: True, if message statistics must be available from context menu of the message.
  const MessageProperties({
    required this.canAddOffer,
    required this.canAddTasks,
    required this.canBeApproved,
    required this.canBeCopied,
    required this.canBeCopiedToSecretChat,
    required this.canBeDeclined,
    required this.canBeDeletedOnlyForSelf,
    required this.canBeDeletedForAllUsers,
    required this.canBeEdited,
    required this.canBeForwarded,
    required this.canBePaid,
    required this.canBePinned,
    required this.canBeReplied,
    required this.canBeRepliedInAnotherChat,
    required this.canBeSaved,
    required this.canBeSharedInStory,
    required this.canDeleteReactions,
    required this.canEditMedia,
    required this.canEditSchedulingState,
    required this.canEditSuggestedPostInfo,
    required this.canGetAuthor,
    required this.canGetEmbeddingCode,
    required this.canGetLink,
    required this.canGetMediaTimestampLinks,
    required this.canGetMessageThread,
    required this.canGetPollVoteStatistics,
    required this.canGetReadDate,
    required this.canGetStatistics,
    required this.canGetVideoAdvertisements,
    required this.canGetViewers,
    required this.canMarkTasksAsDone,
    required this.canRecognizeSpeech,
    required this.canReportChat,
    required this.canReportReactions,
    required this.canReportSupergroupSpam,
    required this.canSetFactCheck,
    required this.customEmojiIds,
    required this.hasProtectedContentByCurrentUser,
    required this.hasProtectedContentByOtherUser,
    required this.needShowStatistics,
    this.extra,
    this.clientId,
  });

  /// True, if an offer can be added to the message using addOffer
  final bool canAddOffer;

  /// True, if tasks can be added to the message's checklist using addChecklistTasks if the current user has Telegram Premium subscription
  final bool canAddTasks;

  /// True, if the message is a suggested post that can be approved by the user using approveSuggestedPost
  final bool canBeApproved;

  /// True, if content of the message can be copied using inputMessageForwarded or forwardMessages with copy options
  final bool canBeCopied;

  /// True, if content of the message can be copied to a secret chat using inputMessageForwarded or forwardMessages with copy options
  final bool canBeCopiedToSecretChat;

  /// True, if the message is a suggested post that can be declined by the user using declineSuggestedPost
  final bool canBeDeclined;

  /// True, if the message can be deleted only for the current user while other users will continue to see it using the method deleteMessages with revoke == false
  final bool canBeDeletedOnlyForSelf;

  /// True, if the message can be deleted for all users using the method deleteMessages with revoke == true
  final bool canBeDeletedForAllUsers;

  /// True, if the message can be edited using the methods editMessageText, editMessageCaption, or editMessageReplyMarkup.. For live location, poll, and checklist messages this field shows whether editMessageLiveLocation, stopPoll, or editMessageChecklist respectively can be used with this message
  final bool canBeEdited;

  /// True, if the message can be forwarded using inputMessageForwarded or forwardMessages without copy options
  final bool canBeForwarded;

  /// True, if the message can be paid using inputInvoiceMessage
  final bool canBePaid;

  /// True, if the message can be pinned or unpinned in the chat using pinChatMessage or unpinChatMessage
  final bool canBePinned;

  /// True, if the message can be replied in the same chat and forum topic using inputMessageReplyToMessage. Ephemeral messages can be replied only by other ephemeral messages
  final bool canBeReplied;

  /// True, if the message can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
  final bool canBeRepliedInAnotherChat;

  /// True, if content of the message can be saved locally
  final bool canBeSaved;

  /// True, if the message can be shared in a story using inputStoryAreaTypeMessage
  final bool canBeSharedInStory;

  /// True, if the user can delete reactions of other users in the message using the method deleteMessageReactionsFromSender
  final bool canDeleteReactions;

  /// True, if the message can be edited using the method editMessageMedia
  final bool canEditMedia;

  /// True, if scheduling state of the message can be edited
  final bool canEditSchedulingState;

  /// True, if another price or post send time can be suggested using addOffer
  final bool canEditSuggestedPostInfo;

  /// True, if author of the message sent on behalf of a chat can be received through getMessageAuthor
  final bool canGetAuthor;

  /// True, if code for message embedding can be received using getMessageEmbeddingCode
  final bool canGetEmbeddingCode;

  /// True, if a link can be generated for the message using getMessageLink
  final bool canGetLink;

  /// True, if media timestamp links can be generated for media timestamp entities in the message text, caption, or link preview description using getMessageLink
  final bool canGetMediaTimestampLinks;

  /// True, if information about the message thread is available through getMessageThread and getMessageThreadHistory
  final bool canGetMessageThread;

  /// True, if the message is a poll and vote statistics are available through getPollVoteStatistics
  final bool canGetPollVoteStatistics;

  /// True, if read date of the message can be received through getMessageReadDate
  final bool canGetReadDate;

  /// True, if message statistics are available through getMessageStatistics and message forwards can be received using getMessagePublicForwards
  final bool canGetStatistics;

  /// True, if advertisements for video of the message can be received through getVideoMessageAdvertisements
  final bool canGetVideoAdvertisements;

  /// True, if chat members already viewed the message can be received through getMessageViewers
  final bool canGetViewers;

  /// True, if tasks can be marked as done or not done in the message's checklist using markChecklistTasksAsDone if the current user has Telegram Premium subscription
  final bool canMarkTasksAsDone;

  /// True, if speech can be recognized for the message through recognizeSpeech
  final bool canRecognizeSpeech;

  /// True, if the message can be reported using reportChat
  final bool canReportChat;

  /// True, if reactions on the message can be reported through reportMessageReactions
  final bool canReportReactions;

  /// True, if the message can be reported using reportSupergroupSpam
  final bool canReportSupergroupSpam;

  /// True, if fact check for the message can be changed through setMessageFactCheck
  final bool canSetFactCheck;

  /// Identifiers of custom emoji used in the message
  final List<int> customEmojiIds;

  /// True, if content of the message can't be saved locally, because it is protected by the current user; if true, then can_be_saved is false
  final bool hasProtectedContentByCurrentUser;

  /// True, if content of the message can't be saved locally, because it is protected by the other user; if true, then can_be_saved is false
  final bool hasProtectedContentByOtherUser;

  /// True, if message statistics must be available from context menu of the message
  final bool needShowStatistics;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory MessageProperties.fromJson(Map<String, dynamic> json) =>
      MessageProperties(
        canAddOffer: json['can_add_offer'],
        canAddTasks: json['can_add_tasks'],
        canBeApproved: json['can_be_approved'],
        canBeCopied: json['can_be_copied'],
        canBeCopiedToSecretChat: json['can_be_copied_to_secret_chat'],
        canBeDeclined: json['can_be_declined'],
        canBeDeletedOnlyForSelf: json['can_be_deleted_only_for_self'],
        canBeDeletedForAllUsers: json['can_be_deleted_for_all_users'],
        canBeEdited: json['can_be_edited'],
        canBeForwarded: json['can_be_forwarded'],
        canBePaid: json['can_be_paid'],
        canBePinned: json['can_be_pinned'],
        canBeReplied: json['can_be_replied'],
        canBeRepliedInAnotherChat: json['can_be_replied_in_another_chat'],
        canBeSaved: json['can_be_saved'],
        canBeSharedInStory: json['can_be_shared_in_story'],
        canDeleteReactions: json['can_delete_reactions'],
        canEditMedia: json['can_edit_media'],
        canEditSchedulingState: json['can_edit_scheduling_state'],
        canEditSuggestedPostInfo: json['can_edit_suggested_post_info'],
        canGetAuthor: json['can_get_author'],
        canGetEmbeddingCode: json['can_get_embedding_code'],
        canGetLink: json['can_get_link'],
        canGetMediaTimestampLinks: json['can_get_media_timestamp_links'],
        canGetMessageThread: json['can_get_message_thread'],
        canGetPollVoteStatistics: json['can_get_poll_vote_statistics'],
        canGetReadDate: json['can_get_read_date'],
        canGetStatistics: json['can_get_statistics'],
        canGetVideoAdvertisements: json['can_get_video_advertisements'],
        canGetViewers: json['can_get_viewers'],
        canMarkTasksAsDone: json['can_mark_tasks_as_done'],
        canRecognizeSpeech: json['can_recognize_speech'],
        canReportChat: json['can_report_chat'],
        canReportReactions: json['can_report_reactions'],
        canReportSupergroupSpam: json['can_report_supergroup_spam'],
        canSetFactCheck: json['can_set_fact_check'],
        customEmojiIds: List<int>.from((json['custom_emoji_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        hasProtectedContentByCurrentUser:
            json['has_protected_content_by_current_user'],
        hasProtectedContentByOtherUser:
            json['has_protected_content_by_other_user'],
        needShowStatistics: json['need_show_statistics'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_add_offer": canAddOffer,
      "can_add_tasks": canAddTasks,
      "can_be_approved": canBeApproved,
      "can_be_copied": canBeCopied,
      "can_be_copied_to_secret_chat": canBeCopiedToSecretChat,
      "can_be_declined": canBeDeclined,
      "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
      "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
      "can_be_edited": canBeEdited,
      "can_be_forwarded": canBeForwarded,
      "can_be_paid": canBePaid,
      "can_be_pinned": canBePinned,
      "can_be_replied": canBeReplied,
      "can_be_replied_in_another_chat": canBeRepliedInAnotherChat,
      "can_be_saved": canBeSaved,
      "can_be_shared_in_story": canBeSharedInStory,
      "can_delete_reactions": canDeleteReactions,
      "can_edit_media": canEditMedia,
      "can_edit_scheduling_state": canEditSchedulingState,
      "can_edit_suggested_post_info": canEditSuggestedPostInfo,
      "can_get_author": canGetAuthor,
      "can_get_embedding_code": canGetEmbeddingCode,
      "can_get_link": canGetLink,
      "can_get_media_timestamp_links": canGetMediaTimestampLinks,
      "can_get_message_thread": canGetMessageThread,
      "can_get_poll_vote_statistics": canGetPollVoteStatistics,
      "can_get_read_date": canGetReadDate,
      "can_get_statistics": canGetStatistics,
      "can_get_video_advertisements": canGetVideoAdvertisements,
      "can_get_viewers": canGetViewers,
      "can_mark_tasks_as_done": canMarkTasksAsDone,
      "can_recognize_speech": canRecognizeSpeech,
      "can_report_chat": canReportChat,
      "can_report_reactions": canReportReactions,
      "can_report_supergroup_spam": canReportSupergroupSpam,
      "can_set_fact_check": canSetFactCheck,
      "custom_emoji_ids": customEmojiIds.map((i) => i).toList(),
      "has_protected_content_by_current_user": hasProtectedContentByCurrentUser,
      "has_protected_content_by_other_user": hasProtectedContentByOtherUser,
      "need_show_statistics": needShowStatistics,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_add_offer]: True, if an offer can be added to the message using addOffer
  /// * [can_add_tasks]: True, if tasks can be added to the message's checklist using addChecklistTasks if the current user has Telegram Premium subscription
  /// * [can_be_approved]: True, if the message is a suggested post that can be approved by the user using approveSuggestedPost
  /// * [can_be_copied]: True, if content of the message can be copied using inputMessageForwarded or forwardMessages with copy options
  /// * [can_be_copied_to_secret_chat]: True, if content of the message can be copied to a secret chat using inputMessageForwarded or forwardMessages with copy options
  /// * [can_be_declined]: True, if the message is a suggested post that can be declined by the user using declineSuggestedPost
  /// * [can_be_deleted_only_for_self]: True, if the message can be deleted only for the current user while other users will continue to see it using the method deleteMessages with revoke == false
  /// * [can_be_deleted_for_all_users]: True, if the message can be deleted for all users using the method deleteMessages with revoke == true
  /// * [can_be_edited]: True, if the message can be edited using the methods editMessageText, editMessageCaption, or editMessageReplyMarkup.. For live location, poll, and checklist messages this field shows whether editMessageLiveLocation, stopPoll, or editMessageChecklist respectively can be used with this message
  /// * [can_be_forwarded]: True, if the message can be forwarded using inputMessageForwarded or forwardMessages without copy options
  /// * [can_be_paid]: True, if the message can be paid using inputInvoiceMessage
  /// * [can_be_pinned]: True, if the message can be pinned or unpinned in the chat using pinChatMessage or unpinChatMessage
  /// * [can_be_replied]: True, if the message can be replied in the same chat and forum topic using inputMessageReplyToMessage. Ephemeral messages can be replied only by other ephemeral messages
  /// * [can_be_replied_in_another_chat]: True, if the message can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
  /// * [can_be_saved]: True, if content of the message can be saved locally
  /// * [can_be_shared_in_story]: True, if the message can be shared in a story using inputStoryAreaTypeMessage
  /// * [can_delete_reactions]: True, if the user can delete reactions of other users in the message using the method deleteMessageReactionsFromSender
  /// * [can_edit_media]: True, if the message can be edited using the method editMessageMedia
  /// * [can_edit_scheduling_state]: True, if scheduling state of the message can be edited
  /// * [can_edit_suggested_post_info]: True, if another price or post send time can be suggested using addOffer
  /// * [can_get_author]: True, if author of the message sent on behalf of a chat can be received through getMessageAuthor
  /// * [can_get_embedding_code]: True, if code for message embedding can be received using getMessageEmbeddingCode
  /// * [can_get_link]: True, if a link can be generated for the message using getMessageLink
  /// * [can_get_media_timestamp_links]: True, if media timestamp links can be generated for media timestamp entities in the message text, caption, or link preview description using getMessageLink
  /// * [can_get_message_thread]: True, if information about the message thread is available through getMessageThread and getMessageThreadHistory
  /// * [can_get_poll_vote_statistics]: True, if the message is a poll and vote statistics are available through getPollVoteStatistics
  /// * [can_get_read_date]: True, if read date of the message can be received through getMessageReadDate
  /// * [can_get_statistics]: True, if message statistics are available through getMessageStatistics and message forwards can be received using getMessagePublicForwards
  /// * [can_get_video_advertisements]: True, if advertisements for video of the message can be received through getVideoMessageAdvertisements
  /// * [can_get_viewers]: True, if chat members already viewed the message can be received through getMessageViewers
  /// * [can_mark_tasks_as_done]: True, if tasks can be marked as done or not done in the message's checklist using markChecklistTasksAsDone if the current user has Telegram Premium subscription
  /// * [can_recognize_speech]: True, if speech can be recognized for the message through recognizeSpeech
  /// * [can_report_chat]: True, if the message can be reported using reportChat
  /// * [can_report_reactions]: True, if reactions on the message can be reported through reportMessageReactions
  /// * [can_report_supergroup_spam]: True, if the message can be reported using reportSupergroupSpam
  /// * [can_set_fact_check]: True, if fact check for the message can be changed through setMessageFactCheck
  /// * [custom_emoji_ids]: Identifiers of custom emoji used in the message
  /// * [has_protected_content_by_current_user]: True, if content of the message can't be saved locally, because it is protected by the current user; if true, then can_be_saved is false
  /// * [has_protected_content_by_other_user]: True, if content of the message can't be saved locally, because it is protected by the other user; if true, then can_be_saved is false
  /// * [need_show_statistics]: True, if message statistics must be available from context menu of the message
  MessageProperties copyWith({
    bool? canAddOffer,
    bool? canAddTasks,
    bool? canBeApproved,
    bool? canBeCopied,
    bool? canBeCopiedToSecretChat,
    bool? canBeDeclined,
    bool? canBeDeletedOnlyForSelf,
    bool? canBeDeletedForAllUsers,
    bool? canBeEdited,
    bool? canBeForwarded,
    bool? canBePaid,
    bool? canBePinned,
    bool? canBeReplied,
    bool? canBeRepliedInAnotherChat,
    bool? canBeSaved,
    bool? canBeSharedInStory,
    bool? canDeleteReactions,
    bool? canEditMedia,
    bool? canEditSchedulingState,
    bool? canEditSuggestedPostInfo,
    bool? canGetAuthor,
    bool? canGetEmbeddingCode,
    bool? canGetLink,
    bool? canGetMediaTimestampLinks,
    bool? canGetMessageThread,
    bool? canGetPollVoteStatistics,
    bool? canGetReadDate,
    bool? canGetStatistics,
    bool? canGetVideoAdvertisements,
    bool? canGetViewers,
    bool? canMarkTasksAsDone,
    bool? canRecognizeSpeech,
    bool? canReportChat,
    bool? canReportReactions,
    bool? canReportSupergroupSpam,
    bool? canSetFactCheck,
    List<int>? customEmojiIds,
    bool? hasProtectedContentByCurrentUser,
    bool? hasProtectedContentByOtherUser,
    bool? needShowStatistics,
    dynamic extra,
    int? clientId,
  }) =>
      MessageProperties(
        canAddOffer: canAddOffer ?? this.canAddOffer,
        canAddTasks: canAddTasks ?? this.canAddTasks,
        canBeApproved: canBeApproved ?? this.canBeApproved,
        canBeCopied: canBeCopied ?? this.canBeCopied,
        canBeCopiedToSecretChat:
            canBeCopiedToSecretChat ?? this.canBeCopiedToSecretChat,
        canBeDeclined: canBeDeclined ?? this.canBeDeclined,
        canBeDeletedOnlyForSelf:
            canBeDeletedOnlyForSelf ?? this.canBeDeletedOnlyForSelf,
        canBeDeletedForAllUsers:
            canBeDeletedForAllUsers ?? this.canBeDeletedForAllUsers,
        canBeEdited: canBeEdited ?? this.canBeEdited,
        canBeForwarded: canBeForwarded ?? this.canBeForwarded,
        canBePaid: canBePaid ?? this.canBePaid,
        canBePinned: canBePinned ?? this.canBePinned,
        canBeReplied: canBeReplied ?? this.canBeReplied,
        canBeRepliedInAnotherChat:
            canBeRepliedInAnotherChat ?? this.canBeRepliedInAnotherChat,
        canBeSaved: canBeSaved ?? this.canBeSaved,
        canBeSharedInStory: canBeSharedInStory ?? this.canBeSharedInStory,
        canDeleteReactions: canDeleteReactions ?? this.canDeleteReactions,
        canEditMedia: canEditMedia ?? this.canEditMedia,
        canEditSchedulingState:
            canEditSchedulingState ?? this.canEditSchedulingState,
        canEditSuggestedPostInfo:
            canEditSuggestedPostInfo ?? this.canEditSuggestedPostInfo,
        canGetAuthor: canGetAuthor ?? this.canGetAuthor,
        canGetEmbeddingCode: canGetEmbeddingCode ?? this.canGetEmbeddingCode,
        canGetLink: canGetLink ?? this.canGetLink,
        canGetMediaTimestampLinks:
            canGetMediaTimestampLinks ?? this.canGetMediaTimestampLinks,
        canGetMessageThread: canGetMessageThread ?? this.canGetMessageThread,
        canGetPollVoteStatistics:
            canGetPollVoteStatistics ?? this.canGetPollVoteStatistics,
        canGetReadDate: canGetReadDate ?? this.canGetReadDate,
        canGetStatistics: canGetStatistics ?? this.canGetStatistics,
        canGetVideoAdvertisements:
            canGetVideoAdvertisements ?? this.canGetVideoAdvertisements,
        canGetViewers: canGetViewers ?? this.canGetViewers,
        canMarkTasksAsDone: canMarkTasksAsDone ?? this.canMarkTasksAsDone,
        canRecognizeSpeech: canRecognizeSpeech ?? this.canRecognizeSpeech,
        canReportChat: canReportChat ?? this.canReportChat,
        canReportReactions: canReportReactions ?? this.canReportReactions,
        canReportSupergroupSpam:
            canReportSupergroupSpam ?? this.canReportSupergroupSpam,
        canSetFactCheck: canSetFactCheck ?? this.canSetFactCheck,
        customEmojiIds: customEmojiIds ?? this.customEmojiIds,
        hasProtectedContentByCurrentUser: hasProtectedContentByCurrentUser ??
            this.hasProtectedContentByCurrentUser,
        hasProtectedContentByOtherUser: hasProtectedContentByOtherUser ??
            this.hasProtectedContentByOtherUser,
        needShowStatistics: needShowStatistics ?? this.needShowStatistics,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageProperties';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
