part of '../tdapi.dart';

/// **Update** *(update)* - parent
///
/// Contains notifications about data changes.
sealed class Update extends TdObject {
  /// **Update** *(update)* - parent
  ///
  /// Contains notifications about data changes.
  const Update();

  /// a Update return type can be :
  /// * [UpdateAuthorizationState]
  /// * [UpdateNewMessage]
  /// * [UpdateMessageSendAcknowledged]
  /// * [UpdateMessageSendSucceeded]
  /// * [UpdateMessageSendFailed]
  /// * [UpdateMessageContent]
  /// * [UpdateMessageEphemeralContent]
  /// * [UpdateMessageEdited]
  /// * [UpdateMessageIsPinned]
  /// * [UpdateMessageInteractionInfo]
  /// * [UpdateMessageContentOpened]
  /// * [UpdateMessageMentionRead]
  /// * [UpdateMessageUnreadReactions]
  /// * [UpdateMessageContainsUnreadPollVotes]
  /// * [UpdateMessageFactCheck]
  /// * [UpdateMessageSuggestedPostInfo]
  /// * [UpdateMessageLiveLocationViewed]
  /// * [UpdateVideoPublished]
  /// * [UpdateNewChat]
  /// * [UpdateChatTitle]
  /// * [UpdateChatPhoto]
  /// * [UpdateChatAccentColors]
  /// * [UpdateChatPermissions]
  /// * [UpdateChatLastMessage]
  /// * [UpdateChatPosition]
  /// * [UpdateChatAddedToList]
  /// * [UpdateChatRemovedFromList]
  /// * [UpdateChatReadInbox]
  /// * [UpdateChatReadOutbox]
  /// * [UpdateChatActionBar]
  /// * [UpdateChatBusinessBotManageBar]
  /// * [UpdateChatAvailableReactions]
  /// * [UpdateChatDraftMessage]
  /// * [UpdateChatEmojiStatus]
  /// * [UpdateChatMessageSender]
  /// * [UpdateChatMessageAutoDeleteTime]
  /// * [UpdateChatNotificationSettings]
  /// * [UpdateChatPendingJoinRequests]
  /// * [UpdateChatReplyMarkup]
  /// * [UpdateChatBackground]
  /// * [UpdateChatTheme]
  /// * [UpdateChatUnreadMentionCount]
  /// * [UpdateChatUnreadReactionCount]
  /// * [UpdateChatUnreadPollVoteCount]
  /// * [UpdateChatVideoChat]
  /// * [UpdateChatDefaultDisableNotification]
  /// * [UpdateChatHasProtectedContent]
  /// * [UpdateChatIsTranslatable]
  /// * [UpdateChatIsMarkedAsUnread]
  /// * [UpdateChatViewAsTopics]
  /// * [UpdateChatBlockList]
  /// * [UpdateChatHasScheduledMessages]
  /// * [UpdateChatHasWelcomeMessages]
  /// * [UpdateChatFolders]
  /// * [UpdateChatOnlineMemberCount]
  /// * [UpdateSavedMessagesTopic]
  /// * [UpdateSavedMessagesTopicCount]
  /// * [UpdateDirectMessagesChatTopic]
  /// * [UpdateTopicMessageCount]
  /// * [UpdateQuickReplyShortcut]
  /// * [UpdateQuickReplyShortcutDeleted]
  /// * [UpdateQuickReplyShortcuts]
  /// * [UpdateQuickReplyShortcutMessages]
  /// * [UpdateChatWelcomeMessages]
  /// * [UpdateForumTopicInfo]
  /// * [UpdateForumTopic]
  /// * [UpdateScopeNotificationSettings]
  /// * [UpdateReactionNotificationSettings]
  /// * [UpdateNotification]
  /// * [UpdateNotificationGroup]
  /// * [UpdateActiveNotifications]
  /// * [UpdateHavePendingNotifications]
  /// * [UpdateDeleteMessages]
  /// * [UpdateChatAction]
  /// * [UpdatePendingMessage]
  /// * [UpdateStopMessageDraft]
  /// * [UpdateCommunity]
  /// * [UpdateUserStatus]
  /// * [UpdateUser]
  /// * [UpdateBasicGroup]
  /// * [UpdateSupergroup]
  /// * [UpdateSecretChat]
  /// * [UpdateUserFullInfo]
  /// * [UpdateBasicGroupFullInfo]
  /// * [UpdateSupergroupFullInfo]
  /// * [UpdateCommunityFullInfo]
  /// * [UpdateServiceNotification]
  /// * [UpdateNewOauthRequest]
  /// * [UpdateFile]
  /// * [UpdateFileGenerationStart]
  /// * [UpdateFileGenerationStop]
  /// * [UpdateFileDownloads]
  /// * [UpdateFileAddedToDownloads]
  /// * [UpdateFileDownload]
  /// * [UpdateFileRemovedFromDownloads]
  /// * [UpdateApplicationVerificationRequired]
  /// * [UpdateApplicationRecaptchaVerificationRequired]
  /// * [UpdateCall]
  /// * [UpdateGroupCall]
  /// * [UpdateGroupCallParticipant]
  /// * [UpdateGroupCallParticipants]
  /// * [UpdateGroupCallVerificationState]
  /// * [UpdateNewGroupCallMessage]
  /// * [UpdateNewGroupCallPaidReaction]
  /// * [UpdateGroupCallMessageSendFailed]
  /// * [UpdateGroupCallMessagesDeleted]
  /// * [UpdateLiveStoryTopDonors]
  /// * [UpdateNewCallSignalingData]
  /// * [UpdateGiftAuctionState]
  /// * [UpdateActiveGiftAuctions]
  /// * [UpdateUserPrivacySettingRules]
  /// * [UpdateUnreadMessageCount]
  /// * [UpdateUnreadChatCount]
  /// * [UpdateChatJoinResult]
  /// * [UpdateStory]
  /// * [UpdateStoryDeleted]
  /// * [UpdateStoryPostSucceeded]
  /// * [UpdateStoryPostFailed]
  /// * [UpdateChatActiveStories]
  /// * [UpdateStoryListChatCount]
  /// * [UpdateStoryStealthMode]
  /// * [UpdateAllowedBotUsernamePremiumSuffixes]
  /// * [UpdateTrustedMiniAppBots]
  /// * [UpdateOption]
  /// * [UpdateStickerSet]
  /// * [UpdateInstalledStickerSets]
  /// * [UpdateTrendingStickerSets]
  /// * [UpdateRecentStickers]
  /// * [UpdateFavoriteStickers]
  /// * [UpdateSavedAnimations]
  /// * [UpdateSavedNotificationSounds]
  /// * [UpdateDefaultBackground]
  /// * [UpdateEmojiChatThemes]
  /// * [UpdateAccentColors]
  /// * [UpdateProfileAccentColors]
  /// * [UpdateWebBrowserSettings]
  /// * [UpdateLanguagePackStrings]
  /// * [UpdateConnectionState]
  /// * [UpdateWebProxyCarrierOpened]
  /// * [UpdateWebProxyCarrierData]
  /// * [UpdateWebProxyCarrierClosed]
  /// * [UpdateFreezeState]
  /// * [UpdateAgeVerificationParameters]
  /// * [UpdateTermsOfService]
  /// * [UpdateUnconfirmedSession]
  /// * [UpdateAttachmentMenuBots]
  /// * [UpdateWebAppMessageSent]
  /// * [UpdateActiveEmojiReactions]
  /// * [UpdateAvailableMessageEffects]
  /// * [UpdateDefaultReactionType]
  /// * [UpdateDefaultPaidReactionType]
  /// * [UpdateSavedMessagesTags]
  /// * [UpdateActiveLiveLocationMessages]
  /// * [UpdateOwnedStarCount]
  /// * [UpdateOwnedGramCount]
  /// * [UpdateTonWalletState]
  /// * [UpdateTonWalletGaslessTransfersInfo]
  /// * [UpdateTonWalletTonConnectSession]
  /// * [UpdateTonWalletTonConnectSessionDisconnectRequired]
  /// * [UpdateChatRevenueAmount]
  /// * [UpdateStarRevenueStatus]
  /// * [UpdateGramRevenueStatus]
  /// * [UpdateSpeechRecognitionTrial]
  /// * [UpdateGroupCallMessageLevels]
  /// * [UpdateDiceEmojis]
  /// * [UpdateStakeDiceState]
  /// * [UpdateAnimatedEmojiMessageClicked]
  /// * [UpdateAnimationSearchParameters]
  /// * [UpdateTextCompositionStyles]
  /// * [UpdateSuggestedActions]
  /// * [UpdateSpeedLimitNotification]
  /// * [UpdateContactCloseBirthdays]
  /// * [UpdateAutosaveSettings]
  /// * [UpdateBusinessConnection]
  /// * [UpdateNewBusinessMessage]
  /// * [UpdateBusinessMessageEdited]
  /// * [UpdateBusinessMessagesDeleted]
  /// * [UpdateNewInlineQuery]
  /// * [UpdateNewChosenInlineResult]
  /// * [UpdateNewGuestQuery]
  /// * [UpdateNewCallbackQuery]
  /// * [UpdateNewInlineCallbackQuery]
  /// * [UpdateNewBusinessCallbackQuery]
  /// * [UpdateNewShippingQuery]
  /// * [UpdateNewPreCheckoutQuery]
  /// * [UpdateNewCustomEvent]
  /// * [UpdateNewCustomQuery]
  /// * [UpdateUserSubscription]
  /// * [UpdatePoll]
  /// * [UpdatePollAnswer]
  /// * [UpdateManagedBot]
  /// * [UpdateChatMember]
  /// * [UpdateNewChatJoinRequest]
  /// * [UpdateChatBoost]
  /// * [UpdateMessageReaction]
  /// * [UpdateMessageReactions]
  /// * [UpdatePaidMediaPurchased]
  factory Update.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UpdateAuthorizationState.defaultObjectId:
        return UpdateAuthorizationState.fromJson(json);
      case UpdateNewMessage.defaultObjectId:
        return UpdateNewMessage.fromJson(json);
      case UpdateMessageSendAcknowledged.defaultObjectId:
        return UpdateMessageSendAcknowledged.fromJson(json);
      case UpdateMessageSendSucceeded.defaultObjectId:
        return UpdateMessageSendSucceeded.fromJson(json);
      case UpdateMessageSendFailed.defaultObjectId:
        return UpdateMessageSendFailed.fromJson(json);
      case UpdateMessageContent.defaultObjectId:
        return UpdateMessageContent.fromJson(json);
      case UpdateMessageEphemeralContent.defaultObjectId:
        return UpdateMessageEphemeralContent.fromJson(json);
      case UpdateMessageEdited.defaultObjectId:
        return UpdateMessageEdited.fromJson(json);
      case UpdateMessageIsPinned.defaultObjectId:
        return UpdateMessageIsPinned.fromJson(json);
      case UpdateMessageInteractionInfo.defaultObjectId:
        return UpdateMessageInteractionInfo.fromJson(json);
      case UpdateMessageContentOpened.defaultObjectId:
        return UpdateMessageContentOpened.fromJson(json);
      case UpdateMessageMentionRead.defaultObjectId:
        return UpdateMessageMentionRead.fromJson(json);
      case UpdateMessageUnreadReactions.defaultObjectId:
        return UpdateMessageUnreadReactions.fromJson(json);
      case UpdateMessageContainsUnreadPollVotes.defaultObjectId:
        return UpdateMessageContainsUnreadPollVotes.fromJson(json);
      case UpdateMessageFactCheck.defaultObjectId:
        return UpdateMessageFactCheck.fromJson(json);
      case UpdateMessageSuggestedPostInfo.defaultObjectId:
        return UpdateMessageSuggestedPostInfo.fromJson(json);
      case UpdateMessageLiveLocationViewed.defaultObjectId:
        return UpdateMessageLiveLocationViewed.fromJson(json);
      case UpdateVideoPublished.defaultObjectId:
        return UpdateVideoPublished.fromJson(json);
      case UpdateNewChat.defaultObjectId:
        return UpdateNewChat.fromJson(json);
      case UpdateChatTitle.defaultObjectId:
        return UpdateChatTitle.fromJson(json);
      case UpdateChatPhoto.defaultObjectId:
        return UpdateChatPhoto.fromJson(json);
      case UpdateChatAccentColors.defaultObjectId:
        return UpdateChatAccentColors.fromJson(json);
      case UpdateChatPermissions.defaultObjectId:
        return UpdateChatPermissions.fromJson(json);
      case UpdateChatLastMessage.defaultObjectId:
        return UpdateChatLastMessage.fromJson(json);
      case UpdateChatPosition.defaultObjectId:
        return UpdateChatPosition.fromJson(json);
      case UpdateChatAddedToList.defaultObjectId:
        return UpdateChatAddedToList.fromJson(json);
      case UpdateChatRemovedFromList.defaultObjectId:
        return UpdateChatRemovedFromList.fromJson(json);
      case UpdateChatReadInbox.defaultObjectId:
        return UpdateChatReadInbox.fromJson(json);
      case UpdateChatReadOutbox.defaultObjectId:
        return UpdateChatReadOutbox.fromJson(json);
      case UpdateChatActionBar.defaultObjectId:
        return UpdateChatActionBar.fromJson(json);
      case UpdateChatBusinessBotManageBar.defaultObjectId:
        return UpdateChatBusinessBotManageBar.fromJson(json);
      case UpdateChatAvailableReactions.defaultObjectId:
        return UpdateChatAvailableReactions.fromJson(json);
      case UpdateChatDraftMessage.defaultObjectId:
        return UpdateChatDraftMessage.fromJson(json);
      case UpdateChatEmojiStatus.defaultObjectId:
        return UpdateChatEmojiStatus.fromJson(json);
      case UpdateChatMessageSender.defaultObjectId:
        return UpdateChatMessageSender.fromJson(json);
      case UpdateChatMessageAutoDeleteTime.defaultObjectId:
        return UpdateChatMessageAutoDeleteTime.fromJson(json);
      case UpdateChatNotificationSettings.defaultObjectId:
        return UpdateChatNotificationSettings.fromJson(json);
      case UpdateChatPendingJoinRequests.defaultObjectId:
        return UpdateChatPendingJoinRequests.fromJson(json);
      case UpdateChatReplyMarkup.defaultObjectId:
        return UpdateChatReplyMarkup.fromJson(json);
      case UpdateChatBackground.defaultObjectId:
        return UpdateChatBackground.fromJson(json);
      case UpdateChatTheme.defaultObjectId:
        return UpdateChatTheme.fromJson(json);
      case UpdateChatUnreadMentionCount.defaultObjectId:
        return UpdateChatUnreadMentionCount.fromJson(json);
      case UpdateChatUnreadReactionCount.defaultObjectId:
        return UpdateChatUnreadReactionCount.fromJson(json);
      case UpdateChatUnreadPollVoteCount.defaultObjectId:
        return UpdateChatUnreadPollVoteCount.fromJson(json);
      case UpdateChatVideoChat.defaultObjectId:
        return UpdateChatVideoChat.fromJson(json);
      case UpdateChatDefaultDisableNotification.defaultObjectId:
        return UpdateChatDefaultDisableNotification.fromJson(json);
      case UpdateChatHasProtectedContent.defaultObjectId:
        return UpdateChatHasProtectedContent.fromJson(json);
      case UpdateChatIsTranslatable.defaultObjectId:
        return UpdateChatIsTranslatable.fromJson(json);
      case UpdateChatIsMarkedAsUnread.defaultObjectId:
        return UpdateChatIsMarkedAsUnread.fromJson(json);
      case UpdateChatViewAsTopics.defaultObjectId:
        return UpdateChatViewAsTopics.fromJson(json);
      case UpdateChatBlockList.defaultObjectId:
        return UpdateChatBlockList.fromJson(json);
      case UpdateChatHasScheduledMessages.defaultObjectId:
        return UpdateChatHasScheduledMessages.fromJson(json);
      case UpdateChatHasWelcomeMessages.defaultObjectId:
        return UpdateChatHasWelcomeMessages.fromJson(json);
      case UpdateChatFolders.defaultObjectId:
        return UpdateChatFolders.fromJson(json);
      case UpdateChatOnlineMemberCount.defaultObjectId:
        return UpdateChatOnlineMemberCount.fromJson(json);
      case UpdateSavedMessagesTopic.defaultObjectId:
        return UpdateSavedMessagesTopic.fromJson(json);
      case UpdateSavedMessagesTopicCount.defaultObjectId:
        return UpdateSavedMessagesTopicCount.fromJson(json);
      case UpdateDirectMessagesChatTopic.defaultObjectId:
        return UpdateDirectMessagesChatTopic.fromJson(json);
      case UpdateTopicMessageCount.defaultObjectId:
        return UpdateTopicMessageCount.fromJson(json);
      case UpdateQuickReplyShortcut.defaultObjectId:
        return UpdateQuickReplyShortcut.fromJson(json);
      case UpdateQuickReplyShortcutDeleted.defaultObjectId:
        return UpdateQuickReplyShortcutDeleted.fromJson(json);
      case UpdateQuickReplyShortcuts.defaultObjectId:
        return UpdateQuickReplyShortcuts.fromJson(json);
      case UpdateQuickReplyShortcutMessages.defaultObjectId:
        return UpdateQuickReplyShortcutMessages.fromJson(json);
      case UpdateChatWelcomeMessages.defaultObjectId:
        return UpdateChatWelcomeMessages.fromJson(json);
      case UpdateForumTopicInfo.defaultObjectId:
        return UpdateForumTopicInfo.fromJson(json);
      case UpdateForumTopic.defaultObjectId:
        return UpdateForumTopic.fromJson(json);
      case UpdateScopeNotificationSettings.defaultObjectId:
        return UpdateScopeNotificationSettings.fromJson(json);
      case UpdateReactionNotificationSettings.defaultObjectId:
        return UpdateReactionNotificationSettings.fromJson(json);
      case UpdateNotification.defaultObjectId:
        return UpdateNotification.fromJson(json);
      case UpdateNotificationGroup.defaultObjectId:
        return UpdateNotificationGroup.fromJson(json);
      case UpdateActiveNotifications.defaultObjectId:
        return UpdateActiveNotifications.fromJson(json);
      case UpdateHavePendingNotifications.defaultObjectId:
        return UpdateHavePendingNotifications.fromJson(json);
      case UpdateDeleteMessages.defaultObjectId:
        return UpdateDeleteMessages.fromJson(json);
      case UpdateChatAction.defaultObjectId:
        return UpdateChatAction.fromJson(json);
      case UpdatePendingMessage.defaultObjectId:
        return UpdatePendingMessage.fromJson(json);
      case UpdateStopMessageDraft.defaultObjectId:
        return UpdateStopMessageDraft.fromJson(json);
      case UpdateCommunity.defaultObjectId:
        return UpdateCommunity.fromJson(json);
      case UpdateUserStatus.defaultObjectId:
        return UpdateUserStatus.fromJson(json);
      case UpdateUser.defaultObjectId:
        return UpdateUser.fromJson(json);
      case UpdateBasicGroup.defaultObjectId:
        return UpdateBasicGroup.fromJson(json);
      case UpdateSupergroup.defaultObjectId:
        return UpdateSupergroup.fromJson(json);
      case UpdateSecretChat.defaultObjectId:
        return UpdateSecretChat.fromJson(json);
      case UpdateUserFullInfo.defaultObjectId:
        return UpdateUserFullInfo.fromJson(json);
      case UpdateBasicGroupFullInfo.defaultObjectId:
        return UpdateBasicGroupFullInfo.fromJson(json);
      case UpdateSupergroupFullInfo.defaultObjectId:
        return UpdateSupergroupFullInfo.fromJson(json);
      case UpdateCommunityFullInfo.defaultObjectId:
        return UpdateCommunityFullInfo.fromJson(json);
      case UpdateServiceNotification.defaultObjectId:
        return UpdateServiceNotification.fromJson(json);
      case UpdateNewOauthRequest.defaultObjectId:
        return UpdateNewOauthRequest.fromJson(json);
      case UpdateFile.defaultObjectId:
        return UpdateFile.fromJson(json);
      case UpdateFileGenerationStart.defaultObjectId:
        return UpdateFileGenerationStart.fromJson(json);
      case UpdateFileGenerationStop.defaultObjectId:
        return UpdateFileGenerationStop.fromJson(json);
      case UpdateFileDownloads.defaultObjectId:
        return UpdateFileDownloads.fromJson(json);
      case UpdateFileAddedToDownloads.defaultObjectId:
        return UpdateFileAddedToDownloads.fromJson(json);
      case UpdateFileDownload.defaultObjectId:
        return UpdateFileDownload.fromJson(json);
      case UpdateFileRemovedFromDownloads.defaultObjectId:
        return UpdateFileRemovedFromDownloads.fromJson(json);
      case UpdateApplicationVerificationRequired.defaultObjectId:
        return UpdateApplicationVerificationRequired.fromJson(json);
      case UpdateApplicationRecaptchaVerificationRequired.defaultObjectId:
        return UpdateApplicationRecaptchaVerificationRequired.fromJson(json);
      case UpdateCall.defaultObjectId:
        return UpdateCall.fromJson(json);
      case UpdateGroupCall.defaultObjectId:
        return UpdateGroupCall.fromJson(json);
      case UpdateGroupCallParticipant.defaultObjectId:
        return UpdateGroupCallParticipant.fromJson(json);
      case UpdateGroupCallParticipants.defaultObjectId:
        return UpdateGroupCallParticipants.fromJson(json);
      case UpdateGroupCallVerificationState.defaultObjectId:
        return UpdateGroupCallVerificationState.fromJson(json);
      case UpdateNewGroupCallMessage.defaultObjectId:
        return UpdateNewGroupCallMessage.fromJson(json);
      case UpdateNewGroupCallPaidReaction.defaultObjectId:
        return UpdateNewGroupCallPaidReaction.fromJson(json);
      case UpdateGroupCallMessageSendFailed.defaultObjectId:
        return UpdateGroupCallMessageSendFailed.fromJson(json);
      case UpdateGroupCallMessagesDeleted.defaultObjectId:
        return UpdateGroupCallMessagesDeleted.fromJson(json);
      case UpdateLiveStoryTopDonors.defaultObjectId:
        return UpdateLiveStoryTopDonors.fromJson(json);
      case UpdateNewCallSignalingData.defaultObjectId:
        return UpdateNewCallSignalingData.fromJson(json);
      case UpdateGiftAuctionState.defaultObjectId:
        return UpdateGiftAuctionState.fromJson(json);
      case UpdateActiveGiftAuctions.defaultObjectId:
        return UpdateActiveGiftAuctions.fromJson(json);
      case UpdateUserPrivacySettingRules.defaultObjectId:
        return UpdateUserPrivacySettingRules.fromJson(json);
      case UpdateUnreadMessageCount.defaultObjectId:
        return UpdateUnreadMessageCount.fromJson(json);
      case UpdateUnreadChatCount.defaultObjectId:
        return UpdateUnreadChatCount.fromJson(json);
      case UpdateChatJoinResult.defaultObjectId:
        return UpdateChatJoinResult.fromJson(json);
      case UpdateStory.defaultObjectId:
        return UpdateStory.fromJson(json);
      case UpdateStoryDeleted.defaultObjectId:
        return UpdateStoryDeleted.fromJson(json);
      case UpdateStoryPostSucceeded.defaultObjectId:
        return UpdateStoryPostSucceeded.fromJson(json);
      case UpdateStoryPostFailed.defaultObjectId:
        return UpdateStoryPostFailed.fromJson(json);
      case UpdateChatActiveStories.defaultObjectId:
        return UpdateChatActiveStories.fromJson(json);
      case UpdateStoryListChatCount.defaultObjectId:
        return UpdateStoryListChatCount.fromJson(json);
      case UpdateStoryStealthMode.defaultObjectId:
        return UpdateStoryStealthMode.fromJson(json);
      case UpdateAllowedBotUsernamePremiumSuffixes.defaultObjectId:
        return UpdateAllowedBotUsernamePremiumSuffixes.fromJson(json);
      case UpdateTrustedMiniAppBots.defaultObjectId:
        return UpdateTrustedMiniAppBots.fromJson(json);
      case UpdateOption.defaultObjectId:
        return UpdateOption.fromJson(json);
      case UpdateStickerSet.defaultObjectId:
        return UpdateStickerSet.fromJson(json);
      case UpdateInstalledStickerSets.defaultObjectId:
        return UpdateInstalledStickerSets.fromJson(json);
      case UpdateTrendingStickerSets.defaultObjectId:
        return UpdateTrendingStickerSets.fromJson(json);
      case UpdateRecentStickers.defaultObjectId:
        return UpdateRecentStickers.fromJson(json);
      case UpdateFavoriteStickers.defaultObjectId:
        return UpdateFavoriteStickers.fromJson(json);
      case UpdateSavedAnimations.defaultObjectId:
        return UpdateSavedAnimations.fromJson(json);
      case UpdateSavedNotificationSounds.defaultObjectId:
        return UpdateSavedNotificationSounds.fromJson(json);
      case UpdateDefaultBackground.defaultObjectId:
        return UpdateDefaultBackground.fromJson(json);
      case UpdateEmojiChatThemes.defaultObjectId:
        return UpdateEmojiChatThemes.fromJson(json);
      case UpdateAccentColors.defaultObjectId:
        return UpdateAccentColors.fromJson(json);
      case UpdateProfileAccentColors.defaultObjectId:
        return UpdateProfileAccentColors.fromJson(json);
      case UpdateWebBrowserSettings.defaultObjectId:
        return UpdateWebBrowserSettings.fromJson(json);
      case UpdateLanguagePackStrings.defaultObjectId:
        return UpdateLanguagePackStrings.fromJson(json);
      case UpdateConnectionState.defaultObjectId:
        return UpdateConnectionState.fromJson(json);
      case UpdateWebProxyCarrierOpened.defaultObjectId:
        return UpdateWebProxyCarrierOpened.fromJson(json);
      case UpdateWebProxyCarrierData.defaultObjectId:
        return UpdateWebProxyCarrierData.fromJson(json);
      case UpdateWebProxyCarrierClosed.defaultObjectId:
        return UpdateWebProxyCarrierClosed.fromJson(json);
      case UpdateFreezeState.defaultObjectId:
        return UpdateFreezeState.fromJson(json);
      case UpdateAgeVerificationParameters.defaultObjectId:
        return UpdateAgeVerificationParameters.fromJson(json);
      case UpdateTermsOfService.defaultObjectId:
        return UpdateTermsOfService.fromJson(json);
      case UpdateUnconfirmedSession.defaultObjectId:
        return UpdateUnconfirmedSession.fromJson(json);
      case UpdateAttachmentMenuBots.defaultObjectId:
        return UpdateAttachmentMenuBots.fromJson(json);
      case UpdateWebAppMessageSent.defaultObjectId:
        return UpdateWebAppMessageSent.fromJson(json);
      case UpdateActiveEmojiReactions.defaultObjectId:
        return UpdateActiveEmojiReactions.fromJson(json);
      case UpdateAvailableMessageEffects.defaultObjectId:
        return UpdateAvailableMessageEffects.fromJson(json);
      case UpdateDefaultReactionType.defaultObjectId:
        return UpdateDefaultReactionType.fromJson(json);
      case UpdateDefaultPaidReactionType.defaultObjectId:
        return UpdateDefaultPaidReactionType.fromJson(json);
      case UpdateSavedMessagesTags.defaultObjectId:
        return UpdateSavedMessagesTags.fromJson(json);
      case UpdateActiveLiveLocationMessages.defaultObjectId:
        return UpdateActiveLiveLocationMessages.fromJson(json);
      case UpdateOwnedStarCount.defaultObjectId:
        return UpdateOwnedStarCount.fromJson(json);
      case UpdateOwnedGramCount.defaultObjectId:
        return UpdateOwnedGramCount.fromJson(json);
      case UpdateTonWalletState.defaultObjectId:
        return UpdateTonWalletState.fromJson(json);
      case UpdateTonWalletGaslessTransfersInfo.defaultObjectId:
        return UpdateTonWalletGaslessTransfersInfo.fromJson(json);
      case UpdateTonWalletTonConnectSession.defaultObjectId:
        return UpdateTonWalletTonConnectSession.fromJson(json);
      case UpdateTonWalletTonConnectSessionDisconnectRequired.defaultObjectId:
        return UpdateTonWalletTonConnectSessionDisconnectRequired.fromJson(
            json);
      case UpdateChatRevenueAmount.defaultObjectId:
        return UpdateChatRevenueAmount.fromJson(json);
      case UpdateStarRevenueStatus.defaultObjectId:
        return UpdateStarRevenueStatus.fromJson(json);
      case UpdateGramRevenueStatus.defaultObjectId:
        return UpdateGramRevenueStatus.fromJson(json);
      case UpdateSpeechRecognitionTrial.defaultObjectId:
        return UpdateSpeechRecognitionTrial.fromJson(json);
      case UpdateGroupCallMessageLevels.defaultObjectId:
        return UpdateGroupCallMessageLevels.fromJson(json);
      case UpdateDiceEmojis.defaultObjectId:
        return UpdateDiceEmojis.fromJson(json);
      case UpdateStakeDiceState.defaultObjectId:
        return UpdateStakeDiceState.fromJson(json);
      case UpdateAnimatedEmojiMessageClicked.defaultObjectId:
        return UpdateAnimatedEmojiMessageClicked.fromJson(json);
      case UpdateAnimationSearchParameters.defaultObjectId:
        return UpdateAnimationSearchParameters.fromJson(json);
      case UpdateTextCompositionStyles.defaultObjectId:
        return UpdateTextCompositionStyles.fromJson(json);
      case UpdateSuggestedActions.defaultObjectId:
        return UpdateSuggestedActions.fromJson(json);
      case UpdateSpeedLimitNotification.defaultObjectId:
        return UpdateSpeedLimitNotification.fromJson(json);
      case UpdateContactCloseBirthdays.defaultObjectId:
        return UpdateContactCloseBirthdays.fromJson(json);
      case UpdateAutosaveSettings.defaultObjectId:
        return UpdateAutosaveSettings.fromJson(json);
      case UpdateBusinessConnection.defaultObjectId:
        return UpdateBusinessConnection.fromJson(json);
      case UpdateNewBusinessMessage.defaultObjectId:
        return UpdateNewBusinessMessage.fromJson(json);
      case UpdateBusinessMessageEdited.defaultObjectId:
        return UpdateBusinessMessageEdited.fromJson(json);
      case UpdateBusinessMessagesDeleted.defaultObjectId:
        return UpdateBusinessMessagesDeleted.fromJson(json);
      case UpdateNewInlineQuery.defaultObjectId:
        return UpdateNewInlineQuery.fromJson(json);
      case UpdateNewChosenInlineResult.defaultObjectId:
        return UpdateNewChosenInlineResult.fromJson(json);
      case UpdateNewGuestQuery.defaultObjectId:
        return UpdateNewGuestQuery.fromJson(json);
      case UpdateNewCallbackQuery.defaultObjectId:
        return UpdateNewCallbackQuery.fromJson(json);
      case UpdateNewInlineCallbackQuery.defaultObjectId:
        return UpdateNewInlineCallbackQuery.fromJson(json);
      case UpdateNewBusinessCallbackQuery.defaultObjectId:
        return UpdateNewBusinessCallbackQuery.fromJson(json);
      case UpdateNewShippingQuery.defaultObjectId:
        return UpdateNewShippingQuery.fromJson(json);
      case UpdateNewPreCheckoutQuery.defaultObjectId:
        return UpdateNewPreCheckoutQuery.fromJson(json);
      case UpdateNewCustomEvent.defaultObjectId:
        return UpdateNewCustomEvent.fromJson(json);
      case UpdateNewCustomQuery.defaultObjectId:
        return UpdateNewCustomQuery.fromJson(json);
      case UpdateUserSubscription.defaultObjectId:
        return UpdateUserSubscription.fromJson(json);
      case UpdatePoll.defaultObjectId:
        return UpdatePoll.fromJson(json);
      case UpdatePollAnswer.defaultObjectId:
        return UpdatePollAnswer.fromJson(json);
      case UpdateManagedBot.defaultObjectId:
        return UpdateManagedBot.fromJson(json);
      case UpdateChatMember.defaultObjectId:
        return UpdateChatMember.fromJson(json);
      case UpdateNewChatJoinRequest.defaultObjectId:
        return UpdateNewChatJoinRequest.fromJson(json);
      case UpdateChatBoost.defaultObjectId:
        return UpdateChatBoost.fromJson(json);
      case UpdateMessageReaction.defaultObjectId:
        return UpdateMessageReaction.fromJson(json);
      case UpdateMessageReactions.defaultObjectId:
        return UpdateMessageReactions.fromJson(json);
      case UpdatePaidMediaPurchased.defaultObjectId:
        return UpdatePaidMediaPurchased.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of Update)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  Update copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'update';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAuthorizationState** *(updateAuthorizationState)* - child of Update
///
/// The user authorization state has changed.
///
/// * [authorizationState]: New authorization state.
final class UpdateAuthorizationState extends Update {
  /// **UpdateAuthorizationState** *(updateAuthorizationState)* - child of Update
  ///
  /// The user authorization state has changed.
  ///
  /// * [authorizationState]: New authorization state.
  const UpdateAuthorizationState({
    required this.authorizationState,
    this.extra,
    this.clientId,
  });

  /// New authorization state
  final AuthorizationState authorizationState;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAuthorizationState.fromJson(Map<String, dynamic> json) =>
      UpdateAuthorizationState(
        authorizationState:
            AuthorizationState.fromJson(json['authorization_state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "authorization_state": authorizationState.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [authorization_state]: New authorization state
  @override
  UpdateAuthorizationState copyWith({
    AuthorizationState? authorizationState,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAuthorizationState(
        authorizationState: authorizationState ?? this.authorizationState,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAuthorizationState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewMessage** *(updateNewMessage)* - child of Update
///
/// A new message was received; can also be an outgoing message.
///
/// * [message]: The new message.
final class UpdateNewMessage extends Update {
  /// **UpdateNewMessage** *(updateNewMessage)* - child of Update
  ///
  /// A new message was received; can also be an outgoing message.
  ///
  /// * [message]: The new message.
  const UpdateNewMessage({
    required this.message,
    this.extra,
    this.clientId,
  });

  /// The new message
  final Message message;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewMessage.fromJson(Map<String, dynamic> json) =>
      UpdateNewMessage(
        message: Message.fromJson(json['message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The new message
  @override
  UpdateNewMessage copyWith({
    Message? message,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewMessage(
        message: message ?? this.message,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageSendAcknowledged** *(updateMessageSendAcknowledged)* - child of Update
///
/// A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully.. This update is sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message.
///
/// * [chatId]: The chat identifier of the sent message.
/// * [messageId]: A temporary message identifier.
final class UpdateMessageSendAcknowledged extends Update {
  /// **UpdateMessageSendAcknowledged** *(updateMessageSendAcknowledged)* - child of Update
  ///
  /// A request to send a message has reached the Telegram server. This doesn't mean that the message will be sent successfully.. This update is sent only if the option "use_quick_ack" is set to true. This update may be sent multiple times for the same message.
  ///
  /// * [chatId]: The chat identifier of the sent message.
  /// * [messageId]: A temporary message identifier.
  const UpdateMessageSendAcknowledged({
    required this.chatId,
    required this.messageId,
    this.extra,
    this.clientId,
  });

  /// The chat identifier of the sent message
  final int chatId;

  /// A temporary message identifier
  final int messageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageSendAcknowledged.fromJson(Map<String, dynamic> json) =>
      UpdateMessageSendAcknowledged(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat identifier of the sent message
  /// * [message_id]: A temporary message identifier
  @override
  UpdateMessageSendAcknowledged copyWith({
    int? chatId,
    int? messageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageSendAcknowledged(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageSendAcknowledged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageSendSucceeded** *(updateMessageSendSucceeded)* - child of Update
///
/// A message has been successfully sent.
///
/// * [message]: The sent message. Almost any field of the new message can be different from the corresponding field of the original message.. For example, the field scheduling_state may change, making the message scheduled, or non-scheduled.
/// * [oldMessageId]: The previous temporary message identifier.
final class UpdateMessageSendSucceeded extends Update {
  /// **UpdateMessageSendSucceeded** *(updateMessageSendSucceeded)* - child of Update
  ///
  /// A message has been successfully sent.
  ///
  /// * [message]: The sent message. Almost any field of the new message can be different from the corresponding field of the original message.. For example, the field scheduling_state may change, making the message scheduled, or non-scheduled.
  /// * [oldMessageId]: The previous temporary message identifier.
  const UpdateMessageSendSucceeded({
    required this.message,
    required this.oldMessageId,
    this.extra,
    this.clientId,
  });

  /// The sent message. Almost any field of the new message can be different from the corresponding field of the original message.. For example, the field scheduling_state may change, making the message scheduled, or non-scheduled
  final Message message;

  /// The previous temporary message identifier
  final int oldMessageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageSendSucceeded.fromJson(Map<String, dynamic> json) =>
      UpdateMessageSendSucceeded(
        message: Message.fromJson(json['message']),
        oldMessageId: json['old_message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "old_message_id": oldMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The sent message. Almost any field of the new message can be different from the corresponding field of the original message.. For example, the field scheduling_state may change, making the message scheduled, or non-scheduled
  /// * [old_message_id]: The previous temporary message identifier
  @override
  UpdateMessageSendSucceeded copyWith({
    Message? message,
    int? oldMessageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageSendSucceeded(
        message: message ?? this.message,
        oldMessageId: oldMessageId ?? this.oldMessageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageSendSucceeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageSendFailed** *(updateMessageSendFailed)* - child of Update
///
/// A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update.
///
/// * [message]: The failed to send message.
/// * [oldMessageId]: The previous temporary message identifier.
/// * [error]: The cause of the message sending failure.
final class UpdateMessageSendFailed extends Update {
  /// **UpdateMessageSendFailed** *(updateMessageSendFailed)* - child of Update
  ///
  /// A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update.
  ///
  /// * [message]: The failed to send message.
  /// * [oldMessageId]: The previous temporary message identifier.
  /// * [error]: The cause of the message sending failure.
  const UpdateMessageSendFailed({
    required this.message,
    required this.oldMessageId,
    required this.error,
    this.extra,
    this.clientId,
  });

  /// The failed to send message
  final Message message;

  /// The previous temporary message identifier
  final int oldMessageId;

  /// The cause of the message sending failure
  final TdError error;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageSendFailed.fromJson(Map<String, dynamic> json) =>
      UpdateMessageSendFailed(
        message: Message.fromJson(json['message']),
        oldMessageId: json['old_message_id'],
        error: TdError.fromJson(json['error']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "old_message_id": oldMessageId,
      "error": error.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The failed to send message
  /// * [old_message_id]: The previous temporary message identifier
  /// * [error]: The cause of the message sending failure
  @override
  UpdateMessageSendFailed copyWith({
    Message? message,
    int? oldMessageId,
    TdError? error,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageSendFailed(
        message: message ?? this.message,
        oldMessageId: oldMessageId ?? this.oldMessageId,
        error: error ?? this.error,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageSendFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageContent** *(updateMessageContent)* - child of Update
///
/// The message content has changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [newContent]: New message content.
final class UpdateMessageContent extends Update {
  /// **UpdateMessageContent** *(updateMessageContent)* - child of Update
  ///
  /// The message content has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [newContent]: New message content.
  const UpdateMessageContent({
    required this.chatId,
    required this.messageId,
    required this.newContent,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// New message content
  final MessageContent newContent;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageContent.fromJson(Map<String, dynamic> json) =>
      UpdateMessageContent(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        newContent: MessageContent.fromJson(json['new_content']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "new_content": newContent.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [new_content]: New message content
  @override
  UpdateMessageContent copyWith({
    int? chatId,
    int? messageId,
    MessageContent? newContent,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageContent(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        newContent: newContent ?? this.newContent,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageEphemeralContent** *(updateMessageEphemeralContent)* - child of Update
///
/// The message ephemeral content has changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [ephemeralContent]: New ephemeral content of the message; may be null if none *(optional)*.
final class UpdateMessageEphemeralContent extends Update {
  /// **UpdateMessageEphemeralContent** *(updateMessageEphemeralContent)* - child of Update
  ///
  /// The message ephemeral content has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [ephemeralContent]: New ephemeral content of the message; may be null if none *(optional)*.
  const UpdateMessageEphemeralContent({
    required this.chatId,
    required this.messageId,
    this.ephemeralContent,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// New ephemeral content of the message; may be null if none
  final EphemeralMessageContent? ephemeralContent;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageEphemeralContent.fromJson(Map<String, dynamic> json) =>
      UpdateMessageEphemeralContent(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        ephemeralContent: json['ephemeral_content'] == null
            ? null
            : EphemeralMessageContent.fromJson(json['ephemeral_content']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "ephemeral_content": ephemeralContent?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [ephemeral_content]: New ephemeral content of the message; may be null if none
  @override
  UpdateMessageEphemeralContent copyWith({
    int? chatId,
    int? messageId,
    EphemeralMessageContent? ephemeralContent,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageEphemeralContent(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        ephemeralContent: ephemeralContent ?? this.ephemeralContent,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageEphemeralContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageEdited** *(updateMessageEdited)* - child of Update
///
/// A message was edited. Changes in the message content will come in a separate updateMessageContent.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [editDate]: Point in time (Unix timestamp) when the message was edited.
/// * [replyMarkup]: New message reply markup; may be null *(optional)*.
final class UpdateMessageEdited extends Update {
  /// **UpdateMessageEdited** *(updateMessageEdited)* - child of Update
  ///
  /// A message was edited. Changes in the message content will come in a separate updateMessageContent.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [editDate]: Point in time (Unix timestamp) when the message was edited.
  /// * [replyMarkup]: New message reply markup; may be null *(optional)*.
  const UpdateMessageEdited({
    required this.chatId,
    required this.messageId,
    required this.editDate,
    this.replyMarkup,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Point in time (Unix timestamp) when the message was edited
  final int editDate;

  /// New message reply markup; may be null
  final ReplyMarkup? replyMarkup;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageEdited.fromJson(Map<String, dynamic> json) =>
      UpdateMessageEdited(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        editDate: json['edit_date'],
        replyMarkup: json['reply_markup'] == null
            ? null
            : ReplyMarkup.fromJson(json['reply_markup']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "edit_date": editDate,
      "reply_markup": replyMarkup?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [edit_date]: Point in time (Unix timestamp) when the message was edited
  /// * [reply_markup]: New message reply markup; may be null
  @override
  UpdateMessageEdited copyWith({
    int? chatId,
    int? messageId,
    int? editDate,
    ReplyMarkup? replyMarkup,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageEdited(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        editDate: editDate ?? this.editDate,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageIsPinned** *(updateMessageIsPinned)* - child of Update
///
/// The message pinned state was changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: The message identifier.
/// * [isPinned]: True, if the message is pinned.
final class UpdateMessageIsPinned extends Update {
  /// **UpdateMessageIsPinned** *(updateMessageIsPinned)* - child of Update
  ///
  /// The message pinned state was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: The message identifier.
  /// * [isPinned]: True, if the message is pinned.
  const UpdateMessageIsPinned({
    required this.chatId,
    required this.messageId,
    required this.isPinned,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The message identifier
  final int messageId;

  /// True, if the message is pinned
  final bool isPinned;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageIsPinned.fromJson(Map<String, dynamic> json) =>
      UpdateMessageIsPinned(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        isPinned: json['is_pinned'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: The message identifier
  /// * [is_pinned]: True, if the message is pinned
  @override
  UpdateMessageIsPinned copyWith({
    int? chatId,
    int? messageId,
    bool? isPinned,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageIsPinned(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        isPinned: isPinned ?? this.isPinned,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageIsPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageInteractionInfo** *(updateMessageInteractionInfo)* - child of Update
///
/// The information about interactions with a message has changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [interactionInfo]: New information about interactions with the message; may be null *(optional)*.
final class UpdateMessageInteractionInfo extends Update {
  /// **UpdateMessageInteractionInfo** *(updateMessageInteractionInfo)* - child of Update
  ///
  /// The information about interactions with a message has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [interactionInfo]: New information about interactions with the message; may be null *(optional)*.
  const UpdateMessageInteractionInfo({
    required this.chatId,
    required this.messageId,
    this.interactionInfo,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// New information about interactions with the message; may be null
  final MessageInteractionInfo? interactionInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageInteractionInfo.fromJson(Map<String, dynamic> json) =>
      UpdateMessageInteractionInfo(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        interactionInfo: json['interaction_info'] == null
            ? null
            : MessageInteractionInfo.fromJson(json['interaction_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "interaction_info": interactionInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [interaction_info]: New information about interactions with the message; may be null
  @override
  UpdateMessageInteractionInfo copyWith({
    int? chatId,
    int? messageId,
    MessageInteractionInfo? interactionInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageInteractionInfo(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        interactionInfo: interactionInfo ?? this.interactionInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageInteractionInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageContentOpened** *(updateMessageContentOpened)* - child of Update
///
/// The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the self-destruct timer.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
final class UpdateMessageContentOpened extends Update {
  /// **UpdateMessageContentOpened** *(updateMessageContentOpened)* - child of Update
  ///
  /// The message content was opened. Updates voice note messages to "listened", video note messages to "viewed" and starts the self-destruct timer.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  const UpdateMessageContentOpened({
    required this.chatId,
    required this.messageId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageContentOpened.fromJson(Map<String, dynamic> json) =>
      UpdateMessageContentOpened(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  @override
  UpdateMessageContentOpened copyWith({
    int? chatId,
    int? messageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageContentOpened(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageContentOpened';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageMentionRead** *(updateMessageMentionRead)* - child of Update
///
/// A message with an unread mention was read.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [unreadMentionCount]: The new number of unread mention messages left in the chat.
final class UpdateMessageMentionRead extends Update {
  /// **UpdateMessageMentionRead** *(updateMessageMentionRead)* - child of Update
  ///
  /// A message with an unread mention was read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [unreadMentionCount]: The new number of unread mention messages left in the chat.
  const UpdateMessageMentionRead({
    required this.chatId,
    required this.messageId,
    required this.unreadMentionCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// The new number of unread mention messages left in the chat
  final int unreadMentionCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageMentionRead.fromJson(Map<String, dynamic> json) =>
      UpdateMessageMentionRead(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        unreadMentionCount: json['unread_mention_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "unread_mention_count": unreadMentionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [unread_mention_count]: The new number of unread mention messages left in the chat
  @override
  UpdateMessageMentionRead copyWith({
    int? chatId,
    int? messageId,
    int? unreadMentionCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageMentionRead(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        unreadMentionCount: unreadMentionCount ?? this.unreadMentionCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageMentionRead';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageUnreadReactions** *(updateMessageUnreadReactions)* - child of Update
///
/// The list of unread reactions added to a message was changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [unreadReactions]: The new list of unread reactions.
/// * [unreadReactionCount]: The new number of messages with unread reactions in the chat.
final class UpdateMessageUnreadReactions extends Update {
  /// **UpdateMessageUnreadReactions** *(updateMessageUnreadReactions)* - child of Update
  ///
  /// The list of unread reactions added to a message was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [unreadReactions]: The new list of unread reactions.
  /// * [unreadReactionCount]: The new number of messages with unread reactions in the chat.
  const UpdateMessageUnreadReactions({
    required this.chatId,
    required this.messageId,
    required this.unreadReactions,
    required this.unreadReactionCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// The new list of unread reactions
  final List<UnreadReaction> unreadReactions;

  /// The new number of messages with unread reactions in the chat
  final int unreadReactionCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageUnreadReactions.fromJson(Map<String, dynamic> json) =>
      UpdateMessageUnreadReactions(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        unreadReactions: List<UnreadReaction>.from(
            (json['unread_reactions'] ?? [])
                .map((item) => UnreadReaction.fromJson(item))
                .toList()),
        unreadReactionCount: json['unread_reaction_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "unread_reactions": unreadReactions.map((i) => i.toJson()).toList(),
      "unread_reaction_count": unreadReactionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [unread_reactions]: The new list of unread reactions
  /// * [unread_reaction_count]: The new number of messages with unread reactions in the chat
  @override
  UpdateMessageUnreadReactions copyWith({
    int? chatId,
    int? messageId,
    List<UnreadReaction>? unreadReactions,
    int? unreadReactionCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageUnreadReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        unreadReactions: unreadReactions ?? this.unreadReactions,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageUnreadReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageContainsUnreadPollVotes** *(updateMessageContainsUnreadPollVotes)* - child of Update
///
/// Unread votes were added or removed from a poll message.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [containsUnreadPollVotes]: True, if the message is a poll message with unread votes.
/// * [unreadPollVoteCount]: The new number of messages with unread poll votes in the chat.
final class UpdateMessageContainsUnreadPollVotes extends Update {
  /// **UpdateMessageContainsUnreadPollVotes** *(updateMessageContainsUnreadPollVotes)* - child of Update
  ///
  /// Unread votes were added or removed from a poll message.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [containsUnreadPollVotes]: True, if the message is a poll message with unread votes.
  /// * [unreadPollVoteCount]: The new number of messages with unread poll votes in the chat.
  const UpdateMessageContainsUnreadPollVotes({
    required this.chatId,
    required this.messageId,
    required this.containsUnreadPollVotes,
    required this.unreadPollVoteCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// True, if the message is a poll message with unread votes
  final bool containsUnreadPollVotes;

  /// The new number of messages with unread poll votes in the chat
  final int unreadPollVoteCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageContainsUnreadPollVotes.fromJson(
          Map<String, dynamic> json) =>
      UpdateMessageContainsUnreadPollVotes(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        containsUnreadPollVotes: json['contains_unread_poll_votes'],
        unreadPollVoteCount: json['unread_poll_vote_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "contains_unread_poll_votes": containsUnreadPollVotes,
      "unread_poll_vote_count": unreadPollVoteCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [contains_unread_poll_votes]: True, if the message is a poll message with unread votes
  /// * [unread_poll_vote_count]: The new number of messages with unread poll votes in the chat
  @override
  UpdateMessageContainsUnreadPollVotes copyWith({
    int? chatId,
    int? messageId,
    bool? containsUnreadPollVotes,
    int? unreadPollVoteCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageContainsUnreadPollVotes(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        containsUnreadPollVotes:
            containsUnreadPollVotes ?? this.containsUnreadPollVotes,
        unreadPollVoteCount: unreadPollVoteCount ?? this.unreadPollVoteCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageContainsUnreadPollVotes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageFactCheck** *(updateMessageFactCheck)* - child of Update
///
/// A fact-check added to a message was changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [factCheck]: The new fact-check.
final class UpdateMessageFactCheck extends Update {
  /// **UpdateMessageFactCheck** *(updateMessageFactCheck)* - child of Update
  ///
  /// A fact-check added to a message was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [factCheck]: The new fact-check.
  const UpdateMessageFactCheck({
    required this.chatId,
    required this.messageId,
    required this.factCheck,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// The new fact-check
  final FactCheck factCheck;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageFactCheck.fromJson(Map<String, dynamic> json) =>
      UpdateMessageFactCheck(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        factCheck: FactCheck.fromJson(json['fact_check']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "fact_check": factCheck.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [fact_check]: The new fact-check
  @override
  UpdateMessageFactCheck copyWith({
    int? chatId,
    int? messageId,
    FactCheck? factCheck,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageFactCheck(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        factCheck: factCheck ?? this.factCheck,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageFactCheck';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageSuggestedPostInfo** *(updateMessageSuggestedPostInfo)* - child of Update
///
/// Information about suggested post of a message was changed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [suggestedPostInfo]: The new information about the suggested post.
final class UpdateMessageSuggestedPostInfo extends Update {
  /// **UpdateMessageSuggestedPostInfo** *(updateMessageSuggestedPostInfo)* - child of Update
  ///
  /// Information about suggested post of a message was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [suggestedPostInfo]: The new information about the suggested post.
  const UpdateMessageSuggestedPostInfo({
    required this.chatId,
    required this.messageId,
    required this.suggestedPostInfo,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// The new information about the suggested post
  final SuggestedPostInfo suggestedPostInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageSuggestedPostInfo.fromJson(Map<String, dynamic> json) =>
      UpdateMessageSuggestedPostInfo(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        suggestedPostInfo:
            SuggestedPostInfo.fromJson(json['suggested_post_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "suggested_post_info": suggestedPostInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [suggested_post_info]: The new information about the suggested post
  @override
  UpdateMessageSuggestedPostInfo copyWith({
    int? chatId,
    int? messageId,
    SuggestedPostInfo? suggestedPostInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageSuggestedPostInfo(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        suggestedPostInfo: suggestedPostInfo ?? this.suggestedPostInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageSuggestedPostInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageLiveLocationViewed** *(updateMessageLiveLocationViewed)* - child of Update
///
/// A message with a live location was viewed. When the update is received, the application is expected to update the live location.
///
/// * [chatId]: Identifier of the chat with the live location message.
/// * [messageId]: Identifier of the message with live location.
final class UpdateMessageLiveLocationViewed extends Update {
  /// **UpdateMessageLiveLocationViewed** *(updateMessageLiveLocationViewed)* - child of Update
  ///
  /// A message with a live location was viewed. When the update is received, the application is expected to update the live location.
  ///
  /// * [chatId]: Identifier of the chat with the live location message.
  /// * [messageId]: Identifier of the message with live location.
  const UpdateMessageLiveLocationViewed({
    required this.chatId,
    required this.messageId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat with the live location message
  final int chatId;

  /// Identifier of the message with live location
  final int messageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageLiveLocationViewed.fromJson(Map<String, dynamic> json) =>
      UpdateMessageLiveLocationViewed(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the live location message
  /// * [message_id]: Identifier of the message with live location
  @override
  UpdateMessageLiveLocationViewed copyWith({
    int? chatId,
    int? messageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageLiveLocationViewed(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageLiveLocationViewed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateVideoPublished** *(updateVideoPublished)* - child of Update
///
/// An automatically scheduled message with video has been successfully sent after conversion.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the sent message.
final class UpdateVideoPublished extends Update {
  /// **UpdateVideoPublished** *(updateVideoPublished)* - child of Update
  ///
  /// An automatically scheduled message with video has been successfully sent after conversion.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the sent message.
  const UpdateVideoPublished({
    required this.chatId,
    required this.messageId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the sent message
  final int messageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateVideoPublished.fromJson(Map<String, dynamic> json) =>
      UpdateVideoPublished(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the sent message
  @override
  UpdateVideoPublished copyWith({
    int? chatId,
    int? messageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateVideoPublished(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateVideoPublished';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewChat** *(updateNewChat)* - child of Update
///
/// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates.
///
/// * [chat]: The chat.
final class UpdateNewChat extends Update {
  /// **UpdateNewChat** *(updateNewChat)* - child of Update
  ///
  /// A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the application. The chat field changes will be reported through separate updates.
  ///
  /// * [chat]: The chat.
  const UpdateNewChat({
    required this.chat,
    this.extra,
    this.clientId,
  });

  /// The chat
  final Chat chat;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewChat.fromJson(Map<String, dynamic> json) => UpdateNewChat(
        chat: Chat.fromJson(json['chat']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat": chat.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat]: The chat
  @override
  UpdateNewChat copyWith({
    Chat? chat,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewChat(
        chat: chat ?? this.chat,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatTitle** *(updateChatTitle)* - child of Update
///
/// The title of a chat was changed.
///
/// * [chatId]: Chat identifier.
/// * [title]: The new chat title.
final class UpdateChatTitle extends Update {
  /// **UpdateChatTitle** *(updateChatTitle)* - child of Update
  ///
  /// The title of a chat was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [title]: The new chat title.
  const UpdateChatTitle({
    required this.chatId,
    required this.title,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat title
  final String title;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatTitle.fromJson(Map<String, dynamic> json) =>
      UpdateChatTitle(
        chatId: json['chat_id'],
        title: json['title'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [title]: The new chat title
  @override
  UpdateChatTitle copyWith({
    int? chatId,
    String? title,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatTitle(
        chatId: chatId ?? this.chatId,
        title: title ?? this.title,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatPhoto** *(updateChatPhoto)* - child of Update
///
/// A chat photo was changed.
///
/// * [chatId]: Chat identifier.
/// * [photo]: The new chat photo; may be null *(optional)*.
final class UpdateChatPhoto extends Update {
  /// **UpdateChatPhoto** *(updateChatPhoto)* - child of Update
  ///
  /// A chat photo was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [photo]: The new chat photo; may be null *(optional)*.
  const UpdateChatPhoto({
    required this.chatId,
    this.photo,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat photo; may be null
  final ChatPhotoInfo? photo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatPhoto.fromJson(Map<String, dynamic> json) =>
      UpdateChatPhoto(
        chatId: json['chat_id'],
        photo: json['photo'] == null
            ? null
            : ChatPhotoInfo.fromJson(json['photo']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [photo]: The new chat photo; may be null
  @override
  UpdateChatPhoto copyWith({
    int? chatId,
    ChatPhotoInfo? photo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatPhoto(
        chatId: chatId ?? this.chatId,
        photo: photo ?? this.photo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatAccentColors** *(updateChatAccentColors)* - child of Update
///
/// Chat accent colors have changed.
///
/// * [chatId]: Chat identifier.
/// * [accentColorId]: The new chat accent color identifier.
/// * [backgroundCustomEmojiId]: The new identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none.
/// * [upgradedGiftColors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none *(optional)*.
/// * [profileAccentColorId]: The new chat profile accent color identifier; -1 if none.
/// * [profileBackgroundCustomEmojiId]: The new identifier of a custom emoji to be shown on the profile background; 0 if none.
final class UpdateChatAccentColors extends Update {
  /// **UpdateChatAccentColors** *(updateChatAccentColors)* - child of Update
  ///
  /// Chat accent colors have changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [accentColorId]: The new chat accent color identifier.
  /// * [backgroundCustomEmojiId]: The new identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none.
  /// * [upgradedGiftColors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none *(optional)*.
  /// * [profileAccentColorId]: The new chat profile accent color identifier; -1 if none.
  /// * [profileBackgroundCustomEmojiId]: The new identifier of a custom emoji to be shown on the profile background; 0 if none.
  const UpdateChatAccentColors({
    required this.chatId,
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
    this.upgradedGiftColors,
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat accent color identifier
  final int accentColorId;

  /// The new identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
  final int backgroundCustomEmojiId;

  /// Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none
  final UpgradedGiftColors? upgradedGiftColors;

  /// The new chat profile accent color identifier; -1 if none
  final int profileAccentColorId;

  /// The new identifier of a custom emoji to be shown on the profile background; 0 if none
  final int profileBackgroundCustomEmojiId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatAccentColors.fromJson(Map<String, dynamic> json) =>
      UpdateChatAccentColors(
        chatId: json['chat_id'],
        accentColorId: json['accent_color_id'],
        backgroundCustomEmojiId: json['background_custom_emoji_id'] is int
            ? json['background_custom_emoji_id']
            : int.tryParse(json['background_custom_emoji_id'] ?? "") ?? 0,
        upgradedGiftColors: json['upgraded_gift_colors'] == null
            ? null
            : UpgradedGiftColors.fromJson(json['upgraded_gift_colors']),
        profileAccentColorId: json['profile_accent_color_id'],
        profileBackgroundCustomEmojiId:
            json['profile_background_custom_emoji_id'] is int
                ? json['profile_background_custom_emoji_id']
                : int.tryParse(
                        json['profile_background_custom_emoji_id'] ?? "") ??
                    0,
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "accent_color_id": accentColorId,
      "background_custom_emoji_id": backgroundCustomEmojiId,
      "upgraded_gift_colors": upgradedGiftColors?.toJson(),
      "profile_accent_color_id": profileAccentColorId,
      "profile_background_custom_emoji_id": profileBackgroundCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [accent_color_id]: The new chat accent color identifier
  /// * [background_custom_emoji_id]: The new identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
  /// * [upgraded_gift_colors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none
  /// * [profile_accent_color_id]: The new chat profile accent color identifier; -1 if none
  /// * [profile_background_custom_emoji_id]: The new identifier of a custom emoji to be shown on the profile background; 0 if none
  @override
  UpdateChatAccentColors copyWith({
    int? chatId,
    int? accentColorId,
    int? backgroundCustomEmojiId,
    UpgradedGiftColors? upgradedGiftColors,
    int? profileAccentColorId,
    int? profileBackgroundCustomEmojiId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatAccentColors(
        chatId: chatId ?? this.chatId,
        accentColorId: accentColorId ?? this.accentColorId,
        backgroundCustomEmojiId:
            backgroundCustomEmojiId ?? this.backgroundCustomEmojiId,
        upgradedGiftColors: upgradedGiftColors ?? this.upgradedGiftColors,
        profileAccentColorId: profileAccentColorId ?? this.profileAccentColorId,
        profileBackgroundCustomEmojiId: profileBackgroundCustomEmojiId ??
            this.profileBackgroundCustomEmojiId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatAccentColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatPermissions** *(updateChatPermissions)* - child of Update
///
/// Chat permissions were changed.
///
/// * [chatId]: Chat identifier.
/// * [permissions]: The new chat permissions.
final class UpdateChatPermissions extends Update {
  /// **UpdateChatPermissions** *(updateChatPermissions)* - child of Update
  ///
  /// Chat permissions were changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [permissions]: The new chat permissions.
  const UpdateChatPermissions({
    required this.chatId,
    required this.permissions,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat permissions
  final ChatPermissions permissions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatPermissions.fromJson(Map<String, dynamic> json) =>
      UpdateChatPermissions(
        chatId: json['chat_id'],
        permissions: ChatPermissions.fromJson(json['permissions']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "permissions": permissions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [permissions]: The new chat permissions
  @override
  UpdateChatPermissions copyWith({
    int? chatId,
    ChatPermissions? permissions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatPermissions(
        chatId: chatId ?? this.chatId,
        permissions: permissions ?? this.permissions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatPermissions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatLastMessage** *(updateChatLastMessage)* - child of Update
///
/// The last message of a chat was changed.
///
/// * [chatId]: Chat identifier.
/// * [lastMessage]: The new last message in the chat; may be null if the last message became unknown. While the last message is unknown, new messages can be added to the chat without corresponding updateNewMessage update *(optional)*.
/// * [positions]: The new chat positions in the chat lists.
final class UpdateChatLastMessage extends Update {
  /// **UpdateChatLastMessage** *(updateChatLastMessage)* - child of Update
  ///
  /// The last message of a chat was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [lastMessage]: The new last message in the chat; may be null if the last message became unknown. While the last message is unknown, new messages can be added to the chat without corresponding updateNewMessage update *(optional)*.
  /// * [positions]: The new chat positions in the chat lists.
  const UpdateChatLastMessage({
    required this.chatId,
    this.lastMessage,
    required this.positions,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new last message in the chat; may be null if the last message became unknown. While the last message is unknown, new messages can be added to the chat without corresponding updateNewMessage update
  final Message? lastMessage;

  /// The new chat positions in the chat lists
  final List<ChatPosition> positions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatLastMessage.fromJson(Map<String, dynamic> json) =>
      UpdateChatLastMessage(
        chatId: json['chat_id'],
        lastMessage: json['last_message'] == null
            ? null
            : Message.fromJson(json['last_message']),
        positions: List<ChatPosition>.from((json['positions'] ?? [])
            .map((item) => ChatPosition.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "last_message": lastMessage?.toJson(),
      "positions": positions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [last_message]: The new last message in the chat; may be null if the last message became unknown. While the last message is unknown, new messages can be added to the chat without corresponding updateNewMessage update
  /// * [positions]: The new chat positions in the chat lists
  @override
  UpdateChatLastMessage copyWith({
    int? chatId,
    Message? lastMessage,
    List<ChatPosition>? positions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatLastMessage(
        chatId: chatId ?? this.chatId,
        lastMessage: lastMessage ?? this.lastMessage,
        positions: positions ?? this.positions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatLastMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatPosition** *(updateChatPosition)* - child of Update
///
/// The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update.
///
/// * [chatId]: Chat identifier.
/// * [position]: New chat position. If new order is 0, then the chat needs to be removed from the list.
final class UpdateChatPosition extends Update {
  /// **UpdateChatPosition** *(updateChatPosition)* - child of Update
  ///
  /// The position of a chat in a chat list has changed. An updateChatLastMessage or updateChatDraftMessage update might be sent instead of the update.
  ///
  /// * [chatId]: Chat identifier.
  /// * [position]: New chat position. If new order is 0, then the chat needs to be removed from the list.
  const UpdateChatPosition({
    required this.chatId,
    required this.position,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New chat position. If new order is 0, then the chat needs to be removed from the list
  final ChatPosition position;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatPosition.fromJson(Map<String, dynamic> json) =>
      UpdateChatPosition(
        chatId: json['chat_id'],
        position: ChatPosition.fromJson(json['position']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "position": position.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [position]: New chat position. If new order is 0, then the chat needs to be removed from the list
  @override
  UpdateChatPosition copyWith({
    int? chatId,
    ChatPosition? position,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatPosition(
        chatId: chatId ?? this.chatId,
        position: position ?? this.position,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatAddedToList** *(updateChatAddedToList)* - child of Update
///
/// A chat was added to a chat list.
///
/// * [chatId]: Chat identifier.
/// * [chatList]: The chat list to which the chat was added.
final class UpdateChatAddedToList extends Update {
  /// **UpdateChatAddedToList** *(updateChatAddedToList)* - child of Update
  ///
  /// A chat was added to a chat list.
  ///
  /// * [chatId]: Chat identifier.
  /// * [chatList]: The chat list to which the chat was added.
  const UpdateChatAddedToList({
    required this.chatId,
    required this.chatList,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The chat list to which the chat was added
  final ChatList chatList;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatAddedToList.fromJson(Map<String, dynamic> json) =>
      UpdateChatAddedToList(
        chatId: json['chat_id'],
        chatList: ChatList.fromJson(json['chat_list']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "chat_list": chatList.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [chat_list]: The chat list to which the chat was added
  @override
  UpdateChatAddedToList copyWith({
    int? chatId,
    ChatList? chatList,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatAddedToList(
        chatId: chatId ?? this.chatId,
        chatList: chatList ?? this.chatList,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatAddedToList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatRemovedFromList** *(updateChatRemovedFromList)* - child of Update
///
/// A chat was removed from a chat list.
///
/// * [chatId]: Chat identifier.
/// * [chatList]: The chat list from which the chat was removed.
final class UpdateChatRemovedFromList extends Update {
  /// **UpdateChatRemovedFromList** *(updateChatRemovedFromList)* - child of Update
  ///
  /// A chat was removed from a chat list.
  ///
  /// * [chatId]: Chat identifier.
  /// * [chatList]: The chat list from which the chat was removed.
  const UpdateChatRemovedFromList({
    required this.chatId,
    required this.chatList,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The chat list from which the chat was removed
  final ChatList chatList;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatRemovedFromList.fromJson(Map<String, dynamic> json) =>
      UpdateChatRemovedFromList(
        chatId: json['chat_id'],
        chatList: ChatList.fromJson(json['chat_list']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "chat_list": chatList.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [chat_list]: The chat list from which the chat was removed
  @override
  UpdateChatRemovedFromList copyWith({
    int? chatId,
    ChatList? chatList,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatRemovedFromList(
        chatId: chatId ?? this.chatId,
        chatList: chatList ?? this.chatList,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatRemovedFromList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatReadInbox** *(updateChatReadInbox)* - child of Update
///
/// Incoming messages were read or the number of unread messages has been changed.
///
/// * [chatId]: Chat identifier.
/// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
/// * [unreadCount]: The number of unread messages left in the chat.
final class UpdateChatReadInbox extends Update {
  /// **UpdateChatReadInbox** *(updateChatReadInbox)* - child of Update
  ///
  /// Incoming messages were read or the number of unread messages has been changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
  /// * [unreadCount]: The number of unread messages left in the chat.
  const UpdateChatReadInbox({
    required this.chatId,
    required this.lastReadInboxMessageId,
    required this.unreadCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the last read incoming message
  final int lastReadInboxMessageId;

  /// The number of unread messages left in the chat
  final int unreadCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatReadInbox.fromJson(Map<String, dynamic> json) =>
      UpdateChatReadInbox(
        chatId: json['chat_id'],
        lastReadInboxMessageId: json['last_read_inbox_message_id'],
        unreadCount: json['unread_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "unread_count": unreadCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [last_read_inbox_message_id]: Identifier of the last read incoming message
  /// * [unread_count]: The number of unread messages left in the chat
  @override
  UpdateChatReadInbox copyWith({
    int? chatId,
    int? lastReadInboxMessageId,
    int? unreadCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatReadInbox(
        chatId: chatId ?? this.chatId,
        lastReadInboxMessageId:
            lastReadInboxMessageId ?? this.lastReadInboxMessageId,
        unreadCount: unreadCount ?? this.unreadCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatReadInbox';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatReadOutbox** *(updateChatReadOutbox)* - child of Update
///
/// Outgoing messages were read.
///
/// * [chatId]: Chat identifier.
/// * [lastReadOutboxMessageId]: Identifier of last read outgoing message.
final class UpdateChatReadOutbox extends Update {
  /// **UpdateChatReadOutbox** *(updateChatReadOutbox)* - child of Update
  ///
  /// Outgoing messages were read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [lastReadOutboxMessageId]: Identifier of last read outgoing message.
  const UpdateChatReadOutbox({
    required this.chatId,
    required this.lastReadOutboxMessageId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of last read outgoing message
  final int lastReadOutboxMessageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatReadOutbox.fromJson(Map<String, dynamic> json) =>
      UpdateChatReadOutbox(
        chatId: json['chat_id'],
        lastReadOutboxMessageId: json['last_read_outbox_message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [last_read_outbox_message_id]: Identifier of last read outgoing message
  @override
  UpdateChatReadOutbox copyWith({
    int? chatId,
    int? lastReadOutboxMessageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatReadOutbox(
        chatId: chatId ?? this.chatId,
        lastReadOutboxMessageId:
            lastReadOutboxMessageId ?? this.lastReadOutboxMessageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatReadOutbox';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatActionBar** *(updateChatActionBar)* - child of Update
///
/// The chat action bar was changed.
///
/// * [chatId]: Chat identifier.
/// * [actionBar]: The new value of the action bar; may be null *(optional)*.
final class UpdateChatActionBar extends Update {
  /// **UpdateChatActionBar** *(updateChatActionBar)* - child of Update
  ///
  /// The chat action bar was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [actionBar]: The new value of the action bar; may be null *(optional)*.
  const UpdateChatActionBar({
    required this.chatId,
    this.actionBar,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new value of the action bar; may be null
  final ChatActionBar? actionBar;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatActionBar.fromJson(Map<String, dynamic> json) =>
      UpdateChatActionBar(
        chatId: json['chat_id'],
        actionBar: json['action_bar'] == null
            ? null
            : ChatActionBar.fromJson(json['action_bar']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "action_bar": actionBar?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [action_bar]: The new value of the action bar; may be null
  @override
  UpdateChatActionBar copyWith({
    int? chatId,
    ChatActionBar? actionBar,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatActionBar(
        chatId: chatId ?? this.chatId,
        actionBar: actionBar ?? this.actionBar,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatActionBar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatBusinessBotManageBar** *(updateChatBusinessBotManageBar)* - child of Update
///
/// The bar for managing business bot was changed in a chat.
///
/// * [chatId]: Chat identifier.
/// * [businessBotManageBar]: The new value of the business bot manage bar; may be null *(optional)*.
final class UpdateChatBusinessBotManageBar extends Update {
  /// **UpdateChatBusinessBotManageBar** *(updateChatBusinessBotManageBar)* - child of Update
  ///
  /// The bar for managing business bot was changed in a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [businessBotManageBar]: The new value of the business bot manage bar; may be null *(optional)*.
  const UpdateChatBusinessBotManageBar({
    required this.chatId,
    this.businessBotManageBar,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new value of the business bot manage bar; may be null
  final BusinessBotManageBar? businessBotManageBar;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatBusinessBotManageBar.fromJson(Map<String, dynamic> json) =>
      UpdateChatBusinessBotManageBar(
        chatId: json['chat_id'],
        businessBotManageBar: json['business_bot_manage_bar'] == null
            ? null
            : BusinessBotManageBar.fromJson(json['business_bot_manage_bar']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "business_bot_manage_bar": businessBotManageBar?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [business_bot_manage_bar]: The new value of the business bot manage bar; may be null
  @override
  UpdateChatBusinessBotManageBar copyWith({
    int? chatId,
    BusinessBotManageBar? businessBotManageBar,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatBusinessBotManageBar(
        chatId: chatId ?? this.chatId,
        businessBotManageBar: businessBotManageBar ?? this.businessBotManageBar,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatBusinessBotManageBar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatAvailableReactions** *(updateChatAvailableReactions)* - child of Update
///
/// The chat available reactions were changed.
///
/// * [chatId]: Chat identifier.
/// * [availableReactions]: The new reactions, available in the chat.
final class UpdateChatAvailableReactions extends Update {
  /// **UpdateChatAvailableReactions** *(updateChatAvailableReactions)* - child of Update
  ///
  /// The chat available reactions were changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [availableReactions]: The new reactions, available in the chat.
  const UpdateChatAvailableReactions({
    required this.chatId,
    required this.availableReactions,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new reactions, available in the chat
  final ChatAvailableReactions availableReactions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatAvailableReactions.fromJson(Map<String, dynamic> json) =>
      UpdateChatAvailableReactions(
        chatId: json['chat_id'],
        availableReactions:
            ChatAvailableReactions.fromJson(json['available_reactions']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "available_reactions": availableReactions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [available_reactions]: The new reactions, available in the chat
  @override
  UpdateChatAvailableReactions copyWith({
    int? chatId,
    ChatAvailableReactions? availableReactions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatAvailableReactions(
        chatId: chatId ?? this.chatId,
        availableReactions: availableReactions ?? this.availableReactions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatAvailableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatDraftMessage** *(updateChatDraftMessage)* - child of Update
///
/// A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied.
///
/// * [chatId]: Chat identifier.
/// * [draftMessage]: The new draft message; may be null if none *(optional)*.
/// * [positions]: The new chat positions in the chat lists.
final class UpdateChatDraftMessage extends Update {
  /// **UpdateChatDraftMessage** *(updateChatDraftMessage)* - child of Update
  ///
  /// A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update mustn't be applied.
  ///
  /// * [chatId]: Chat identifier.
  /// * [draftMessage]: The new draft message; may be null if none *(optional)*.
  /// * [positions]: The new chat positions in the chat lists.
  const UpdateChatDraftMessage({
    required this.chatId,
    this.draftMessage,
    required this.positions,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new draft message; may be null if none
  final DraftMessage? draftMessage;

  /// The new chat positions in the chat lists
  final List<ChatPosition> positions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatDraftMessage.fromJson(Map<String, dynamic> json) =>
      UpdateChatDraftMessage(
        chatId: json['chat_id'],
        draftMessage: json['draft_message'] == null
            ? null
            : DraftMessage.fromJson(json['draft_message']),
        positions: List<ChatPosition>.from((json['positions'] ?? [])
            .map((item) => ChatPosition.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "draft_message": draftMessage?.toJson(),
      "positions": positions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [draft_message]: The new draft message; may be null if none
  /// * [positions]: The new chat positions in the chat lists
  @override
  UpdateChatDraftMessage copyWith({
    int? chatId,
    DraftMessage? draftMessage,
    List<ChatPosition>? positions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatDraftMessage(
        chatId: chatId ?? this.chatId,
        draftMessage: draftMessage ?? this.draftMessage,
        positions: positions ?? this.positions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatDraftMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatEmojiStatus** *(updateChatEmojiStatus)* - child of Update
///
/// Chat emoji status has changed.
///
/// * [chatId]: Chat identifier.
/// * [emojiStatus]: The new chat emoji status; may be null *(optional)*.
final class UpdateChatEmojiStatus extends Update {
  /// **UpdateChatEmojiStatus** *(updateChatEmojiStatus)* - child of Update
  ///
  /// Chat emoji status has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [emojiStatus]: The new chat emoji status; may be null *(optional)*.
  const UpdateChatEmojiStatus({
    required this.chatId,
    this.emojiStatus,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat emoji status; may be null
  final EmojiStatus? emojiStatus;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatEmojiStatus.fromJson(Map<String, dynamic> json) =>
      UpdateChatEmojiStatus(
        chatId: json['chat_id'],
        emojiStatus: json['emoji_status'] == null
            ? null
            : EmojiStatus.fromJson(json['emoji_status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "emoji_status": emojiStatus?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [emoji_status]: The new chat emoji status; may be null
  @override
  UpdateChatEmojiStatus copyWith({
    int? chatId,
    EmojiStatus? emojiStatus,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatEmojiStatus(
        chatId: chatId ?? this.chatId,
        emojiStatus: emojiStatus ?? this.emojiStatus,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatMessageSender** *(updateChatMessageSender)* - child of Update
///
/// The message sender that is selected to send messages in a chat has changed.
///
/// * [chatId]: Chat identifier.
/// * [messageSenderId]: New value of message_sender_id; may be null if the user can't change message sender *(optional)*.
final class UpdateChatMessageSender extends Update {
  /// **UpdateChatMessageSender** *(updateChatMessageSender)* - child of Update
  ///
  /// The message sender that is selected to send messages in a chat has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageSenderId]: New value of message_sender_id; may be null if the user can't change message sender *(optional)*.
  const UpdateChatMessageSender({
    required this.chatId,
    this.messageSenderId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of message_sender_id; may be null if the user can't change message sender
  final MessageSender? messageSenderId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatMessageSender.fromJson(Map<String, dynamic> json) =>
      UpdateChatMessageSender(
        chatId: json['chat_id'],
        messageSenderId: json['message_sender_id'] == null
            ? null
            : MessageSender.fromJson(json['message_sender_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_sender_id": messageSenderId?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_sender_id]: New value of message_sender_id; may be null if the user can't change message sender
  @override
  UpdateChatMessageSender copyWith({
    int? chatId,
    MessageSender? messageSenderId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatMessageSender(
        chatId: chatId ?? this.chatId,
        messageSenderId: messageSenderId ?? this.messageSenderId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatMessageSender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatMessageAutoDeleteTime** *(updateChatMessageAutoDeleteTime)* - child of Update
///
/// The message auto-delete or self-destruct timer setting for a chat was changed.
///
/// * [chatId]: Chat identifier.
/// * [messageAutoDeleteTime]: New value of message_auto_delete_time.
final class UpdateChatMessageAutoDeleteTime extends Update {
  /// **UpdateChatMessageAutoDeleteTime** *(updateChatMessageAutoDeleteTime)* - child of Update
  ///
  /// The message auto-delete or self-destruct timer setting for a chat was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageAutoDeleteTime]: New value of message_auto_delete_time.
  const UpdateChatMessageAutoDeleteTime({
    required this.chatId,
    required this.messageAutoDeleteTime,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of message_auto_delete_time
  final int messageAutoDeleteTime;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatMessageAutoDeleteTime.fromJson(Map<String, dynamic> json) =>
      UpdateChatMessageAutoDeleteTime(
        chatId: json['chat_id'],
        messageAutoDeleteTime: json['message_auto_delete_time'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_auto_delete_time": messageAutoDeleteTime,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_auto_delete_time]: New value of message_auto_delete_time
  @override
  UpdateChatMessageAutoDeleteTime copyWith({
    int? chatId,
    int? messageAutoDeleteTime,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatMessageAutoDeleteTime(
        chatId: chatId ?? this.chatId,
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatMessageAutoDeleteTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatNotificationSettings** *(updateChatNotificationSettings)* - child of Update
///
/// Notification settings for a chat were changed.
///
/// * [chatId]: Chat identifier.
/// * [notificationSettings]: The new notification settings.
final class UpdateChatNotificationSettings extends Update {
  /// **UpdateChatNotificationSettings** *(updateChatNotificationSettings)* - child of Update
  ///
  /// Notification settings for a chat were changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [notificationSettings]: The new notification settings.
  const UpdateChatNotificationSettings({
    required this.chatId,
    required this.notificationSettings,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new notification settings
  final ChatNotificationSettings notificationSettings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatNotificationSettings.fromJson(Map<String, dynamic> json) =>
      UpdateChatNotificationSettings(
        chatId: json['chat_id'],
        notificationSettings:
            ChatNotificationSettings.fromJson(json['notification_settings']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "notification_settings": notificationSettings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [notification_settings]: The new notification settings
  @override
  UpdateChatNotificationSettings copyWith({
    int? chatId,
    ChatNotificationSettings? notificationSettings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatNotificationSettings(
        chatId: chatId ?? this.chatId,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatPendingJoinRequests** *(updateChatPendingJoinRequests)* - child of Update
///
/// The chat pending join requests were changed.
///
/// * [chatId]: Chat identifier.
/// * [pendingJoinRequests]: The new data about pending join requests; may be null *(optional)*.
final class UpdateChatPendingJoinRequests extends Update {
  /// **UpdateChatPendingJoinRequests** *(updateChatPendingJoinRequests)* - child of Update
  ///
  /// The chat pending join requests were changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [pendingJoinRequests]: The new data about pending join requests; may be null *(optional)*.
  const UpdateChatPendingJoinRequests({
    required this.chatId,
    this.pendingJoinRequests,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new data about pending join requests; may be null
  final ChatJoinRequestsInfo? pendingJoinRequests;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatPendingJoinRequests.fromJson(Map<String, dynamic> json) =>
      UpdateChatPendingJoinRequests(
        chatId: json['chat_id'],
        pendingJoinRequests: json['pending_join_requests'] == null
            ? null
            : ChatJoinRequestsInfo.fromJson(json['pending_join_requests']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "pending_join_requests": pendingJoinRequests?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [pending_join_requests]: The new data about pending join requests; may be null
  @override
  UpdateChatPendingJoinRequests copyWith({
    int? chatId,
    ChatJoinRequestsInfo? pendingJoinRequests,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatPendingJoinRequests(
        chatId: chatId ?? this.chatId,
        pendingJoinRequests: pendingJoinRequests ?? this.pendingJoinRequests,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatPendingJoinRequests';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatReplyMarkup** *(updateChatReplyMarkup)* - child of Update
///
/// The chat reply markup was changed.
///
/// * [chatId]: Chat identifier.
/// * [replyMarkupMessage]: The message from which the reply markup must be used; may be null if there is no default reply markup in the chat *(optional)*.
final class UpdateChatReplyMarkup extends Update {
  /// **UpdateChatReplyMarkup** *(updateChatReplyMarkup)* - child of Update
  ///
  /// The chat reply markup was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [replyMarkupMessage]: The message from which the reply markup must be used; may be null if there is no default reply markup in the chat *(optional)*.
  const UpdateChatReplyMarkup({
    required this.chatId,
    this.replyMarkupMessage,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The message from which the reply markup must be used; may be null if there is no default reply markup in the chat
  final Message? replyMarkupMessage;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatReplyMarkup.fromJson(Map<String, dynamic> json) =>
      UpdateChatReplyMarkup(
        chatId: json['chat_id'],
        replyMarkupMessage: json['reply_markup_message'] == null
            ? null
            : Message.fromJson(json['reply_markup_message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "reply_markup_message": replyMarkupMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [reply_markup_message]: The message from which the reply markup must be used; may be null if there is no default reply markup in the chat
  @override
  UpdateChatReplyMarkup copyWith({
    int? chatId,
    Message? replyMarkupMessage,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatReplyMarkup(
        chatId: chatId ?? this.chatId,
        replyMarkupMessage: replyMarkupMessage ?? this.replyMarkupMessage,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatReplyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatBackground** *(updateChatBackground)* - child of Update
///
/// The chat background was changed.
///
/// * [chatId]: Chat identifier.
/// * [background]: The new chat background; may be null if background was reset to default *(optional)*.
final class UpdateChatBackground extends Update {
  /// **UpdateChatBackground** *(updateChatBackground)* - child of Update
  ///
  /// The chat background was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [background]: The new chat background; may be null if background was reset to default *(optional)*.
  const UpdateChatBackground({
    required this.chatId,
    this.background,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new chat background; may be null if background was reset to default
  final ChatBackground? background;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatBackground.fromJson(Map<String, dynamic> json) =>
      UpdateChatBackground(
        chatId: json['chat_id'],
        background: json['background'] == null
            ? null
            : ChatBackground.fromJson(json['background']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "background": background?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [background]: The new chat background; may be null if background was reset to default
  @override
  UpdateChatBackground copyWith({
    int? chatId,
    ChatBackground? background,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatBackground(
        chatId: chatId ?? this.chatId,
        background: background ?? this.background,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatTheme** *(updateChatTheme)* - child of Update
///
/// The chat theme was changed.
///
/// * [chatId]: Chat identifier.
/// * [theme]: The new theme of the chat; may be null if theme was reset to default *(optional)*.
final class UpdateChatTheme extends Update {
  /// **UpdateChatTheme** *(updateChatTheme)* - child of Update
  ///
  /// The chat theme was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [theme]: The new theme of the chat; may be null if theme was reset to default *(optional)*.
  const UpdateChatTheme({
    required this.chatId,
    this.theme,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new theme of the chat; may be null if theme was reset to default
  final ChatTheme? theme;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatTheme.fromJson(Map<String, dynamic> json) =>
      UpdateChatTheme(
        chatId: json['chat_id'],
        theme: json['theme'] == null ? null : ChatTheme.fromJson(json['theme']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "theme": theme?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [theme]: The new theme of the chat; may be null if theme was reset to default
  @override
  UpdateChatTheme copyWith({
    int? chatId,
    ChatTheme? theme,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatTheme(
        chatId: chatId ?? this.chatId,
        theme: theme ?? this.theme,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatUnreadMentionCount** *(updateChatUnreadMentionCount)* - child of Update
///
/// The chat unread_mention_count has changed.
///
/// * [chatId]: Chat identifier.
/// * [unreadMentionCount]: The number of unread mention messages left in the chat.
final class UpdateChatUnreadMentionCount extends Update {
  /// **UpdateChatUnreadMentionCount** *(updateChatUnreadMentionCount)* - child of Update
  ///
  /// The chat unread_mention_count has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [unreadMentionCount]: The number of unread mention messages left in the chat.
  const UpdateChatUnreadMentionCount({
    required this.chatId,
    required this.unreadMentionCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The number of unread mention messages left in the chat
  final int unreadMentionCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatUnreadMentionCount.fromJson(Map<String, dynamic> json) =>
      UpdateChatUnreadMentionCount(
        chatId: json['chat_id'],
        unreadMentionCount: json['unread_mention_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "unread_mention_count": unreadMentionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [unread_mention_count]: The number of unread mention messages left in the chat
  @override
  UpdateChatUnreadMentionCount copyWith({
    int? chatId,
    int? unreadMentionCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatUnreadMentionCount(
        chatId: chatId ?? this.chatId,
        unreadMentionCount: unreadMentionCount ?? this.unreadMentionCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatUnreadMentionCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatUnreadReactionCount** *(updateChatUnreadReactionCount)* - child of Update
///
/// The chat unread_reaction_count has changed.
///
/// * [chatId]: Chat identifier.
/// * [unreadReactionCount]: The number of messages with unread reactions left in the chat.
final class UpdateChatUnreadReactionCount extends Update {
  /// **UpdateChatUnreadReactionCount** *(updateChatUnreadReactionCount)* - child of Update
  ///
  /// The chat unread_reaction_count has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [unreadReactionCount]: The number of messages with unread reactions left in the chat.
  const UpdateChatUnreadReactionCount({
    required this.chatId,
    required this.unreadReactionCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The number of messages with unread reactions left in the chat
  final int unreadReactionCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatUnreadReactionCount.fromJson(Map<String, dynamic> json) =>
      UpdateChatUnreadReactionCount(
        chatId: json['chat_id'],
        unreadReactionCount: json['unread_reaction_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "unread_reaction_count": unreadReactionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [unread_reaction_count]: The number of messages with unread reactions left in the chat
  @override
  UpdateChatUnreadReactionCount copyWith({
    int? chatId,
    int? unreadReactionCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatUnreadReactionCount(
        chatId: chatId ?? this.chatId,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatUnreadReactionCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatUnreadPollVoteCount** *(updateChatUnreadPollVoteCount)* - child of Update
///
/// The chat unread_poll_vote_count has changed.
///
/// * [chatId]: Chat identifier.
/// * [unreadPollVoteCount]: The number of messages with unread poll votes left in the chat.
final class UpdateChatUnreadPollVoteCount extends Update {
  /// **UpdateChatUnreadPollVoteCount** *(updateChatUnreadPollVoteCount)* - child of Update
  ///
  /// The chat unread_poll_vote_count has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [unreadPollVoteCount]: The number of messages with unread poll votes left in the chat.
  const UpdateChatUnreadPollVoteCount({
    required this.chatId,
    required this.unreadPollVoteCount,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The number of messages with unread poll votes left in the chat
  final int unreadPollVoteCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatUnreadPollVoteCount.fromJson(Map<String, dynamic> json) =>
      UpdateChatUnreadPollVoteCount(
        chatId: json['chat_id'],
        unreadPollVoteCount: json['unread_poll_vote_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "unread_poll_vote_count": unreadPollVoteCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [unread_poll_vote_count]: The number of messages with unread poll votes left in the chat
  @override
  UpdateChatUnreadPollVoteCount copyWith({
    int? chatId,
    int? unreadPollVoteCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatUnreadPollVoteCount(
        chatId: chatId ?? this.chatId,
        unreadPollVoteCount: unreadPollVoteCount ?? this.unreadPollVoteCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatUnreadPollVoteCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatVideoChat** *(updateChatVideoChat)* - child of Update
///
/// A chat video chat state has changed.
///
/// * [chatId]: Chat identifier.
/// * [videoChat]: New value of video_chat.
final class UpdateChatVideoChat extends Update {
  /// **UpdateChatVideoChat** *(updateChatVideoChat)* - child of Update
  ///
  /// A chat video chat state has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [videoChat]: New value of video_chat.
  const UpdateChatVideoChat({
    required this.chatId,
    required this.videoChat,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of video_chat
  final VideoChat videoChat;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatVideoChat.fromJson(Map<String, dynamic> json) =>
      UpdateChatVideoChat(
        chatId: json['chat_id'],
        videoChat: VideoChat.fromJson(json['video_chat']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "video_chat": videoChat.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [video_chat]: New value of video_chat
  @override
  UpdateChatVideoChat copyWith({
    int? chatId,
    VideoChat? videoChat,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatVideoChat(
        chatId: chatId ?? this.chatId,
        videoChat: videoChat ?? this.videoChat,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatVideoChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatDefaultDisableNotification** *(updateChatDefaultDisableNotification)* - child of Update
///
/// The value of the default disable_notification parameter, used when a message is sent to the chat, was changed.
///
/// * [chatId]: Chat identifier.
/// * [defaultDisableNotification]: The new default_disable_notification value.
final class UpdateChatDefaultDisableNotification extends Update {
  /// **UpdateChatDefaultDisableNotification** *(updateChatDefaultDisableNotification)* - child of Update
  ///
  /// The value of the default disable_notification parameter, used when a message is sent to the chat, was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [defaultDisableNotification]: The new default_disable_notification value.
  const UpdateChatDefaultDisableNotification({
    required this.chatId,
    required this.defaultDisableNotification,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The new default_disable_notification value
  final bool defaultDisableNotification;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatDefaultDisableNotification.fromJson(
          Map<String, dynamic> json) =>
      UpdateChatDefaultDisableNotification(
        chatId: json['chat_id'],
        defaultDisableNotification: json['default_disable_notification'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "default_disable_notification": defaultDisableNotification,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [default_disable_notification]: The new default_disable_notification value
  @override
  UpdateChatDefaultDisableNotification copyWith({
    int? chatId,
    bool? defaultDisableNotification,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatDefaultDisableNotification(
        chatId: chatId ?? this.chatId,
        defaultDisableNotification:
            defaultDisableNotification ?? this.defaultDisableNotification,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatDefaultDisableNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatHasProtectedContent** *(updateChatHasProtectedContent)* - child of Update
///
/// A chat content was allowed or restricted for saving.
///
/// * [chatId]: Chat identifier.
/// * [hasProtectedContent]: New value of has_protected_content.
final class UpdateChatHasProtectedContent extends Update {
  /// **UpdateChatHasProtectedContent** *(updateChatHasProtectedContent)* - child of Update
  ///
  /// A chat content was allowed or restricted for saving.
  ///
  /// * [chatId]: Chat identifier.
  /// * [hasProtectedContent]: New value of has_protected_content.
  const UpdateChatHasProtectedContent({
    required this.chatId,
    required this.hasProtectedContent,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of has_protected_content
  final bool hasProtectedContent;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatHasProtectedContent.fromJson(Map<String, dynamic> json) =>
      UpdateChatHasProtectedContent(
        chatId: json['chat_id'],
        hasProtectedContent: json['has_protected_content'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "has_protected_content": hasProtectedContent,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [has_protected_content]: New value of has_protected_content
  @override
  UpdateChatHasProtectedContent copyWith({
    int? chatId,
    bool? hasProtectedContent,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatHasProtectedContent(
        chatId: chatId ?? this.chatId,
        hasProtectedContent: hasProtectedContent ?? this.hasProtectedContent,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatHasProtectedContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatIsTranslatable** *(updateChatIsTranslatable)* - child of Update
///
/// Translation of chat messages was enabled or disabled.
///
/// * [chatId]: Chat identifier.
/// * [isTranslatable]: New value of is_translatable.
final class UpdateChatIsTranslatable extends Update {
  /// **UpdateChatIsTranslatable** *(updateChatIsTranslatable)* - child of Update
  ///
  /// Translation of chat messages was enabled or disabled.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isTranslatable]: New value of is_translatable.
  const UpdateChatIsTranslatable({
    required this.chatId,
    required this.isTranslatable,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of is_translatable
  final bool isTranslatable;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatIsTranslatable.fromJson(Map<String, dynamic> json) =>
      UpdateChatIsTranslatable(
        chatId: json['chat_id'],
        isTranslatable: json['is_translatable'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_translatable": isTranslatable,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_translatable]: New value of is_translatable
  @override
  UpdateChatIsTranslatable copyWith({
    int? chatId,
    bool? isTranslatable,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatIsTranslatable(
        chatId: chatId ?? this.chatId,
        isTranslatable: isTranslatable ?? this.isTranslatable,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatIsTranslatable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatIsMarkedAsUnread** *(updateChatIsMarkedAsUnread)* - child of Update
///
/// A chat was marked as unread or was read.
///
/// * [chatId]: Chat identifier.
/// * [isMarkedAsUnread]: New value of is_marked_as_unread.
final class UpdateChatIsMarkedAsUnread extends Update {
  /// **UpdateChatIsMarkedAsUnread** *(updateChatIsMarkedAsUnread)* - child of Update
  ///
  /// A chat was marked as unread or was read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isMarkedAsUnread]: New value of is_marked_as_unread.
  const UpdateChatIsMarkedAsUnread({
    required this.chatId,
    required this.isMarkedAsUnread,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of is_marked_as_unread
  final bool isMarkedAsUnread;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatIsMarkedAsUnread.fromJson(Map<String, dynamic> json) =>
      UpdateChatIsMarkedAsUnread(
        chatId: json['chat_id'],
        isMarkedAsUnread: json['is_marked_as_unread'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_marked_as_unread": isMarkedAsUnread,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_marked_as_unread]: New value of is_marked_as_unread
  @override
  UpdateChatIsMarkedAsUnread copyWith({
    int? chatId,
    bool? isMarkedAsUnread,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatIsMarkedAsUnread(
        chatId: chatId ?? this.chatId,
        isMarkedAsUnread: isMarkedAsUnread ?? this.isMarkedAsUnread,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatIsMarkedAsUnread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatViewAsTopics** *(updateChatViewAsTopics)* - child of Update
///
/// A chat default appearance has changed.
///
/// * [chatId]: Chat identifier.
/// * [viewAsTopics]: New value of view_as_topics.
final class UpdateChatViewAsTopics extends Update {
  /// **UpdateChatViewAsTopics** *(updateChatViewAsTopics)* - child of Update
  ///
  /// A chat default appearance has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [viewAsTopics]: New value of view_as_topics.
  const UpdateChatViewAsTopics({
    required this.chatId,
    required this.viewAsTopics,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of view_as_topics
  final bool viewAsTopics;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatViewAsTopics.fromJson(Map<String, dynamic> json) =>
      UpdateChatViewAsTopics(
        chatId: json['chat_id'],
        viewAsTopics: json['view_as_topics'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "view_as_topics": viewAsTopics,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [view_as_topics]: New value of view_as_topics
  @override
  UpdateChatViewAsTopics copyWith({
    int? chatId,
    bool? viewAsTopics,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatViewAsTopics(
        chatId: chatId ?? this.chatId,
        viewAsTopics: viewAsTopics ?? this.viewAsTopics,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatViewAsTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatBlockList** *(updateChatBlockList)* - child of Update
///
/// A chat was blocked or unblocked.
///
/// * [chatId]: Chat identifier.
/// * [blockList]: Block list to which the chat is added; may be null if none *(optional)*.
final class UpdateChatBlockList extends Update {
  /// **UpdateChatBlockList** *(updateChatBlockList)* - child of Update
  ///
  /// A chat was blocked or unblocked.
  ///
  /// * [chatId]: Chat identifier.
  /// * [blockList]: Block list to which the chat is added; may be null if none *(optional)*.
  const UpdateChatBlockList({
    required this.chatId,
    this.blockList,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Block list to which the chat is added; may be null if none
  final BlockList? blockList;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatBlockList.fromJson(Map<String, dynamic> json) =>
      UpdateChatBlockList(
        chatId: json['chat_id'],
        blockList: json['block_list'] == null
            ? null
            : BlockList.fromJson(json['block_list']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "block_list": blockList?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [block_list]: Block list to which the chat is added; may be null if none
  @override
  UpdateChatBlockList copyWith({
    int? chatId,
    BlockList? blockList,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatBlockList(
        chatId: chatId ?? this.chatId,
        blockList: blockList ?? this.blockList,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatBlockList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatHasScheduledMessages** *(updateChatHasScheduledMessages)* - child of Update
///
/// A chat's has_scheduled_messages field has changed.
///
/// * [chatId]: Chat identifier.
/// * [hasScheduledMessages]: New value of has_scheduled_messages.
final class UpdateChatHasScheduledMessages extends Update {
  /// **UpdateChatHasScheduledMessages** *(updateChatHasScheduledMessages)* - child of Update
  ///
  /// A chat's has_scheduled_messages field has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [hasScheduledMessages]: New value of has_scheduled_messages.
  const UpdateChatHasScheduledMessages({
    required this.chatId,
    required this.hasScheduledMessages,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of has_scheduled_messages
  final bool hasScheduledMessages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatHasScheduledMessages.fromJson(Map<String, dynamic> json) =>
      UpdateChatHasScheduledMessages(
        chatId: json['chat_id'],
        hasScheduledMessages: json['has_scheduled_messages'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "has_scheduled_messages": hasScheduledMessages,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [has_scheduled_messages]: New value of has_scheduled_messages
  @override
  UpdateChatHasScheduledMessages copyWith({
    int? chatId,
    bool? hasScheduledMessages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatHasScheduledMessages(
        chatId: chatId ?? this.chatId,
        hasScheduledMessages: hasScheduledMessages ?? this.hasScheduledMessages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatHasScheduledMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatHasWelcomeMessages** *(updateChatHasWelcomeMessages)* - child of Update
///
/// A chat's has_welcome_messages field has changed.
///
/// * [chatId]: Chat identifier.
/// * [hasWelcomeMessages]: New value of has_welcome_messages.
final class UpdateChatHasWelcomeMessages extends Update {
  /// **UpdateChatHasWelcomeMessages** *(updateChatHasWelcomeMessages)* - child of Update
  ///
  /// A chat's has_welcome_messages field has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [hasWelcomeMessages]: New value of has_welcome_messages.
  const UpdateChatHasWelcomeMessages({
    required this.chatId,
    required this.hasWelcomeMessages,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New value of has_welcome_messages
  final bool hasWelcomeMessages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatHasWelcomeMessages.fromJson(Map<String, dynamic> json) =>
      UpdateChatHasWelcomeMessages(
        chatId: json['chat_id'],
        hasWelcomeMessages: json['has_welcome_messages'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "has_welcome_messages": hasWelcomeMessages,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [has_welcome_messages]: New value of has_welcome_messages
  @override
  UpdateChatHasWelcomeMessages copyWith({
    int? chatId,
    bool? hasWelcomeMessages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatHasWelcomeMessages(
        chatId: chatId ?? this.chatId,
        hasWelcomeMessages: hasWelcomeMessages ?? this.hasWelcomeMessages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatHasWelcomeMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatFolders** *(updateChatFolders)* - child of Update
///
/// The list of chat folders or a chat folder has changed.
///
/// * [chatFolders]: The new list of chat folders.
/// * [mainChatListPosition]: Position of the main chat list among chat folders, 0-based.
/// * [areTagsEnabled]: True, if folder tags are enabled.
final class UpdateChatFolders extends Update {
  /// **UpdateChatFolders** *(updateChatFolders)* - child of Update
  ///
  /// The list of chat folders or a chat folder has changed.
  ///
  /// * [chatFolders]: The new list of chat folders.
  /// * [mainChatListPosition]: Position of the main chat list among chat folders, 0-based.
  /// * [areTagsEnabled]: True, if folder tags are enabled.
  const UpdateChatFolders({
    required this.chatFolders,
    required this.mainChatListPosition,
    required this.areTagsEnabled,
    this.extra,
    this.clientId,
  });

  /// The new list of chat folders
  final List<ChatFolderInfo> chatFolders;

  /// Position of the main chat list among chat folders, 0-based
  final int mainChatListPosition;

  /// True, if folder tags are enabled
  final bool areTagsEnabled;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatFolders.fromJson(Map<String, dynamic> json) =>
      UpdateChatFolders(
        chatFolders: List<ChatFolderInfo>.from((json['chat_folders'] ?? [])
            .map((item) => ChatFolderInfo.fromJson(item))
            .toList()),
        mainChatListPosition: json['main_chat_list_position'],
        areTagsEnabled: json['are_tags_enabled'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_folders": chatFolders.map((i) => i.toJson()).toList(),
      "main_chat_list_position": mainChatListPosition,
      "are_tags_enabled": areTagsEnabled,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folders]: The new list of chat folders
  /// * [main_chat_list_position]: Position of the main chat list among chat folders, 0-based
  /// * [are_tags_enabled]: True, if folder tags are enabled
  @override
  UpdateChatFolders copyWith({
    List<ChatFolderInfo>? chatFolders,
    int? mainChatListPosition,
    bool? areTagsEnabled,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatFolders(
        chatFolders: chatFolders ?? this.chatFolders,
        mainChatListPosition: mainChatListPosition ?? this.mainChatListPosition,
        areTagsEnabled: areTagsEnabled ?? this.areTagsEnabled,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatFolders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatOnlineMemberCount** *(updateChatOnlineMemberCount)* - child of Update
///
/// The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats.. There is no guarantee that it is sent just after the number of online users has changed.
///
/// * [chatId]: Identifier of the chat.
/// * [onlineMemberCount]: New number of online members in the chat, or 0 if unknown.
final class UpdateChatOnlineMemberCount extends Update {
  /// **UpdateChatOnlineMemberCount** *(updateChatOnlineMemberCount)* - child of Update
  ///
  /// The number of online group members has changed. This update with non-zero number of online group members is sent only for currently opened chats.. There is no guarantee that it is sent just after the number of online users has changed.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [onlineMemberCount]: New number of online members in the chat, or 0 if unknown.
  const UpdateChatOnlineMemberCount({
    required this.chatId,
    required this.onlineMemberCount,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat
  final int chatId;

  /// New number of online members in the chat, or 0 if unknown
  final int onlineMemberCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatOnlineMemberCount.fromJson(Map<String, dynamic> json) =>
      UpdateChatOnlineMemberCount(
        chatId: json['chat_id'],
        onlineMemberCount: json['online_member_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "online_member_count": onlineMemberCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [online_member_count]: New number of online members in the chat, or 0 if unknown
  @override
  UpdateChatOnlineMemberCount copyWith({
    int? chatId,
    int? onlineMemberCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatOnlineMemberCount(
        chatId: chatId ?? this.chatId,
        onlineMemberCount: onlineMemberCount ?? this.onlineMemberCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatOnlineMemberCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSavedMessagesTopic** *(updateSavedMessagesTopic)* - child of Update
///
/// Basic information about a Saved Messages topic has changed. This update is guaranteed to come before the topic identifier is returned to the application.
///
/// * [topic]: New data about the topic.
final class UpdateSavedMessagesTopic extends Update {
  /// **UpdateSavedMessagesTopic** *(updateSavedMessagesTopic)* - child of Update
  ///
  /// Basic information about a Saved Messages topic has changed. This update is guaranteed to come before the topic identifier is returned to the application.
  ///
  /// * [topic]: New data about the topic.
  const UpdateSavedMessagesTopic({
    required this.topic,
    this.extra,
    this.clientId,
  });

  /// New data about the topic
  final SavedMessagesTopic topic;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSavedMessagesTopic.fromJson(Map<String, dynamic> json) =>
      UpdateSavedMessagesTopic(
        topic: SavedMessagesTopic.fromJson(json['topic']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic": topic.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic]: New data about the topic
  @override
  UpdateSavedMessagesTopic copyWith({
    SavedMessagesTopic? topic,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSavedMessagesTopic(
        topic: topic ?? this.topic,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSavedMessagesTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSavedMessagesTopicCount** *(updateSavedMessagesTopicCount)* - child of Update
///
/// Number of Saved Messages topics has changed.
///
/// * [topicCount]: Approximate total number of Saved Messages topics.
final class UpdateSavedMessagesTopicCount extends Update {
  /// **UpdateSavedMessagesTopicCount** *(updateSavedMessagesTopicCount)* - child of Update
  ///
  /// Number of Saved Messages topics has changed.
  ///
  /// * [topicCount]: Approximate total number of Saved Messages topics.
  const UpdateSavedMessagesTopicCount({
    required this.topicCount,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of Saved Messages topics
  final int topicCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSavedMessagesTopicCount.fromJson(Map<String, dynamic> json) =>
      UpdateSavedMessagesTopicCount(
        topicCount: json['topic_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_count": topicCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_count]: Approximate total number of Saved Messages topics
  @override
  UpdateSavedMessagesTopicCount copyWith({
    int? topicCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSavedMessagesTopicCount(
        topicCount: topicCount ?? this.topicCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSavedMessagesTopicCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDirectMessagesChatTopic** *(updateDirectMessagesChatTopic)* - child of Update
///
/// Basic information about a topic in a channel direct messages chat administered by the current user has changed. This update is guaranteed to come before the topic identifier is returned to the application.
///
/// * [topic]: New data about the topic.
final class UpdateDirectMessagesChatTopic extends Update {
  /// **UpdateDirectMessagesChatTopic** *(updateDirectMessagesChatTopic)* - child of Update
  ///
  /// Basic information about a topic in a channel direct messages chat administered by the current user has changed. This update is guaranteed to come before the topic identifier is returned to the application.
  ///
  /// * [topic]: New data about the topic.
  const UpdateDirectMessagesChatTopic({
    required this.topic,
    this.extra,
    this.clientId,
  });

  /// New data about the topic
  final DirectMessagesChatTopic topic;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDirectMessagesChatTopic.fromJson(Map<String, dynamic> json) =>
      UpdateDirectMessagesChatTopic(
        topic: DirectMessagesChatTopic.fromJson(json['topic']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic": topic.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic]: New data about the topic
  @override
  UpdateDirectMessagesChatTopic copyWith({
    DirectMessagesChatTopic? topic,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDirectMessagesChatTopic(
        topic: topic ?? this.topic,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDirectMessagesChatTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTopicMessageCount** *(updateTopicMessageCount)* - child of Update
///
/// Number of messages in a topic has changed; for Saved Messages and channel direct messages chat topics only.
///
/// * [chatId]: Identifier of the chat in topic of which the number of messages has changed.
/// * [topicId]: Identifier of the topic.
/// * [messageCount]: Approximate number of messages in the topic.
final class UpdateTopicMessageCount extends Update {
  /// **UpdateTopicMessageCount** *(updateTopicMessageCount)* - child of Update
  ///
  /// Number of messages in a topic has changed; for Saved Messages and channel direct messages chat topics only.
  ///
  /// * [chatId]: Identifier of the chat in topic of which the number of messages has changed.
  /// * [topicId]: Identifier of the topic.
  /// * [messageCount]: Approximate number of messages in the topic.
  const UpdateTopicMessageCount({
    required this.chatId,
    required this.topicId,
    required this.messageCount,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat in topic of which the number of messages has changed
  final int chatId;

  /// Identifier of the topic
  final MessageTopic topicId;

  /// Approximate number of messages in the topic
  final int messageCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTopicMessageCount.fromJson(Map<String, dynamic> json) =>
      UpdateTopicMessageCount(
        chatId: json['chat_id'],
        topicId: MessageTopic.fromJson(json['topic_id']),
        messageCount: json['message_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId.toJson(),
      "message_count": messageCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in topic of which the number of messages has changed
  /// * [topic_id]: Identifier of the topic
  /// * [message_count]: Approximate number of messages in the topic
  @override
  UpdateTopicMessageCount copyWith({
    int? chatId,
    MessageTopic? topicId,
    int? messageCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTopicMessageCount(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        messageCount: messageCount ?? this.messageCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTopicMessageCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateQuickReplyShortcut** *(updateQuickReplyShortcut)* - child of Update
///
/// Basic information about a quick reply shortcut has changed. This update is guaranteed to come before the quick shortcut name is returned to the application.
///
/// * [shortcut]: New data about the shortcut.
final class UpdateQuickReplyShortcut extends Update {
  /// **UpdateQuickReplyShortcut** *(updateQuickReplyShortcut)* - child of Update
  ///
  /// Basic information about a quick reply shortcut has changed. This update is guaranteed to come before the quick shortcut name is returned to the application.
  ///
  /// * [shortcut]: New data about the shortcut.
  const UpdateQuickReplyShortcut({
    required this.shortcut,
    this.extra,
    this.clientId,
  });

  /// New data about the shortcut
  final QuickReplyShortcut shortcut;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateQuickReplyShortcut.fromJson(Map<String, dynamic> json) =>
      UpdateQuickReplyShortcut(
        shortcut: QuickReplyShortcut.fromJson(json['shortcut']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut": shortcut.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut]: New data about the shortcut
  @override
  UpdateQuickReplyShortcut copyWith({
    QuickReplyShortcut? shortcut,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateQuickReplyShortcut(
        shortcut: shortcut ?? this.shortcut,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateQuickReplyShortcut';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateQuickReplyShortcutDeleted** *(updateQuickReplyShortcutDeleted)* - child of Update
///
/// A quick reply shortcut and all its messages were deleted.
///
/// * [shortcutId]: The identifier of the deleted shortcut.
final class UpdateQuickReplyShortcutDeleted extends Update {
  /// **UpdateQuickReplyShortcutDeleted** *(updateQuickReplyShortcutDeleted)* - child of Update
  ///
  /// A quick reply shortcut and all its messages were deleted.
  ///
  /// * [shortcutId]: The identifier of the deleted shortcut.
  const UpdateQuickReplyShortcutDeleted({
    required this.shortcutId,
    this.extra,
    this.clientId,
  });

  /// The identifier of the deleted shortcut
  final int shortcutId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateQuickReplyShortcutDeleted.fromJson(Map<String, dynamic> json) =>
      UpdateQuickReplyShortcutDeleted(
        shortcutId: json['shortcut_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: The identifier of the deleted shortcut
  @override
  UpdateQuickReplyShortcutDeleted copyWith({
    int? shortcutId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateQuickReplyShortcutDeleted(
        shortcutId: shortcutId ?? this.shortcutId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateQuickReplyShortcutDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateQuickReplyShortcuts** *(updateQuickReplyShortcuts)* - child of Update
///
/// The list of quick reply shortcuts has changed.
///
/// * [shortcutIds]: The new list of identifiers of quick reply shortcuts.
final class UpdateQuickReplyShortcuts extends Update {
  /// **UpdateQuickReplyShortcuts** *(updateQuickReplyShortcuts)* - child of Update
  ///
  /// The list of quick reply shortcuts has changed.
  ///
  /// * [shortcutIds]: The new list of identifiers of quick reply shortcuts.
  const UpdateQuickReplyShortcuts({
    required this.shortcutIds,
    this.extra,
    this.clientId,
  });

  /// The new list of identifiers of quick reply shortcuts
  final List<int> shortcutIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateQuickReplyShortcuts.fromJson(Map<String, dynamic> json) =>
      UpdateQuickReplyShortcuts(
        shortcutIds: List<int>.from(
            (json['shortcut_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut_ids": shortcutIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_ids]: The new list of identifiers of quick reply shortcuts
  @override
  UpdateQuickReplyShortcuts copyWith({
    List<int>? shortcutIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateQuickReplyShortcuts(
        shortcutIds: shortcutIds ?? this.shortcutIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateQuickReplyShortcuts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateQuickReplyShortcutMessages** *(updateQuickReplyShortcutMessages)* - child of Update
///
/// The list of quick reply shortcut messages has changed.
///
/// * [shortcutId]: The identifier of the shortcut.
/// * [messages]: The new list of quick reply messages for the shortcut in order from the first to the last sent.
final class UpdateQuickReplyShortcutMessages extends Update {
  /// **UpdateQuickReplyShortcutMessages** *(updateQuickReplyShortcutMessages)* - child of Update
  ///
  /// The list of quick reply shortcut messages has changed.
  ///
  /// * [shortcutId]: The identifier of the shortcut.
  /// * [messages]: The new list of quick reply messages for the shortcut in order from the first to the last sent.
  const UpdateQuickReplyShortcutMessages({
    required this.shortcutId,
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// The identifier of the shortcut
  final int shortcutId;

  /// The new list of quick reply messages for the shortcut in order from the first to the last sent
  final List<QuickReplyMessage> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateQuickReplyShortcutMessages.fromJson(
          Map<String, dynamic> json) =>
      UpdateQuickReplyShortcutMessages(
        shortcutId: json['shortcut_id'],
        messages: List<QuickReplyMessage>.from((json['messages'] ?? [])
            .map((item) => QuickReplyMessage.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "messages": messages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: The identifier of the shortcut
  /// * [messages]: The new list of quick reply messages for the shortcut in order from the first to the last sent
  @override
  UpdateQuickReplyShortcutMessages copyWith({
    int? shortcutId,
    List<QuickReplyMessage>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateQuickReplyShortcutMessages(
        shortcutId: shortcutId ?? this.shortcutId,
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateQuickReplyShortcutMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatWelcomeMessages** *(updateChatWelcomeMessages)* - child of Update
///
/// The list of welcome messages of a chat has changed.
///
/// * [chatId]: The identifier of the chat.
/// * [messages]: The new list of welcome messages of the chat in the order from the first to the last sent.
final class UpdateChatWelcomeMessages extends Update {
  /// **UpdateChatWelcomeMessages** *(updateChatWelcomeMessages)* - child of Update
  ///
  /// The list of welcome messages of a chat has changed.
  ///
  /// * [chatId]: The identifier of the chat.
  /// * [messages]: The new list of welcome messages of the chat in the order from the first to the last sent.
  const UpdateChatWelcomeMessages({
    required this.chatId,
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// The identifier of the chat
  final int chatId;

  /// The new list of welcome messages of the chat in the order from the first to the last sent
  final List<WelcomeMessage> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatWelcomeMessages.fromJson(Map<String, dynamic> json) =>
      UpdateChatWelcomeMessages(
        chatId: json['chat_id'],
        messages: List<WelcomeMessage>.from((json['messages'] ?? [])
            .map((item) => WelcomeMessage.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "messages": messages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat
  /// * [messages]: The new list of welcome messages of the chat in the order from the first to the last sent
  @override
  UpdateChatWelcomeMessages copyWith({
    int? chatId,
    List<WelcomeMessage>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatWelcomeMessages(
        chatId: chatId ?? this.chatId,
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatWelcomeMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateForumTopicInfo** *(updateForumTopicInfo)* - child of Update
///
/// Basic information about a topic in a forum chat was changed.
///
/// * [info]: New information about the topic.
final class UpdateForumTopicInfo extends Update {
  /// **UpdateForumTopicInfo** *(updateForumTopicInfo)* - child of Update
  ///
  /// Basic information about a topic in a forum chat was changed.
  ///
  /// * [info]: New information about the topic.
  const UpdateForumTopicInfo({
    required this.info,
    this.extra,
    this.clientId,
  });

  /// New information about the topic
  final ForumTopicInfo info;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateForumTopicInfo.fromJson(Map<String, dynamic> json) =>
      UpdateForumTopicInfo(
        info: ForumTopicInfo.fromJson(json['info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "info": info.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [info]: New information about the topic
  @override
  UpdateForumTopicInfo copyWith({
    ForumTopicInfo? info,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateForumTopicInfo(
        info: info ?? this.info,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateForumTopicInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateForumTopic** *(updateForumTopic)* - child of Update
///
/// Information about a topic in a forum chat was changed.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier of the topic.
/// * [isPinned]: True, if the topic is pinned in the topic list.
/// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
/// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
/// * [unreadMentionCount]: Number of unread messages with a mention/reply in the topic.
/// * [unreadReactionCount]: Number of messages with unread reactions in the topic.
/// * [unreadPollVoteCount]: Number of messages with unread poll votes in the topic.
/// * [notificationSettings]: Notification settings for the topic.
/// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
final class UpdateForumTopic extends Update {
  /// **UpdateForumTopic** *(updateForumTopic)* - child of Update
  ///
  /// Information about a topic in a forum chat was changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier of the topic.
  /// * [isPinned]: True, if the topic is pinned in the topic list.
  /// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
  /// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
  /// * [unreadMentionCount]: Number of unread messages with a mention/reply in the topic.
  /// * [unreadReactionCount]: Number of messages with unread reactions in the topic.
  /// * [unreadPollVoteCount]: Number of messages with unread poll votes in the topic.
  /// * [notificationSettings]: Notification settings for the topic.
  /// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
  const UpdateForumTopic({
    required this.chatId,
    required this.forumTopicId,
    required this.isPinned,
    required this.lastReadInboxMessageId,
    required this.lastReadOutboxMessageId,
    required this.unreadMentionCount,
    required this.unreadReactionCount,
    required this.unreadPollVoteCount,
    required this.notificationSettings,
    this.draftMessage,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier of the topic
  final int forumTopicId;

  /// True, if the topic is pinned in the topic list
  final bool isPinned;

  /// Identifier of the last read incoming message
  final int lastReadInboxMessageId;

  /// Identifier of the last read outgoing message
  final int lastReadOutboxMessageId;

  /// Number of unread messages with a mention/reply in the topic
  final int unreadMentionCount;

  /// Number of messages with unread reactions in the topic
  final int unreadReactionCount;

  /// Number of messages with unread poll votes in the topic
  final int unreadPollVoteCount;

  /// Notification settings for the topic
  final ChatNotificationSettings notificationSettings;

  /// A draft of a message in the topic; may be null if none
  final DraftMessage? draftMessage;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateForumTopic.fromJson(Map<String, dynamic> json) =>
      UpdateForumTopic(
        chatId: json['chat_id'],
        forumTopicId: json['forum_topic_id'],
        isPinned: json['is_pinned'],
        lastReadInboxMessageId: json['last_read_inbox_message_id'],
        lastReadOutboxMessageId: json['last_read_outbox_message_id'],
        unreadMentionCount: json['unread_mention_count'],
        unreadReactionCount: json['unread_reaction_count'],
        unreadPollVoteCount: json['unread_poll_vote_count'],
        notificationSettings:
            ChatNotificationSettings.fromJson(json['notification_settings']),
        draftMessage: json['draft_message'] == null
            ? null
            : DraftMessage.fromJson(json['draft_message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "is_pinned": isPinned,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "unread_mention_count": unreadMentionCount,
      "unread_reaction_count": unreadReactionCount,
      "unread_poll_vote_count": unreadPollVoteCount,
      "notification_settings": notificationSettings.toJson(),
      "draft_message": draftMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: Forum topic identifier of the topic
  /// * [is_pinned]: True, if the topic is pinned in the topic list
  /// * [last_read_inbox_message_id]: Identifier of the last read incoming message
  /// * [last_read_outbox_message_id]: Identifier of the last read outgoing message
  /// * [unread_mention_count]: Number of unread messages with a mention/reply in the topic
  /// * [unread_reaction_count]: Number of messages with unread reactions in the topic
  /// * [unread_poll_vote_count]: Number of messages with unread poll votes in the topic
  /// * [notification_settings]: Notification settings for the topic
  /// * [draft_message]: A draft of a message in the topic; may be null if none
  @override
  UpdateForumTopic copyWith({
    int? chatId,
    int? forumTopicId,
    bool? isPinned,
    int? lastReadInboxMessageId,
    int? lastReadOutboxMessageId,
    int? unreadMentionCount,
    int? unreadReactionCount,
    int? unreadPollVoteCount,
    ChatNotificationSettings? notificationSettings,
    DraftMessage? draftMessage,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateForumTopic(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        isPinned: isPinned ?? this.isPinned,
        lastReadInboxMessageId:
            lastReadInboxMessageId ?? this.lastReadInboxMessageId,
        lastReadOutboxMessageId:
            lastReadOutboxMessageId ?? this.lastReadOutboxMessageId,
        unreadMentionCount: unreadMentionCount ?? this.unreadMentionCount,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        unreadPollVoteCount: unreadPollVoteCount ?? this.unreadPollVoteCount,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        draftMessage: draftMessage ?? this.draftMessage,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateForumTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateScopeNotificationSettings** *(updateScopeNotificationSettings)* - child of Update
///
/// Notification settings for some type of chats were updated.
///
/// * [scope]: Types of chats for which notification settings were updated.
/// * [notificationSettings]: The new notification settings.
final class UpdateScopeNotificationSettings extends Update {
  /// **UpdateScopeNotificationSettings** *(updateScopeNotificationSettings)* - child of Update
  ///
  /// Notification settings for some type of chats were updated.
  ///
  /// * [scope]: Types of chats for which notification settings were updated.
  /// * [notificationSettings]: The new notification settings.
  const UpdateScopeNotificationSettings({
    required this.scope,
    required this.notificationSettings,
    this.extra,
    this.clientId,
  });

  /// Types of chats for which notification settings were updated
  final NotificationSettingsScope scope;

  /// The new notification settings
  final ScopeNotificationSettings notificationSettings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateScopeNotificationSettings.fromJson(Map<String, dynamic> json) =>
      UpdateScopeNotificationSettings(
        scope: NotificationSettingsScope.fromJson(json['scope']),
        notificationSettings:
            ScopeNotificationSettings.fromJson(json['notification_settings']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "scope": scope.toJson(),
      "notification_settings": notificationSettings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: Types of chats for which notification settings were updated
  /// * [notification_settings]: The new notification settings
  @override
  UpdateScopeNotificationSettings copyWith({
    NotificationSettingsScope? scope,
    ScopeNotificationSettings? notificationSettings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateScopeNotificationSettings(
        scope: scope ?? this.scope,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateScopeNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateReactionNotificationSettings** *(updateReactionNotificationSettings)* - child of Update
///
/// Notification settings for reactions were updated.
///
/// * [notificationSettings]: The new notification settings.
final class UpdateReactionNotificationSettings extends Update {
  /// **UpdateReactionNotificationSettings** *(updateReactionNotificationSettings)* - child of Update
  ///
  /// Notification settings for reactions were updated.
  ///
  /// * [notificationSettings]: The new notification settings.
  const UpdateReactionNotificationSettings({
    required this.notificationSettings,
    this.extra,
    this.clientId,
  });

  /// The new notification settings
  final ReactionNotificationSettings notificationSettings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateReactionNotificationSettings.fromJson(
          Map<String, dynamic> json) =>
      UpdateReactionNotificationSettings(
        notificationSettings: ReactionNotificationSettings.fromJson(
            json['notification_settings']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "notification_settings": notificationSettings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_settings]: The new notification settings
  @override
  UpdateReactionNotificationSettings copyWith({
    ReactionNotificationSettings? notificationSettings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateReactionNotificationSettings(
        notificationSettings: notificationSettings ?? this.notificationSettings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateReactionNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNotification** *(updateNotification)* - child of Update
///
/// A notification was changed.
///
/// * [notificationGroupId]: Unique notification group identifier.
/// * [notification]: Changed notification.
final class UpdateNotification extends Update {
  /// **UpdateNotification** *(updateNotification)* - child of Update
  ///
  /// A notification was changed.
  ///
  /// * [notificationGroupId]: Unique notification group identifier.
  /// * [notification]: Changed notification.
  const UpdateNotification({
    required this.notificationGroupId,
    required this.notification,
    this.extra,
    this.clientId,
  });

  /// Unique notification group identifier
  final int notificationGroupId;

  /// Changed notification
  final Notification notification;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNotification.fromJson(Map<String, dynamic> json) =>
      UpdateNotification(
        notificationGroupId: json['notification_group_id'],
        notification: Notification.fromJson(json['notification']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "notification_group_id": notificationGroupId,
      "notification": notification.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_group_id]: Unique notification group identifier
  /// * [notification]: Changed notification
  @override
  UpdateNotification copyWith({
    int? notificationGroupId,
    Notification? notification,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNotification(
        notificationGroupId: notificationGroupId ?? this.notificationGroupId,
        notification: notification ?? this.notification,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNotificationGroup** *(updateNotificationGroup)* - child of Update
///
/// A list of active notifications in a notification group has changed.
///
/// * [notificationGroupId]: Unique notification group identifier.
/// * [type]: New type of the notification group.
/// * [chatId]: Identifier of a chat to which all notifications in the group belong.
/// * [notificationSettingsChatId]: Chat identifier, which notification settings must be applied to the added notifications.
/// * [notificationSoundId]: Identifier of the notification sound to be played; 0 if sound is disabled.
/// * [totalCount]: Total number of unread notifications in the group, can be bigger than number of active notifications.
/// * [addedNotifications]: List of added group notifications, sorted by notification identifier.
/// * [removedNotificationIds]: Identifiers of removed group notifications, sorted by notification identifier.
final class UpdateNotificationGroup extends Update {
  /// **UpdateNotificationGroup** *(updateNotificationGroup)* - child of Update
  ///
  /// A list of active notifications in a notification group has changed.
  ///
  /// * [notificationGroupId]: Unique notification group identifier.
  /// * [type]: New type of the notification group.
  /// * [chatId]: Identifier of a chat to which all notifications in the group belong.
  /// * [notificationSettingsChatId]: Chat identifier, which notification settings must be applied to the added notifications.
  /// * [notificationSoundId]: Identifier of the notification sound to be played; 0 if sound is disabled.
  /// * [totalCount]: Total number of unread notifications in the group, can be bigger than number of active notifications.
  /// * [addedNotifications]: List of added group notifications, sorted by notification identifier.
  /// * [removedNotificationIds]: Identifiers of removed group notifications, sorted by notification identifier.
  const UpdateNotificationGroup({
    required this.notificationGroupId,
    required this.type,
    required this.chatId,
    required this.notificationSettingsChatId,
    required this.notificationSoundId,
    required this.totalCount,
    required this.addedNotifications,
    required this.removedNotificationIds,
    this.extra,
    this.clientId,
  });

  /// Unique notification group identifier
  final int notificationGroupId;

  /// New type of the notification group
  final NotificationGroupType type;

  /// Identifier of a chat to which all notifications in the group belong
  final int chatId;

  /// Chat identifier, which notification settings must be applied to the added notifications
  final int notificationSettingsChatId;

  /// Identifier of the notification sound to be played; 0 if sound is disabled
  final int notificationSoundId;

  /// Total number of unread notifications in the group, can be bigger than number of active notifications
  final int totalCount;

  /// List of added group notifications, sorted by notification identifier
  final List<Notification> addedNotifications;

  /// Identifiers of removed group notifications, sorted by notification identifier
  final List<int> removedNotificationIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNotificationGroup.fromJson(Map<String, dynamic> json) =>
      UpdateNotificationGroup(
        notificationGroupId: json['notification_group_id'],
        type: NotificationGroupType.fromJson(json['type']),
        chatId: json['chat_id'],
        notificationSettingsChatId: json['notification_settings_chat_id'],
        notificationSoundId: json['notification_sound_id'] is int
            ? json['notification_sound_id']
            : int.parse(json['notification_sound_id']),
        totalCount: json['total_count'],
        addedNotifications: List<Notification>.from(
            (json['added_notifications'] ?? [])
                .map((item) => Notification.fromJson(item))
                .toList()),
        removedNotificationIds: List<int>.from(
            (json['removed_notification_ids'] ?? [])
                .map((item) => item)
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "notification_group_id": notificationGroupId,
      "type": type.toJson(),
      "chat_id": chatId,
      "notification_settings_chat_id": notificationSettingsChatId,
      "notification_sound_id": notificationSoundId,
      "total_count": totalCount,
      "added_notifications": addedNotifications.map((i) => i.toJson()).toList(),
      "removed_notification_ids": removedNotificationIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_group_id]: Unique notification group identifier
  /// * [type]: New type of the notification group
  /// * [chat_id]: Identifier of a chat to which all notifications in the group belong
  /// * [notification_settings_chat_id]: Chat identifier, which notification settings must be applied to the added notifications
  /// * [notification_sound_id]: Identifier of the notification sound to be played; 0 if sound is disabled
  /// * [total_count]: Total number of unread notifications in the group, can be bigger than number of active notifications
  /// * [added_notifications]: List of added group notifications, sorted by notification identifier
  /// * [removed_notification_ids]: Identifiers of removed group notifications, sorted by notification identifier
  @override
  UpdateNotificationGroup copyWith({
    int? notificationGroupId,
    NotificationGroupType? type,
    int? chatId,
    int? notificationSettingsChatId,
    int? notificationSoundId,
    int? totalCount,
    List<Notification>? addedNotifications,
    List<int>? removedNotificationIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNotificationGroup(
        notificationGroupId: notificationGroupId ?? this.notificationGroupId,
        type: type ?? this.type,
        chatId: chatId ?? this.chatId,
        notificationSettingsChatId:
            notificationSettingsChatId ?? this.notificationSettingsChatId,
        notificationSoundId: notificationSoundId ?? this.notificationSoundId,
        totalCount: totalCount ?? this.totalCount,
        addedNotifications: addedNotifications ?? this.addedNotifications,
        removedNotificationIds:
            removedNotificationIds ?? this.removedNotificationIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNotificationGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateActiveNotifications** *(updateActiveNotifications)* - child of Update
///
/// Contains active notifications that were shown on previous application launches. This update is sent only. if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update.
///
/// * [groups]: Lists of active notification groups.
final class UpdateActiveNotifications extends Update {
  /// **UpdateActiveNotifications** *(updateActiveNotifications)* - child of Update
  ///
  /// Contains active notifications that were shown on previous application launches. This update is sent only. if the message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update.
  ///
  /// * [groups]: Lists of active notification groups.
  const UpdateActiveNotifications({
    required this.groups,
    this.extra,
    this.clientId,
  });

  /// Lists of active notification groups
  final List<NotificationGroup> groups;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateActiveNotifications.fromJson(Map<String, dynamic> json) =>
      UpdateActiveNotifications(
        groups: List<NotificationGroup>.from((json['groups'] ?? [])
            .map((item) => NotificationGroup.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "groups": groups.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [groups]: Lists of active notification groups
  @override
  UpdateActiveNotifications copyWith({
    List<NotificationGroup>? groups,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateActiveNotifications(
        groups: groups ?? this.groups,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateActiveNotifications';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateHavePendingNotifications** *(updateHavePendingNotifications)* - child of Update
///
/// Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications.
///
/// * [haveDelayedNotifications]: True, if there are some delayed notification updates, which will be sent soon.
/// * [haveUnreceivedNotifications]: True, if there can be some yet unreceived notifications, which are being fetched from the server.
final class UpdateHavePendingNotifications extends Update {
  /// **UpdateHavePendingNotifications** *(updateHavePendingNotifications)* - child of Update
  ///
  /// Describes whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications.
  ///
  /// * [haveDelayedNotifications]: True, if there are some delayed notification updates, which will be sent soon.
  /// * [haveUnreceivedNotifications]: True, if there can be some yet unreceived notifications, which are being fetched from the server.
  const UpdateHavePendingNotifications({
    required this.haveDelayedNotifications,
    required this.haveUnreceivedNotifications,
    this.extra,
    this.clientId,
  });

  /// True, if there are some delayed notification updates, which will be sent soon
  final bool haveDelayedNotifications;

  /// True, if there can be some yet unreceived notifications, which are being fetched from the server
  final bool haveUnreceivedNotifications;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateHavePendingNotifications.fromJson(Map<String, dynamic> json) =>
      UpdateHavePendingNotifications(
        haveDelayedNotifications: json['have_delayed_notifications'],
        haveUnreceivedNotifications: json['have_unreceived_notifications'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "have_delayed_notifications": haveDelayedNotifications,
      "have_unreceived_notifications": haveUnreceivedNotifications,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [have_delayed_notifications]: True, if there are some delayed notification updates, which will be sent soon
  /// * [have_unreceived_notifications]: True, if there can be some yet unreceived notifications, which are being fetched from the server
  @override
  UpdateHavePendingNotifications copyWith({
    bool? haveDelayedNotifications,
    bool? haveUnreceivedNotifications,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateHavePendingNotifications(
        haveDelayedNotifications:
            haveDelayedNotifications ?? this.haveDelayedNotifications,
        haveUnreceivedNotifications:
            haveUnreceivedNotifications ?? this.haveUnreceivedNotifications,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateHavePendingNotifications';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDeleteMessages** *(updateDeleteMessages)* - child of Update
///
/// Some messages were deleted.
///
/// * [chatId]: Chat identifier.
/// * [messageIds]: Identifiers of the deleted messages.
/// * [isPermanent]: True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible).
/// * [fromCache]: True, if the messages are deleted only from the cache and can possibly be retrieved again in the future.
final class UpdateDeleteMessages extends Update {
  /// **UpdateDeleteMessages** *(updateDeleteMessages)* - child of Update
  ///
  /// Some messages were deleted.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageIds]: Identifiers of the deleted messages.
  /// * [isPermanent]: True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible).
  /// * [fromCache]: True, if the messages are deleted only from the cache and can possibly be retrieved again in the future.
  const UpdateDeleteMessages({
    required this.chatId,
    required this.messageIds,
    required this.isPermanent,
    required this.fromCache,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifiers of the deleted messages
  final List<int> messageIds;

  /// True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
  final bool isPermanent;

  /// True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
  final bool fromCache;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDeleteMessages.fromJson(Map<String, dynamic> json) =>
      UpdateDeleteMessages(
        chatId: json['chat_id'],
        messageIds: List<int>.from(
            (json['message_ids'] ?? []).map((item) => item).toList()),
        isPermanent: json['is_permanent'],
        fromCache: json['from_cache'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_ids": messageIds.map((i) => i).toList(),
      "is_permanent": isPermanent,
      "from_cache": fromCache,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_ids]: Identifiers of the deleted messages
  /// * [is_permanent]: True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
  /// * [from_cache]: True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
  @override
  UpdateDeleteMessages copyWith({
    int? chatId,
    List<int>? messageIds,
    bool? isPermanent,
    bool? fromCache,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDeleteMessages(
        chatId: chatId ?? this.chatId,
        messageIds: messageIds ?? this.messageIds,
        isPermanent: isPermanent ?? this.isPermanent,
        fromCache: fromCache ?? this.fromCache,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDeleteMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatAction** *(updateChatAction)* - child of Update
///
/// A message sender activity in the chat has changed.
///
/// * [chatId]: Chat identifier.
/// * [topicId]: Identifier of the specific topic in which the action was performed; may be null if none *(optional)*.
/// * [senderId]: Identifier of a message sender performing the action.
/// * [action]: The action.
final class UpdateChatAction extends Update {
  /// **UpdateChatAction** *(updateChatAction)* - child of Update
  ///
  /// A message sender activity in the chat has changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [topicId]: Identifier of the specific topic in which the action was performed; may be null if none *(optional)*.
  /// * [senderId]: Identifier of a message sender performing the action.
  /// * [action]: The action.
  const UpdateChatAction({
    required this.chatId,
    this.topicId,
    required this.senderId,
    required this.action,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the specific topic in which the action was performed; may be null if none
  final MessageTopic? topicId;

  /// Identifier of a message sender performing the action
  final MessageSender senderId;

  /// The action
  final ChatAction action;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatAction.fromJson(Map<String, dynamic> json) =>
      UpdateChatAction(
        chatId: json['chat_id'],
        topicId: json['topic_id'] == null
            ? null
            : MessageTopic.fromJson(json['topic_id']),
        senderId: MessageSender.fromJson(json['sender_id']),
        action: ChatAction.fromJson(json['action']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "sender_id": senderId.toJson(),
      "action": action.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [topic_id]: Identifier of the specific topic in which the action was performed; may be null if none
  /// * [sender_id]: Identifier of a message sender performing the action
  /// * [action]: The action
  @override
  UpdateChatAction copyWith({
    int? chatId,
    MessageTopic? topicId,
    MessageSender? senderId,
    ChatAction? action,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatAction(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        senderId: senderId ?? this.senderId,
        action: action ?? this.action,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdatePendingMessage** *(updatePendingMessage)* - child of Update
///
/// A new pending text or rich message was received in a chat with a bot. The message must be shown in the chat for at most getOption("pending_text_message_period") seconds,. replace any other pending message with the same draft_id with animation, and be deleted whenever any incoming message or a pending message with another draft_id is received in the message thread.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: The forum topic identifier in which the message will be sent; 0 if none.
/// * [draftId]: Unique identifier of the message draft within the message thread.
/// * [canStop]: True, if a button that calls stopPendingMessage to stop further message generation must be shown.
/// * [keepOnStop]: True, if the pending message must not be automatically deleted when the user presses the Stop button.
/// * [content]: Content of the message; always of the type messageText or messageRichMessage.
final class UpdatePendingMessage extends Update {
  /// **UpdatePendingMessage** *(updatePendingMessage)* - child of Update
  ///
  /// A new pending text or rich message was received in a chat with a bot. The message must be shown in the chat for at most getOption("pending_text_message_period") seconds,. replace any other pending message with the same draft_id with animation, and be deleted whenever any incoming message or a pending message with another draft_id is received in the message thread.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: The forum topic identifier in which the message will be sent; 0 if none.
  /// * [draftId]: Unique identifier of the message draft within the message thread.
  /// * [canStop]: True, if a button that calls stopPendingMessage to stop further message generation must be shown.
  /// * [keepOnStop]: True, if the pending message must not be automatically deleted when the user presses the Stop button.
  /// * [content]: Content of the message; always of the type messageText or messageRichMessage.
  const UpdatePendingMessage({
    required this.chatId,
    required this.forumTopicId,
    required this.draftId,
    required this.canStop,
    required this.keepOnStop,
    required this.content,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The forum topic identifier in which the message will be sent; 0 if none
  final int forumTopicId;

  /// Unique identifier of the message draft within the message thread
  final int draftId;

  /// True, if a button that calls stopPendingMessage to stop further message generation must be shown
  final bool canStop;

  /// True, if the pending message must not be automatically deleted when the user presses the Stop button
  final bool keepOnStop;

  /// Content of the message; always of the type messageText or messageRichMessage
  final MessageContent content;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdatePendingMessage.fromJson(Map<String, dynamic> json) =>
      UpdatePendingMessage(
        chatId: json['chat_id'],
        forumTopicId: json['forum_topic_id'] ?? 0,
        draftId: json['draft_id'] is int
            ? json['draft_id']
            : int.parse(json['draft_id']),
        canStop: json['can_stop'],
        keepOnStop: json['keep_on_stop'],
        content: MessageContent.fromJson(json['content']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "draft_id": draftId,
      "can_stop": canStop,
      "keep_on_stop": keepOnStop,
      "content": content.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: The forum topic identifier in which the message will be sent; 0 if none
  /// * [draft_id]: Unique identifier of the message draft within the message thread
  /// * [can_stop]: True, if a button that calls stopPendingMessage to stop further message generation must be shown
  /// * [keep_on_stop]: True, if the pending message must not be automatically deleted when the user presses the Stop button
  /// * [content]: Content of the message; always of the type messageText or messageRichMessage
  @override
  UpdatePendingMessage copyWith({
    int? chatId,
    int? forumTopicId,
    int? draftId,
    bool? canStop,
    bool? keepOnStop,
    MessageContent? content,
    dynamic extra,
    int? clientId,
  }) =>
      UpdatePendingMessage(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        draftId: draftId ?? this.draftId,
        canStop: canStop ?? this.canStop,
        keepOnStop: keepOnStop ?? this.keepOnStop,
        content: content ?? this.content,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updatePendingMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStopMessageDraft** *(updateStopMessageDraft)* - child of Update
///
/// A message draft generation was stopped by the user.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: The forum topic identifier of the message draft.
/// * [draftId]: Identifier of the message draft within the message thread.
final class UpdateStopMessageDraft extends Update {
  /// **UpdateStopMessageDraft** *(updateStopMessageDraft)* - child of Update
  ///
  /// A message draft generation was stopped by the user.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: The forum topic identifier of the message draft.
  /// * [draftId]: Identifier of the message draft within the message thread.
  const UpdateStopMessageDraft({
    required this.chatId,
    required this.forumTopicId,
    required this.draftId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// The forum topic identifier of the message draft
  final int forumTopicId;

  /// Identifier of the message draft within the message thread
  final int draftId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStopMessageDraft.fromJson(Map<String, dynamic> json) =>
      UpdateStopMessageDraft(
        chatId: json['chat_id'],
        forumTopicId: json['forum_topic_id'],
        draftId: json['draft_id'] is int
            ? json['draft_id']
            : int.parse(json['draft_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "draft_id": draftId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: The forum topic identifier of the message draft
  /// * [draft_id]: Identifier of the message draft within the message thread
  @override
  UpdateStopMessageDraft copyWith({
    int? chatId,
    int? forumTopicId,
    int? draftId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStopMessageDraft(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        draftId: draftId ?? this.draftId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStopMessageDraft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateCommunity** *(updateCommunity)* - child of Update
///
/// Some data of a community has changed. This update is guaranteed to come before the community identifier is returned to the application.
///
/// * [community]: New data about the community.
final class UpdateCommunity extends Update {
  /// **UpdateCommunity** *(updateCommunity)* - child of Update
  ///
  /// Some data of a community has changed. This update is guaranteed to come before the community identifier is returned to the application.
  ///
  /// * [community]: New data about the community.
  const UpdateCommunity({
    required this.community,
    this.extra,
    this.clientId,
  });

  /// New data about the community
  final Community community;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateCommunity.fromJson(Map<String, dynamic> json) =>
      UpdateCommunity(
        community: Community.fromJson(json['community']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "community": community.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community]: New data about the community
  @override
  UpdateCommunity copyWith({
    Community? community,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateCommunity(
        community: community ?? this.community,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUserStatus** *(updateUserStatus)* - child of Update
///
/// The user went online or offline.
///
/// * [userId]: User identifier.
/// * [status]: New status of the user.
final class UpdateUserStatus extends Update {
  /// **UpdateUserStatus** *(updateUserStatus)* - child of Update
  ///
  /// The user went online or offline.
  ///
  /// * [userId]: User identifier.
  /// * [status]: New status of the user.
  const UpdateUserStatus({
    required this.userId,
    required this.status,
    this.extra,
    this.clientId,
  });

  /// User identifier
  final int userId;

  /// New status of the user
  final UserStatus status;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUserStatus.fromJson(Map<String, dynamic> json) =>
      UpdateUserStatus(
        userId: json['user_id'],
        status: UserStatus.fromJson(json['status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "status": status.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [status]: New status of the user
  @override
  UpdateUserStatus copyWith({
    int? userId,
    UserStatus? status,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUserStatus(
        userId: userId ?? this.userId,
        status: status ?? this.status,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUserStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUser** *(updateUser)* - child of Update
///
/// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application.
///
/// * [user]: New data about the user.
final class UpdateUser extends Update {
  /// **UpdateUser** *(updateUser)* - child of Update
  ///
  /// Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the application.
  ///
  /// * [user]: New data about the user.
  const UpdateUser({
    required this.user,
    this.extra,
    this.clientId,
  });

  /// New data about the user
  final User user;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUser.fromJson(Map<String, dynamic> json) => UpdateUser(
        user: User.fromJson(json['user']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user": user.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user]: New data about the user
  @override
  UpdateUser copyWith({
    User? user,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUser(
        user: user ?? this.user,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateBasicGroup** *(updateBasicGroup)* - child of Update
///
/// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application.
///
/// * [basicGroup]: New data about the group.
final class UpdateBasicGroup extends Update {
  /// **UpdateBasicGroup** *(updateBasicGroup)* - child of Update
  ///
  /// Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the application.
  ///
  /// * [basicGroup]: New data about the group.
  const UpdateBasicGroup({
    required this.basicGroup,
    this.extra,
    this.clientId,
  });

  /// New data about the group
  final BasicGroup basicGroup;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateBasicGroup.fromJson(Map<String, dynamic> json) =>
      UpdateBasicGroup(
        basicGroup: BasicGroup.fromJson(json['basic_group']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "basic_group": basicGroup.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [basic_group]: New data about the group
  @override
  UpdateBasicGroup copyWith({
    BasicGroup? basicGroup,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateBasicGroup(
        basicGroup: basicGroup ?? this.basicGroup,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateBasicGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSupergroup** *(updateSupergroup)* - child of Update
///
/// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application.
///
/// * [supergroup]: New data about the supergroup.
final class UpdateSupergroup extends Update {
  /// **UpdateSupergroup** *(updateSupergroup)* - child of Update
  ///
  /// Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the application.
  ///
  /// * [supergroup]: New data about the supergroup.
  const UpdateSupergroup({
    required this.supergroup,
    this.extra,
    this.clientId,
  });

  /// New data about the supergroup
  final Supergroup supergroup;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSupergroup.fromJson(Map<String, dynamic> json) =>
      UpdateSupergroup(
        supergroup: Supergroup.fromJson(json['supergroup']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "supergroup": supergroup.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup]: New data about the supergroup
  @override
  UpdateSupergroup copyWith({
    Supergroup? supergroup,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSupergroup(
        supergroup: supergroup ?? this.supergroup,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSupergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSecretChat** *(updateSecretChat)* - child of Update
///
/// Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application.
///
/// * [secretChat]: New data about the secret chat.
final class UpdateSecretChat extends Update {
  /// **UpdateSecretChat** *(updateSecretChat)* - child of Update
  ///
  /// Some data of a secret chat has changed. This update is guaranteed to come before the secret chat identifier is returned to the application.
  ///
  /// * [secretChat]: New data about the secret chat.
  const UpdateSecretChat({
    required this.secretChat,
    this.extra,
    this.clientId,
  });

  /// New data about the secret chat
  final SecretChat secretChat;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSecretChat.fromJson(Map<String, dynamic> json) =>
      UpdateSecretChat(
        secretChat: SecretChat.fromJson(json['secret_chat']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "secret_chat": secretChat.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [secret_chat]: New data about the secret chat
  @override
  UpdateSecretChat copyWith({
    SecretChat? secretChat,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSecretChat(
        secretChat: secretChat ?? this.secretChat,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUserFullInfo** *(updateUserFullInfo)* - child of Update
///
/// Some data in userFullInfo has been changed.
///
/// * [userId]: User identifier.
/// * [userFullInfo]: New full information about the user.
final class UpdateUserFullInfo extends Update {
  /// **UpdateUserFullInfo** *(updateUserFullInfo)* - child of Update
  ///
  /// Some data in userFullInfo has been changed.
  ///
  /// * [userId]: User identifier.
  /// * [userFullInfo]: New full information about the user.
  const UpdateUserFullInfo({
    required this.userId,
    required this.userFullInfo,
    this.extra,
    this.clientId,
  });

  /// User identifier
  final int userId;

  /// New full information about the user
  final UserFullInfo userFullInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUserFullInfo.fromJson(Map<String, dynamic> json) =>
      UpdateUserFullInfo(
        userId: json['user_id'],
        userFullInfo: UserFullInfo.fromJson(json['user_full_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "user_full_info": userFullInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [user_full_info]: New full information about the user
  @override
  UpdateUserFullInfo copyWith({
    int? userId,
    UserFullInfo? userFullInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUserFullInfo(
        userId: userId ?? this.userId,
        userFullInfo: userFullInfo ?? this.userFullInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUserFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateBasicGroupFullInfo** *(updateBasicGroupFullInfo)* - child of Update
///
/// Some data in basicGroupFullInfo has been changed.
///
/// * [basicGroupId]: Identifier of a basic group.
/// * [basicGroupFullInfo]: New full information about the group.
final class UpdateBasicGroupFullInfo extends Update {
  /// **UpdateBasicGroupFullInfo** *(updateBasicGroupFullInfo)* - child of Update
  ///
  /// Some data in basicGroupFullInfo has been changed.
  ///
  /// * [basicGroupId]: Identifier of a basic group.
  /// * [basicGroupFullInfo]: New full information about the group.
  const UpdateBasicGroupFullInfo({
    required this.basicGroupId,
    required this.basicGroupFullInfo,
    this.extra,
    this.clientId,
  });

  /// Identifier of a basic group
  final int basicGroupId;

  /// New full information about the group
  final BasicGroupFullInfo basicGroupFullInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateBasicGroupFullInfo.fromJson(Map<String, dynamic> json) =>
      UpdateBasicGroupFullInfo(
        basicGroupId: json['basic_group_id'],
        basicGroupFullInfo:
            BasicGroupFullInfo.fromJson(json['basic_group_full_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "basic_group_id": basicGroupId,
      "basic_group_full_info": basicGroupFullInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [basic_group_id]: Identifier of a basic group
  /// * [basic_group_full_info]: New full information about the group
  @override
  UpdateBasicGroupFullInfo copyWith({
    int? basicGroupId,
    BasicGroupFullInfo? basicGroupFullInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateBasicGroupFullInfo(
        basicGroupId: basicGroupId ?? this.basicGroupId,
        basicGroupFullInfo: basicGroupFullInfo ?? this.basicGroupFullInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateBasicGroupFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSupergroupFullInfo** *(updateSupergroupFullInfo)* - child of Update
///
/// Some data in supergroupFullInfo has been changed.
///
/// * [supergroupId]: Identifier of the supergroup or channel.
/// * [supergroupFullInfo]: New full information about the supergroup.
final class UpdateSupergroupFullInfo extends Update {
  /// **UpdateSupergroupFullInfo** *(updateSupergroupFullInfo)* - child of Update
  ///
  /// Some data in supergroupFullInfo has been changed.
  ///
  /// * [supergroupId]: Identifier of the supergroup or channel.
  /// * [supergroupFullInfo]: New full information about the supergroup.
  const UpdateSupergroupFullInfo({
    required this.supergroupId,
    required this.supergroupFullInfo,
    this.extra,
    this.clientId,
  });

  /// Identifier of the supergroup or channel
  final int supergroupId;

  /// New full information about the supergroup
  final SupergroupFullInfo supergroupFullInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSupergroupFullInfo.fromJson(Map<String, dynamic> json) =>
      UpdateSupergroupFullInfo(
        supergroupId: json['supergroup_id'],
        supergroupFullInfo:
            SupergroupFullInfo.fromJson(json['supergroup_full_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "supergroup_full_info": supergroupFullInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup or channel
  /// * [supergroup_full_info]: New full information about the supergroup
  @override
  UpdateSupergroupFullInfo copyWith({
    int? supergroupId,
    SupergroupFullInfo? supergroupFullInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSupergroupFullInfo(
        supergroupId: supergroupId ?? this.supergroupId,
        supergroupFullInfo: supergroupFullInfo ?? this.supergroupFullInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSupergroupFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateCommunityFullInfo** *(updateCommunityFullInfo)* - child of Update
///
/// Some data in communityFullInfo has been changed.
///
/// * [communityId]: Identifier of the community.
/// * [communityFullInfo]: New full information about the community.
final class UpdateCommunityFullInfo extends Update {
  /// **UpdateCommunityFullInfo** *(updateCommunityFullInfo)* - child of Update
  ///
  /// Some data in communityFullInfo has been changed.
  ///
  /// * [communityId]: Identifier of the community.
  /// * [communityFullInfo]: New full information about the community.
  const UpdateCommunityFullInfo({
    required this.communityId,
    required this.communityFullInfo,
    this.extra,
    this.clientId,
  });

  /// Identifier of the community
  final int communityId;

  /// New full information about the community
  final CommunityFullInfo communityFullInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateCommunityFullInfo.fromJson(Map<String, dynamic> json) =>
      UpdateCommunityFullInfo(
        communityId: json['community_id'],
        communityFullInfo:
            CommunityFullInfo.fromJson(json['community_full_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
      "community_full_info": communityFullInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community
  /// * [community_full_info]: New full information about the community
  @override
  UpdateCommunityFullInfo copyWith({
    int? communityId,
    CommunityFullInfo? communityFullInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateCommunityFullInfo(
        communityId: communityId ?? this.communityId,
        communityFullInfo: communityFullInfo ?? this.communityFullInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateCommunityFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateServiceNotification** *(updateServiceNotification)* - child of Update
///
/// A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification.
///
/// * [type]: Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method.
/// * [content]: Notification content.
final class UpdateServiceNotification extends Update {
  /// **UpdateServiceNotification** *(updateServiceNotification)* - child of Update
  ///
  /// A service notification from the server was received. Upon receiving this the application must show a popup with the content of the notification.
  ///
  /// * [type]: Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method.
  /// * [content]: Notification content.
  const UpdateServiceNotification({
    required this.type,
    required this.content,
    this.extra,
    this.clientId,
  });

  /// Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
  final String type;

  /// Notification content
  final MessageContent content;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateServiceNotification.fromJson(Map<String, dynamic> json) =>
      UpdateServiceNotification(
        type: json['type'],
        content: MessageContent.fromJson(json['content']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type,
      "content": content.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" must be shown under notification; if user presses the second, all local data must be destroyed using Destroy method
  /// * [content]: Notification content
  @override
  UpdateServiceNotification copyWith({
    String? type,
    MessageContent? content,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateServiceNotification(
        type: type ?? this.type,
        content: content ?? this.content,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateServiceNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewOauthRequest** *(updateNewOauthRequest)* - child of Update
///
/// An OAuth authorization request was received.
///
/// * [domain]: A domain of the URL where the user authorizes.
/// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address.
/// * [url]: The URL to pass to getOauthLinkInfo; the link is valid for 60 seconds.
final class UpdateNewOauthRequest extends Update {
  /// **UpdateNewOauthRequest** *(updateNewOauthRequest)* - child of Update
  ///
  /// An OAuth authorization request was received.
  ///
  /// * [domain]: A domain of the URL where the user authorizes.
  /// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address.
  /// * [url]: The URL to pass to getOauthLinkInfo; the link is valid for 60 seconds.
  const UpdateNewOauthRequest({
    required this.domain,
    required this.location,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// A domain of the URL where the user authorizes
  final String domain;

  /// Human-readable description of a country and a region from which the authorization is performed, based on the IP address
  final String location;

  /// The URL to pass to getOauthLinkInfo; the link is valid for 60 seconds
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewOauthRequest.fromJson(Map<String, dynamic> json) =>
      UpdateNewOauthRequest(
        domain: json['domain'],
        location: json['location'],
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "domain": domain,
      "location": location,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [domain]: A domain of the URL where the user authorizes
  /// * [location]: Human-readable description of a country and a region from which the authorization is performed, based on the IP address
  /// * [url]: The URL to pass to getOauthLinkInfo; the link is valid for 60 seconds
  @override
  UpdateNewOauthRequest copyWith({
    String? domain,
    String? location,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewOauthRequest(
        domain: domain ?? this.domain,
        location: location ?? this.location,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewOauthRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFile** *(updateFile)* - child of Update
///
/// Information about a file was updated.
///
/// * [file]: New data about the file.
final class UpdateFile extends Update {
  /// **UpdateFile** *(updateFile)* - child of Update
  ///
  /// Information about a file was updated.
  ///
  /// * [file]: New data about the file.
  const UpdateFile({
    required this.file,
    this.extra,
    this.clientId,
  });

  /// New data about the file
  final File file;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFile.fromJson(Map<String, dynamic> json) => UpdateFile(
        file: File.fromJson(json['file']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file": file.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file]: New data about the file
  @override
  UpdateFile copyWith({
    File? file,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFile(
        file: file ?? this.file,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileGenerationStart** *(updateFileGenerationStart)* - child of Update
///
/// The file generation process needs to be started by the application. Use setFileGenerationProgress and finishFileGeneration to generate the file.
///
/// * [generationId]: Unique identifier for the generation process.
/// * [originalPath]: The original path specified by the application in inputFileGenerated.
/// * [destinationPath]: The path to a file that must be created and where the new file must be generated by the application.. If the application has no access to the path, it can use writeGeneratedFilePart to generate the file.
/// * [conversion]: If the conversion is "#url#", then original_path contains an HTTP/HTTPS URL of a file that must be downloaded by the application.. Otherwise, this is the conversion specified by the application in inputFileGenerated.
final class UpdateFileGenerationStart extends Update {
  /// **UpdateFileGenerationStart** *(updateFileGenerationStart)* - child of Update
  ///
  /// The file generation process needs to be started by the application. Use setFileGenerationProgress and finishFileGeneration to generate the file.
  ///
  /// * [generationId]: Unique identifier for the generation process.
  /// * [originalPath]: The original path specified by the application in inputFileGenerated.
  /// * [destinationPath]: The path to a file that must be created and where the new file must be generated by the application.. If the application has no access to the path, it can use writeGeneratedFilePart to generate the file.
  /// * [conversion]: If the conversion is "#url#", then original_path contains an HTTP/HTTPS URL of a file that must be downloaded by the application.. Otherwise, this is the conversion specified by the application in inputFileGenerated.
  const UpdateFileGenerationStart({
    required this.generationId,
    required this.originalPath,
    required this.destinationPath,
    required this.conversion,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the generation process
  final int generationId;

  /// The original path specified by the application in inputFileGenerated
  final String originalPath;

  /// The path to a file that must be created and where the new file must be generated by the application.. If the application has no access to the path, it can use writeGeneratedFilePart to generate the file
  final String destinationPath;

  /// If the conversion is "#url#", then original_path contains an HTTP/HTTPS URL of a file that must be downloaded by the application.. Otherwise, this is the conversion specified by the application in inputFileGenerated
  final String conversion;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileGenerationStart.fromJson(Map<String, dynamic> json) =>
      UpdateFileGenerationStart(
        generationId: json['generation_id'] is int
            ? json['generation_id']
            : int.parse(json['generation_id']),
        originalPath: json['original_path'],
        destinationPath: json['destination_path'],
        conversion: json['conversion'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "generation_id": generationId,
      "original_path": originalPath,
      "destination_path": destinationPath,
      "conversion": conversion,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [generation_id]: Unique identifier for the generation process
  /// * [original_path]: The original path specified by the application in inputFileGenerated
  /// * [destination_path]: The path to a file that must be created and where the new file must be generated by the application.. If the application has no access to the path, it can use writeGeneratedFilePart to generate the file
  /// * [conversion]: If the conversion is "#url#", then original_path contains an HTTP/HTTPS URL of a file that must be downloaded by the application.. Otherwise, this is the conversion specified by the application in inputFileGenerated
  @override
  UpdateFileGenerationStart copyWith({
    int? generationId,
    String? originalPath,
    String? destinationPath,
    String? conversion,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileGenerationStart(
        generationId: generationId ?? this.generationId,
        originalPath: originalPath ?? this.originalPath,
        destinationPath: destinationPath ?? this.destinationPath,
        conversion: conversion ?? this.conversion,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileGenerationStart';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileGenerationStop** *(updateFileGenerationStop)* - child of Update
///
/// File generation is no longer needed.
///
/// * [generationId]: Unique identifier for the generation process.
final class UpdateFileGenerationStop extends Update {
  /// **UpdateFileGenerationStop** *(updateFileGenerationStop)* - child of Update
  ///
  /// File generation is no longer needed.
  ///
  /// * [generationId]: Unique identifier for the generation process.
  const UpdateFileGenerationStop({
    required this.generationId,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the generation process
  final int generationId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileGenerationStop.fromJson(Map<String, dynamic> json) =>
      UpdateFileGenerationStop(
        generationId: json['generation_id'] is int
            ? json['generation_id']
            : int.parse(json['generation_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "generation_id": generationId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [generation_id]: Unique identifier for the generation process
  @override
  UpdateFileGenerationStop copyWith({
    int? generationId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileGenerationStop(
        generationId: generationId ?? this.generationId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileGenerationStop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileDownloads** *(updateFileDownloads)* - child of Update
///
/// The state of the file download list has changed.
///
/// * [totalSize]: Total size of files in the file download list, in bytes.
/// * [totalCount]: Total number of files in the file download list.
/// * [downloadedSize]: Total downloaded size of files in the file download list, in bytes.
final class UpdateFileDownloads extends Update {
  /// **UpdateFileDownloads** *(updateFileDownloads)* - child of Update
  ///
  /// The state of the file download list has changed.
  ///
  /// * [totalSize]: Total size of files in the file download list, in bytes.
  /// * [totalCount]: Total number of files in the file download list.
  /// * [downloadedSize]: Total downloaded size of files in the file download list, in bytes.
  const UpdateFileDownloads({
    required this.totalSize,
    required this.totalCount,
    required this.downloadedSize,
    this.extra,
    this.clientId,
  });

  /// Total size of files in the file download list, in bytes
  final int totalSize;

  /// Total number of files in the file download list
  final int totalCount;

  /// Total downloaded size of files in the file download list, in bytes
  final int downloadedSize;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileDownloads.fromJson(Map<String, dynamic> json) =>
      UpdateFileDownloads(
        totalSize: json['total_size'],
        totalCount: json['total_count'],
        downloadedSize: json['downloaded_size'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_size": totalSize,
      "total_count": totalCount,
      "downloaded_size": downloadedSize,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_size]: Total size of files in the file download list, in bytes
  /// * [total_count]: Total number of files in the file download list
  /// * [downloaded_size]: Total downloaded size of files in the file download list, in bytes
  @override
  UpdateFileDownloads copyWith({
    int? totalSize,
    int? totalCount,
    int? downloadedSize,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileDownloads(
        totalSize: totalSize ?? this.totalSize,
        totalCount: totalCount ?? this.totalCount,
        downloadedSize: downloadedSize ?? this.downloadedSize,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileDownloads';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileAddedToDownloads** *(updateFileAddedToDownloads)* - child of Update
///
/// A file was added to the file download list. This update is sent only after file download list is loaded for the first time.
///
/// * [fileDownload]: The added file download.
/// * [counts]: New number of being downloaded and recently downloaded files found.
final class UpdateFileAddedToDownloads extends Update {
  /// **UpdateFileAddedToDownloads** *(updateFileAddedToDownloads)* - child of Update
  ///
  /// A file was added to the file download list. This update is sent only after file download list is loaded for the first time.
  ///
  /// * [fileDownload]: The added file download.
  /// * [counts]: New number of being downloaded and recently downloaded files found.
  const UpdateFileAddedToDownloads({
    required this.fileDownload,
    required this.counts,
    this.extra,
    this.clientId,
  });

  /// The added file download
  final FileDownload fileDownload;

  /// New number of being downloaded and recently downloaded files found
  final DownloadedFileCounts counts;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileAddedToDownloads.fromJson(Map<String, dynamic> json) =>
      UpdateFileAddedToDownloads(
        fileDownload: FileDownload.fromJson(json['file_download']),
        counts: DownloadedFileCounts.fromJson(json['counts']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_download": fileDownload.toJson(),
      "counts": counts.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_download]: The added file download
  /// * [counts]: New number of being downloaded and recently downloaded files found
  @override
  UpdateFileAddedToDownloads copyWith({
    FileDownload? fileDownload,
    DownloadedFileCounts? counts,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileAddedToDownloads(
        fileDownload: fileDownload ?? this.fileDownload,
        counts: counts ?? this.counts,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileAddedToDownloads';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileDownload** *(updateFileDownload)* - child of Update
///
/// A file download was changed. This update is sent only after file download list is loaded for the first time.
///
/// * [fileId]: File identifier.
/// * [completeDate]: Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed.
/// * [isPaused]: True, if downloading of the file is paused.
/// * [counts]: New number of being downloaded and recently downloaded files found.
final class UpdateFileDownload extends Update {
  /// **UpdateFileDownload** *(updateFileDownload)* - child of Update
  ///
  /// A file download was changed. This update is sent only after file download list is loaded for the first time.
  ///
  /// * [fileId]: File identifier.
  /// * [completeDate]: Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed.
  /// * [isPaused]: True, if downloading of the file is paused.
  /// * [counts]: New number of being downloaded and recently downloaded files found.
  const UpdateFileDownload({
    required this.fileId,
    required this.completeDate,
    required this.isPaused,
    required this.counts,
    this.extra,
    this.clientId,
  });

  /// File identifier
  final int fileId;

  /// Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
  final int completeDate;

  /// True, if downloading of the file is paused
  final bool isPaused;

  /// New number of being downloaded and recently downloaded files found
  final DownloadedFileCounts counts;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileDownload.fromJson(Map<String, dynamic> json) =>
      UpdateFileDownload(
        fileId: json['file_id'],
        completeDate: json['complete_date'],
        isPaused: json['is_paused'],
        counts: DownloadedFileCounts.fromJson(json['counts']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "complete_date": completeDate,
      "is_paused": isPaused,
      "counts": counts.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: File identifier
  /// * [complete_date]: Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
  /// * [is_paused]: True, if downloading of the file is paused
  /// * [counts]: New number of being downloaded and recently downloaded files found
  @override
  UpdateFileDownload copyWith({
    int? fileId,
    int? completeDate,
    bool? isPaused,
    DownloadedFileCounts? counts,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileDownload(
        fileId: fileId ?? this.fileId,
        completeDate: completeDate ?? this.completeDate,
        isPaused: isPaused ?? this.isPaused,
        counts: counts ?? this.counts,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileDownload';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFileRemovedFromDownloads** *(updateFileRemovedFromDownloads)* - child of Update
///
/// A file was removed from the file download list. This update is sent only after file download list is loaded for the first time.
///
/// * [fileId]: File identifier.
/// * [counts]: New number of being downloaded and recently downloaded files found.
final class UpdateFileRemovedFromDownloads extends Update {
  /// **UpdateFileRemovedFromDownloads** *(updateFileRemovedFromDownloads)* - child of Update
  ///
  /// A file was removed from the file download list. This update is sent only after file download list is loaded for the first time.
  ///
  /// * [fileId]: File identifier.
  /// * [counts]: New number of being downloaded and recently downloaded files found.
  const UpdateFileRemovedFromDownloads({
    required this.fileId,
    required this.counts,
    this.extra,
    this.clientId,
  });

  /// File identifier
  final int fileId;

  /// New number of being downloaded and recently downloaded files found
  final DownloadedFileCounts counts;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFileRemovedFromDownloads.fromJson(Map<String, dynamic> json) =>
      UpdateFileRemovedFromDownloads(
        fileId: json['file_id'],
        counts: DownloadedFileCounts.fromJson(json['counts']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "counts": counts.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: File identifier
  /// * [counts]: New number of being downloaded and recently downloaded files found
  @override
  UpdateFileRemovedFromDownloads copyWith({
    int? fileId,
    DownloadedFileCounts? counts,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFileRemovedFromDownloads(
        fileId: fileId ?? this.fileId,
        counts: counts ?? this.counts,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFileRemovedFromDownloads';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateApplicationVerificationRequired** *(updateApplicationVerificationRequired)* - child of Update
///
/// A request can't be completed unless application verification is performed; for official mobile applications only.. The method setApplicationVerificationToken must be called once the verification is completed or failed.
///
/// * [verificationId]: Unique identifier for the verification process.
/// * [nonce]: Unique base64url-encoded nonce for the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic) for Android,. or a unique string to compare with verify_nonce field from a push notification for iOS.
/// * [cloudProjectNumber]: Cloud project number to pass to the Play Integrity API on Android.
final class UpdateApplicationVerificationRequired extends Update {
  /// **UpdateApplicationVerificationRequired** *(updateApplicationVerificationRequired)* - child of Update
  ///
  /// A request can't be completed unless application verification is performed; for official mobile applications only.. The method setApplicationVerificationToken must be called once the verification is completed or failed.
  ///
  /// * [verificationId]: Unique identifier for the verification process.
  /// * [nonce]: Unique base64url-encoded nonce for the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic) for Android,. or a unique string to compare with verify_nonce field from a push notification for iOS.
  /// * [cloudProjectNumber]: Cloud project number to pass to the Play Integrity API on Android.
  const UpdateApplicationVerificationRequired({
    required this.verificationId,
    required this.nonce,
    required this.cloudProjectNumber,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the verification process
  final int verificationId;

  /// Unique base64url-encoded nonce for the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic) for Android,. or a unique string to compare with verify_nonce field from a push notification for iOS
  final String nonce;

  /// Cloud project number to pass to the Play Integrity API on Android
  final int cloudProjectNumber;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateApplicationVerificationRequired.fromJson(
          Map<String, dynamic> json) =>
      UpdateApplicationVerificationRequired(
        verificationId: json['verification_id'],
        nonce: json['nonce'],
        cloudProjectNumber: json['cloud_project_number'] is int
            ? json['cloud_project_number']
            : int.parse(json['cloud_project_number']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "verification_id": verificationId,
      "nonce": nonce,
      "cloud_project_number": cloudProjectNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [verification_id]: Unique identifier for the verification process
  /// * [nonce]: Unique base64url-encoded nonce for the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic) for Android,. or a unique string to compare with verify_nonce field from a push notification for iOS
  /// * [cloud_project_number]: Cloud project number to pass to the Play Integrity API on Android
  @override
  UpdateApplicationVerificationRequired copyWith({
    int? verificationId,
    String? nonce,
    int? cloudProjectNumber,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateApplicationVerificationRequired(
        verificationId: verificationId ?? this.verificationId,
        nonce: nonce ?? this.nonce,
        cloudProjectNumber: cloudProjectNumber ?? this.cloudProjectNumber,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateApplicationVerificationRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateApplicationRecaptchaVerificationRequired** *(updateApplicationRecaptchaVerificationRequired)* - child of Update
///
/// A request can't be completed unless reCAPTCHA verification is performed; for official mobile applications only.. The method setApplicationVerificationToken must be called once the verification is completed or failed.
///
/// * [verificationId]: Unique identifier for the verification process.
/// * [action]: The action for the check.
/// * [recaptchaKeyId]: Identifier of the reCAPTCHA key.
final class UpdateApplicationRecaptchaVerificationRequired extends Update {
  /// **UpdateApplicationRecaptchaVerificationRequired** *(updateApplicationRecaptchaVerificationRequired)* - child of Update
  ///
  /// A request can't be completed unless reCAPTCHA verification is performed; for official mobile applications only.. The method setApplicationVerificationToken must be called once the verification is completed or failed.
  ///
  /// * [verificationId]: Unique identifier for the verification process.
  /// * [action]: The action for the check.
  /// * [recaptchaKeyId]: Identifier of the reCAPTCHA key.
  const UpdateApplicationRecaptchaVerificationRequired({
    required this.verificationId,
    required this.action,
    required this.recaptchaKeyId,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the verification process
  final int verificationId;

  /// The action for the check
  final String action;

  /// Identifier of the reCAPTCHA key
  final String recaptchaKeyId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateApplicationRecaptchaVerificationRequired.fromJson(
          Map<String, dynamic> json) =>
      UpdateApplicationRecaptchaVerificationRequired(
        verificationId: json['verification_id'],
        action: json['action'],
        recaptchaKeyId: json['recaptcha_key_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "verification_id": verificationId,
      "action": action,
      "recaptcha_key_id": recaptchaKeyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [verification_id]: Unique identifier for the verification process
  /// * [action]: The action for the check
  /// * [recaptcha_key_id]: Identifier of the reCAPTCHA key
  @override
  UpdateApplicationRecaptchaVerificationRequired copyWith({
    int? verificationId,
    String? action,
    String? recaptchaKeyId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateApplicationRecaptchaVerificationRequired(
        verificationId: verificationId ?? this.verificationId,
        action: action ?? this.action,
        recaptchaKeyId: recaptchaKeyId ?? this.recaptchaKeyId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'updateApplicationRecaptchaVerificationRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateCall** *(updateCall)* - child of Update
///
/// New call was created or information about a call was updated.
///
/// * [call]: New data about a call.
final class UpdateCall extends Update {
  /// **UpdateCall** *(updateCall)* - child of Update
  ///
  /// New call was created or information about a call was updated.
  ///
  /// * [call]: New data about a call.
  const UpdateCall({
    required this.call,
    this.extra,
    this.clientId,
  });

  /// New data about a call
  final Call call;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateCall.fromJson(Map<String, dynamic> json) => UpdateCall(
        call: Call.fromJson(json['call']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "call": call.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call]: New data about a call
  @override
  UpdateCall copyWith({
    Call? call,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateCall(
        call: call ?? this.call,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCall** *(updateGroupCall)* - child of Update
///
/// Information about a group call was updated.
///
/// * [groupCall]: New data about the group call.
final class UpdateGroupCall extends Update {
  /// **UpdateGroupCall** *(updateGroupCall)* - child of Update
  ///
  /// Information about a group call was updated.
  ///
  /// * [groupCall]: New data about the group call.
  const UpdateGroupCall({
    required this.groupCall,
    this.extra,
    this.clientId,
  });

  /// New data about the group call
  final GroupCall groupCall;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCall.fromJson(Map<String, dynamic> json) =>
      UpdateGroupCall(
        groupCall: GroupCall.fromJson(json['group_call']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call": groupCall.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call]: New data about the group call
  @override
  UpdateGroupCall copyWith({
    GroupCall? groupCall,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCall(
        groupCall: groupCall ?? this.groupCall,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallParticipant** *(updateGroupCallParticipant)* - child of Update
///
/// Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined.
///
/// * [groupCallId]: Identifier of the group call.
/// * [participant]: New data about the participant.
final class UpdateGroupCallParticipant extends Update {
  /// **UpdateGroupCallParticipant** *(updateGroupCallParticipant)* - child of Update
  ///
  /// Information about a group call participant was changed. The updates are sent only after the group call is received through getGroupCall and only if the call is joined or being joined.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [participant]: New data about the participant.
  const UpdateGroupCallParticipant({
    required this.groupCallId,
    required this.participant,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// New data about the participant
  final GroupCallParticipant participant;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallParticipant.fromJson(Map<String, dynamic> json) =>
      UpdateGroupCallParticipant(
        groupCallId: json['group_call_id'],
        participant: GroupCallParticipant.fromJson(json['participant']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant": participant.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [participant]: New data about the participant
  @override
  UpdateGroupCallParticipant copyWith({
    int? groupCallId,
    GroupCallParticipant? participant,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallParticipant(
        groupCallId: groupCallId ?? this.groupCallId,
        participant: participant ?? this.participant,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallParticipant';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallParticipants** *(updateGroupCallParticipants)* - child of Update
///
/// The list of group call participants that can send and receive encrypted call data has changed; for group calls not bound to a chat only.
///
/// * [groupCallId]: Identifier of the group call.
/// * [participantUserIds]: New list of group call participant user identifiers. The identifiers may be invalid or the corresponding users may be unknown.. The participants must be shown in the list of group call participants even if there is no information about them.
final class UpdateGroupCallParticipants extends Update {
  /// **UpdateGroupCallParticipants** *(updateGroupCallParticipants)* - child of Update
  ///
  /// The list of group call participants that can send and receive encrypted call data has changed; for group calls not bound to a chat only.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [participantUserIds]: New list of group call participant user identifiers. The identifiers may be invalid or the corresponding users may be unknown.. The participants must be shown in the list of group call participants even if there is no information about them.
  const UpdateGroupCallParticipants({
    required this.groupCallId,
    required this.participantUserIds,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// New list of group call participant user identifiers. The identifiers may be invalid or the corresponding users may be unknown.. The participants must be shown in the list of group call participants even if there is no information about them
  final List<int> participantUserIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallParticipants.fromJson(Map<String, dynamic> json) =>
      UpdateGroupCallParticipants(
        groupCallId: json['group_call_id'],
        participantUserIds: List<int>.from((json['participant_user_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_user_ids": participantUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [participant_user_ids]: New list of group call participant user identifiers. The identifiers may be invalid or the corresponding users may be unknown.. The participants must be shown in the list of group call participants even if there is no information about them
  @override
  UpdateGroupCallParticipants copyWith({
    int? groupCallId,
    List<int>? participantUserIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        participantUserIds: participantUserIds ?? this.participantUserIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallVerificationState** *(updateGroupCallVerificationState)* - child of Update
///
/// The verification state of an encrypted group call has changed; for group calls not bound to a chat only.
///
/// * [groupCallId]: Identifier of the group call.
/// * [generation]: The call state generation to which the emoji corresponds. If generation is different for two users, then their emoji may be also different.
/// * [emojis]: Group call state fingerprint represented as 4 emoji; may be empty if the state isn't verified yet.
final class UpdateGroupCallVerificationState extends Update {
  /// **UpdateGroupCallVerificationState** *(updateGroupCallVerificationState)* - child of Update
  ///
  /// The verification state of an encrypted group call has changed; for group calls not bound to a chat only.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [generation]: The call state generation to which the emoji corresponds. If generation is different for two users, then their emoji may be also different.
  /// * [emojis]: Group call state fingerprint represented as 4 emoji; may be empty if the state isn't verified yet.
  const UpdateGroupCallVerificationState({
    required this.groupCallId,
    required this.generation,
    required this.emojis,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// The call state generation to which the emoji corresponds. If generation is different for two users, then their emoji may be also different
  final int generation;

  /// Group call state fingerprint represented as 4 emoji; may be empty if the state isn't verified yet
  final List<String> emojis;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallVerificationState.fromJson(
          Map<String, dynamic> json) =>
      UpdateGroupCallVerificationState(
        groupCallId: json['group_call_id'],
        generation: json['generation'],
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "generation": generation,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [generation]: The call state generation to which the emoji corresponds. If generation is different for two users, then their emoji may be also different
  /// * [emojis]: Group call state fingerprint represented as 4 emoji; may be empty if the state isn't verified yet
  @override
  UpdateGroupCallVerificationState copyWith({
    int? groupCallId,
    int? generation,
    List<String>? emojis,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallVerificationState(
        groupCallId: groupCallId ?? this.groupCallId,
        generation: generation ?? this.generation,
        emojis: emojis ?? this.emojis,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallVerificationState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewGroupCallMessage** *(updateNewGroupCallMessage)* - child of Update
///
/// A new message was received in a group call.
///
/// * [groupCallId]: Identifier of the group call.
/// * [message]: The message.
final class UpdateNewGroupCallMessage extends Update {
  /// **UpdateNewGroupCallMessage** *(updateNewGroupCallMessage)* - child of Update
  ///
  /// A new message was received in a group call.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [message]: The message.
  const UpdateNewGroupCallMessage({
    required this.groupCallId,
    required this.message,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// The message
  final GroupCallMessage message;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewGroupCallMessage.fromJson(Map<String, dynamic> json) =>
      UpdateNewGroupCallMessage(
        groupCallId: json['group_call_id'],
        message: GroupCallMessage.fromJson(json['message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [message]: The message
  @override
  UpdateNewGroupCallMessage copyWith({
    int? groupCallId,
    GroupCallMessage? message,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewGroupCallMessage(
        groupCallId: groupCallId ?? this.groupCallId,
        message: message ?? this.message,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewGroupCallMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewGroupCallPaidReaction** *(updateNewGroupCallPaidReaction)* - child of Update
///
/// A new paid reaction was received in a live story group call.
///
/// * [groupCallId]: Identifier of the group call.
/// * [senderId]: Identifier of the sender of the reaction.
/// * [starCount]: The number of Telegram Stars that were paid to send the reaction.
final class UpdateNewGroupCallPaidReaction extends Update {
  /// **UpdateNewGroupCallPaidReaction** *(updateNewGroupCallPaidReaction)* - child of Update
  ///
  /// A new paid reaction was received in a live story group call.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [senderId]: Identifier of the sender of the reaction.
  /// * [starCount]: The number of Telegram Stars that were paid to send the reaction.
  const UpdateNewGroupCallPaidReaction({
    required this.groupCallId,
    required this.senderId,
    required this.starCount,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// Identifier of the sender of the reaction
  final MessageSender senderId;

  /// The number of Telegram Stars that were paid to send the reaction
  final int starCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewGroupCallPaidReaction.fromJson(Map<String, dynamic> json) =>
      UpdateNewGroupCallPaidReaction(
        groupCallId: json['group_call_id'],
        senderId: MessageSender.fromJson(json['sender_id']),
        starCount: json['star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "sender_id": senderId.toJson(),
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [sender_id]: Identifier of the sender of the reaction
  /// * [star_count]: The number of Telegram Stars that were paid to send the reaction
  @override
  UpdateNewGroupCallPaidReaction copyWith({
    int? groupCallId,
    MessageSender? senderId,
    int? starCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewGroupCallPaidReaction(
        groupCallId: groupCallId ?? this.groupCallId,
        senderId: senderId ?? this.senderId,
        starCount: starCount ?? this.starCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewGroupCallPaidReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallMessageSendFailed** *(updateGroupCallMessageSendFailed)* - child of Update
///
/// A group call message failed to send.
///
/// * [groupCallId]: Identifier of the group call.
/// * [messageId]: Message identifier.
/// * [error]: The cause of the message sending failure.
final class UpdateGroupCallMessageSendFailed extends Update {
  /// **UpdateGroupCallMessageSendFailed** *(updateGroupCallMessageSendFailed)* - child of Update
  ///
  /// A group call message failed to send.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [messageId]: Message identifier.
  /// * [error]: The cause of the message sending failure.
  const UpdateGroupCallMessageSendFailed({
    required this.groupCallId,
    required this.messageId,
    required this.error,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// Message identifier
  final int messageId;

  /// The cause of the message sending failure
  final TdError error;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallMessageSendFailed.fromJson(
          Map<String, dynamic> json) =>
      UpdateGroupCallMessageSendFailed(
        groupCallId: json['group_call_id'],
        messageId: json['message_id'],
        error: TdError.fromJson(json['error']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "message_id": messageId,
      "error": error.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [message_id]: Message identifier
  /// * [error]: The cause of the message sending failure
  @override
  UpdateGroupCallMessageSendFailed copyWith({
    int? groupCallId,
    int? messageId,
    TdError? error,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallMessageSendFailed(
        groupCallId: groupCallId ?? this.groupCallId,
        messageId: messageId ?? this.messageId,
        error: error ?? this.error,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallMessageSendFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallMessagesDeleted** *(updateGroupCallMessagesDeleted)* - child of Update
///
/// Some group call messages were deleted.
///
/// * [groupCallId]: Identifier of the group call.
/// * [messageIds]: Identifiers of the deleted messages.
final class UpdateGroupCallMessagesDeleted extends Update {
  /// **UpdateGroupCallMessagesDeleted** *(updateGroupCallMessagesDeleted)* - child of Update
  ///
  /// Some group call messages were deleted.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [messageIds]: Identifiers of the deleted messages.
  const UpdateGroupCallMessagesDeleted({
    required this.groupCallId,
    required this.messageIds,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// Identifiers of the deleted messages
  final List<int> messageIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallMessagesDeleted.fromJson(Map<String, dynamic> json) =>
      UpdateGroupCallMessagesDeleted(
        groupCallId: json['group_call_id'],
        messageIds: List<int>.from(
            (json['message_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "message_ids": messageIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [message_ids]: Identifiers of the deleted messages
  @override
  UpdateGroupCallMessagesDeleted copyWith({
    int? groupCallId,
    List<int>? messageIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallMessagesDeleted(
        groupCallId: groupCallId ?? this.groupCallId,
        messageIds: messageIds ?? this.messageIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallMessagesDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateLiveStoryTopDonors** *(updateLiveStoryTopDonors)* - child of Update
///
/// The list of top donors in live story group call has changed.
///
/// * [groupCallId]: Identifier of the group call.
/// * [donors]: New list of live story donors.
final class UpdateLiveStoryTopDonors extends Update {
  /// **UpdateLiveStoryTopDonors** *(updateLiveStoryTopDonors)* - child of Update
  ///
  /// The list of top donors in live story group call has changed.
  ///
  /// * [groupCallId]: Identifier of the group call.
  /// * [donors]: New list of live story donors.
  const UpdateLiveStoryTopDonors({
    required this.groupCallId,
    required this.donors,
    this.extra,
    this.clientId,
  });

  /// Identifier of the group call
  final int groupCallId;

  /// New list of live story donors
  final LiveStoryDonors donors;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateLiveStoryTopDonors.fromJson(Map<String, dynamic> json) =>
      UpdateLiveStoryTopDonors(
        groupCallId: json['group_call_id'],
        donors: LiveStoryDonors.fromJson(json['donors']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "donors": donors.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the group call
  /// * [donors]: New list of live story donors
  @override
  UpdateLiveStoryTopDonors copyWith({
    int? groupCallId,
    LiveStoryDonors? donors,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateLiveStoryTopDonors(
        groupCallId: groupCallId ?? this.groupCallId,
        donors: donors ?? this.donors,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateLiveStoryTopDonors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewCallSignalingData** *(updateNewCallSignalingData)* - child of Update
///
/// New call signaling data arrived.
///
/// * [callId]: The call identifier.
/// * [data]: The data.
final class UpdateNewCallSignalingData extends Update {
  /// **UpdateNewCallSignalingData** *(updateNewCallSignalingData)* - child of Update
  ///
  /// New call signaling data arrived.
  ///
  /// * [callId]: The call identifier.
  /// * [data]: The data.
  const UpdateNewCallSignalingData({
    required this.callId,
    required this.data,
    this.extra,
    this.clientId,
  });

  /// The call identifier
  final int callId;

  /// The data
  final String data;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewCallSignalingData.fromJson(Map<String, dynamic> json) =>
      UpdateNewCallSignalingData(
        callId: json['call_id'],
        data: json['data'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "call_id": callId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: The call identifier
  /// * [data]: The data
  @override
  UpdateNewCallSignalingData copyWith({
    int? callId,
    String? data,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewCallSignalingData(
        callId: callId ?? this.callId,
        data: data ?? this.data,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewCallSignalingData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGiftAuctionState** *(updateGiftAuctionState)* - child of Update
///
/// State of a gift auction was updated.
///
/// * [state]: New state of the auction.
final class UpdateGiftAuctionState extends Update {
  /// **UpdateGiftAuctionState** *(updateGiftAuctionState)* - child of Update
  ///
  /// State of a gift auction was updated.
  ///
  /// * [state]: New state of the auction.
  const UpdateGiftAuctionState({
    required this.state,
    this.extra,
    this.clientId,
  });

  /// New state of the auction
  final GiftAuctionState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGiftAuctionState.fromJson(Map<String, dynamic> json) =>
      UpdateGiftAuctionState(
        state: GiftAuctionState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state]: New state of the auction
  @override
  UpdateGiftAuctionState copyWith({
    GiftAuctionState? state,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGiftAuctionState(
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGiftAuctionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateActiveGiftAuctions** *(updateActiveGiftAuctions)* - child of Update
///
/// The list of auctions in which the current user participates has changed.
///
/// * [states]: New states of the auctions.
final class UpdateActiveGiftAuctions extends Update {
  /// **UpdateActiveGiftAuctions** *(updateActiveGiftAuctions)* - child of Update
  ///
  /// The list of auctions in which the current user participates has changed.
  ///
  /// * [states]: New states of the auctions.
  const UpdateActiveGiftAuctions({
    required this.states,
    this.extra,
    this.clientId,
  });

  /// New states of the auctions
  final List<GiftAuctionState> states;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateActiveGiftAuctions.fromJson(Map<String, dynamic> json) =>
      UpdateActiveGiftAuctions(
        states: List<GiftAuctionState>.from((json['states'] ?? [])
            .map((item) => GiftAuctionState.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "states": states.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [states]: New states of the auctions
  @override
  UpdateActiveGiftAuctions copyWith({
    List<GiftAuctionState>? states,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateActiveGiftAuctions(
        states: states ?? this.states,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateActiveGiftAuctions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUserPrivacySettingRules** *(updateUserPrivacySettingRules)* - child of Update
///
/// Some privacy setting rules have been changed.
///
/// * [setting]: The privacy setting.
/// * [rules]: New privacy rules.
final class UpdateUserPrivacySettingRules extends Update {
  /// **UpdateUserPrivacySettingRules** *(updateUserPrivacySettingRules)* - child of Update
  ///
  /// Some privacy setting rules have been changed.
  ///
  /// * [setting]: The privacy setting.
  /// * [rules]: New privacy rules.
  const UpdateUserPrivacySettingRules({
    required this.setting,
    required this.rules,
    this.extra,
    this.clientId,
  });

  /// The privacy setting
  final UserPrivacySetting setting;

  /// New privacy rules
  final UserPrivacySettingRules rules;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUserPrivacySettingRules.fromJson(Map<String, dynamic> json) =>
      UpdateUserPrivacySettingRules(
        setting: UserPrivacySetting.fromJson(json['setting']),
        rules: UserPrivacySettingRules.fromJson(json['rules']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "setting": setting.toJson(),
      "rules": rules.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [setting]: The privacy setting
  /// * [rules]: New privacy rules
  @override
  UpdateUserPrivacySettingRules copyWith({
    UserPrivacySetting? setting,
    UserPrivacySettingRules? rules,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUserPrivacySettingRules(
        setting: setting ?? this.setting,
        rules: rules ?? this.rules,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUserPrivacySettingRules';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUnreadMessageCount** *(updateUnreadMessageCount)* - child of Update
///
/// Number of unread messages in a chat list has changed. This update is sent only if the message database is used.
///
/// * [chatList]: The chat list with changed number of unread messages.
/// * [unreadCount]: Total number of unread messages.
/// * [unreadUnmutedCount]: Total number of unread messages in unmuted chats.
final class UpdateUnreadMessageCount extends Update {
  /// **UpdateUnreadMessageCount** *(updateUnreadMessageCount)* - child of Update
  ///
  /// Number of unread messages in a chat list has changed. This update is sent only if the message database is used.
  ///
  /// * [chatList]: The chat list with changed number of unread messages.
  /// * [unreadCount]: Total number of unread messages.
  /// * [unreadUnmutedCount]: Total number of unread messages in unmuted chats.
  const UpdateUnreadMessageCount({
    required this.chatList,
    required this.unreadCount,
    required this.unreadUnmutedCount,
    this.extra,
    this.clientId,
  });

  /// The chat list with changed number of unread messages
  final ChatList chatList;

  /// Total number of unread messages
  final int unreadCount;

  /// Total number of unread messages in unmuted chats
  final int unreadUnmutedCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUnreadMessageCount.fromJson(Map<String, dynamic> json) =>
      UpdateUnreadMessageCount(
        chatList: ChatList.fromJson(json['chat_list']),
        unreadCount: json['unread_count'],
        unreadUnmutedCount: json['unread_unmuted_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList.toJson(),
      "unread_count": unreadCount,
      "unread_unmuted_count": unreadUnmutedCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: The chat list with changed number of unread messages
  /// * [unread_count]: Total number of unread messages
  /// * [unread_unmuted_count]: Total number of unread messages in unmuted chats
  @override
  UpdateUnreadMessageCount copyWith({
    ChatList? chatList,
    int? unreadCount,
    int? unreadUnmutedCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUnreadMessageCount(
        chatList: chatList ?? this.chatList,
        unreadCount: unreadCount ?? this.unreadCount,
        unreadUnmutedCount: unreadUnmutedCount ?? this.unreadUnmutedCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUnreadMessageCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUnreadChatCount** *(updateUnreadChatCount)* - child of Update
///
/// Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used.
///
/// * [chatList]: The chat list with changed number of unread messages.
/// * [totalCount]: Approximate total number of chats in the chat list.
/// * [unreadCount]: Total number of unread chats.
/// * [unreadUnmutedCount]: Total number of unread unmuted chats.
/// * [markedAsUnreadCount]: Total number of chats marked as unread.
/// * [markedAsUnreadUnmutedCount]: Total number of unmuted chats marked as unread.
final class UpdateUnreadChatCount extends Update {
  /// **UpdateUnreadChatCount** *(updateUnreadChatCount)* - child of Update
  ///
  /// Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if the message database is used.
  ///
  /// * [chatList]: The chat list with changed number of unread messages.
  /// * [totalCount]: Approximate total number of chats in the chat list.
  /// * [unreadCount]: Total number of unread chats.
  /// * [unreadUnmutedCount]: Total number of unread unmuted chats.
  /// * [markedAsUnreadCount]: Total number of chats marked as unread.
  /// * [markedAsUnreadUnmutedCount]: Total number of unmuted chats marked as unread.
  const UpdateUnreadChatCount({
    required this.chatList,
    required this.totalCount,
    required this.unreadCount,
    required this.unreadUnmutedCount,
    required this.markedAsUnreadCount,
    required this.markedAsUnreadUnmutedCount,
    this.extra,
    this.clientId,
  });

  /// The chat list with changed number of unread messages
  final ChatList chatList;

  /// Approximate total number of chats in the chat list
  final int totalCount;

  /// Total number of unread chats
  final int unreadCount;

  /// Total number of unread unmuted chats
  final int unreadUnmutedCount;

  /// Total number of chats marked as unread
  final int markedAsUnreadCount;

  /// Total number of unmuted chats marked as unread
  final int markedAsUnreadUnmutedCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUnreadChatCount.fromJson(Map<String, dynamic> json) =>
      UpdateUnreadChatCount(
        chatList: ChatList.fromJson(json['chat_list']),
        totalCount: json['total_count'],
        unreadCount: json['unread_count'],
        unreadUnmutedCount: json['unread_unmuted_count'],
        markedAsUnreadCount: json['marked_as_unread_count'],
        markedAsUnreadUnmutedCount: json['marked_as_unread_unmuted_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList.toJson(),
      "total_count": totalCount,
      "unread_count": unreadCount,
      "unread_unmuted_count": unreadUnmutedCount,
      "marked_as_unread_count": markedAsUnreadCount,
      "marked_as_unread_unmuted_count": markedAsUnreadUnmutedCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: The chat list with changed number of unread messages
  /// * [total_count]: Approximate total number of chats in the chat list
  /// * [unread_count]: Total number of unread chats
  /// * [unread_unmuted_count]: Total number of unread unmuted chats
  /// * [marked_as_unread_count]: Total number of chats marked as unread
  /// * [marked_as_unread_unmuted_count]: Total number of unmuted chats marked as unread
  @override
  UpdateUnreadChatCount copyWith({
    ChatList? chatList,
    int? totalCount,
    int? unreadCount,
    int? unreadUnmutedCount,
    int? markedAsUnreadCount,
    int? markedAsUnreadUnmutedCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUnreadChatCount(
        chatList: chatList ?? this.chatList,
        totalCount: totalCount ?? this.totalCount,
        unreadCount: unreadCount ?? this.unreadCount,
        unreadUnmutedCount: unreadUnmutedCount ?? this.unreadUnmutedCount,
        markedAsUnreadCount: markedAsUnreadCount ?? this.markedAsUnreadCount,
        markedAsUnreadUnmutedCount:
            markedAsUnreadUnmutedCount ?? this.markedAsUnreadUnmutedCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUnreadChatCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatJoinResult** *(updateChatJoinResult)* - child of Update
///
/// A join request from the user was completed.
///
/// * [queryId]: Identifier of the join request query as received in chatJoinResultGuardBotApprovalRequired. If the corresponding Web App is still open, then it must be closed.
/// * [chatId]: Identifier of the joined chat, or 0 if the request wasn't approved.
/// * [result]: Result of the join.
final class UpdateChatJoinResult extends Update {
  /// **UpdateChatJoinResult** *(updateChatJoinResult)* - child of Update
  ///
  /// A join request from the user was completed.
  ///
  /// * [queryId]: Identifier of the join request query as received in chatJoinResultGuardBotApprovalRequired. If the corresponding Web App is still open, then it must be closed.
  /// * [chatId]: Identifier of the joined chat, or 0 if the request wasn't approved.
  /// * [result]: Result of the join.
  const UpdateChatJoinResult({
    required this.queryId,
    required this.chatId,
    required this.result,
    this.extra,
    this.clientId,
  });

  /// Identifier of the join request query as received in chatJoinResultGuardBotApprovalRequired. If the corresponding Web App is still open, then it must be closed
  final int queryId;

  /// Identifier of the joined chat, or 0 if the request wasn't approved
  final int chatId;

  /// Result of the join
  final ChatJoinRequestResult result;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatJoinResult.fromJson(Map<String, dynamic> json) =>
      UpdateChatJoinResult(
        queryId: json['query_id'] is int
            ? json['query_id']
            : int.parse(json['query_id']),
        chatId: json['chat_id'],
        result: ChatJoinRequestResult.fromJson(json['result']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "query_id": queryId,
      "chat_id": chatId,
      "result": result.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query_id]: Identifier of the join request query as received in chatJoinResultGuardBotApprovalRequired. If the corresponding Web App is still open, then it must be closed
  /// * [chat_id]: Identifier of the joined chat, or 0 if the request wasn't approved
  /// * [result]: Result of the join
  @override
  UpdateChatJoinResult copyWith({
    int? queryId,
    int? chatId,
    ChatJoinRequestResult? result,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatJoinResult(
        queryId: queryId ?? this.queryId,
        chatId: chatId ?? this.chatId,
        result: result ?? this.result,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatJoinResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStory** *(updateStory)* - child of Update
///
/// A story was changed.
///
/// * [story]: The new information about the story.
final class UpdateStory extends Update {
  /// **UpdateStory** *(updateStory)* - child of Update
  ///
  /// A story was changed.
  ///
  /// * [story]: The new information about the story.
  const UpdateStory({
    required this.story,
    this.extra,
    this.clientId,
  });

  /// The new information about the story
  final Story story;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStory.fromJson(Map<String, dynamic> json) => UpdateStory(
        story: Story.fromJson(json['story']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story": story.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story]: The new information about the story
  @override
  UpdateStory copyWith({
    Story? story,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStory(
        story: story ?? this.story,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStoryDeleted** *(updateStoryDeleted)* - child of Update
///
/// A story became inaccessible.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
final class UpdateStoryDeleted extends Update {
  /// **UpdateStoryDeleted** *(updateStoryDeleted)* - child of Update
  ///
  /// A story became inaccessible.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  const UpdateStoryDeleted({
    required this.storyPosterChatId,
    required this.storyId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStoryDeleted.fromJson(Map<String, dynamic> json) =>
      UpdateStoryDeleted(
        storyPosterChatId: json['story_poster_chat_id'],
        storyId: json['story_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Story identifier
  @override
  UpdateStoryDeleted copyWith({
    int? storyPosterChatId,
    int? storyId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStoryDeleted(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStoryDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStoryPostSucceeded** *(updateStoryPostSucceeded)* - child of Update
///
/// A story has been successfully posted.
///
/// * [story]: The posted story.
/// * [oldStoryId]: The previous temporary story identifier.
final class UpdateStoryPostSucceeded extends Update {
  /// **UpdateStoryPostSucceeded** *(updateStoryPostSucceeded)* - child of Update
  ///
  /// A story has been successfully posted.
  ///
  /// * [story]: The posted story.
  /// * [oldStoryId]: The previous temporary story identifier.
  const UpdateStoryPostSucceeded({
    required this.story,
    required this.oldStoryId,
    this.extra,
    this.clientId,
  });

  /// The posted story
  final Story story;

  /// The previous temporary story identifier
  final int oldStoryId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStoryPostSucceeded.fromJson(Map<String, dynamic> json) =>
      UpdateStoryPostSucceeded(
        story: Story.fromJson(json['story']),
        oldStoryId: json['old_story_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story": story.toJson(),
      "old_story_id": oldStoryId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story]: The posted story
  /// * [old_story_id]: The previous temporary story identifier
  @override
  UpdateStoryPostSucceeded copyWith({
    Story? story,
    int? oldStoryId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStoryPostSucceeded(
        story: story ?? this.story,
        oldStoryId: oldStoryId ?? this.oldStoryId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStoryPostSucceeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStoryPostFailed** *(updateStoryPostFailed)* - child of Update
///
/// A story failed to post. If the story posting is canceled, then updateStoryDeleted will be received instead of this update.
///
/// * [story]: The failed to post story.
/// * [error]: The cause of the story posting failure.
/// * [errorType]: Type of the error; may be null if unknown *(optional)*.
final class UpdateStoryPostFailed extends Update {
  /// **UpdateStoryPostFailed** *(updateStoryPostFailed)* - child of Update
  ///
  /// A story failed to post. If the story posting is canceled, then updateStoryDeleted will be received instead of this update.
  ///
  /// * [story]: The failed to post story.
  /// * [error]: The cause of the story posting failure.
  /// * [errorType]: Type of the error; may be null if unknown *(optional)*.
  const UpdateStoryPostFailed({
    required this.story,
    required this.error,
    this.errorType,
    this.extra,
    this.clientId,
  });

  /// The failed to post story
  final Story story;

  /// The cause of the story posting failure
  final TdError error;

  /// Type of the error; may be null if unknown
  final CanPostStoryResult? errorType;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStoryPostFailed.fromJson(Map<String, dynamic> json) =>
      UpdateStoryPostFailed(
        story: Story.fromJson(json['story']),
        error: TdError.fromJson(json['error']),
        errorType: json['error_type'] == null
            ? null
            : CanPostStoryResult.fromJson(json['error_type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story": story.toJson(),
      "error": error.toJson(),
      "error_type": errorType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story]: The failed to post story
  /// * [error]: The cause of the story posting failure
  /// * [error_type]: Type of the error; may be null if unknown
  @override
  UpdateStoryPostFailed copyWith({
    Story? story,
    TdError? error,
    CanPostStoryResult? errorType,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStoryPostFailed(
        story: story ?? this.story,
        error: error ?? this.error,
        errorType: errorType ?? this.errorType,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStoryPostFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatActiveStories** *(updateChatActiveStories)* - child of Update
///
/// The list of active stories posted by a specific chat has changed.
///
/// * [activeStories]: The new list of active stories.
final class UpdateChatActiveStories extends Update {
  /// **UpdateChatActiveStories** *(updateChatActiveStories)* - child of Update
  ///
  /// The list of active stories posted by a specific chat has changed.
  ///
  /// * [activeStories]: The new list of active stories.
  const UpdateChatActiveStories({
    required this.activeStories,
    this.extra,
    this.clientId,
  });

  /// The new list of active stories
  final ChatActiveStories activeStories;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatActiveStories.fromJson(Map<String, dynamic> json) =>
      UpdateChatActiveStories(
        activeStories: ChatActiveStories.fromJson(json['active_stories']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "active_stories": activeStories.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [active_stories]: The new list of active stories
  @override
  UpdateChatActiveStories copyWith({
    ChatActiveStories? activeStories,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatActiveStories(
        activeStories: activeStories ?? this.activeStories,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatActiveStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStoryListChatCount** *(updateStoryListChatCount)* - child of Update
///
/// Number of chats in a story list has changed.
///
/// * [storyList]: The story list.
/// * [chatCount]: Approximate total number of chats with active stories in the list.
final class UpdateStoryListChatCount extends Update {
  /// **UpdateStoryListChatCount** *(updateStoryListChatCount)* - child of Update
  ///
  /// Number of chats in a story list has changed.
  ///
  /// * [storyList]: The story list.
  /// * [chatCount]: Approximate total number of chats with active stories in the list.
  const UpdateStoryListChatCount({
    required this.storyList,
    required this.chatCount,
    this.extra,
    this.clientId,
  });

  /// The story list
  final StoryList storyList;

  /// Approximate total number of chats with active stories in the list
  final int chatCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStoryListChatCount.fromJson(Map<String, dynamic> json) =>
      UpdateStoryListChatCount(
        storyList: StoryList.fromJson(json['story_list']),
        chatCount: json['chat_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_list": storyList.toJson(),
      "chat_count": chatCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_list]: The story list
  /// * [chat_count]: Approximate total number of chats with active stories in the list
  @override
  UpdateStoryListChatCount copyWith({
    StoryList? storyList,
    int? chatCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStoryListChatCount(
        storyList: storyList ?? this.storyList,
        chatCount: chatCount ?? this.chatCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStoryListChatCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStoryStealthMode** *(updateStoryStealthMode)* - child of Update
///
/// Story stealth mode settings have changed.
///
/// * [activeUntilDate]: Point in time (Unix timestamp) until stealth mode is active; 0 if it is disabled.
/// * [cooldownUntilDate]: Point in time (Unix timestamp) when stealth mode can be enabled again; 0 if there is no active cooldown.
final class UpdateStoryStealthMode extends Update {
  /// **UpdateStoryStealthMode** *(updateStoryStealthMode)* - child of Update
  ///
  /// Story stealth mode settings have changed.
  ///
  /// * [activeUntilDate]: Point in time (Unix timestamp) until stealth mode is active; 0 if it is disabled.
  /// * [cooldownUntilDate]: Point in time (Unix timestamp) when stealth mode can be enabled again; 0 if there is no active cooldown.
  const UpdateStoryStealthMode({
    required this.activeUntilDate,
    required this.cooldownUntilDate,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) until stealth mode is active; 0 if it is disabled
  final int activeUntilDate;

  /// Point in time (Unix timestamp) when stealth mode can be enabled again; 0 if there is no active cooldown
  final int cooldownUntilDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStoryStealthMode.fromJson(Map<String, dynamic> json) =>
      UpdateStoryStealthMode(
        activeUntilDate: json['active_until_date'],
        cooldownUntilDate: json['cooldown_until_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "active_until_date": activeUntilDate,
      "cooldown_until_date": cooldownUntilDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [active_until_date]: Point in time (Unix timestamp) until stealth mode is active; 0 if it is disabled
  /// * [cooldown_until_date]: Point in time (Unix timestamp) when stealth mode can be enabled again; 0 if there is no active cooldown
  @override
  UpdateStoryStealthMode copyWith({
    int? activeUntilDate,
    int? cooldownUntilDate,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStoryStealthMode(
        activeUntilDate: activeUntilDate ?? this.activeUntilDate,
        cooldownUntilDate: cooldownUntilDate ?? this.cooldownUntilDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStoryStealthMode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAllowedBotUsernamePremiumSuffixes** *(updateAllowedBotUsernamePremiumSuffixes)* - child of Update
///
/// Lists of suffixes allowed in secondary bot usernames, which can be added additionally to the main username if the bot's owner has a Telegram Premium subscription.
///
/// * [suffixes]: The list of allowed suffixes.
final class UpdateAllowedBotUsernamePremiumSuffixes extends Update {
  /// **UpdateAllowedBotUsernamePremiumSuffixes** *(updateAllowedBotUsernamePremiumSuffixes)* - child of Update
  ///
  /// Lists of suffixes allowed in secondary bot usernames, which can be added additionally to the main username if the bot's owner has a Telegram Premium subscription.
  ///
  /// * [suffixes]: The list of allowed suffixes.
  const UpdateAllowedBotUsernamePremiumSuffixes({
    required this.suffixes,
    this.extra,
    this.clientId,
  });

  /// The list of allowed suffixes
  final List<String> suffixes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAllowedBotUsernamePremiumSuffixes.fromJson(
          Map<String, dynamic> json) =>
      UpdateAllowedBotUsernamePremiumSuffixes(
        suffixes: List<String>.from(
            (json['suffixes'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suffixes": suffixes.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suffixes]: The list of allowed suffixes
  @override
  UpdateAllowedBotUsernamePremiumSuffixes copyWith({
    List<String>? suffixes,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAllowedBotUsernamePremiumSuffixes(
        suffixes: suffixes ?? this.suffixes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'updateAllowedBotUsernamePremiumSuffixes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTrustedMiniAppBots** *(updateTrustedMiniAppBots)* - child of Update
///
/// Lists of bots which Mini Apps must be allowed to read text from clipboard and must be opened without a warning.
///
/// * [botUserIds]: List of user identifiers of the bots; the corresponding users may not be sent using updateUser updates and may not be accessible.
final class UpdateTrustedMiniAppBots extends Update {
  /// **UpdateTrustedMiniAppBots** *(updateTrustedMiniAppBots)* - child of Update
  ///
  /// Lists of bots which Mini Apps must be allowed to read text from clipboard and must be opened without a warning.
  ///
  /// * [botUserIds]: List of user identifiers of the bots; the corresponding users may not be sent using updateUser updates and may not be accessible.
  const UpdateTrustedMiniAppBots({
    required this.botUserIds,
    this.extra,
    this.clientId,
  });

  /// List of user identifiers of the bots; the corresponding users may not be sent using updateUser updates and may not be accessible
  final List<int> botUserIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTrustedMiniAppBots.fromJson(Map<String, dynamic> json) =>
      UpdateTrustedMiniAppBots(
        botUserIds: List<int>.from(
            (json['bot_user_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_ids": botUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_ids]: List of user identifiers of the bots; the corresponding users may not be sent using updateUser updates and may not be accessible
  @override
  UpdateTrustedMiniAppBots copyWith({
    List<int>? botUserIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTrustedMiniAppBots(
        botUserIds: botUserIds ?? this.botUserIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTrustedMiniAppBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateOption** *(updateOption)* - child of Update
///
/// An option changed its value.
///
/// * [name]: The option name.
/// * [value]: The new option value.
final class UpdateOption extends Update {
  /// **UpdateOption** *(updateOption)* - child of Update
  ///
  /// An option changed its value.
  ///
  /// * [name]: The option name.
  /// * [value]: The new option value.
  const UpdateOption({
    required this.name,
    required this.value,
    this.extra,
    this.clientId,
  });

  /// The option name
  final String name;

  /// The new option value
  final OptionValue value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateOption.fromJson(Map<String, dynamic> json) => UpdateOption(
        name: json['name'],
        value: OptionValue.fromJson(json['value']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "value": value.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: The option name
  /// * [value]: The new option value
  @override
  UpdateOption copyWith({
    String? name,
    OptionValue? value,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateOption(
        name: name ?? this.name,
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStickerSet** *(updateStickerSet)* - child of Update
///
/// A sticker set has changed.
///
/// * [stickerSet]: The sticker set.
final class UpdateStickerSet extends Update {
  /// **UpdateStickerSet** *(updateStickerSet)* - child of Update
  ///
  /// A sticker set has changed.
  ///
  /// * [stickerSet]: The sticker set.
  const UpdateStickerSet({
    required this.stickerSet,
    this.extra,
    this.clientId,
  });

  /// The sticker set
  final StickerSet stickerSet;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStickerSet.fromJson(Map<String, dynamic> json) =>
      UpdateStickerSet(
        stickerSet: StickerSet.fromJson(json['sticker_set']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_set": stickerSet.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_set]: The sticker set
  @override
  UpdateStickerSet copyWith({
    StickerSet? stickerSet,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStickerSet(
        stickerSet: stickerSet ?? this.stickerSet,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateInstalledStickerSets** *(updateInstalledStickerSets)* - child of Update
///
/// The list of installed sticker sets was updated.
///
/// * [stickerType]: Type of the affected stickers.
/// * [stickerSetIds]: The new list of installed ordinary sticker sets.
final class UpdateInstalledStickerSets extends Update {
  /// **UpdateInstalledStickerSets** *(updateInstalledStickerSets)* - child of Update
  ///
  /// The list of installed sticker sets was updated.
  ///
  /// * [stickerType]: Type of the affected stickers.
  /// * [stickerSetIds]: The new list of installed ordinary sticker sets.
  const UpdateInstalledStickerSets({
    required this.stickerType,
    required this.stickerSetIds,
    this.extra,
    this.clientId,
  });

  /// Type of the affected stickers
  final StickerType stickerType;

  /// The new list of installed ordinary sticker sets
  final List<int> stickerSetIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateInstalledStickerSets.fromJson(Map<String, dynamic> json) =>
      UpdateInstalledStickerSets(
        stickerType: StickerType.fromJson(json['sticker_type']),
        stickerSetIds: List<int>.from((json['sticker_set_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "sticker_set_ids": stickerSetIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the affected stickers
  /// * [sticker_set_ids]: The new list of installed ordinary sticker sets
  @override
  UpdateInstalledStickerSets copyWith({
    StickerType? stickerType,
    List<int>? stickerSetIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateInstalledStickerSets(
        stickerType: stickerType ?? this.stickerType,
        stickerSetIds: stickerSetIds ?? this.stickerSetIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateInstalledStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTrendingStickerSets** *(updateTrendingStickerSets)* - child of Update
///
/// The list of trending sticker sets was updated or some of them were viewed.
///
/// * [stickerType]: Type of the affected stickers.
/// * [stickerSets]: The prefix of the list of trending sticker sets with the newest trending sticker sets.
final class UpdateTrendingStickerSets extends Update {
  /// **UpdateTrendingStickerSets** *(updateTrendingStickerSets)* - child of Update
  ///
  /// The list of trending sticker sets was updated or some of them were viewed.
  ///
  /// * [stickerType]: Type of the affected stickers.
  /// * [stickerSets]: The prefix of the list of trending sticker sets with the newest trending sticker sets.
  const UpdateTrendingStickerSets({
    required this.stickerType,
    required this.stickerSets,
    this.extra,
    this.clientId,
  });

  /// Type of the affected stickers
  final StickerType stickerType;

  /// The prefix of the list of trending sticker sets with the newest trending sticker sets
  final TrendingStickerSets stickerSets;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTrendingStickerSets.fromJson(Map<String, dynamic> json) =>
      UpdateTrendingStickerSets(
        stickerType: StickerType.fromJson(json['sticker_type']),
        stickerSets: TrendingStickerSets.fromJson(json['sticker_sets']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "sticker_sets": stickerSets.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the affected stickers
  /// * [sticker_sets]: The prefix of the list of trending sticker sets with the newest trending sticker sets
  @override
  UpdateTrendingStickerSets copyWith({
    StickerType? stickerType,
    TrendingStickerSets? stickerSets,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTrendingStickerSets(
        stickerType: stickerType ?? this.stickerType,
        stickerSets: stickerSets ?? this.stickerSets,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTrendingStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateRecentStickers** *(updateRecentStickers)* - child of Update
///
/// The list of recently used stickers was updated.
///
/// * [isAttached]: True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated.
/// * [stickerIds]: The new list of file identifiers of recently used stickers.
final class UpdateRecentStickers extends Update {
  /// **UpdateRecentStickers** *(updateRecentStickers)* - child of Update
  ///
  /// The list of recently used stickers was updated.
  ///
  /// * [isAttached]: True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated.
  /// * [stickerIds]: The new list of file identifiers of recently used stickers.
  const UpdateRecentStickers({
    required this.isAttached,
    required this.stickerIds,
    this.extra,
    this.clientId,
  });

  /// True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated
  final bool isAttached;

  /// The new list of file identifiers of recently used stickers
  final List<int> stickerIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateRecentStickers.fromJson(Map<String, dynamic> json) =>
      UpdateRecentStickers(
        isAttached: json['is_attached'],
        stickerIds: List<int>.from(
            (json['sticker_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_attached": isAttached,
      "sticker_ids": stickerIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_attached]: True, if the list of stickers attached to photo or video files was updated; otherwise, the list of sent stickers is updated
  /// * [sticker_ids]: The new list of file identifiers of recently used stickers
  @override
  UpdateRecentStickers copyWith({
    bool? isAttached,
    List<int>? stickerIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateRecentStickers(
        isAttached: isAttached ?? this.isAttached,
        stickerIds: stickerIds ?? this.stickerIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateRecentStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFavoriteStickers** *(updateFavoriteStickers)* - child of Update
///
/// The list of favorite stickers was updated.
///
/// * [stickerIds]: The new list of file identifiers of favorite stickers.
final class UpdateFavoriteStickers extends Update {
  /// **UpdateFavoriteStickers** *(updateFavoriteStickers)* - child of Update
  ///
  /// The list of favorite stickers was updated.
  ///
  /// * [stickerIds]: The new list of file identifiers of favorite stickers.
  const UpdateFavoriteStickers({
    required this.stickerIds,
    this.extra,
    this.clientId,
  });

  /// The new list of file identifiers of favorite stickers
  final List<int> stickerIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFavoriteStickers.fromJson(Map<String, dynamic> json) =>
      UpdateFavoriteStickers(
        stickerIds: List<int>.from(
            (json['sticker_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_ids": stickerIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_ids]: The new list of file identifiers of favorite stickers
  @override
  UpdateFavoriteStickers copyWith({
    List<int>? stickerIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFavoriteStickers(
        stickerIds: stickerIds ?? this.stickerIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFavoriteStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSavedAnimations** *(updateSavedAnimations)* - child of Update
///
/// The list of saved animations was updated.
///
/// * [animationIds]: The new list of file identifiers of saved animations.
final class UpdateSavedAnimations extends Update {
  /// **UpdateSavedAnimations** *(updateSavedAnimations)* - child of Update
  ///
  /// The list of saved animations was updated.
  ///
  /// * [animationIds]: The new list of file identifiers of saved animations.
  const UpdateSavedAnimations({
    required this.animationIds,
    this.extra,
    this.clientId,
  });

  /// The new list of file identifiers of saved animations
  final List<int> animationIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSavedAnimations.fromJson(Map<String, dynamic> json) =>
      UpdateSavedAnimations(
        animationIds: List<int>.from(
            (json['animation_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation_ids": animationIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation_ids]: The new list of file identifiers of saved animations
  @override
  UpdateSavedAnimations copyWith({
    List<int>? animationIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSavedAnimations(
        animationIds: animationIds ?? this.animationIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSavedAnimations';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSavedNotificationSounds** *(updateSavedNotificationSounds)* - child of Update
///
/// The list of saved notification sounds was updated. This update may not be sent until information about a notification sound was requested for the first time.
///
/// * [notificationSoundIds]: The new list of identifiers of saved notification sounds.
final class UpdateSavedNotificationSounds extends Update {
  /// **UpdateSavedNotificationSounds** *(updateSavedNotificationSounds)* - child of Update
  ///
  /// The list of saved notification sounds was updated. This update may not be sent until information about a notification sound was requested for the first time.
  ///
  /// * [notificationSoundIds]: The new list of identifiers of saved notification sounds.
  const UpdateSavedNotificationSounds({
    required this.notificationSoundIds,
    this.extra,
    this.clientId,
  });

  /// The new list of identifiers of saved notification sounds
  final List<int> notificationSoundIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSavedNotificationSounds.fromJson(Map<String, dynamic> json) =>
      UpdateSavedNotificationSounds(
        notificationSoundIds: List<int>.from(
            (json['notification_sound_ids'] ?? [])
                .map((item) => item is int ? item : int.parse(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "notification_sound_ids": notificationSoundIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_sound_ids]: The new list of identifiers of saved notification sounds
  @override
  UpdateSavedNotificationSounds copyWith({
    List<int>? notificationSoundIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSavedNotificationSounds(
        notificationSoundIds: notificationSoundIds ?? this.notificationSoundIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSavedNotificationSounds';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDefaultBackground** *(updateDefaultBackground)* - child of Update
///
/// The default background has changed.
///
/// * [forDarkTheme]: True, if default background for dark theme has changed.
/// * [background]: The new default background; may be null *(optional)*.
final class UpdateDefaultBackground extends Update {
  /// **UpdateDefaultBackground** *(updateDefaultBackground)* - child of Update
  ///
  /// The default background has changed.
  ///
  /// * [forDarkTheme]: True, if default background for dark theme has changed.
  /// * [background]: The new default background; may be null *(optional)*.
  const UpdateDefaultBackground({
    required this.forDarkTheme,
    this.background,
    this.extra,
    this.clientId,
  });

  /// True, if default background for dark theme has changed
  final bool forDarkTheme;

  /// The new default background; may be null
  final Background? background;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDefaultBackground.fromJson(Map<String, dynamic> json) =>
      UpdateDefaultBackground(
        forDarkTheme: json['for_dark_theme'],
        background: json['background'] == null
            ? null
            : Background.fromJson(json['background']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "for_dark_theme": forDarkTheme,
      "background": background?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [for_dark_theme]: True, if default background for dark theme has changed
  /// * [background]: The new default background; may be null
  @override
  UpdateDefaultBackground copyWith({
    bool? forDarkTheme,
    Background? background,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDefaultBackground(
        forDarkTheme: forDarkTheme ?? this.forDarkTheme,
        background: background ?? this.background,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDefaultBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateEmojiChatThemes** *(updateEmojiChatThemes)* - child of Update
///
/// The list of available emoji chat themes has changed.
///
/// * [chatThemes]: The new list of emoji chat themes.
final class UpdateEmojiChatThemes extends Update {
  /// **UpdateEmojiChatThemes** *(updateEmojiChatThemes)* - child of Update
  ///
  /// The list of available emoji chat themes has changed.
  ///
  /// * [chatThemes]: The new list of emoji chat themes.
  const UpdateEmojiChatThemes({
    required this.chatThemes,
    this.extra,
    this.clientId,
  });

  /// The new list of emoji chat themes
  final List<EmojiChatTheme> chatThemes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateEmojiChatThemes.fromJson(Map<String, dynamic> json) =>
      UpdateEmojiChatThemes(
        chatThemes: List<EmojiChatTheme>.from((json['chat_themes'] ?? [])
            .map((item) => EmojiChatTheme.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_themes": chatThemes.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_themes]: The new list of emoji chat themes
  @override
  UpdateEmojiChatThemes copyWith({
    List<EmojiChatTheme>? chatThemes,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateEmojiChatThemes(
        chatThemes: chatThemes ?? this.chatThemes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateEmojiChatThemes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAccentColors** *(updateAccentColors)* - child of Update
///
/// The list of supported accent colors has changed.
///
/// * [colors]: Information about supported colors; colors with identifiers 0 (red), 1 (orange), 2 (purple/violet), 3 (green), 4 (cyan), 5 (blue), 6 (pink) must always be supported. and aren't included in the list. The exact colors for the accent colors with identifiers 0-6 must be taken from the application theme.
/// * [availableAccentColorIds]: The list of accent color identifiers, which can be set through setAccentColor and setChatAccentColor. The colors must be shown in the specified order.
final class UpdateAccentColors extends Update {
  /// **UpdateAccentColors** *(updateAccentColors)* - child of Update
  ///
  /// The list of supported accent colors has changed.
  ///
  /// * [colors]: Information about supported colors; colors with identifiers 0 (red), 1 (orange), 2 (purple/violet), 3 (green), 4 (cyan), 5 (blue), 6 (pink) must always be supported. and aren't included in the list. The exact colors for the accent colors with identifiers 0-6 must be taken from the application theme.
  /// * [availableAccentColorIds]: The list of accent color identifiers, which can be set through setAccentColor and setChatAccentColor. The colors must be shown in the specified order.
  const UpdateAccentColors({
    required this.colors,
    required this.availableAccentColorIds,
    this.extra,
    this.clientId,
  });

  /// Information about supported colors; colors with identifiers 0 (red), 1 (orange), 2 (purple/violet), 3 (green), 4 (cyan), 5 (blue), 6 (pink) must always be supported. and aren't included in the list. The exact colors for the accent colors with identifiers 0-6 must be taken from the application theme
  final List<AccentColor> colors;

  /// The list of accent color identifiers, which can be set through setAccentColor and setChatAccentColor. The colors must be shown in the specified order
  final List<int> availableAccentColorIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAccentColors.fromJson(Map<String, dynamic> json) =>
      UpdateAccentColors(
        colors: List<AccentColor>.from((json['colors'] ?? [])
            .map((item) => AccentColor.fromJson(item))
            .toList()),
        availableAccentColorIds: List<int>.from(
            (json['available_accent_color_ids'] ?? [])
                .map((item) => item)
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "colors": colors.map((i) => i.toJson()).toList(),
      "available_accent_color_ids":
          availableAccentColorIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [colors]: Information about supported colors; colors with identifiers 0 (red), 1 (orange), 2 (purple/violet), 3 (green), 4 (cyan), 5 (blue), 6 (pink) must always be supported. and aren't included in the list. The exact colors for the accent colors with identifiers 0-6 must be taken from the application theme
  /// * [available_accent_color_ids]: The list of accent color identifiers, which can be set through setAccentColor and setChatAccentColor. The colors must be shown in the specified order
  @override
  UpdateAccentColors copyWith({
    List<AccentColor>? colors,
    List<int>? availableAccentColorIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAccentColors(
        colors: colors ?? this.colors,
        availableAccentColorIds:
            availableAccentColorIds ?? this.availableAccentColorIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAccentColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateProfileAccentColors** *(updateProfileAccentColors)* - child of Update
///
/// The list of supported accent colors for user profiles has changed.
///
/// * [colors]: Information about supported colors.
/// * [availableAccentColorIds]: The list of accent color identifiers, which can be set through setProfileAccentColor and setChatProfileAccentColor. The colors must be shown in the specified order.
final class UpdateProfileAccentColors extends Update {
  /// **UpdateProfileAccentColors** *(updateProfileAccentColors)* - child of Update
  ///
  /// The list of supported accent colors for user profiles has changed.
  ///
  /// * [colors]: Information about supported colors.
  /// * [availableAccentColorIds]: The list of accent color identifiers, which can be set through setProfileAccentColor and setChatProfileAccentColor. The colors must be shown in the specified order.
  const UpdateProfileAccentColors({
    required this.colors,
    required this.availableAccentColorIds,
    this.extra,
    this.clientId,
  });

  /// Information about supported colors
  final List<ProfileAccentColor> colors;

  /// The list of accent color identifiers, which can be set through setProfileAccentColor and setChatProfileAccentColor. The colors must be shown in the specified order
  final List<int> availableAccentColorIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateProfileAccentColors.fromJson(Map<String, dynamic> json) =>
      UpdateProfileAccentColors(
        colors: List<ProfileAccentColor>.from((json['colors'] ?? [])
            .map((item) => ProfileAccentColor.fromJson(item))
            .toList()),
        availableAccentColorIds: List<int>.from(
            (json['available_accent_color_ids'] ?? [])
                .map((item) => item)
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "colors": colors.map((i) => i.toJson()).toList(),
      "available_accent_color_ids":
          availableAccentColorIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [colors]: Information about supported colors
  /// * [available_accent_color_ids]: The list of accent color identifiers, which can be set through setProfileAccentColor and setChatProfileAccentColor. The colors must be shown in the specified order
  @override
  UpdateProfileAccentColors copyWith({
    List<ProfileAccentColor>? colors,
    List<int>? availableAccentColorIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateProfileAccentColors(
        colors: colors ?? this.colors,
        availableAccentColorIds:
            availableAccentColorIds ?? this.availableAccentColorIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateProfileAccentColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateWebBrowserSettings** *(updateWebBrowserSettings)* - child of Update
///
/// Web browser settings have been updated.
///
/// * [settings]: New settings.
final class UpdateWebBrowserSettings extends Update {
  /// **UpdateWebBrowserSettings** *(updateWebBrowserSettings)* - child of Update
  ///
  /// Web browser settings have been updated.
  ///
  /// * [settings]: New settings.
  const UpdateWebBrowserSettings({
    required this.settings,
    this.extra,
    this.clientId,
  });

  /// New settings
  final WebBrowserSettings settings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateWebBrowserSettings.fromJson(Map<String, dynamic> json) =>
      UpdateWebBrowserSettings(
        settings: WebBrowserSettings.fromJson(json['settings']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "settings": settings.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [settings]: New settings
  @override
  UpdateWebBrowserSettings copyWith({
    WebBrowserSettings? settings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateWebBrowserSettings(
        settings: settings ?? this.settings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateWebBrowserSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateLanguagePackStrings** *(updateLanguagePackStrings)* - child of Update
///
/// Some language pack strings have been updated.
///
/// * [localizationTarget]: Localization target to which the language pack belongs.
/// * [languagePackId]: Identifier of the updated language pack.
/// * [strings]: List of changed language pack strings; empty if all strings have changed.
final class UpdateLanguagePackStrings extends Update {
  /// **UpdateLanguagePackStrings** *(updateLanguagePackStrings)* - child of Update
  ///
  /// Some language pack strings have been updated.
  ///
  /// * [localizationTarget]: Localization target to which the language pack belongs.
  /// * [languagePackId]: Identifier of the updated language pack.
  /// * [strings]: List of changed language pack strings; empty if all strings have changed.
  const UpdateLanguagePackStrings({
    required this.localizationTarget,
    required this.languagePackId,
    required this.strings,
    this.extra,
    this.clientId,
  });

  /// Localization target to which the language pack belongs
  final String localizationTarget;

  /// Identifier of the updated language pack
  final String languagePackId;

  /// List of changed language pack strings; empty if all strings have changed
  final List<LanguagePackString> strings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateLanguagePackStrings.fromJson(Map<String, dynamic> json) =>
      UpdateLanguagePackStrings(
        localizationTarget: json['localization_target'],
        languagePackId: json['language_pack_id'],
        strings: List<LanguagePackString>.from((json['strings'] ?? [])
            .map((item) => LanguagePackString.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "localization_target": localizationTarget,
      "language_pack_id": languagePackId,
      "strings": strings.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [localization_target]: Localization target to which the language pack belongs
  /// * [language_pack_id]: Identifier of the updated language pack
  /// * [strings]: List of changed language pack strings; empty if all strings have changed
  @override
  UpdateLanguagePackStrings copyWith({
    String? localizationTarget,
    String? languagePackId,
    List<LanguagePackString>? strings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateLanguagePackStrings(
        localizationTarget: localizationTarget ?? this.localizationTarget,
        languagePackId: languagePackId ?? this.languagePackId,
        strings: strings ?? this.strings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateLanguagePackStrings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateConnectionState** *(updateConnectionState)* - child of Update
///
/// The connection state has changed. This update must be used only to show a human-readable description of the connection state.
///
/// * [state]: The new connection state.
final class UpdateConnectionState extends Update {
  /// **UpdateConnectionState** *(updateConnectionState)* - child of Update
  ///
  /// The connection state has changed. This update must be used only to show a human-readable description of the connection state.
  ///
  /// * [state]: The new connection state.
  const UpdateConnectionState({
    required this.state,
    this.extra,
    this.clientId,
  });

  /// The new connection state
  final ConnectionState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateConnectionState.fromJson(Map<String, dynamic> json) =>
      UpdateConnectionState(
        state: ConnectionState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state]: The new connection state
  @override
  UpdateConnectionState copyWith({
    ConnectionState? state,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateConnectionState(
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateConnectionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateWebProxyCarrierOpened** *(updateWebProxyCarrierOpened)* - child of Update
///
/// A web proxy carrier must be opened as described in webProxyCarrier. Messages passed by the page to the bridge object must be passed to processWebProxyCarrierMessage.. Failures of the carrier must be reported with reportWebProxyCarrierError.
///
/// * [carrier]: The carrier.
final class UpdateWebProxyCarrierOpened extends Update {
  /// **UpdateWebProxyCarrierOpened** *(updateWebProxyCarrierOpened)* - child of Update
  ///
  /// A web proxy carrier must be opened as described in webProxyCarrier. Messages passed by the page to the bridge object must be passed to processWebProxyCarrierMessage.. Failures of the carrier must be reported with reportWebProxyCarrierError.
  ///
  /// * [carrier]: The carrier.
  const UpdateWebProxyCarrierOpened({
    required this.carrier,
    this.extra,
    this.clientId,
  });

  /// The carrier
  final WebProxyCarrier carrier;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateWebProxyCarrierOpened.fromJson(Map<String, dynamic> json) =>
      UpdateWebProxyCarrierOpened(
        carrier: WebProxyCarrier.fromJson(json['carrier']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "carrier": carrier.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [carrier]: The carrier
  @override
  UpdateWebProxyCarrierOpened copyWith({
    WebProxyCarrier? carrier,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateWebProxyCarrierOpened(
        carrier: carrier ?? this.carrier,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateWebProxyCarrierOpened';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateWebProxyCarrierData** *(updateWebProxyCarrierData)* - child of Update
///
/// Data must be delivered as an ArrayBuffer to the page of a web proxy carrier through the onmessage function of the bridge object, in the order of the updates.
///
/// * [carrierId]: Identifier of the carrier.
/// * [data]: The data to deliver.
final class UpdateWebProxyCarrierData extends Update {
  /// **UpdateWebProxyCarrierData** *(updateWebProxyCarrierData)* - child of Update
  ///
  /// Data must be delivered as an ArrayBuffer to the page of a web proxy carrier through the onmessage function of the bridge object, in the order of the updates.
  ///
  /// * [carrierId]: Identifier of the carrier.
  /// * [data]: The data to deliver.
  const UpdateWebProxyCarrierData({
    required this.carrierId,
    required this.data,
    this.extra,
    this.clientId,
  });

  /// Identifier of the carrier
  final int carrierId;

  /// The data to deliver
  final String data;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateWebProxyCarrierData.fromJson(Map<String, dynamic> json) =>
      UpdateWebProxyCarrierData(
        carrierId: json['carrier_id'],
        data: json['data'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "carrier_id": carrierId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [carrier_id]: Identifier of the carrier
  /// * [data]: The data to deliver
  @override
  UpdateWebProxyCarrierData copyWith({
    int? carrierId,
    String? data,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateWebProxyCarrierData(
        carrierId: carrierId ?? this.carrierId,
        data: data ?? this.data,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateWebProxyCarrierData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateWebProxyCarrierClosed** *(updateWebProxyCarrierClosed)* - child of Update
///
/// A web proxy carrier must be closed. If the page has passed any message to the bridge object, then the application must deliver the string {"t":"close"} to the page,. so that it can end its relay session, and destroy the web view shortly after, for example, in 200 milliseconds; otherwise, the web view must be destroyed immediately.. Messages from the carrier received after this update must be ignored.
///
/// * [carrierId]: Identifier of the carrier.
final class UpdateWebProxyCarrierClosed extends Update {
  /// **UpdateWebProxyCarrierClosed** *(updateWebProxyCarrierClosed)* - child of Update
  ///
  /// A web proxy carrier must be closed. If the page has passed any message to the bridge object, then the application must deliver the string {"t":"close"} to the page,. so that it can end its relay session, and destroy the web view shortly after, for example, in 200 milliseconds; otherwise, the web view must be destroyed immediately.. Messages from the carrier received after this update must be ignored.
  ///
  /// * [carrierId]: Identifier of the carrier.
  const UpdateWebProxyCarrierClosed({
    required this.carrierId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the carrier
  final int carrierId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateWebProxyCarrierClosed.fromJson(Map<String, dynamic> json) =>
      UpdateWebProxyCarrierClosed(
        carrierId: json['carrier_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "carrier_id": carrierId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [carrier_id]: Identifier of the carrier
  @override
  UpdateWebProxyCarrierClosed copyWith({
    int? carrierId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateWebProxyCarrierClosed(
        carrierId: carrierId ?? this.carrierId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateWebProxyCarrierClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateFreezeState** *(updateFreezeState)* - child of Update
///
/// The freeze state of the current user's account has changed.
///
/// * [isFrozen]: True, if the account is frozen.
/// * [freezingDate]: Point in time (Unix timestamp) when the account was frozen; 0 if the account isn't frozen.
/// * [deletionDate]: Point in time (Unix timestamp) when the account will be deleted and can't be unfrozen; 0 if the account isn't frozen.
/// * [appealLink]: The link to open to send an appeal to unfreeze the account.
final class UpdateFreezeState extends Update {
  /// **UpdateFreezeState** *(updateFreezeState)* - child of Update
  ///
  /// The freeze state of the current user's account has changed.
  ///
  /// * [isFrozen]: True, if the account is frozen.
  /// * [freezingDate]: Point in time (Unix timestamp) when the account was frozen; 0 if the account isn't frozen.
  /// * [deletionDate]: Point in time (Unix timestamp) when the account will be deleted and can't be unfrozen; 0 if the account isn't frozen.
  /// * [appealLink]: The link to open to send an appeal to unfreeze the account.
  const UpdateFreezeState({
    required this.isFrozen,
    required this.freezingDate,
    required this.deletionDate,
    required this.appealLink,
    this.extra,
    this.clientId,
  });

  /// True, if the account is frozen
  final bool isFrozen;

  /// Point in time (Unix timestamp) when the account was frozen; 0 if the account isn't frozen
  final int freezingDate;

  /// Point in time (Unix timestamp) when the account will be deleted and can't be unfrozen; 0 if the account isn't frozen
  final int deletionDate;

  /// The link to open to send an appeal to unfreeze the account
  final String appealLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateFreezeState.fromJson(Map<String, dynamic> json) =>
      UpdateFreezeState(
        isFrozen: json['is_frozen'],
        freezingDate: json['freezing_date'],
        deletionDate: json['deletion_date'],
        appealLink: json['appeal_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_frozen": isFrozen,
      "freezing_date": freezingDate,
      "deletion_date": deletionDate,
      "appeal_link": appealLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_frozen]: True, if the account is frozen
  /// * [freezing_date]: Point in time (Unix timestamp) when the account was frozen; 0 if the account isn't frozen
  /// * [deletion_date]: Point in time (Unix timestamp) when the account will be deleted and can't be unfrozen; 0 if the account isn't frozen
  /// * [appeal_link]: The link to open to send an appeal to unfreeze the account
  @override
  UpdateFreezeState copyWith({
    bool? isFrozen,
    int? freezingDate,
    int? deletionDate,
    String? appealLink,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateFreezeState(
        isFrozen: isFrozen ?? this.isFrozen,
        freezingDate: freezingDate ?? this.freezingDate,
        deletionDate: deletionDate ?? this.deletionDate,
        appealLink: appealLink ?? this.appealLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateFreezeState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAgeVerificationParameters** *(updateAgeVerificationParameters)* - child of Update
///
/// The parameters for age verification of the current user's account have changed.
///
/// * [parameters]: Parameters for the age verification; may be null if age verification isn't needed *(optional)*.
final class UpdateAgeVerificationParameters extends Update {
  /// **UpdateAgeVerificationParameters** *(updateAgeVerificationParameters)* - child of Update
  ///
  /// The parameters for age verification of the current user's account have changed.
  ///
  /// * [parameters]: Parameters for the age verification; may be null if age verification isn't needed *(optional)*.
  const UpdateAgeVerificationParameters({
    this.parameters,
    this.extra,
    this.clientId,
  });

  /// Parameters for the age verification; may be null if age verification isn't needed
  final AgeVerificationParameters? parameters;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAgeVerificationParameters.fromJson(Map<String, dynamic> json) =>
      UpdateAgeVerificationParameters(
        parameters: json['parameters'] == null
            ? null
            : AgeVerificationParameters.fromJson(json['parameters']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Parameters for the age verification; may be null if age verification isn't needed
  @override
  UpdateAgeVerificationParameters copyWith({
    AgeVerificationParameters? parameters,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAgeVerificationParameters(
        parameters: parameters ?? this.parameters,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAgeVerificationParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTermsOfService** *(updateTermsOfService)* - child of Update
///
/// New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update".
///
/// * [termsOfServiceId]: Identifier of the terms of service.
/// * [termsOfService]: The new terms of service.
final class UpdateTermsOfService extends Update {
  /// **UpdateTermsOfService** *(updateTermsOfService)* - child of Update
  ///
  /// New terms of service must be accepted by the user. If the terms of service are declined, then the deleteAccount method must be called with the reason "Decline ToS update".
  ///
  /// * [termsOfServiceId]: Identifier of the terms of service.
  /// * [termsOfService]: The new terms of service.
  const UpdateTermsOfService({
    required this.termsOfServiceId,
    required this.termsOfService,
    this.extra,
    this.clientId,
  });

  /// Identifier of the terms of service
  final String termsOfServiceId;

  /// The new terms of service
  final TermsOfService termsOfService;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTermsOfService.fromJson(Map<String, dynamic> json) =>
      UpdateTermsOfService(
        termsOfServiceId: json['terms_of_service_id'],
        termsOfService: TermsOfService.fromJson(json['terms_of_service']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "terms_of_service_id": termsOfServiceId,
      "terms_of_service": termsOfService.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [terms_of_service_id]: Identifier of the terms of service
  /// * [terms_of_service]: The new terms of service
  @override
  UpdateTermsOfService copyWith({
    String? termsOfServiceId,
    TermsOfService? termsOfService,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTermsOfService(
        termsOfServiceId: termsOfServiceId ?? this.termsOfServiceId,
        termsOfService: termsOfService ?? this.termsOfService,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTermsOfService';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUnconfirmedSession** *(updateUnconfirmedSession)* - child of Update
///
/// The first unconfirmed session has changed.
///
/// * [session]: The unconfirmed session; may be null if none *(optional)*.
/// * [unconfirmedSessionCount]: The total number of unconfirmed sessions.
final class UpdateUnconfirmedSession extends Update {
  /// **UpdateUnconfirmedSession** *(updateUnconfirmedSession)* - child of Update
  ///
  /// The first unconfirmed session has changed.
  ///
  /// * [session]: The unconfirmed session; may be null if none *(optional)*.
  /// * [unconfirmedSessionCount]: The total number of unconfirmed sessions.
  const UpdateUnconfirmedSession({
    this.session,
    required this.unconfirmedSessionCount,
    this.extra,
    this.clientId,
  });

  /// The unconfirmed session; may be null if none
  final UnconfirmedSession? session;

  /// The total number of unconfirmed sessions
  final int unconfirmedSessionCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUnconfirmedSession.fromJson(Map<String, dynamic> json) =>
      UpdateUnconfirmedSession(
        session: json['session'] == null
            ? null
            : UnconfirmedSession.fromJson(json['session']),
        unconfirmedSessionCount: json['unconfirmed_session_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session": session?.toJson(),
      "unconfirmed_session_count": unconfirmedSessionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session]: The unconfirmed session; may be null if none
  /// * [unconfirmed_session_count]: The total number of unconfirmed sessions
  @override
  UpdateUnconfirmedSession copyWith({
    UnconfirmedSession? session,
    int? unconfirmedSessionCount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUnconfirmedSession(
        session: session ?? this.session,
        unconfirmedSessionCount:
            unconfirmedSessionCount ?? this.unconfirmedSessionCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUnconfirmedSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAttachmentMenuBots** *(updateAttachmentMenuBots)* - child of Update
///
/// The list of bots added to attachment or side menu has changed.
///
/// * [bots]: The new list of bots. The bots must not be shown on scheduled messages screen.
final class UpdateAttachmentMenuBots extends Update {
  /// **UpdateAttachmentMenuBots** *(updateAttachmentMenuBots)* - child of Update
  ///
  /// The list of bots added to attachment or side menu has changed.
  ///
  /// * [bots]: The new list of bots. The bots must not be shown on scheduled messages screen.
  const UpdateAttachmentMenuBots({
    required this.bots,
    this.extra,
    this.clientId,
  });

  /// The new list of bots. The bots must not be shown on scheduled messages screen
  final List<AttachmentMenuBot> bots;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAttachmentMenuBots.fromJson(Map<String, dynamic> json) =>
      UpdateAttachmentMenuBots(
        bots: List<AttachmentMenuBot>.from((json['bots'] ?? [])
            .map((item) => AttachmentMenuBot.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bots": bots.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bots]: The new list of bots. The bots must not be shown on scheduled messages screen
  @override
  UpdateAttachmentMenuBots copyWith({
    List<AttachmentMenuBot>? bots,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAttachmentMenuBots(
        bots: bots ?? this.bots,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAttachmentMenuBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateWebAppMessageSent** *(updateWebAppMessageSent)* - child of Update
///
/// A message was sent by an opened Web App, so the Web App needs to be closed.
///
/// * [webAppLaunchId]: Identifier of Web App launch.
final class UpdateWebAppMessageSent extends Update {
  /// **UpdateWebAppMessageSent** *(updateWebAppMessageSent)* - child of Update
  ///
  /// A message was sent by an opened Web App, so the Web App needs to be closed.
  ///
  /// * [webAppLaunchId]: Identifier of Web App launch.
  const UpdateWebAppMessageSent({
    required this.webAppLaunchId,
    this.extra,
    this.clientId,
  });

  /// Identifier of Web App launch
  final int webAppLaunchId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateWebAppMessageSent.fromJson(Map<String, dynamic> json) =>
      UpdateWebAppMessageSent(
        webAppLaunchId: json['web_app_launch_id'] is int
            ? json['web_app_launch_id']
            : int.parse(json['web_app_launch_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "web_app_launch_id": webAppLaunchId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [web_app_launch_id]: Identifier of Web App launch
  @override
  UpdateWebAppMessageSent copyWith({
    int? webAppLaunchId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateWebAppMessageSent(
        webAppLaunchId: webAppLaunchId ?? this.webAppLaunchId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateWebAppMessageSent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateActiveEmojiReactions** *(updateActiveEmojiReactions)* - child of Update
///
/// The list of active emoji reactions has changed.
///
/// * [emojis]: The new list of active emoji reactions.
final class UpdateActiveEmojiReactions extends Update {
  /// **UpdateActiveEmojiReactions** *(updateActiveEmojiReactions)* - child of Update
  ///
  /// The list of active emoji reactions has changed.
  ///
  /// * [emojis]: The new list of active emoji reactions.
  const UpdateActiveEmojiReactions({
    required this.emojis,
    this.extra,
    this.clientId,
  });

  /// The new list of active emoji reactions
  final List<String> emojis;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateActiveEmojiReactions.fromJson(Map<String, dynamic> json) =>
      UpdateActiveEmojiReactions(
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emojis]: The new list of active emoji reactions
  @override
  UpdateActiveEmojiReactions copyWith({
    List<String>? emojis,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateActiveEmojiReactions(
        emojis: emojis ?? this.emojis,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateActiveEmojiReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAvailableMessageEffects** *(updateAvailableMessageEffects)* - child of Update
///
/// The list of available message effects has changed.
///
/// * [reactionEffectIds]: The new list of available message effects from emoji reactions.
/// * [stickerEffectIds]: The new list of available message effects from Premium stickers.
final class UpdateAvailableMessageEffects extends Update {
  /// **UpdateAvailableMessageEffects** *(updateAvailableMessageEffects)* - child of Update
  ///
  /// The list of available message effects has changed.
  ///
  /// * [reactionEffectIds]: The new list of available message effects from emoji reactions.
  /// * [stickerEffectIds]: The new list of available message effects from Premium stickers.
  const UpdateAvailableMessageEffects({
    required this.reactionEffectIds,
    required this.stickerEffectIds,
    this.extra,
    this.clientId,
  });

  /// The new list of available message effects from emoji reactions
  final List<int> reactionEffectIds;

  /// The new list of available message effects from Premium stickers
  final List<int> stickerEffectIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAvailableMessageEffects.fromJson(Map<String, dynamic> json) =>
      UpdateAvailableMessageEffects(
        reactionEffectIds: List<int>.from((json['reaction_effect_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        stickerEffectIds: List<int>.from((json['sticker_effect_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reaction_effect_ids": reactionEffectIds.map((i) => i).toList(),
      "sticker_effect_ids": stickerEffectIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reaction_effect_ids]: The new list of available message effects from emoji reactions
  /// * [sticker_effect_ids]: The new list of available message effects from Premium stickers
  @override
  UpdateAvailableMessageEffects copyWith({
    List<int>? reactionEffectIds,
    List<int>? stickerEffectIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAvailableMessageEffects(
        reactionEffectIds: reactionEffectIds ?? this.reactionEffectIds,
        stickerEffectIds: stickerEffectIds ?? this.stickerEffectIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAvailableMessageEffects';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDefaultReactionType** *(updateDefaultReactionType)* - child of Update
///
/// The type of default reaction has changed.
///
/// * [reactionType]: The new type of the default reaction.
final class UpdateDefaultReactionType extends Update {
  /// **UpdateDefaultReactionType** *(updateDefaultReactionType)* - child of Update
  ///
  /// The type of default reaction has changed.
  ///
  /// * [reactionType]: The new type of the default reaction.
  const UpdateDefaultReactionType({
    required this.reactionType,
    this.extra,
    this.clientId,
  });

  /// The new type of the default reaction
  final ReactionType reactionType;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDefaultReactionType.fromJson(Map<String, dynamic> json) =>
      UpdateDefaultReactionType(
        reactionType: ReactionType.fromJson(json['reaction_type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reaction_type": reactionType.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reaction_type]: The new type of the default reaction
  @override
  UpdateDefaultReactionType copyWith({
    ReactionType? reactionType,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDefaultReactionType(
        reactionType: reactionType ?? this.reactionType,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDefaultReactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDefaultPaidReactionType** *(updateDefaultPaidReactionType)* - child of Update
///
/// The type of default paid reaction has changed.
///
/// * [type]: The new type of the default paid reaction.
final class UpdateDefaultPaidReactionType extends Update {
  /// **UpdateDefaultPaidReactionType** *(updateDefaultPaidReactionType)* - child of Update
  ///
  /// The type of default paid reaction has changed.
  ///
  /// * [type]: The new type of the default paid reaction.
  const UpdateDefaultPaidReactionType({
    required this.type,
    this.extra,
    this.clientId,
  });

  /// The new type of the default paid reaction
  final PaidReactionType type;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDefaultPaidReactionType.fromJson(Map<String, dynamic> json) =>
      UpdateDefaultPaidReactionType(
        type: PaidReactionType.fromJson(json['type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: The new type of the default paid reaction
  @override
  UpdateDefaultPaidReactionType copyWith({
    PaidReactionType? type,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDefaultPaidReactionType(
        type: type ?? this.type,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDefaultPaidReactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSavedMessagesTags** *(updateSavedMessagesTags)* - child of Update
///
/// Tags used in Saved Messages or a Saved Messages topic have changed.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which tags were changed; 0 if tags for the whole chat have changed.
/// * [tags]: The new tags.
final class UpdateSavedMessagesTags extends Update {
  /// **UpdateSavedMessagesTags** *(updateSavedMessagesTags)* - child of Update
  ///
  /// Tags used in Saved Messages or a Saved Messages topic have changed.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which tags were changed; 0 if tags for the whole chat have changed.
  /// * [tags]: The new tags.
  const UpdateSavedMessagesTags({
    required this.savedMessagesTopicId,
    required this.tags,
    this.extra,
    this.clientId,
  });

  /// Identifier of Saved Messages topic which tags were changed; 0 if tags for the whole chat have changed
  final int savedMessagesTopicId;

  /// The new tags
  final SavedMessagesTags tags;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSavedMessagesTags.fromJson(Map<String, dynamic> json) =>
      UpdateSavedMessagesTags(
        savedMessagesTopicId: json['saved_messages_topic_id'],
        tags: SavedMessagesTags.fromJson(json['tags']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "tags": tags.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which tags were changed; 0 if tags for the whole chat have changed
  /// * [tags]: The new tags
  @override
  UpdateSavedMessagesTags copyWith({
    int? savedMessagesTopicId,
    SavedMessagesTags? tags,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSavedMessagesTags(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        tags: tags ?? this.tags,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSavedMessagesTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateActiveLiveLocationMessages** *(updateActiveLiveLocationMessages)* - child of Update
///
/// The list of messages with active live location that need to be updated by the application has changed. The list is persistent across application restarts only if the message database is used.
///
/// * [messages]: The list of messages with active live locations.
final class UpdateActiveLiveLocationMessages extends Update {
  /// **UpdateActiveLiveLocationMessages** *(updateActiveLiveLocationMessages)* - child of Update
  ///
  /// The list of messages with active live location that need to be updated by the application has changed. The list is persistent across application restarts only if the message database is used.
  ///
  /// * [messages]: The list of messages with active live locations.
  const UpdateActiveLiveLocationMessages({
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// The list of messages with active live locations
  final List<Message> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateActiveLiveLocationMessages.fromJson(
          Map<String, dynamic> json) =>
      UpdateActiveLiveLocationMessages(
        messages: List<Message>.from((json['messages'] ?? [])
            .map((item) => Message.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "messages": messages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [messages]: The list of messages with active live locations
  @override
  UpdateActiveLiveLocationMessages copyWith({
    List<Message>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateActiveLiveLocationMessages(
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateActiveLiveLocationMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateOwnedStarCount** *(updateOwnedStarCount)* - child of Update
///
/// The number of Telegram Stars owned by the current user has changed.
///
/// * [starAmount]: The new amount of owned Telegram Stars.
final class UpdateOwnedStarCount extends Update {
  /// **UpdateOwnedStarCount** *(updateOwnedStarCount)* - child of Update
  ///
  /// The number of Telegram Stars owned by the current user has changed.
  ///
  /// * [starAmount]: The new amount of owned Telegram Stars.
  const UpdateOwnedStarCount({
    required this.starAmount,
    this.extra,
    this.clientId,
  });

  /// The new amount of owned Telegram Stars
  final StarAmount starAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateOwnedStarCount.fromJson(Map<String, dynamic> json) =>
      UpdateOwnedStarCount(
        starAmount: StarAmount.fromJson(json['star_amount']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_amount": starAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_amount]: The new amount of owned Telegram Stars
  @override
  UpdateOwnedStarCount copyWith({
    StarAmount? starAmount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateOwnedStarCount(
        starAmount: starAmount ?? this.starAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateOwnedStarCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateOwnedGramCount** *(updateOwnedGramCount)* - child of Update
///
/// The number of TON Grams owned by the current user has changed.
///
/// * [gramAmount]: The new amount of owned Grams; in the smallest units of the cryptocurrency.
final class UpdateOwnedGramCount extends Update {
  /// **UpdateOwnedGramCount** *(updateOwnedGramCount)* - child of Update
  ///
  /// The number of TON Grams owned by the current user has changed.
  ///
  /// * [gramAmount]: The new amount of owned Grams; in the smallest units of the cryptocurrency.
  const UpdateOwnedGramCount({
    required this.gramAmount,
    this.extra,
    this.clientId,
  });

  /// The new amount of owned Grams; in the smallest units of the cryptocurrency
  final int gramAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateOwnedGramCount.fromJson(Map<String, dynamic> json) =>
      UpdateOwnedGramCount(
        gramAmount: json['gram_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gram_amount": gramAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gram_amount]: The new amount of owned Grams; in the smallest units of the cryptocurrency
  @override
  UpdateOwnedGramCount copyWith({
    int? gramAmount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateOwnedGramCount(
        gramAmount: gramAmount ?? this.gramAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateOwnedGramCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTonWalletState** *(updateTonWalletState)* - child of Update
///
/// The state of the TON wallet of the current user has changed.
///
/// * [state]: The new state of the wallet.
final class UpdateTonWalletState extends Update {
  /// **UpdateTonWalletState** *(updateTonWalletState)* - child of Update
  ///
  /// The state of the TON wallet of the current user has changed.
  ///
  /// * [state]: The new state of the wallet.
  const UpdateTonWalletState({
    required this.state,
    this.extra,
    this.clientId,
  });

  /// The new state of the wallet
  final TonWalletState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTonWalletState.fromJson(Map<String, dynamic> json) =>
      UpdateTonWalletState(
        state: TonWalletState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state]: The new state of the wallet
  @override
  UpdateTonWalletState copyWith({
    TonWalletState? state,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTonWalletState(
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTonWalletState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTonWalletGaslessTransfersInfo** *(updateTonWalletGaslessTransfersInfo)* - child of Update
///
/// The information about gasless transfers has changed.
///
/// * [info]: The new information about gasless transfers.
final class UpdateTonWalletGaslessTransfersInfo extends Update {
  /// **UpdateTonWalletGaslessTransfersInfo** *(updateTonWalletGaslessTransfersInfo)* - child of Update
  ///
  /// The information about gasless transfers has changed.
  ///
  /// * [info]: The new information about gasless transfers.
  const UpdateTonWalletGaslessTransfersInfo({
    required this.info,
    this.extra,
    this.clientId,
  });

  /// The new information about gasless transfers
  final TonWalletGaslessTransfersInfo info;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTonWalletGaslessTransfersInfo.fromJson(
          Map<String, dynamic> json) =>
      UpdateTonWalletGaslessTransfersInfo(
        info: TonWalletGaslessTransfersInfo.fromJson(json['info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "info": info.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [info]: The new information about gasless transfers
  @override
  UpdateTonWalletGaslessTransfersInfo copyWith({
    TonWalletGaslessTransfersInfo? info,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTonWalletGaslessTransfersInfo(
        info: info ?? this.info,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTonWalletGaslessTransfersInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTonWalletTonConnectSession** *(updateTonWalletTonConnectSession)* - child of Update
///
/// A session of a TON Connect has changed.
///
/// * [session]: The new state of the session.
final class UpdateTonWalletTonConnectSession extends Update {
  /// **UpdateTonWalletTonConnectSession** *(updateTonWalletTonConnectSession)* - child of Update
  ///
  /// A session of a TON Connect has changed.
  ///
  /// * [session]: The new state of the session.
  const UpdateTonWalletTonConnectSession({
    required this.session,
    this.extra,
    this.clientId,
  });

  /// The new state of the session
  final TonConnectSession session;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTonWalletTonConnectSession.fromJson(
          Map<String, dynamic> json) =>
      UpdateTonWalletTonConnectSession(
        session: TonConnectSession.fromJson(json['session']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session": session.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session]: The new state of the session
  @override
  UpdateTonWalletTonConnectSession copyWith({
    TonConnectSession? session,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTonWalletTonConnectSession(
        session: session ?? this.session,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTonWalletTonConnectSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTonWalletTonConnectSessionDisconnectRequired** *(updateTonWalletTonConnectSessionDisconnectRequired)* - child of Update
///
/// TON Connect sessions must be disconnected in a regular way.
///
/// * [sessionIds]: Identifiers of the sessions.
final class UpdateTonWalletTonConnectSessionDisconnectRequired extends Update {
  /// **UpdateTonWalletTonConnectSessionDisconnectRequired** *(updateTonWalletTonConnectSessionDisconnectRequired)* - child of Update
  ///
  /// TON Connect sessions must be disconnected in a regular way.
  ///
  /// * [sessionIds]: Identifiers of the sessions.
  const UpdateTonWalletTonConnectSessionDisconnectRequired({
    required this.sessionIds,
    this.extra,
    this.clientId,
  });

  /// Identifiers of the sessions
  final List<int> sessionIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTonWalletTonConnectSessionDisconnectRequired.fromJson(
          Map<String, dynamic> json) =>
      UpdateTonWalletTonConnectSessionDisconnectRequired(
        sessionIds: List<int>.from((json['session_ids'] ?? [])
            .map((item) => item is int ? item : int.parse(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_ids": sessionIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_ids]: Identifiers of the sessions
  @override
  UpdateTonWalletTonConnectSessionDisconnectRequired copyWith({
    List<int>? sessionIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTonWalletTonConnectSessionDisconnectRequired(
        sessionIds: sessionIds ?? this.sessionIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'updateTonWalletTonConnectSessionDisconnectRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatRevenueAmount** *(updateChatRevenueAmount)* - child of Update
///
/// The revenue earned from sponsored messages in a chat has changed. If chat revenue screen is opened, then getChatRevenueTransactions may be called to fetch new transactions.
///
/// * [chatId]: Identifier of the chat.
/// * [revenueAmount]: New amount of earned revenue.
final class UpdateChatRevenueAmount extends Update {
  /// **UpdateChatRevenueAmount** *(updateChatRevenueAmount)* - child of Update
  ///
  /// The revenue earned from sponsored messages in a chat has changed. If chat revenue screen is opened, then getChatRevenueTransactions may be called to fetch new transactions.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [revenueAmount]: New amount of earned revenue.
  const UpdateChatRevenueAmount({
    required this.chatId,
    required this.revenueAmount,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat
  final int chatId;

  /// New amount of earned revenue
  final ChatRevenueAmount revenueAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatRevenueAmount.fromJson(Map<String, dynamic> json) =>
      UpdateChatRevenueAmount(
        chatId: json['chat_id'],
        revenueAmount: ChatRevenueAmount.fromJson(json['revenue_amount']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "revenue_amount": revenueAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [revenue_amount]: New amount of earned revenue
  @override
  UpdateChatRevenueAmount copyWith({
    int? chatId,
    ChatRevenueAmount? revenueAmount,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatRevenueAmount(
        chatId: chatId ?? this.chatId,
        revenueAmount: revenueAmount ?? this.revenueAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatRevenueAmount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStarRevenueStatus** *(updateStarRevenueStatus)* - child of Update
///
/// The Telegram Star revenue earned by a user or a chat has changed. If Telegram Star transaction screen of the chat is opened, then getStarTransactions may be called to fetch new transactions.
///
/// * [ownerId]: Identifier of the owner of the Telegram Stars.
/// * [status]: New Telegram Star revenue status.
final class UpdateStarRevenueStatus extends Update {
  /// **UpdateStarRevenueStatus** *(updateStarRevenueStatus)* - child of Update
  ///
  /// The Telegram Star revenue earned by a user or a chat has changed. If Telegram Star transaction screen of the chat is opened, then getStarTransactions may be called to fetch new transactions.
  ///
  /// * [ownerId]: Identifier of the owner of the Telegram Stars.
  /// * [status]: New Telegram Star revenue status.
  const UpdateStarRevenueStatus({
    required this.ownerId,
    required this.status,
    this.extra,
    this.clientId,
  });

  /// Identifier of the owner of the Telegram Stars
  final MessageSender ownerId;

  /// New Telegram Star revenue status
  final StarRevenueStatus status;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStarRevenueStatus.fromJson(Map<String, dynamic> json) =>
      UpdateStarRevenueStatus(
        ownerId: MessageSender.fromJson(json['owner_id']),
        status: StarRevenueStatus.fromJson(json['status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "status": status.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the owner of the Telegram Stars
  /// * [status]: New Telegram Star revenue status
  @override
  UpdateStarRevenueStatus copyWith({
    MessageSender? ownerId,
    StarRevenueStatus? status,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStarRevenueStatus(
        ownerId: ownerId ?? this.ownerId,
        status: status ?? this.status,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStarRevenueStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGramRevenueStatus** *(updateGramRevenueStatus)* - child of Update
///
/// The TON Gram revenue earned by the current user has changed. If Gram transaction screen of the chat is opened, then getTonTransactions may be called to fetch new transactions.
///
/// * [status]: New Gram revenue status.
final class UpdateGramRevenueStatus extends Update {
  /// **UpdateGramRevenueStatus** *(updateGramRevenueStatus)* - child of Update
  ///
  /// The TON Gram revenue earned by the current user has changed. If Gram transaction screen of the chat is opened, then getTonTransactions may be called to fetch new transactions.
  ///
  /// * [status]: New Gram revenue status.
  const UpdateGramRevenueStatus({
    required this.status,
    this.extra,
    this.clientId,
  });

  /// New Gram revenue status
  final GramRevenueStatus status;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGramRevenueStatus.fromJson(Map<String, dynamic> json) =>
      UpdateGramRevenueStatus(
        status: GramRevenueStatus.fromJson(json['status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "status": status.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [status]: New Gram revenue status
  @override
  UpdateGramRevenueStatus copyWith({
    GramRevenueStatus? status,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGramRevenueStatus(
        status: status ?? this.status,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGramRevenueStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSpeechRecognitionTrial** *(updateSpeechRecognitionTrial)* - child of Update
///
/// The parameters of speech recognition without Telegram Premium subscription have changed.
///
/// * [maxMediaDuration]: The maximum allowed duration of media for speech recognition without Telegram Premium subscription, in seconds.
/// * [weeklyCount]: The total number of allowed speech recognitions per week; 0 if none.
/// * [leftCount]: Number of left speech recognition attempts this week.
/// * [nextResetDate]: Point in time (Unix timestamp) when the weekly number of tries will reset; 0 if unknown.
final class UpdateSpeechRecognitionTrial extends Update {
  /// **UpdateSpeechRecognitionTrial** *(updateSpeechRecognitionTrial)* - child of Update
  ///
  /// The parameters of speech recognition without Telegram Premium subscription have changed.
  ///
  /// * [maxMediaDuration]: The maximum allowed duration of media for speech recognition without Telegram Premium subscription, in seconds.
  /// * [weeklyCount]: The total number of allowed speech recognitions per week; 0 if none.
  /// * [leftCount]: Number of left speech recognition attempts this week.
  /// * [nextResetDate]: Point in time (Unix timestamp) when the weekly number of tries will reset; 0 if unknown.
  const UpdateSpeechRecognitionTrial({
    required this.maxMediaDuration,
    required this.weeklyCount,
    required this.leftCount,
    required this.nextResetDate,
    this.extra,
    this.clientId,
  });

  /// The maximum allowed duration of media for speech recognition without Telegram Premium subscription, in seconds
  final int maxMediaDuration;

  /// The total number of allowed speech recognitions per week; 0 if none
  final int weeklyCount;

  /// Number of left speech recognition attempts this week
  final int leftCount;

  /// Point in time (Unix timestamp) when the weekly number of tries will reset; 0 if unknown
  final int nextResetDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSpeechRecognitionTrial.fromJson(Map<String, dynamic> json) =>
      UpdateSpeechRecognitionTrial(
        maxMediaDuration: json['max_media_duration'],
        weeklyCount: json['weekly_count'] ?? 0,
        leftCount: json['left_count'],
        nextResetDate: json['next_reset_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "max_media_duration": maxMediaDuration,
      "weekly_count": weeklyCount,
      "left_count": leftCount,
      "next_reset_date": nextResetDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [max_media_duration]: The maximum allowed duration of media for speech recognition without Telegram Premium subscription, in seconds
  /// * [weekly_count]: The total number of allowed speech recognitions per week; 0 if none
  /// * [left_count]: Number of left speech recognition attempts this week
  /// * [next_reset_date]: Point in time (Unix timestamp) when the weekly number of tries will reset; 0 if unknown
  @override
  UpdateSpeechRecognitionTrial copyWith({
    int? maxMediaDuration,
    int? weeklyCount,
    int? leftCount,
    int? nextResetDate,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSpeechRecognitionTrial(
        maxMediaDuration: maxMediaDuration ?? this.maxMediaDuration,
        weeklyCount: weeklyCount ?? this.weeklyCount,
        leftCount: leftCount ?? this.leftCount,
        nextResetDate: nextResetDate ?? this.nextResetDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSpeechRecognitionTrial';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateGroupCallMessageLevels** *(updateGroupCallMessageLevels)* - child of Update
///
/// The levels of live story group call messages have changed.
///
/// * [levels]: New description of the levels in decreasing order of groupCallMessageLevel.min_star_count.
final class UpdateGroupCallMessageLevels extends Update {
  /// **UpdateGroupCallMessageLevels** *(updateGroupCallMessageLevels)* - child of Update
  ///
  /// The levels of live story group call messages have changed.
  ///
  /// * [levels]: New description of the levels in decreasing order of groupCallMessageLevel.min_star_count.
  const UpdateGroupCallMessageLevels({
    required this.levels,
    this.extra,
    this.clientId,
  });

  /// New description of the levels in decreasing order of groupCallMessageLevel.min_star_count
  final List<GroupCallMessageLevel> levels;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateGroupCallMessageLevels.fromJson(Map<String, dynamic> json) =>
      UpdateGroupCallMessageLevels(
        levels: List<GroupCallMessageLevel>.from((json['levels'] ?? [])
            .map((item) => GroupCallMessageLevel.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "levels": levels.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [levels]: New description of the levels in decreasing order of groupCallMessageLevel.min_star_count
  @override
  UpdateGroupCallMessageLevels copyWith({
    List<GroupCallMessageLevel>? levels,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateGroupCallMessageLevels(
        levels: levels ?? this.levels,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateGroupCallMessageLevels';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateDiceEmojis** *(updateDiceEmojis)* - child of Update
///
/// The list of supported dice emojis has changed.
///
/// * [emojis]: The new list of supported dice emojis.
final class UpdateDiceEmojis extends Update {
  /// **UpdateDiceEmojis** *(updateDiceEmojis)* - child of Update
  ///
  /// The list of supported dice emojis has changed.
  ///
  /// * [emojis]: The new list of supported dice emojis.
  const UpdateDiceEmojis({
    required this.emojis,
    this.extra,
    this.clientId,
  });

  /// The new list of supported dice emojis
  final List<String> emojis;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateDiceEmojis.fromJson(Map<String, dynamic> json) =>
      UpdateDiceEmojis(
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emojis]: The new list of supported dice emojis
  @override
  UpdateDiceEmojis copyWith({
    List<String>? emojis,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateDiceEmojis(
        emojis: emojis ?? this.emojis,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateDiceEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateStakeDiceState** *(updateStakeDiceState)* - child of Update
///
/// The stake dice state has changed.
///
/// * [state]: The new state. The state can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState.
final class UpdateStakeDiceState extends Update {
  /// **UpdateStakeDiceState** *(updateStakeDiceState)* - child of Update
  ///
  /// The stake dice state has changed.
  ///
  /// * [state]: The new state. The state can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState.
  const UpdateStakeDiceState({
    required this.state,
    this.extra,
    this.clientId,
  });

  /// The new state. The state can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState
  final StakeDiceState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateStakeDiceState.fromJson(Map<String, dynamic> json) =>
      UpdateStakeDiceState(
        state: StakeDiceState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state]: The new state. The state can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState
  @override
  UpdateStakeDiceState copyWith({
    StakeDiceState? state,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateStakeDiceState(
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateStakeDiceState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAnimatedEmojiMessageClicked** *(updateAnimatedEmojiMessageClicked)* - child of Update
///
/// Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [sticker]: The animated sticker to be played.
final class UpdateAnimatedEmojiMessageClicked extends Update {
  /// **UpdateAnimatedEmojiMessageClicked** *(updateAnimatedEmojiMessageClicked)* - child of Update
  ///
  /// Some animated emoji message was clicked and a big animated sticker must be played if the message is visible on the screen. chatActionWatchingAnimations with the text of the message needs to be sent if the sticker is played.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [sticker]: The animated sticker to be played.
  const UpdateAnimatedEmojiMessageClicked({
    required this.chatId,
    required this.messageId,
    required this.sticker,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// The animated sticker to be played
  final Sticker sticker;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAnimatedEmojiMessageClicked.fromJson(
          Map<String, dynamic> json) =>
      UpdateAnimatedEmojiMessageClicked(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        sticker: Sticker.fromJson(json['sticker']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [sticker]: The animated sticker to be played
  @override
  UpdateAnimatedEmojiMessageClicked copyWith({
    int? chatId,
    int? messageId,
    Sticker? sticker,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAnimatedEmojiMessageClicked(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        sticker: sticker ?? this.sticker,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAnimatedEmojiMessageClicked';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAnimationSearchParameters** *(updateAnimationSearchParameters)* - child of Update
///
/// The parameters of animation search through getOption("animation_search_bot_username") bot have changed.
///
/// * [provider]: Name of the animation search provider.
/// * [emojis]: The new list of emojis suggested for searching.
final class UpdateAnimationSearchParameters extends Update {
  /// **UpdateAnimationSearchParameters** *(updateAnimationSearchParameters)* - child of Update
  ///
  /// The parameters of animation search through getOption("animation_search_bot_username") bot have changed.
  ///
  /// * [provider]: Name of the animation search provider.
  /// * [emojis]: The new list of emojis suggested for searching.
  const UpdateAnimationSearchParameters({
    required this.provider,
    required this.emojis,
    this.extra,
    this.clientId,
  });

  /// Name of the animation search provider
  final String provider;

  /// The new list of emojis suggested for searching
  final List<String> emojis;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAnimationSearchParameters.fromJson(Map<String, dynamic> json) =>
      UpdateAnimationSearchParameters(
        provider: json['provider'],
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "provider": provider,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [provider]: Name of the animation search provider
  /// * [emojis]: The new list of emojis suggested for searching
  @override
  UpdateAnimationSearchParameters copyWith({
    String? provider,
    List<String>? emojis,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAnimationSearchParameters(
        provider: provider ?? this.provider,
        emojis: emojis ?? this.emojis,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAnimationSearchParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateTextCompositionStyles** *(updateTextCompositionStyles)* - child of Update
///
/// The styles supported for text composition have changed.
///
/// * [styles]: The new list of supported styles.
final class UpdateTextCompositionStyles extends Update {
  /// **UpdateTextCompositionStyles** *(updateTextCompositionStyles)* - child of Update
  ///
  /// The styles supported for text composition have changed.
  ///
  /// * [styles]: The new list of supported styles.
  const UpdateTextCompositionStyles({
    required this.styles,
    this.extra,
    this.clientId,
  });

  /// The new list of supported styles
  final List<TextCompositionStyle> styles;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateTextCompositionStyles.fromJson(Map<String, dynamic> json) =>
      UpdateTextCompositionStyles(
        styles: List<TextCompositionStyle>.from((json['styles'] ?? [])
            .map((item) => TextCompositionStyle.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "styles": styles.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [styles]: The new list of supported styles
  @override
  UpdateTextCompositionStyles copyWith({
    List<TextCompositionStyle>? styles,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateTextCompositionStyles(
        styles: styles ?? this.styles,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateTextCompositionStyles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSuggestedActions** *(updateSuggestedActions)* - child of Update
///
/// The list of suggested to the user actions has changed.
///
/// * [addedActions]: Added suggested actions.
/// * [removedActions]: Removed suggested actions.
final class UpdateSuggestedActions extends Update {
  /// **UpdateSuggestedActions** *(updateSuggestedActions)* - child of Update
  ///
  /// The list of suggested to the user actions has changed.
  ///
  /// * [addedActions]: Added suggested actions.
  /// * [removedActions]: Removed suggested actions.
  const UpdateSuggestedActions({
    required this.addedActions,
    required this.removedActions,
    this.extra,
    this.clientId,
  });

  /// Added suggested actions
  final List<SuggestedAction> addedActions;

  /// Removed suggested actions
  final List<SuggestedAction> removedActions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSuggestedActions.fromJson(Map<String, dynamic> json) =>
      UpdateSuggestedActions(
        addedActions: List<SuggestedAction>.from((json['added_actions'] ?? [])
            .map((item) => SuggestedAction.fromJson(item))
            .toList()),
        removedActions: List<SuggestedAction>.from(
            (json['removed_actions'] ?? [])
                .map((item) => SuggestedAction.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "added_actions": addedActions.map((i) => i.toJson()).toList(),
      "removed_actions": removedActions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [added_actions]: Added suggested actions
  /// * [removed_actions]: Removed suggested actions
  @override
  UpdateSuggestedActions copyWith({
    List<SuggestedAction>? addedActions,
    List<SuggestedAction>? removedActions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSuggestedActions(
        addedActions: addedActions ?? this.addedActions,
        removedActions: removedActions ?? this.removedActions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSuggestedActions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateSpeedLimitNotification** *(updateSpeedLimitNotification)* - child of Update
///
/// Download or upload file speed for the user was limited, but it can be restored by subscription to Telegram Premium. The notification can be postponed until a file being downloaded or uploaded is visible to the user.. Use getOption("premium_download_speedup") or getOption("premium_upload_speedup") to get expected speedup after subscription to Telegram Premium.
///
/// * [isUpload]: True, if upload speed was limited; false, if download speed was limited.
final class UpdateSpeedLimitNotification extends Update {
  /// **UpdateSpeedLimitNotification** *(updateSpeedLimitNotification)* - child of Update
  ///
  /// Download or upload file speed for the user was limited, but it can be restored by subscription to Telegram Premium. The notification can be postponed until a file being downloaded or uploaded is visible to the user.. Use getOption("premium_download_speedup") or getOption("premium_upload_speedup") to get expected speedup after subscription to Telegram Premium.
  ///
  /// * [isUpload]: True, if upload speed was limited; false, if download speed was limited.
  const UpdateSpeedLimitNotification({
    required this.isUpload,
    this.extra,
    this.clientId,
  });

  /// True, if upload speed was limited; false, if download speed was limited
  final bool isUpload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateSpeedLimitNotification.fromJson(Map<String, dynamic> json) =>
      UpdateSpeedLimitNotification(
        isUpload: json['is_upload'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_upload": isUpload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_upload]: True, if upload speed was limited; false, if download speed was limited
  @override
  UpdateSpeedLimitNotification copyWith({
    bool? isUpload,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateSpeedLimitNotification(
        isUpload: isUpload ?? this.isUpload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateSpeedLimitNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateContactCloseBirthdays** *(updateContactCloseBirthdays)* - child of Update
///
/// The list of contacts that had birthdays recently or will have birthday soon has changed.
///
/// * [closeBirthdayUsers]: List of contact users with close birthday.
final class UpdateContactCloseBirthdays extends Update {
  /// **UpdateContactCloseBirthdays** *(updateContactCloseBirthdays)* - child of Update
  ///
  /// The list of contacts that had birthdays recently or will have birthday soon has changed.
  ///
  /// * [closeBirthdayUsers]: List of contact users with close birthday.
  const UpdateContactCloseBirthdays({
    required this.closeBirthdayUsers,
    this.extra,
    this.clientId,
  });

  /// List of contact users with close birthday
  final List<CloseBirthdayUser> closeBirthdayUsers;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateContactCloseBirthdays.fromJson(Map<String, dynamic> json) =>
      UpdateContactCloseBirthdays(
        closeBirthdayUsers: List<CloseBirthdayUser>.from(
            (json['close_birthday_users'] ?? [])
                .map((item) => CloseBirthdayUser.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "close_birthday_users":
          closeBirthdayUsers.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [close_birthday_users]: List of contact users with close birthday
  @override
  UpdateContactCloseBirthdays copyWith({
    List<CloseBirthdayUser>? closeBirthdayUsers,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateContactCloseBirthdays(
        closeBirthdayUsers: closeBirthdayUsers ?? this.closeBirthdayUsers,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateContactCloseBirthdays';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateAutosaveSettings** *(updateAutosaveSettings)* - child of Update
///
/// Autosave settings for some type of chats were updated.
///
/// * [scope]: Type of chats for which autosave settings were updated.
/// * [settings]: The new autosave settings; may be null if the settings are reset to default *(optional)*.
final class UpdateAutosaveSettings extends Update {
  /// **UpdateAutosaveSettings** *(updateAutosaveSettings)* - child of Update
  ///
  /// Autosave settings for some type of chats were updated.
  ///
  /// * [scope]: Type of chats for which autosave settings were updated.
  /// * [settings]: The new autosave settings; may be null if the settings are reset to default *(optional)*.
  const UpdateAutosaveSettings({
    required this.scope,
    this.settings,
    this.extra,
    this.clientId,
  });

  /// Type of chats for which autosave settings were updated
  final AutosaveSettingsScope scope;

  /// The new autosave settings; may be null if the settings are reset to default
  final ScopeAutosaveSettings? settings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateAutosaveSettings.fromJson(Map<String, dynamic> json) =>
      UpdateAutosaveSettings(
        scope: AutosaveSettingsScope.fromJson(json['scope']),
        settings: json['settings'] == null
            ? null
            : ScopeAutosaveSettings.fromJson(json['settings']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "scope": scope.toJson(),
      "settings": settings?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: Type of chats for which autosave settings were updated
  /// * [settings]: The new autosave settings; may be null if the settings are reset to default
  @override
  UpdateAutosaveSettings copyWith({
    AutosaveSettingsScope? scope,
    ScopeAutosaveSettings? settings,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateAutosaveSettings(
        scope: scope ?? this.scope,
        settings: settings ?? this.settings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateAutosaveSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateBusinessConnection** *(updateBusinessConnection)* - child of Update
///
/// A business connection has changed; for bots only.
///
/// * [connection]: New data about the connection.
final class UpdateBusinessConnection extends Update {
  /// **UpdateBusinessConnection** *(updateBusinessConnection)* - child of Update
  ///
  /// A business connection has changed; for bots only.
  ///
  /// * [connection]: New data about the connection.
  const UpdateBusinessConnection({
    required this.connection,
    this.extra,
    this.clientId,
  });

  /// New data about the connection
  final BusinessConnection connection;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateBusinessConnection.fromJson(Map<String, dynamic> json) =>
      UpdateBusinessConnection(
        connection: BusinessConnection.fromJson(json['connection']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "connection": connection.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [connection]: New data about the connection
  @override
  UpdateBusinessConnection copyWith({
    BusinessConnection? connection,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateBusinessConnection(
        connection: connection ?? this.connection,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateBusinessConnection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewBusinessMessage** *(updateNewBusinessMessage)* - child of Update
///
/// A new message was added to a business account; for bots only.
///
/// * [connectionId]: Unique identifier of the business connection.
/// * [message]: The new message.
final class UpdateNewBusinessMessage extends Update {
  /// **UpdateNewBusinessMessage** *(updateNewBusinessMessage)* - child of Update
  ///
  /// A new message was added to a business account; for bots only.
  ///
  /// * [connectionId]: Unique identifier of the business connection.
  /// * [message]: The new message.
  const UpdateNewBusinessMessage({
    required this.connectionId,
    required this.message,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the business connection
  final String connectionId;

  /// The new message
  final BusinessMessage message;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewBusinessMessage.fromJson(Map<String, dynamic> json) =>
      UpdateNewBusinessMessage(
        connectionId: json['connection_id'],
        message: BusinessMessage.fromJson(json['message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "connection_id": connectionId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [connection_id]: Unique identifier of the business connection
  /// * [message]: The new message
  @override
  UpdateNewBusinessMessage copyWith({
    String? connectionId,
    BusinessMessage? message,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewBusinessMessage(
        connectionId: connectionId ?? this.connectionId,
        message: message ?? this.message,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewBusinessMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateBusinessMessageEdited** *(updateBusinessMessageEdited)* - child of Update
///
/// A message in a business account was edited; for bots only.
///
/// * [connectionId]: Unique identifier of the business connection.
/// * [message]: The edited message.
final class UpdateBusinessMessageEdited extends Update {
  /// **UpdateBusinessMessageEdited** *(updateBusinessMessageEdited)* - child of Update
  ///
  /// A message in a business account was edited; for bots only.
  ///
  /// * [connectionId]: Unique identifier of the business connection.
  /// * [message]: The edited message.
  const UpdateBusinessMessageEdited({
    required this.connectionId,
    required this.message,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the business connection
  final String connectionId;

  /// The edited message
  final BusinessMessage message;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateBusinessMessageEdited.fromJson(Map<String, dynamic> json) =>
      UpdateBusinessMessageEdited(
        connectionId: json['connection_id'],
        message: BusinessMessage.fromJson(json['message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "connection_id": connectionId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [connection_id]: Unique identifier of the business connection
  /// * [message]: The edited message
  @override
  UpdateBusinessMessageEdited copyWith({
    String? connectionId,
    BusinessMessage? message,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateBusinessMessageEdited(
        connectionId: connectionId ?? this.connectionId,
        message: message ?? this.message,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateBusinessMessageEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateBusinessMessagesDeleted** *(updateBusinessMessagesDeleted)* - child of Update
///
/// Messages in a business account were deleted; for bots only.
///
/// * [connectionId]: Unique identifier of the business connection.
/// * [chatId]: Identifier of a chat in the business account in which messages were deleted.
/// * [messageIds]: Unique message identifiers of the deleted messages.
final class UpdateBusinessMessagesDeleted extends Update {
  /// **UpdateBusinessMessagesDeleted** *(updateBusinessMessagesDeleted)* - child of Update
  ///
  /// Messages in a business account were deleted; for bots only.
  ///
  /// * [connectionId]: Unique identifier of the business connection.
  /// * [chatId]: Identifier of a chat in the business account in which messages were deleted.
  /// * [messageIds]: Unique message identifiers of the deleted messages.
  const UpdateBusinessMessagesDeleted({
    required this.connectionId,
    required this.chatId,
    required this.messageIds,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the business connection
  final String connectionId;

  /// Identifier of a chat in the business account in which messages were deleted
  final int chatId;

  /// Unique message identifiers of the deleted messages
  final List<int> messageIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateBusinessMessagesDeleted.fromJson(Map<String, dynamic> json) =>
      UpdateBusinessMessagesDeleted(
        connectionId: json['connection_id'],
        chatId: json['chat_id'],
        messageIds: List<int>.from(
            (json['message_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "connection_id": connectionId,
      "chat_id": chatId,
      "message_ids": messageIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [connection_id]: Unique identifier of the business connection
  /// * [chat_id]: Identifier of a chat in the business account in which messages were deleted
  /// * [message_ids]: Unique message identifiers of the deleted messages
  @override
  UpdateBusinessMessagesDeleted copyWith({
    String? connectionId,
    int? chatId,
    List<int>? messageIds,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateBusinessMessagesDeleted(
        connectionId: connectionId ?? this.connectionId,
        chatId: chatId ?? this.chatId,
        messageIds: messageIds ?? this.messageIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateBusinessMessagesDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewInlineQuery** *(updateNewInlineQuery)* - child of Update
///
/// A new incoming inline query; for bots only.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [userLocation]: User location; may be null *(optional)*.
/// * [chatType]: The type of the chat from which the query originated; may be null if unknown *(optional)*.
/// * [query]: Text of the query.
/// * [offset]: Offset of the first entry to return.
final class UpdateNewInlineQuery extends Update {
  /// **UpdateNewInlineQuery** *(updateNewInlineQuery)* - child of Update
  ///
  /// A new incoming inline query; for bots only.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [userLocation]: User location; may be null *(optional)*.
  /// * [chatType]: The type of the chat from which the query originated; may be null if unknown *(optional)*.
  /// * [query]: Text of the query.
  /// * [offset]: Offset of the first entry to return.
  const UpdateNewInlineQuery({
    required this.id,
    required this.senderUserId,
    this.userLocation,
    this.chatType,
    required this.query,
    required this.offset,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// User location; may be null
  final Location? userLocation;

  /// The type of the chat from which the query originated; may be null if unknown
  final ChatType? chatType;

  /// Text of the query
  final String query;

  /// Offset of the first entry to return
  final String offset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewInlineQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewInlineQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        userLocation: json['user_location'] == null
            ? null
            : Location.fromJson(json['user_location']),
        chatType: json['chat_type'] == null
            ? null
            : ChatType.fromJson(json['chat_type']),
        query: json['query'],
        offset: json['offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "user_location": userLocation?.toJson(),
      "chat_type": chatType?.toJson(),
      "query": query,
      "offset": offset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [user_location]: User location; may be null
  /// * [chat_type]: The type of the chat from which the query originated; may be null if unknown
  /// * [query]: Text of the query
  /// * [offset]: Offset of the first entry to return
  @override
  UpdateNewInlineQuery copyWith({
    int? id,
    int? senderUserId,
    Location? userLocation,
    ChatType? chatType,
    String? query,
    String? offset,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewInlineQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        userLocation: userLocation ?? this.userLocation,
        chatType: chatType ?? this.chatType,
        query: query ?? this.query,
        offset: offset ?? this.offset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewInlineQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewChosenInlineResult** *(updateNewChosenInlineResult)* - child of Update
///
/// The user has chosen a result of an inline query; for bots only.
///
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [userLocation]: User location; may be null *(optional)*.
/// * [query]: Text of the query.
/// * [resultId]: Identifier of the chosen result.
/// * [inlineMessageId]: Identifier of the sent inline message, if known.
final class UpdateNewChosenInlineResult extends Update {
  /// **UpdateNewChosenInlineResult** *(updateNewChosenInlineResult)* - child of Update
  ///
  /// The user has chosen a result of an inline query; for bots only.
  ///
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [userLocation]: User location; may be null *(optional)*.
  /// * [query]: Text of the query.
  /// * [resultId]: Identifier of the chosen result.
  /// * [inlineMessageId]: Identifier of the sent inline message, if known.
  const UpdateNewChosenInlineResult({
    required this.senderUserId,
    this.userLocation,
    required this.query,
    required this.resultId,
    required this.inlineMessageId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// User location; may be null
  final Location? userLocation;

  /// Text of the query
  final String query;

  /// Identifier of the chosen result
  final String resultId;

  /// Identifier of the sent inline message, if known
  final String inlineMessageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewChosenInlineResult.fromJson(Map<String, dynamic> json) =>
      UpdateNewChosenInlineResult(
        senderUserId: json['sender_user_id'],
        userLocation: json['user_location'] == null
            ? null
            : Location.fromJson(json['user_location']),
        query: json['query'],
        resultId: json['result_id'],
        inlineMessageId: json['inline_message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_user_id": senderUserId,
      "user_location": userLocation?.toJson(),
      "query": query,
      "result_id": resultId,
      "inline_message_id": inlineMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [user_location]: User location; may be null
  /// * [query]: Text of the query
  /// * [result_id]: Identifier of the chosen result
  /// * [inline_message_id]: Identifier of the sent inline message, if known
  @override
  UpdateNewChosenInlineResult copyWith({
    int? senderUserId,
    Location? userLocation,
    String? query,
    String? resultId,
    String? inlineMessageId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewChosenInlineResult(
        senderUserId: senderUserId ?? this.senderUserId,
        userLocation: userLocation ?? this.userLocation,
        query: query ?? this.query,
        resultId: resultId ?? this.resultId,
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewChosenInlineResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewGuestQuery** *(updateNewGuestQuery)* - child of Update
///
/// A new incoming guest query; for bots only.
///
/// * [id]: Unique query identifier.
/// * [message]: The message with the query.
/// * [referenceMessages]: The list of reference messages.
final class UpdateNewGuestQuery extends Update {
  /// **UpdateNewGuestQuery** *(updateNewGuestQuery)* - child of Update
  ///
  /// A new incoming guest query; for bots only.
  ///
  /// * [id]: Unique query identifier.
  /// * [message]: The message with the query.
  /// * [referenceMessages]: The list of reference messages.
  const UpdateNewGuestQuery({
    required this.id,
    required this.message,
    required this.referenceMessages,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// The message with the query
  final Message message;

  /// The list of reference messages
  final List<Message> referenceMessages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewGuestQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewGuestQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        message: Message.fromJson(json['message']),
        referenceMessages: List<Message>.from((json['reference_messages'] ?? [])
            .map((item) => Message.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "message": message.toJson(),
      "reference_messages": referenceMessages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [message]: The message with the query
  /// * [reference_messages]: The list of reference messages
  @override
  UpdateNewGuestQuery copyWith({
    int? id,
    Message? message,
    List<Message>? referenceMessages,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewGuestQuery(
        id: id ?? this.id,
        message: message ?? this.message,
        referenceMessages: referenceMessages ?? this.referenceMessages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewGuestQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewCallbackQuery** *(updateNewCallbackQuery)* - child of Update
///
/// A new incoming callback query; for bots only.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [chatId]: Identifier of the chat where the query was sent.
/// * [messageId]: Identifier of the message from which the query originated.
/// * [chatInstance]: Identifier that uniquely corresponds to the chat to which the message was sent.
/// * [payload]: Query payload.
final class UpdateNewCallbackQuery extends Update {
  /// **UpdateNewCallbackQuery** *(updateNewCallbackQuery)* - child of Update
  ///
  /// A new incoming callback query; for bots only.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [chatId]: Identifier of the chat where the query was sent.
  /// * [messageId]: Identifier of the message from which the query originated.
  /// * [chatInstance]: Identifier that uniquely corresponds to the chat to which the message was sent.
  /// * [payload]: Query payload.
  const UpdateNewCallbackQuery({
    required this.id,
    required this.senderUserId,
    required this.chatId,
    required this.messageId,
    required this.chatInstance,
    required this.payload,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// Identifier of the chat where the query was sent
  final int chatId;

  /// Identifier of the message from which the query originated
  final int messageId;

  /// Identifier that uniquely corresponds to the chat to which the message was sent
  final int chatInstance;

  /// Query payload
  final CallbackQueryPayload payload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewCallbackQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewCallbackQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        chatId: json['chat_id'],
        messageId: json['message_id'],
        chatInstance: json['chat_instance'] is int
            ? json['chat_instance']
            : int.parse(json['chat_instance']),
        payload: CallbackQueryPayload.fromJson(json['payload']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "chat_id": chatId,
      "message_id": messageId,
      "chat_instance": chatInstance,
      "payload": payload.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [chat_id]: Identifier of the chat where the query was sent
  /// * [message_id]: Identifier of the message from which the query originated
  /// * [chat_instance]: Identifier that uniquely corresponds to the chat to which the message was sent
  /// * [payload]: Query payload
  @override
  UpdateNewCallbackQuery copyWith({
    int? id,
    int? senderUserId,
    int? chatId,
    int? messageId,
    int? chatInstance,
    CallbackQueryPayload? payload,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewCallbackQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        chatInstance: chatInstance ?? this.chatInstance,
        payload: payload ?? this.payload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewCallbackQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewInlineCallbackQuery** *(updateNewInlineCallbackQuery)* - child of Update
///
/// A new incoming callback query from a message sent via a bot; for bots only.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [inlineMessageId]: Identifier of the inline message from which the query originated.
/// * [chatInstance]: An identifier uniquely corresponding to the chat a message was sent to.
/// * [payload]: Query payload.
final class UpdateNewInlineCallbackQuery extends Update {
  /// **UpdateNewInlineCallbackQuery** *(updateNewInlineCallbackQuery)* - child of Update
  ///
  /// A new incoming callback query from a message sent via a bot; for bots only.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [inlineMessageId]: Identifier of the inline message from which the query originated.
  /// * [chatInstance]: An identifier uniquely corresponding to the chat a message was sent to.
  /// * [payload]: Query payload.
  const UpdateNewInlineCallbackQuery({
    required this.id,
    required this.senderUserId,
    required this.inlineMessageId,
    required this.chatInstance,
    required this.payload,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// Identifier of the inline message from which the query originated
  final String inlineMessageId;

  /// An identifier uniquely corresponding to the chat a message was sent to
  final int chatInstance;

  /// Query payload
  final CallbackQueryPayload payload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewInlineCallbackQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewInlineCallbackQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        inlineMessageId: json['inline_message_id'],
        chatInstance: json['chat_instance'] is int
            ? json['chat_instance']
            : int.parse(json['chat_instance']),
        payload: CallbackQueryPayload.fromJson(json['payload']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "inline_message_id": inlineMessageId,
      "chat_instance": chatInstance,
      "payload": payload.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [inline_message_id]: Identifier of the inline message from which the query originated
  /// * [chat_instance]: An identifier uniquely corresponding to the chat a message was sent to
  /// * [payload]: Query payload
  @override
  UpdateNewInlineCallbackQuery copyWith({
    int? id,
    int? senderUserId,
    String? inlineMessageId,
    int? chatInstance,
    CallbackQueryPayload? payload,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewInlineCallbackQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        chatInstance: chatInstance ?? this.chatInstance,
        payload: payload ?? this.payload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewInlineCallbackQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewBusinessCallbackQuery** *(updateNewBusinessCallbackQuery)* - child of Update
///
/// A new incoming callback query from a business message; for bots only.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [connectionId]: Unique identifier of the business connection.
/// * [message]: The message from the business account from which the query originated.
/// * [chatInstance]: An identifier uniquely corresponding to the chat a message was sent to.
/// * [payload]: Query payload.
final class UpdateNewBusinessCallbackQuery extends Update {
  /// **UpdateNewBusinessCallbackQuery** *(updateNewBusinessCallbackQuery)* - child of Update
  ///
  /// A new incoming callback query from a business message; for bots only.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [connectionId]: Unique identifier of the business connection.
  /// * [message]: The message from the business account from which the query originated.
  /// * [chatInstance]: An identifier uniquely corresponding to the chat a message was sent to.
  /// * [payload]: Query payload.
  const UpdateNewBusinessCallbackQuery({
    required this.id,
    required this.senderUserId,
    required this.connectionId,
    required this.message,
    required this.chatInstance,
    required this.payload,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// Unique identifier of the business connection
  final String connectionId;

  /// The message from the business account from which the query originated
  final BusinessMessage message;

  /// An identifier uniquely corresponding to the chat a message was sent to
  final int chatInstance;

  /// Query payload
  final CallbackQueryPayload payload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewBusinessCallbackQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewBusinessCallbackQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        connectionId: json['connection_id'],
        message: BusinessMessage.fromJson(json['message']),
        chatInstance: json['chat_instance'] is int
            ? json['chat_instance']
            : int.parse(json['chat_instance']),
        payload: CallbackQueryPayload.fromJson(json['payload']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "connection_id": connectionId,
      "message": message.toJson(),
      "chat_instance": chatInstance,
      "payload": payload.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [connection_id]: Unique identifier of the business connection
  /// * [message]: The message from the business account from which the query originated
  /// * [chat_instance]: An identifier uniquely corresponding to the chat a message was sent to
  /// * [payload]: Query payload
  @override
  UpdateNewBusinessCallbackQuery copyWith({
    int? id,
    int? senderUserId,
    String? connectionId,
    BusinessMessage? message,
    int? chatInstance,
    CallbackQueryPayload? payload,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewBusinessCallbackQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        connectionId: connectionId ?? this.connectionId,
        message: message ?? this.message,
        chatInstance: chatInstance ?? this.chatInstance,
        payload: payload ?? this.payload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewBusinessCallbackQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewShippingQuery** *(updateNewShippingQuery)* - child of Update
///
/// A new incoming shipping query; for bots only. Only for invoices with flexible price.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [invoicePayload]: Invoice payload.
/// * [shippingAddress]: User shipping address.
final class UpdateNewShippingQuery extends Update {
  /// **UpdateNewShippingQuery** *(updateNewShippingQuery)* - child of Update
  ///
  /// A new incoming shipping query; for bots only. Only for invoices with flexible price.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [invoicePayload]: Invoice payload.
  /// * [shippingAddress]: User shipping address.
  const UpdateNewShippingQuery({
    required this.id,
    required this.senderUserId,
    required this.invoicePayload,
    required this.shippingAddress,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// Invoice payload
  final String invoicePayload;

  /// User shipping address
  final Address shippingAddress;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewShippingQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewShippingQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        invoicePayload: json['invoice_payload'],
        shippingAddress: Address.fromJson(json['shipping_address']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "invoice_payload": invoicePayload,
      "shipping_address": shippingAddress.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [invoice_payload]: Invoice payload
  /// * [shipping_address]: User shipping address
  @override
  UpdateNewShippingQuery copyWith({
    int? id,
    int? senderUserId,
    String? invoicePayload,
    Address? shippingAddress,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewShippingQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewShippingQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewPreCheckoutQuery** *(updateNewPreCheckoutQuery)* - child of Update
///
/// A new incoming pre-checkout query; for bots only. Contains full information about a checkout.
///
/// * [id]: Unique query identifier.
/// * [senderUserId]: Identifier of the user who sent the query.
/// * [currency]: Currency for the product price.
/// * [totalAmount]: Total price for the product, in the smallest units of the currency.
/// * [invoicePayload]: Invoice payload.
/// * [shippingOptionId]: Identifier of a shipping option chosen by the user; may be empty if not applicable.
/// * [orderInfo]: Information about the order; may be null *(optional)*.
final class UpdateNewPreCheckoutQuery extends Update {
  /// **UpdateNewPreCheckoutQuery** *(updateNewPreCheckoutQuery)* - child of Update
  ///
  /// A new incoming pre-checkout query; for bots only. Contains full information about a checkout.
  ///
  /// * [id]: Unique query identifier.
  /// * [senderUserId]: Identifier of the user who sent the query.
  /// * [currency]: Currency for the product price.
  /// * [totalAmount]: Total price for the product, in the smallest units of the currency.
  /// * [invoicePayload]: Invoice payload.
  /// * [shippingOptionId]: Identifier of a shipping option chosen by the user; may be empty if not applicable.
  /// * [orderInfo]: Information about the order; may be null *(optional)*.
  const UpdateNewPreCheckoutQuery({
    required this.id,
    required this.senderUserId,
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    required this.shippingOptionId,
    this.orderInfo,
    this.extra,
    this.clientId,
  });

  /// Unique query identifier
  final int id;

  /// Identifier of the user who sent the query
  final int senderUserId;

  /// Currency for the product price
  final String currency;

  /// Total price for the product, in the smallest units of the currency
  final int totalAmount;

  /// Invoice payload
  final String invoicePayload;

  /// Identifier of a shipping option chosen by the user; may be empty if not applicable
  final String shippingOptionId;

  /// Information about the order; may be null
  final OrderInfo? orderInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewPreCheckoutQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewPreCheckoutQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        senderUserId: json['sender_user_id'],
        currency: json['currency'],
        totalAmount: json['total_amount'],
        invoicePayload: json['invoice_payload'],
        shippingOptionId: json['shipping_option_id'],
        orderInfo: json['order_info'] == null
            ? null
            : OrderInfo.fromJson(json['order_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_user_id": senderUserId,
      "currency": currency,
      "total_amount": totalAmount,
      "invoice_payload": invoicePayload,
      "shipping_option_id": shippingOptionId,
      "order_info": orderInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique query identifier
  /// * [sender_user_id]: Identifier of the user who sent the query
  /// * [currency]: Currency for the product price
  /// * [total_amount]: Total price for the product, in the smallest units of the currency
  /// * [invoice_payload]: Invoice payload
  /// * [shipping_option_id]: Identifier of a shipping option chosen by the user; may be empty if not applicable
  /// * [order_info]: Information about the order; may be null
  @override
  UpdateNewPreCheckoutQuery copyWith({
    int? id,
    int? senderUserId,
    String? currency,
    int? totalAmount,
    String? invoicePayload,
    String? shippingOptionId,
    OrderInfo? orderInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewPreCheckoutQuery(
        id: id ?? this.id,
        senderUserId: senderUserId ?? this.senderUserId,
        currency: currency ?? this.currency,
        totalAmount: totalAmount ?? this.totalAmount,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        shippingOptionId: shippingOptionId ?? this.shippingOptionId,
        orderInfo: orderInfo ?? this.orderInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewPreCheckoutQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewCustomEvent** *(updateNewCustomEvent)* - child of Update
///
/// A new incoming event; for bots only.
///
/// * [event]: A JSON-serialized event.
final class UpdateNewCustomEvent extends Update {
  /// **UpdateNewCustomEvent** *(updateNewCustomEvent)* - child of Update
  ///
  /// A new incoming event; for bots only.
  ///
  /// * [event]: A JSON-serialized event.
  const UpdateNewCustomEvent({
    required this.event,
    this.extra,
    this.clientId,
  });

  /// A JSON-serialized event
  final String event;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewCustomEvent.fromJson(Map<String, dynamic> json) =>
      UpdateNewCustomEvent(
        event: json['event'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "event": event,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [event]: A JSON-serialized event
  @override
  UpdateNewCustomEvent copyWith({
    String? event,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewCustomEvent(
        event: event ?? this.event,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewCustomEvent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewCustomQuery** *(updateNewCustomQuery)* - child of Update
///
/// A new incoming query; for bots only.
///
/// * [id]: The query identifier.
/// * [data]: JSON-serialized query data.
/// * [timeout]: Query timeout.
final class UpdateNewCustomQuery extends Update {
  /// **UpdateNewCustomQuery** *(updateNewCustomQuery)* - child of Update
  ///
  /// A new incoming query; for bots only.
  ///
  /// * [id]: The query identifier.
  /// * [data]: JSON-serialized query data.
  /// * [timeout]: Query timeout.
  const UpdateNewCustomQuery({
    required this.id,
    required this.data,
    required this.timeout,
    this.extra,
    this.clientId,
  });

  /// The query identifier
  final int id;

  /// JSON-serialized query data
  final String data;

  /// Query timeout
  final int timeout;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewCustomQuery.fromJson(Map<String, dynamic> json) =>
      UpdateNewCustomQuery(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        data: json['data'],
        timeout: json['timeout'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "data": data,
      "timeout": timeout,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: The query identifier
  /// * [data]: JSON-serialized query data
  /// * [timeout]: Query timeout
  @override
  UpdateNewCustomQuery copyWith({
    int? id,
    String? data,
    int? timeout,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewCustomQuery(
        id: id ?? this.id,
        data: data ?? this.data,
        timeout: timeout ?? this.timeout,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewCustomQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateUserSubscription** *(updateUserSubscription)* - child of Update
///
/// Subscription of a user to the bot was changed; for bots only.
///
/// * [userId]: Identifier of the user.
/// * [payload]: Bot-specified subscription invoice payload.
/// * [isCanceled]: True, if the subscription was canceled.
/// * [isRestored]: True, if the subscription was restored.
/// * [isPaymentFailed]: True, if the payment for the subscription has failed.
final class UpdateUserSubscription extends Update {
  /// **UpdateUserSubscription** *(updateUserSubscription)* - child of Update
  ///
  /// Subscription of a user to the bot was changed; for bots only.
  ///
  /// * [userId]: Identifier of the user.
  /// * [payload]: Bot-specified subscription invoice payload.
  /// * [isCanceled]: True, if the subscription was canceled.
  /// * [isRestored]: True, if the subscription was restored.
  /// * [isPaymentFailed]: True, if the payment for the subscription has failed.
  const UpdateUserSubscription({
    required this.userId,
    required this.payload,
    required this.isCanceled,
    required this.isRestored,
    required this.isPaymentFailed,
    this.extra,
    this.clientId,
  });

  /// Identifier of the user
  final int userId;

  /// Bot-specified subscription invoice payload
  final String payload;

  /// True, if the subscription was canceled
  final bool isCanceled;

  /// True, if the subscription was restored
  final bool isRestored;

  /// True, if the payment for the subscription has failed
  final bool isPaymentFailed;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateUserSubscription.fromJson(Map<String, dynamic> json) =>
      UpdateUserSubscription(
        userId: json['user_id'],
        payload: json['payload'],
        isCanceled: json['is_canceled'],
        isRestored: json['is_restored'],
        isPaymentFailed: json['is_payment_failed'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "payload": payload,
      "is_canceled": isCanceled,
      "is_restored": isRestored,
      "is_payment_failed": isPaymentFailed,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [payload]: Bot-specified subscription invoice payload
  /// * [is_canceled]: True, if the subscription was canceled
  /// * [is_restored]: True, if the subscription was restored
  /// * [is_payment_failed]: True, if the payment for the subscription has failed
  @override
  UpdateUserSubscription copyWith({
    int? userId,
    String? payload,
    bool? isCanceled,
    bool? isRestored,
    bool? isPaymentFailed,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateUserSubscription(
        userId: userId ?? this.userId,
        payload: payload ?? this.payload,
        isCanceled: isCanceled ?? this.isCanceled,
        isRestored: isRestored ?? this.isRestored,
        isPaymentFailed: isPaymentFailed ?? this.isPaymentFailed,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateUserSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdatePoll** *(updatePoll)* - child of Update
///
/// A poll was updated; for bots only.
///
/// * [poll]: New data about the poll.
final class UpdatePoll extends Update {
  /// **UpdatePoll** *(updatePoll)* - child of Update
  ///
  /// A poll was updated; for bots only.
  ///
  /// * [poll]: New data about the poll.
  const UpdatePoll({
    required this.poll,
    this.extra,
    this.clientId,
  });

  /// New data about the poll
  final Poll poll;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdatePoll.fromJson(Map<String, dynamic> json) => UpdatePoll(
        poll: Poll.fromJson(json['poll']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poll": poll.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poll]: New data about the poll
  @override
  UpdatePoll copyWith({
    Poll? poll,
    dynamic extra,
    int? clientId,
  }) =>
      UpdatePoll(
        poll: poll ?? this.poll,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updatePoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdatePollAnswer** *(updatePollAnswer)* - child of Update
///
/// A user changed the answer to a poll; for bots only.
///
/// * [pollId]: Unique poll identifier.
/// * [voterId]: Identifier of the message sender that changed the answer to the poll.
/// * [optionIds]: Unique identifiers of answer options, that were chosen by the user.
/// * [optionPositions]: 0-based identifiers of answer options, that were chosen by the user.
final class UpdatePollAnswer extends Update {
  /// **UpdatePollAnswer** *(updatePollAnswer)* - child of Update
  ///
  /// A user changed the answer to a poll; for bots only.
  ///
  /// * [pollId]: Unique poll identifier.
  /// * [voterId]: Identifier of the message sender that changed the answer to the poll.
  /// * [optionIds]: Unique identifiers of answer options, that were chosen by the user.
  /// * [optionPositions]: 0-based identifiers of answer options, that were chosen by the user.
  const UpdatePollAnswer({
    required this.pollId,
    required this.voterId,
    required this.optionIds,
    required this.optionPositions,
    this.extra,
    this.clientId,
  });

  /// Unique poll identifier
  final int pollId;

  /// Identifier of the message sender that changed the answer to the poll
  final MessageSender voterId;

  /// Unique identifiers of answer options, that were chosen by the user
  final List<String> optionIds;

  /// 0-based identifiers of answer options, that were chosen by the user
  final List<int> optionPositions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdatePollAnswer.fromJson(Map<String, dynamic> json) =>
      UpdatePollAnswer(
        pollId: json['poll_id'] is int
            ? json['poll_id']
            : int.parse(json['poll_id']),
        voterId: MessageSender.fromJson(json['voter_id']),
        optionIds: List<String>.from(
            (json['option_ids'] ?? []).map((item) => item).toList()),
        optionPositions: List<int>.from(
            (json['option_positions'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poll_id": pollId,
      "voter_id": voterId.toJson(),
      "option_ids": optionIds.map((i) => i).toList(),
      "option_positions": optionPositions.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poll_id]: Unique poll identifier
  /// * [voter_id]: Identifier of the message sender that changed the answer to the poll
  /// * [option_ids]: Unique identifiers of answer options, that were chosen by the user
  /// * [option_positions]: 0-based identifiers of answer options, that were chosen by the user
  @override
  UpdatePollAnswer copyWith({
    int? pollId,
    MessageSender? voterId,
    List<String>? optionIds,
    List<int>? optionPositions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdatePollAnswer(
        pollId: pollId ?? this.pollId,
        voterId: voterId ?? this.voterId,
        optionIds: optionIds ?? this.optionIds,
        optionPositions: optionPositions ?? this.optionPositions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updatePollAnswer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateManagedBot** *(updateManagedBot)* - child of Update
///
/// A bot that can be managed by the current bot was created or updated; for bots only.
///
/// * [userId]: Identifier of the user who created the bot.
/// * [botUserId]: Identifier of the created managed bot.
final class UpdateManagedBot extends Update {
  /// **UpdateManagedBot** *(updateManagedBot)* - child of Update
  ///
  /// A bot that can be managed by the current bot was created or updated; for bots only.
  ///
  /// * [userId]: Identifier of the user who created the bot.
  /// * [botUserId]: Identifier of the created managed bot.
  const UpdateManagedBot({
    required this.userId,
    required this.botUserId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the user who created the bot
  final int userId;

  /// Identifier of the created managed bot
  final int botUserId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateManagedBot.fromJson(Map<String, dynamic> json) =>
      UpdateManagedBot(
        userId: json['user_id'],
        botUserId: json['bot_user_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "bot_user_id": botUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who created the bot
  /// * [bot_user_id]: Identifier of the created managed bot
  @override
  UpdateManagedBot copyWith({
    int? userId,
    int? botUserId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateManagedBot(
        userId: userId ?? this.userId,
        botUserId: botUserId ?? this.botUserId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateManagedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatMember** *(updateChatMember)* - child of Update
///
/// User rights changed in a chat; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [actorUserId]: Identifier of the user, changing the rights.
/// * [date]: Point in time (Unix timestamp) when the user rights were changed.
/// * [inviteLink]: If user has joined the chat using an invite link, the invite link; may be null *(optional)*.
/// * [viaJoinRequest]: True, if the user has joined the chat after sending a join request and being approved by an administrator.
/// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
/// * [oldChatMember]: Previous chat member.
/// * [newChatMember]: New chat member.
final class UpdateChatMember extends Update {
  /// **UpdateChatMember** *(updateChatMember)* - child of Update
  ///
  /// User rights changed in a chat; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [actorUserId]: Identifier of the user, changing the rights.
  /// * [date]: Point in time (Unix timestamp) when the user rights were changed.
  /// * [inviteLink]: If user has joined the chat using an invite link, the invite link; may be null *(optional)*.
  /// * [viaJoinRequest]: True, if the user has joined the chat after sending a join request and being approved by an administrator.
  /// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
  /// * [oldChatMember]: Previous chat member.
  /// * [newChatMember]: New chat member.
  const UpdateChatMember({
    required this.chatId,
    required this.actorUserId,
    required this.date,
    this.inviteLink,
    required this.viaJoinRequest,
    required this.viaChatFolderInviteLink,
    required this.oldChatMember,
    required this.newChatMember,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user, changing the rights
  final int actorUserId;

  /// Point in time (Unix timestamp) when the user rights were changed
  final int date;

  /// If user has joined the chat using an invite link, the invite link; may be null
  final ChatInviteLink? inviteLink;

  /// True, if the user has joined the chat after sending a join request and being approved by an administrator
  final bool viaJoinRequest;

  /// True, if the user has joined the chat using an invite link for a chat folder
  final bool viaChatFolderInviteLink;

  /// Previous chat member
  final ChatMember oldChatMember;

  /// New chat member
  final ChatMember newChatMember;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatMember.fromJson(Map<String, dynamic> json) =>
      UpdateChatMember(
        chatId: json['chat_id'],
        actorUserId: json['actor_user_id'],
        date: json['date'],
        inviteLink: json['invite_link'] == null
            ? null
            : ChatInviteLink.fromJson(json['invite_link']),
        viaJoinRequest: json['via_join_request'],
        viaChatFolderInviteLink: json['via_chat_folder_invite_link'],
        oldChatMember: ChatMember.fromJson(json['old_chat_member']),
        newChatMember: ChatMember.fromJson(json['new_chat_member']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "actor_user_id": actorUserId,
      "date": date,
      "invite_link": inviteLink?.toJson(),
      "via_join_request": viaJoinRequest,
      "via_chat_folder_invite_link": viaChatFolderInviteLink,
      "old_chat_member": oldChatMember.toJson(),
      "new_chat_member": newChatMember.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [actor_user_id]: Identifier of the user, changing the rights
  /// * [date]: Point in time (Unix timestamp) when the user rights were changed
  /// * [invite_link]: If user has joined the chat using an invite link, the invite link; may be null
  /// * [via_join_request]: True, if the user has joined the chat after sending a join request and being approved by an administrator
  /// * [via_chat_folder_invite_link]: True, if the user has joined the chat using an invite link for a chat folder
  /// * [old_chat_member]: Previous chat member
  /// * [new_chat_member]: New chat member
  @override
  UpdateChatMember copyWith({
    int? chatId,
    int? actorUserId,
    int? date,
    ChatInviteLink? inviteLink,
    bool? viaJoinRequest,
    bool? viaChatFolderInviteLink,
    ChatMember? oldChatMember,
    ChatMember? newChatMember,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatMember(
        chatId: chatId ?? this.chatId,
        actorUserId: actorUserId ?? this.actorUserId,
        date: date ?? this.date,
        inviteLink: inviteLink ?? this.inviteLink,
        viaJoinRequest: viaJoinRequest ?? this.viaJoinRequest,
        viaChatFolderInviteLink:
            viaChatFolderInviteLink ?? this.viaChatFolderInviteLink,
        oldChatMember: oldChatMember ?? this.oldChatMember,
        newChatMember: newChatMember ?? this.newChatMember,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateNewChatJoinRequest** *(updateNewChatJoinRequest)* - child of Update
///
/// A user sent a join request to a chat; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [request]: Join request.
/// * [userChatId]: Chat identifier of the private chat with the user.
/// * [inviteLink]: The invite link, which was used to send join request; may be null *(optional)*.
/// * [queryId]: Identifier of the join request query, which can be used in answerChatJoinRequestQuery; 0 if none.
final class UpdateNewChatJoinRequest extends Update {
  /// **UpdateNewChatJoinRequest** *(updateNewChatJoinRequest)* - child of Update
  ///
  /// A user sent a join request to a chat; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [request]: Join request.
  /// * [userChatId]: Chat identifier of the private chat with the user.
  /// * [inviteLink]: The invite link, which was used to send join request; may be null *(optional)*.
  /// * [queryId]: Identifier of the join request query, which can be used in answerChatJoinRequestQuery; 0 if none.
  const UpdateNewChatJoinRequest({
    required this.chatId,
    required this.request,
    required this.userChatId,
    this.inviteLink,
    required this.queryId,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Join request
  final ChatJoinRequest request;

  /// Chat identifier of the private chat with the user
  final int userChatId;

  /// The invite link, which was used to send join request; may be null
  final ChatInviteLink? inviteLink;

  /// Identifier of the join request query, which can be used in answerChatJoinRequestQuery; 0 if none
  final int queryId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateNewChatJoinRequest.fromJson(Map<String, dynamic> json) =>
      UpdateNewChatJoinRequest(
        chatId: json['chat_id'],
        request: ChatJoinRequest.fromJson(json['request']),
        userChatId: json['user_chat_id'],
        inviteLink: json['invite_link'] == null
            ? null
            : ChatInviteLink.fromJson(json['invite_link']),
        queryId: json['query_id'] is int
            ? json['query_id']
            : int.tryParse(json['query_id'] ?? "") ?? 0,
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "request": request.toJson(),
      "user_chat_id": userChatId,
      "invite_link": inviteLink?.toJson(),
      "query_id": queryId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [request]: Join request
  /// * [user_chat_id]: Chat identifier of the private chat with the user
  /// * [invite_link]: The invite link, which was used to send join request; may be null
  /// * [query_id]: Identifier of the join request query, which can be used in answerChatJoinRequestQuery; 0 if none
  @override
  UpdateNewChatJoinRequest copyWith({
    int? chatId,
    ChatJoinRequest? request,
    int? userChatId,
    ChatInviteLink? inviteLink,
    int? queryId,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateNewChatJoinRequest(
        chatId: chatId ?? this.chatId,
        request: request ?? this.request,
        userChatId: userChatId ?? this.userChatId,
        inviteLink: inviteLink ?? this.inviteLink,
        queryId: queryId ?? this.queryId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateNewChatJoinRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateChatBoost** *(updateChatBoost)* - child of Update
///
/// A chat boost has changed; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [boost]: New information about the boost.
final class UpdateChatBoost extends Update {
  /// **UpdateChatBoost** *(updateChatBoost)* - child of Update
  ///
  /// A chat boost has changed; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [boost]: New information about the boost.
  const UpdateChatBoost({
    required this.chatId,
    required this.boost,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// New information about the boost
  final ChatBoost boost;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateChatBoost.fromJson(Map<String, dynamic> json) =>
      UpdateChatBoost(
        chatId: json['chat_id'],
        boost: ChatBoost.fromJson(json['boost']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "boost": boost.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [boost]: New information about the boost
  @override
  UpdateChatBoost copyWith({
    int? chatId,
    ChatBoost? boost,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateChatBoost(
        chatId: chatId ?? this.chatId,
        boost: boost ?? this.boost,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateChatBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageReaction** *(updateMessageReaction)* - child of Update
///
/// User changed its reactions on a message with public reactions; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [actorId]: Identifier of the user or chat that changed reactions.
/// * [date]: Point in time (Unix timestamp) when the reactions were changed.
/// * [oldReactionTypes]: Old list of chosen reactions.
/// * [newReactionTypes]: New list of chosen reactions.
final class UpdateMessageReaction extends Update {
  /// **UpdateMessageReaction** *(updateMessageReaction)* - child of Update
  ///
  /// User changed its reactions on a message with public reactions; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [actorId]: Identifier of the user or chat that changed reactions.
  /// * [date]: Point in time (Unix timestamp) when the reactions were changed.
  /// * [oldReactionTypes]: Old list of chosen reactions.
  /// * [newReactionTypes]: New list of chosen reactions.
  const UpdateMessageReaction({
    required this.chatId,
    required this.messageId,
    required this.actorId,
    required this.date,
    required this.oldReactionTypes,
    required this.newReactionTypes,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Identifier of the user or chat that changed reactions
  final MessageSender actorId;

  /// Point in time (Unix timestamp) when the reactions were changed
  final int date;

  /// Old list of chosen reactions
  final List<ReactionType> oldReactionTypes;

  /// New list of chosen reactions
  final List<ReactionType> newReactionTypes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageReaction.fromJson(Map<String, dynamic> json) =>
      UpdateMessageReaction(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        actorId: MessageSender.fromJson(json['actor_id']),
        date: json['date'],
        oldReactionTypes: List<ReactionType>.from(
            (json['old_reaction_types'] ?? [])
                .map((item) => ReactionType.fromJson(item))
                .toList()),
        newReactionTypes: List<ReactionType>.from(
            (json['new_reaction_types'] ?? [])
                .map((item) => ReactionType.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "actor_id": actorId.toJson(),
      "date": date,
      "old_reaction_types": oldReactionTypes.map((i) => i.toJson()).toList(),
      "new_reaction_types": newReactionTypes.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [actor_id]: Identifier of the user or chat that changed reactions
  /// * [date]: Point in time (Unix timestamp) when the reactions were changed
  /// * [old_reaction_types]: Old list of chosen reactions
  /// * [new_reaction_types]: New list of chosen reactions
  @override
  UpdateMessageReaction copyWith({
    int? chatId,
    int? messageId,
    MessageSender? actorId,
    int? date,
    List<ReactionType>? oldReactionTypes,
    List<ReactionType>? newReactionTypes,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageReaction(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        actorId: actorId ?? this.actorId,
        date: date ?? this.date,
        oldReactionTypes: oldReactionTypes ?? this.oldReactionTypes,
        newReactionTypes: newReactionTypes ?? this.newReactionTypes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdateMessageReactions** *(updateMessageReactions)* - child of Update
///
/// Reactions added to a message with anonymous reactions have changed; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [date]: Point in time (Unix timestamp) when the reactions were changed.
/// * [reactions]: The list of reactions added to the message.
final class UpdateMessageReactions extends Update {
  /// **UpdateMessageReactions** *(updateMessageReactions)* - child of Update
  ///
  /// Reactions added to a message with anonymous reactions have changed; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [date]: Point in time (Unix timestamp) when the reactions were changed.
  /// * [reactions]: The list of reactions added to the message.
  const UpdateMessageReactions({
    required this.chatId,
    required this.messageId,
    required this.date,
    required this.reactions,
    this.extra,
    this.clientId,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Point in time (Unix timestamp) when the reactions were changed
  final int date;

  /// The list of reactions added to the message
  final List<MessageReaction> reactions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdateMessageReactions.fromJson(Map<String, dynamic> json) =>
      UpdateMessageReactions(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        date: json['date'],
        reactions: List<MessageReaction>.from((json['reactions'] ?? [])
            .map((item) => MessageReaction.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "date": date,
      "reactions": reactions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [date]: Point in time (Unix timestamp) when the reactions were changed
  /// * [reactions]: The list of reactions added to the message
  @override
  UpdateMessageReactions copyWith({
    int? chatId,
    int? messageId,
    int? date,
    List<MessageReaction>? reactions,
    dynamic extra,
    int? clientId,
  }) =>
      UpdateMessageReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        date: date ?? this.date,
        reactions: reactions ?? this.reactions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updateMessageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpdatePaidMediaPurchased** *(updatePaidMediaPurchased)* - child of Update
///
/// Paid media were purchased by a user; for bots only.
///
/// * [userId]: User identifier.
/// * [payload]: Bot-specified payload for the paid media.
final class UpdatePaidMediaPurchased extends Update {
  /// **UpdatePaidMediaPurchased** *(updatePaidMediaPurchased)* - child of Update
  ///
  /// Paid media were purchased by a user; for bots only.
  ///
  /// * [userId]: User identifier.
  /// * [payload]: Bot-specified payload for the paid media.
  const UpdatePaidMediaPurchased({
    required this.userId,
    required this.payload,
    this.extra,
    this.clientId,
  });

  /// User identifier
  final int userId;

  /// Bot-specified payload for the paid media
  final String payload;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpdatePaidMediaPurchased.fromJson(Map<String, dynamic> json) =>
      UpdatePaidMediaPurchased(
        userId: json['user_id'],
        payload: json['payload'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "payload": payload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [payload]: Bot-specified payload for the paid media
  @override
  UpdatePaidMediaPurchased copyWith({
    int? userId,
    String? payload,
    dynamic extra,
    int? clientId,
  }) =>
      UpdatePaidMediaPurchased(
        userId: userId ?? this.userId,
        payload: payload ?? this.payload,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'updatePaidMediaPurchased';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
