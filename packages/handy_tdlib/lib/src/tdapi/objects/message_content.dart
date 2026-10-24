part of '../tdapi.dart';

/// **MessageContent** *(messageContent)* - parent
///
/// Contains the content of a message.
sealed class MessageContent extends TdObject {
  /// **MessageContent** *(messageContent)* - parent
  ///
  /// Contains the content of a message.
  const MessageContent();

  /// a MessageContent return type can be :
  /// * [MessageText]
  /// * [MessageRichMessage]
  /// * [MessageAnimation]
  /// * [MessageAudio]
  /// * [MessageDocument]
  /// * [MessagePaidMedia]
  /// * [MessagePhoto]
  /// * [MessageSticker]
  /// * [MessageVideo]
  /// * [MessageVideoNote]
  /// * [MessageVoiceNote]
  /// * [MessageExpiredPhoto]
  /// * [MessageExpiredVideo]
  /// * [MessageExpiredVideoNote]
  /// * [MessageExpiredVoiceNote]
  /// * [MessageLiveLocation]
  /// * [MessageLocation]
  /// * [MessageVenue]
  /// * [MessageContact]
  /// * [MessageAnimatedEmoji]
  /// * [MessageDice]
  /// * [MessageGame]
  /// * [MessagePoll]
  /// * [MessageStakeDice]
  /// * [MessageStory]
  /// * [MessageChecklist]
  /// * [MessageInvoice]
  /// * [MessageCall]
  /// * [MessageGroupCall]
  /// * [MessageVideoChatScheduled]
  /// * [MessageVideoChatStarted]
  /// * [MessageVideoChatEnded]
  /// * [MessageInviteVideoChatParticipants]
  /// * [MessagePollOptionAdded]
  /// * [MessagePollOptionDeleted]
  /// * [MessageBasicGroupChatCreate]
  /// * [MessageSupergroupChatCreate]
  /// * [MessageChatChangeTitle]
  /// * [MessageChatChangePhoto]
  /// * [MessageChatDeletePhoto]
  /// * [MessageChatOwnerLeft]
  /// * [MessageChatOwnerChanged]
  /// * [MessageChatHasProtectedContentToggled]
  /// * [MessageChatHasProtectedContentDisableRequested]
  /// * [MessageChatAddMembers]
  /// * [MessageChatJoinByLink]
  /// * [MessageChatJoinByRequest]
  /// * [MessageChatJoinFromCommunity]
  /// * [MessageChatDeleteMember]
  /// * [MessageChatAddedToCommunity]
  /// * [MessageChatRemovedFromCommunity]
  /// * [MessageChatUpgradeTo]
  /// * [MessageChatUpgradeFrom]
  /// * [MessagePinMessage]
  /// * [MessageScreenshotTaken]
  /// * [MessageChatSetBackground]
  /// * [MessageChatSetTheme]
  /// * [MessageChatSetMessageAutoDeleteTime]
  /// * [MessageChatBoost]
  /// * [MessageForumTopicCreated]
  /// * [MessageForumTopicEdited]
  /// * [MessageForumTopicIsClosedToggled]
  /// * [MessageForumTopicIsHiddenToggled]
  /// * [MessageSuggestProfilePhoto]
  /// * [MessageSuggestBirthdate]
  /// * [MessageCustomServiceAction]
  /// * [MessageGameScore]
  /// * [MessageManagedBotCreated]
  /// * [MessagePaymentSuccessful]
  /// * [MessagePaymentSuccessfulBot]
  /// * [MessagePaymentRefunded]
  /// * [MessageGiftedPremium]
  /// * [MessagePremiumGiftCode]
  /// * [MessageGiveawayCreated]
  /// * [MessageGiveaway]
  /// * [MessageGiveawayCompleted]
  /// * [MessageGiveawayWinners]
  /// * [MessageGiftedStars]
  /// * [MessageGiftedGrams]
  /// * [MessageGiveawayPrizeStars]
  /// * [MessageTonWalletTransfer]
  /// * [MessageTonConnectRequest]
  /// * [MessageGift]
  /// * [MessageUpgradedGift]
  /// * [MessageRefundedUpgradedGift]
  /// * [MessageUpgradedGiftPurchaseOffer]
  /// * [MessageUpgradedGiftPurchaseOfferRejected]
  /// * [MessagePaidMessagesRefunded]
  /// * [MessagePaidMessagePriceChanged]
  /// * [MessageDirectMessagePriceChanged]
  /// * [MessageUnpaidMessagesAllowedByLink]
  /// * [MessageChecklistTasksDone]
  /// * [MessageChecklistTasksAdded]
  /// * [MessageSuggestedPostApprovalFailed]
  /// * [MessageSuggestedPostApproved]
  /// * [MessageSuggestedPostDeclined]
  /// * [MessageSuggestedPostPaid]
  /// * [MessageSuggestedPostRefunded]
  /// * [MessageContactRegistered]
  /// * [MessageUsersShared]
  /// * [MessageChatShared]
  /// * [MessageBotWriteAccessAllowed]
  /// * [MessageWebAppDataSent]
  /// * [MessageWebAppDataReceived]
  /// * [MessagePassportDataSent]
  /// * [MessagePassportDataReceived]
  /// * [MessageProximityAlertTriggered]
  /// * [MessageUnsupported]
  factory MessageContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageText.defaultObjectId:
        return MessageText.fromJson(json);
      case MessageRichMessage.defaultObjectId:
        return MessageRichMessage.fromJson(json);
      case MessageAnimation.defaultObjectId:
        return MessageAnimation.fromJson(json);
      case MessageAudio.defaultObjectId:
        return MessageAudio.fromJson(json);
      case MessageDocument.defaultObjectId:
        return MessageDocument.fromJson(json);
      case MessagePaidMedia.defaultObjectId:
        return MessagePaidMedia.fromJson(json);
      case MessagePhoto.defaultObjectId:
        return MessagePhoto.fromJson(json);
      case MessageSticker.defaultObjectId:
        return MessageSticker.fromJson(json);
      case MessageVideo.defaultObjectId:
        return MessageVideo.fromJson(json);
      case MessageVideoNote.defaultObjectId:
        return MessageVideoNote.fromJson(json);
      case MessageVoiceNote.defaultObjectId:
        return MessageVoiceNote.fromJson(json);
      case MessageExpiredPhoto.defaultObjectId:
        return MessageExpiredPhoto.fromJson(json);
      case MessageExpiredVideo.defaultObjectId:
        return MessageExpiredVideo.fromJson(json);
      case MessageExpiredVideoNote.defaultObjectId:
        return MessageExpiredVideoNote.fromJson(json);
      case MessageExpiredVoiceNote.defaultObjectId:
        return MessageExpiredVoiceNote.fromJson(json);
      case MessageLiveLocation.defaultObjectId:
        return MessageLiveLocation.fromJson(json);
      case MessageLocation.defaultObjectId:
        return MessageLocation.fromJson(json);
      case MessageVenue.defaultObjectId:
        return MessageVenue.fromJson(json);
      case MessageContact.defaultObjectId:
        return MessageContact.fromJson(json);
      case MessageAnimatedEmoji.defaultObjectId:
        return MessageAnimatedEmoji.fromJson(json);
      case MessageDice.defaultObjectId:
        return MessageDice.fromJson(json);
      case MessageGame.defaultObjectId:
        return MessageGame.fromJson(json);
      case MessagePoll.defaultObjectId:
        return MessagePoll.fromJson(json);
      case MessageStakeDice.defaultObjectId:
        return MessageStakeDice.fromJson(json);
      case MessageStory.defaultObjectId:
        return MessageStory.fromJson(json);
      case MessageChecklist.defaultObjectId:
        return MessageChecklist.fromJson(json);
      case MessageInvoice.defaultObjectId:
        return MessageInvoice.fromJson(json);
      case MessageCall.defaultObjectId:
        return MessageCall.fromJson(json);
      case MessageGroupCall.defaultObjectId:
        return MessageGroupCall.fromJson(json);
      case MessageVideoChatScheduled.defaultObjectId:
        return MessageVideoChatScheduled.fromJson(json);
      case MessageVideoChatStarted.defaultObjectId:
        return MessageVideoChatStarted.fromJson(json);
      case MessageVideoChatEnded.defaultObjectId:
        return MessageVideoChatEnded.fromJson(json);
      case MessageInviteVideoChatParticipants.defaultObjectId:
        return MessageInviteVideoChatParticipants.fromJson(json);
      case MessagePollOptionAdded.defaultObjectId:
        return MessagePollOptionAdded.fromJson(json);
      case MessagePollOptionDeleted.defaultObjectId:
        return MessagePollOptionDeleted.fromJson(json);
      case MessageBasicGroupChatCreate.defaultObjectId:
        return MessageBasicGroupChatCreate.fromJson(json);
      case MessageSupergroupChatCreate.defaultObjectId:
        return MessageSupergroupChatCreate.fromJson(json);
      case MessageChatChangeTitle.defaultObjectId:
        return MessageChatChangeTitle.fromJson(json);
      case MessageChatChangePhoto.defaultObjectId:
        return MessageChatChangePhoto.fromJson(json);
      case MessageChatDeletePhoto.defaultObjectId:
        return MessageChatDeletePhoto.fromJson(json);
      case MessageChatOwnerLeft.defaultObjectId:
        return MessageChatOwnerLeft.fromJson(json);
      case MessageChatOwnerChanged.defaultObjectId:
        return MessageChatOwnerChanged.fromJson(json);
      case MessageChatHasProtectedContentToggled.defaultObjectId:
        return MessageChatHasProtectedContentToggled.fromJson(json);
      case MessageChatHasProtectedContentDisableRequested.defaultObjectId:
        return MessageChatHasProtectedContentDisableRequested.fromJson(json);
      case MessageChatAddMembers.defaultObjectId:
        return MessageChatAddMembers.fromJson(json);
      case MessageChatJoinByLink.defaultObjectId:
        return MessageChatJoinByLink.fromJson(json);
      case MessageChatJoinByRequest.defaultObjectId:
        return MessageChatJoinByRequest.fromJson(json);
      case MessageChatJoinFromCommunity.defaultObjectId:
        return MessageChatJoinFromCommunity.fromJson(json);
      case MessageChatDeleteMember.defaultObjectId:
        return MessageChatDeleteMember.fromJson(json);
      case MessageChatAddedToCommunity.defaultObjectId:
        return MessageChatAddedToCommunity.fromJson(json);
      case MessageChatRemovedFromCommunity.defaultObjectId:
        return MessageChatRemovedFromCommunity.fromJson(json);
      case MessageChatUpgradeTo.defaultObjectId:
        return MessageChatUpgradeTo.fromJson(json);
      case MessageChatUpgradeFrom.defaultObjectId:
        return MessageChatUpgradeFrom.fromJson(json);
      case MessagePinMessage.defaultObjectId:
        return MessagePinMessage.fromJson(json);
      case MessageScreenshotTaken.defaultObjectId:
        return MessageScreenshotTaken.fromJson(json);
      case MessageChatSetBackground.defaultObjectId:
        return MessageChatSetBackground.fromJson(json);
      case MessageChatSetTheme.defaultObjectId:
        return MessageChatSetTheme.fromJson(json);
      case MessageChatSetMessageAutoDeleteTime.defaultObjectId:
        return MessageChatSetMessageAutoDeleteTime.fromJson(json);
      case MessageChatBoost.defaultObjectId:
        return MessageChatBoost.fromJson(json);
      case MessageForumTopicCreated.defaultObjectId:
        return MessageForumTopicCreated.fromJson(json);
      case MessageForumTopicEdited.defaultObjectId:
        return MessageForumTopicEdited.fromJson(json);
      case MessageForumTopicIsClosedToggled.defaultObjectId:
        return MessageForumTopicIsClosedToggled.fromJson(json);
      case MessageForumTopicIsHiddenToggled.defaultObjectId:
        return MessageForumTopicIsHiddenToggled.fromJson(json);
      case MessageSuggestProfilePhoto.defaultObjectId:
        return MessageSuggestProfilePhoto.fromJson(json);
      case MessageSuggestBirthdate.defaultObjectId:
        return MessageSuggestBirthdate.fromJson(json);
      case MessageCustomServiceAction.defaultObjectId:
        return MessageCustomServiceAction.fromJson(json);
      case MessageGameScore.defaultObjectId:
        return MessageGameScore.fromJson(json);
      case MessageManagedBotCreated.defaultObjectId:
        return MessageManagedBotCreated.fromJson(json);
      case MessagePaymentSuccessful.defaultObjectId:
        return MessagePaymentSuccessful.fromJson(json);
      case MessagePaymentSuccessfulBot.defaultObjectId:
        return MessagePaymentSuccessfulBot.fromJson(json);
      case MessagePaymentRefunded.defaultObjectId:
        return MessagePaymentRefunded.fromJson(json);
      case MessageGiftedPremium.defaultObjectId:
        return MessageGiftedPremium.fromJson(json);
      case MessagePremiumGiftCode.defaultObjectId:
        return MessagePremiumGiftCode.fromJson(json);
      case MessageGiveawayCreated.defaultObjectId:
        return MessageGiveawayCreated.fromJson(json);
      case MessageGiveaway.defaultObjectId:
        return MessageGiveaway.fromJson(json);
      case MessageGiveawayCompleted.defaultObjectId:
        return MessageGiveawayCompleted.fromJson(json);
      case MessageGiveawayWinners.defaultObjectId:
        return MessageGiveawayWinners.fromJson(json);
      case MessageGiftedStars.defaultObjectId:
        return MessageGiftedStars.fromJson(json);
      case MessageGiftedGrams.defaultObjectId:
        return MessageGiftedGrams.fromJson(json);
      case MessageGiveawayPrizeStars.defaultObjectId:
        return MessageGiveawayPrizeStars.fromJson(json);
      case MessageTonWalletTransfer.defaultObjectId:
        return MessageTonWalletTransfer.fromJson(json);
      case MessageTonConnectRequest.defaultObjectId:
        return MessageTonConnectRequest.fromJson(json);
      case MessageGift.defaultObjectId:
        return MessageGift.fromJson(json);
      case MessageUpgradedGift.defaultObjectId:
        return MessageUpgradedGift.fromJson(json);
      case MessageRefundedUpgradedGift.defaultObjectId:
        return MessageRefundedUpgradedGift.fromJson(json);
      case MessageUpgradedGiftPurchaseOffer.defaultObjectId:
        return MessageUpgradedGiftPurchaseOffer.fromJson(json);
      case MessageUpgradedGiftPurchaseOfferRejected.defaultObjectId:
        return MessageUpgradedGiftPurchaseOfferRejected.fromJson(json);
      case MessagePaidMessagesRefunded.defaultObjectId:
        return MessagePaidMessagesRefunded.fromJson(json);
      case MessagePaidMessagePriceChanged.defaultObjectId:
        return MessagePaidMessagePriceChanged.fromJson(json);
      case MessageDirectMessagePriceChanged.defaultObjectId:
        return MessageDirectMessagePriceChanged.fromJson(json);
      case MessageUnpaidMessagesAllowedByLink.defaultObjectId:
        return MessageUnpaidMessagesAllowedByLink.fromJson(json);
      case MessageChecklistTasksDone.defaultObjectId:
        return MessageChecklistTasksDone.fromJson(json);
      case MessageChecklistTasksAdded.defaultObjectId:
        return MessageChecklistTasksAdded.fromJson(json);
      case MessageSuggestedPostApprovalFailed.defaultObjectId:
        return MessageSuggestedPostApprovalFailed.fromJson(json);
      case MessageSuggestedPostApproved.defaultObjectId:
        return MessageSuggestedPostApproved.fromJson(json);
      case MessageSuggestedPostDeclined.defaultObjectId:
        return MessageSuggestedPostDeclined.fromJson(json);
      case MessageSuggestedPostPaid.defaultObjectId:
        return MessageSuggestedPostPaid.fromJson(json);
      case MessageSuggestedPostRefunded.defaultObjectId:
        return MessageSuggestedPostRefunded.fromJson(json);
      case MessageContactRegistered.defaultObjectId:
        return MessageContactRegistered.fromJson(json);
      case MessageUsersShared.defaultObjectId:
        return MessageUsersShared.fromJson(json);
      case MessageChatShared.defaultObjectId:
        return MessageChatShared.fromJson(json);
      case MessageBotWriteAccessAllowed.defaultObjectId:
        return MessageBotWriteAccessAllowed.fromJson(json);
      case MessageWebAppDataSent.defaultObjectId:
        return MessageWebAppDataSent.fromJson(json);
      case MessageWebAppDataReceived.defaultObjectId:
        return MessageWebAppDataReceived.fromJson(json);
      case MessagePassportDataSent.defaultObjectId:
        return MessagePassportDataSent.fromJson(json);
      case MessagePassportDataReceived.defaultObjectId:
        return MessagePassportDataReceived.fromJson(json);
      case MessageProximityAlertTriggered.defaultObjectId:
        return MessageProximityAlertTriggered.fromJson(json);
      case MessageUnsupported.defaultObjectId:
        return MessageUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageText** *(messageText)* - child of MessageContent
///
/// A text message.
///
/// * [text]: Text of the message.
/// * [linkPreview]: A link preview attached to the message; may be null *(optional)*.
/// * [linkPreviewOptions]: Options which were used for generation of the link preview; may be null if default options were used *(optional)*.
final class MessageText extends MessageContent {
  /// **MessageText** *(messageText)* - child of MessageContent
  ///
  /// A text message.
  ///
  /// * [text]: Text of the message.
  /// * [linkPreview]: A link preview attached to the message; may be null *(optional)*.
  /// * [linkPreviewOptions]: Options which were used for generation of the link preview; may be null if default options were used *(optional)*.
  const MessageText({
    required this.text,
    this.linkPreview,
    this.linkPreviewOptions,
  });

  /// Text of the message
  final FormattedText text;

  /// A link preview attached to the message; may be null
  final LinkPreview? linkPreview;

  /// Options which were used for generation of the link preview; may be null if default options were used
  final LinkPreviewOptions? linkPreviewOptions;

  /// Parse from a json
  factory MessageText.fromJson(Map<String, dynamic> json) => MessageText(
        text: FormattedText.fromJson(json['text']),
        linkPreview: json['link_preview'] == null
            ? null
            : LinkPreview.fromJson(json['link_preview']),
        linkPreviewOptions: json['link_preview_options'] == null
            ? null
            : LinkPreviewOptions.fromJson(json['link_preview_options']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "link_preview": linkPreview?.toJson(),
      "link_preview_options": linkPreviewOptions?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the message
  /// * [link_preview]: A link preview attached to the message; may be null
  /// * [link_preview_options]: Options which were used for generation of the link preview; may be null if default options were used
  @override
  MessageText copyWith({
    FormattedText? text,
    LinkPreview? linkPreview,
    LinkPreviewOptions? linkPreviewOptions,
  }) =>
      MessageText(
        text: text ?? this.text,
        linkPreview: linkPreview ?? this.linkPreview,
        linkPreviewOptions: linkPreviewOptions ?? this.linkPreviewOptions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageRichMessage** *(messageRichMessage)* - child of MessageContent
///
/// A rich message; the message can have multiple media of the same type, all of which must be shown in the corresponding profile tab.
///
/// * [message]: The rich message.
final class MessageRichMessage extends MessageContent {
  /// **MessageRichMessage** *(messageRichMessage)* - child of MessageContent
  ///
  /// A rich message; the message can have multiple media of the same type, all of which must be shown in the corresponding profile tab.
  ///
  /// * [message]: The rich message.
  const MessageRichMessage({
    required this.message,
  });

  /// The rich message
  final RichMessage message;

  /// Parse from a json
  factory MessageRichMessage.fromJson(Map<String, dynamic> json) =>
      MessageRichMessage(
        message: RichMessage.fromJson(json['message']),
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
  /// * [message]: The rich message
  @override
  MessageRichMessage copyWith({
    RichMessage? message,
  }) =>
      MessageRichMessage(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageAnimation** *(messageAnimation)* - child of MessageContent
///
/// An animation message (GIF-style).
///
/// * [animation]: The animation description.
/// * [caption]: Animation caption.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation.
/// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
/// * [isSecret]: True, if the animation thumbnail must be blurred and the animation must be shown only while tapped.
final class MessageAnimation extends MessageContent {
  /// **MessageAnimation** *(messageAnimation)* - child of MessageContent
  ///
  /// An animation message (GIF-style).
  ///
  /// * [animation]: The animation description.
  /// * [caption]: Animation caption.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation.
  /// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation.
  /// * [isSecret]: True, if the animation thumbnail must be blurred and the animation must be shown only while tapped.
  const MessageAnimation({
    required this.animation,
    required this.caption,
    required this.showCaptionAboveMedia,
    required this.hasSpoiler,
    required this.isSecret,
  });

  /// The animation description
  final Animation animation;

  /// Animation caption
  final FormattedText caption;

  /// True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation
  final bool showCaptionAboveMedia;

  /// True, if the animation preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
  final bool isSecret;

  /// Parse from a json
  factory MessageAnimation.fromJson(Map<String, dynamic> json) =>
      MessageAnimation(
        animation: Animation.fromJson(json['animation']),
        caption: FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        hasSpoiler: json['has_spoiler'],
        isSecret: json['is_secret'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "caption": caption.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "has_spoiler": hasSpoiler,
      "is_secret": isSecret,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: The animation description
  /// * [caption]: Animation caption
  /// * [show_caption_above_media]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation
  /// * [has_spoiler]: True, if the animation preview must be covered by a spoiler animation
  /// * [is_secret]: True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
  @override
  MessageAnimation copyWith({
    Animation? animation,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? isSecret,
  }) =>
      MessageAnimation(
        animation: animation ?? this.animation,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
        isSecret: isSecret ?? this.isSecret,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageAudio** *(messageAudio)* - child of MessageContent
///
/// An audio message.
///
/// * [audio]: The audio description.
/// * [caption]: Audio caption.
final class MessageAudio extends MessageContent {
  /// **MessageAudio** *(messageAudio)* - child of MessageContent
  ///
  /// An audio message.
  ///
  /// * [audio]: The audio description.
  /// * [caption]: Audio caption.
  const MessageAudio({
    required this.audio,
    required this.caption,
  });

  /// The audio description
  final Audio audio;

  /// Audio caption
  final FormattedText caption;

  /// Parse from a json
  factory MessageAudio.fromJson(Map<String, dynamic> json) => MessageAudio(
        audio: Audio.fromJson(json['audio']),
        caption: FormattedText.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
      "caption": caption.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: The audio description
  /// * [caption]: Audio caption
  @override
  MessageAudio copyWith({
    Audio? audio,
    FormattedText? caption,
  }) =>
      MessageAudio(
        audio: audio ?? this.audio,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageDocument** *(messageDocument)* - child of MessageContent
///
/// A document message (general file).
///
/// * [document]: The document description.
/// * [caption]: Document caption.
final class MessageDocument extends MessageContent {
  /// **MessageDocument** *(messageDocument)* - child of MessageContent
  ///
  /// A document message (general file).
  ///
  /// * [document]: The document description.
  /// * [caption]: Document caption.
  const MessageDocument({
    required this.document,
    required this.caption,
  });

  /// The document description
  final Document document;

  /// Document caption
  final FormattedText caption;

  /// Parse from a json
  factory MessageDocument.fromJson(Map<String, dynamic> json) =>
      MessageDocument(
        document: Document.fromJson(json['document']),
        caption: FormattedText.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
      "caption": caption.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: The document description
  /// * [caption]: Document caption
  @override
  MessageDocument copyWith({
    Document? document,
    FormattedText? caption,
  }) =>
      MessageDocument(
        document: document ?? this.document,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaidMedia** *(messagePaidMedia)* - child of MessageContent
///
/// A message with paid media.
///
/// * [starCount]: Number of Telegram Stars needed to buy access to the media in the message.
/// * [media]: Information about the media.
/// * [caption]: Media caption.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media.
final class MessagePaidMedia extends MessageContent {
  /// **MessagePaidMedia** *(messagePaidMedia)* - child of MessageContent
  ///
  /// A message with paid media.
  ///
  /// * [starCount]: Number of Telegram Stars needed to buy access to the media in the message.
  /// * [media]: Information about the media.
  /// * [caption]: Media caption.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media.
  const MessagePaidMedia({
    required this.starCount,
    required this.media,
    required this.caption,
    required this.showCaptionAboveMedia,
  });

  /// Number of Telegram Stars needed to buy access to the media in the message
  final int starCount;

  /// Information about the media
  final List<PaidMedia> media;

  /// Media caption
  final FormattedText caption;

  /// True, if the caption must be shown above the media; otherwise, the caption must be shown below the media
  final bool showCaptionAboveMedia;

  /// Parse from a json
  factory MessagePaidMedia.fromJson(Map<String, dynamic> json) =>
      MessagePaidMedia(
        starCount: json['star_count'],
        media: List<PaidMedia>.from((json['media'] ?? [])
            .map((item) => PaidMedia.fromJson(item))
            .toList()),
        caption: FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "media": media.map((i) => i.toJson()).toList(),
      "caption": caption.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars needed to buy access to the media in the message
  /// * [media]: Information about the media
  /// * [caption]: Media caption
  /// * [show_caption_above_media]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media
  @override
  MessagePaidMedia copyWith({
    int? starCount,
    List<PaidMedia>? media,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
  }) =>
      MessagePaidMedia(
        starCount: starCount ?? this.starCount,
        media: media ?? this.media,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaidMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePhoto** *(messagePhoto)* - child of MessageContent
///
/// A photo message.
///
/// * [photo]: The photo.
/// * [video]: The video representing the live photo; may be null if the photo is static *(optional)*.
/// * [caption]: Photo caption.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo.
/// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
/// * [isSecret]: True, if the photo must be blurred and must be shown only while tapped.
final class MessagePhoto extends MessageContent {
  /// **MessagePhoto** *(messagePhoto)* - child of MessageContent
  ///
  /// A photo message.
  ///
  /// * [photo]: The photo.
  /// * [video]: The video representing the live photo; may be null if the photo is static *(optional)*.
  /// * [caption]: Photo caption.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo.
  /// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation.
  /// * [isSecret]: True, if the photo must be blurred and must be shown only while tapped.
  const MessagePhoto({
    required this.photo,
    this.video,
    required this.caption,
    required this.showCaptionAboveMedia,
    required this.hasSpoiler,
    required this.isSecret,
  });

  /// The photo
  final Photo photo;

  /// The video representing the live photo; may be null if the photo is static
  final Video? video;

  /// Photo caption
  final FormattedText caption;

  /// True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo
  final bool showCaptionAboveMedia;

  /// True, if the photo preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// True, if the photo must be blurred and must be shown only while tapped
  final bool isSecret;

  /// Parse from a json
  factory MessagePhoto.fromJson(Map<String, dynamic> json) => MessagePhoto(
        photo: Photo.fromJson(json['photo']),
        video: json['video'] == null ? null : Video.fromJson(json['video']),
        caption: FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        hasSpoiler: json['has_spoiler'],
        isSecret: json['is_secret'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "video": video?.toJson(),
      "caption": caption.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "has_spoiler": hasSpoiler,
      "is_secret": isSecret,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: The photo
  /// * [video]: The video representing the live photo; may be null if the photo is static
  /// * [caption]: Photo caption
  /// * [show_caption_above_media]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo
  /// * [has_spoiler]: True, if the photo preview must be covered by a spoiler animation
  /// * [is_secret]: True, if the photo must be blurred and must be shown only while tapped
  @override
  MessagePhoto copyWith({
    Photo? photo,
    Video? video,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? isSecret,
  }) =>
      MessagePhoto(
        photo: photo ?? this.photo,
        video: video ?? this.video,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
        isSecret: isSecret ?? this.isSecret,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSticker** *(messageSticker)* - child of MessageContent
///
/// A sticker message.
///
/// * [sticker]: The sticker description.
/// * [isPremium]: True, if premium animation of the sticker must be played.
final class MessageSticker extends MessageContent {
  /// **MessageSticker** *(messageSticker)* - child of MessageContent
  ///
  /// A sticker message.
  ///
  /// * [sticker]: The sticker description.
  /// * [isPremium]: True, if premium animation of the sticker must be played.
  const MessageSticker({
    required this.sticker,
    required this.isPremium,
  });

  /// The sticker description
  final Sticker sticker;

  /// True, if premium animation of the sticker must be played
  final bool isPremium;

  /// Parse from a json
  factory MessageSticker.fromJson(Map<String, dynamic> json) => MessageSticker(
        sticker: Sticker.fromJson(json['sticker']),
        isPremium: json['is_premium'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "is_premium": isPremium,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: The sticker description
  /// * [is_premium]: True, if premium animation of the sticker must be played
  @override
  MessageSticker copyWith({
    Sticker? sticker,
    bool? isPremium,
  }) =>
      MessageSticker(
        sticker: sticker ?? this.sticker,
        isPremium: isPremium ?? this.isPremium,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVideo** *(messageVideo)* - child of MessageContent
///
/// A video message.
///
/// * [video]: The video description.
/// * [alternativeVideos]: Alternative qualities of the video.
/// * [storyboards]: Available storyboards for the video.
/// * [cover]: Cover of the video; may be null if none *(optional)*.
/// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
/// * [caption]: Video caption.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video.
/// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
/// * [isSecret]: True, if the video thumbnail must be blurred and the video must be shown only while tapped.
final class MessageVideo extends MessageContent {
  /// **MessageVideo** *(messageVideo)* - child of MessageContent
  ///
  /// A video message.
  ///
  /// * [video]: The video description.
  /// * [alternativeVideos]: Alternative qualities of the video.
  /// * [storyboards]: Available storyboards for the video.
  /// * [cover]: Cover of the video; may be null if none *(optional)*.
  /// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
  /// * [caption]: Video caption.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video.
  /// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation.
  /// * [isSecret]: True, if the video thumbnail must be blurred and the video must be shown only while tapped.
  const MessageVideo({
    required this.video,
    required this.alternativeVideos,
    required this.storyboards,
    this.cover,
    required this.startTimestamp,
    required this.caption,
    required this.showCaptionAboveMedia,
    required this.hasSpoiler,
    required this.isSecret,
  });

  /// The video description
  final Video video;

  /// Alternative qualities of the video
  final List<AlternativeVideo> alternativeVideos;

  /// Available storyboards for the video
  final List<VideoStoryboard> storyboards;

  /// Cover of the video; may be null if none
  final Photo? cover;

  /// Timestamp from which the video playing must start, in seconds
  final int startTimestamp;

  /// Video caption
  final FormattedText caption;

  /// True, if the caption must be shown above the video; otherwise, the caption must be shown below the video
  final bool showCaptionAboveMedia;

  /// True, if the video preview must be covered by a spoiler animation
  final bool hasSpoiler;

  /// True, if the video thumbnail must be blurred and the video must be shown only while tapped
  final bool isSecret;

  /// Parse from a json
  factory MessageVideo.fromJson(Map<String, dynamic> json) => MessageVideo(
        video: Video.fromJson(json['video']),
        alternativeVideos: List<AlternativeVideo>.from(
            (json['alternative_videos'] ?? [])
                .map((item) => AlternativeVideo.fromJson(item))
                .toList()),
        storyboards: List<VideoStoryboard>.from((json['storyboards'] ?? [])
            .map((item) => VideoStoryboard.fromJson(item))
            .toList()),
        cover: json['cover'] == null ? null : Photo.fromJson(json['cover']),
        startTimestamp: json['start_timestamp'],
        caption: FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        hasSpoiler: json['has_spoiler'],
        isSecret: json['is_secret'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "alternative_videos": alternativeVideos.map((i) => i.toJson()).toList(),
      "storyboards": storyboards.map((i) => i.toJson()).toList(),
      "cover": cover?.toJson(),
      "start_timestamp": startTimestamp,
      "caption": caption.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "has_spoiler": hasSpoiler,
      "is_secret": isSecret,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: The video description
  /// * [alternative_videos]: Alternative qualities of the video
  /// * [storyboards]: Available storyboards for the video
  /// * [cover]: Cover of the video; may be null if none
  /// * [start_timestamp]: Timestamp from which the video playing must start, in seconds
  /// * [caption]: Video caption
  /// * [show_caption_above_media]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video
  /// * [has_spoiler]: True, if the video preview must be covered by a spoiler animation
  /// * [is_secret]: True, if the video thumbnail must be blurred and the video must be shown only while tapped
  @override
  MessageVideo copyWith({
    Video? video,
    List<AlternativeVideo>? alternativeVideos,
    List<VideoStoryboard>? storyboards,
    Photo? cover,
    int? startTimestamp,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? isSecret,
  }) =>
      MessageVideo(
        video: video ?? this.video,
        alternativeVideos: alternativeVideos ?? this.alternativeVideos,
        storyboards: storyboards ?? this.storyboards,
        cover: cover ?? this.cover,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
        isSecret: isSecret ?? this.isSecret,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVideoNote** *(messageVideoNote)* - child of MessageContent
///
/// A video note message.
///
/// * [videoNote]: The video note description.
/// * [isViewed]: True, if at least one of the recipients has viewed the video note.
/// * [isSecret]: True, if the video note thumbnail must be blurred and the video note must be shown only while tapped.
final class MessageVideoNote extends MessageContent {
  /// **MessageVideoNote** *(messageVideoNote)* - child of MessageContent
  ///
  /// A video note message.
  ///
  /// * [videoNote]: The video note description.
  /// * [isViewed]: True, if at least one of the recipients has viewed the video note.
  /// * [isSecret]: True, if the video note thumbnail must be blurred and the video note must be shown only while tapped.
  const MessageVideoNote({
    required this.videoNote,
    required this.isViewed,
    required this.isSecret,
  });

  /// The video note description
  final VideoNote videoNote;

  /// True, if at least one of the recipients has viewed the video note
  final bool isViewed;

  /// True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
  final bool isSecret;

  /// Parse from a json
  factory MessageVideoNote.fromJson(Map<String, dynamic> json) =>
      MessageVideoNote(
        videoNote: VideoNote.fromJson(json['video_note']),
        isViewed: json['is_viewed'],
        isSecret: json['is_secret'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video_note": videoNote.toJson(),
      "is_viewed": isViewed,
      "is_secret": isSecret,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video_note]: The video note description
  /// * [is_viewed]: True, if at least one of the recipients has viewed the video note
  /// * [is_secret]: True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
  @override
  MessageVideoNote copyWith({
    VideoNote? videoNote,
    bool? isViewed,
    bool? isSecret,
  }) =>
      MessageVideoNote(
        videoNote: videoNote ?? this.videoNote,
        isViewed: isViewed ?? this.isViewed,
        isSecret: isSecret ?? this.isSecret,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVoiceNote** *(messageVoiceNote)* - child of MessageContent
///
/// A voice note message.
///
/// * [voiceNote]: The voice note description.
/// * [caption]: Voice note caption.
/// * [isListened]: True, if at least one of the recipients has listened to the voice note.
final class MessageVoiceNote extends MessageContent {
  /// **MessageVoiceNote** *(messageVoiceNote)* - child of MessageContent
  ///
  /// A voice note message.
  ///
  /// * [voiceNote]: The voice note description.
  /// * [caption]: Voice note caption.
  /// * [isListened]: True, if at least one of the recipients has listened to the voice note.
  const MessageVoiceNote({
    required this.voiceNote,
    required this.caption,
    required this.isListened,
  });

  /// The voice note description
  final VoiceNote voiceNote;

  /// Voice note caption
  final FormattedText caption;

  /// True, if at least one of the recipients has listened to the voice note
  final bool isListened;

  /// Parse from a json
  factory MessageVoiceNote.fromJson(Map<String, dynamic> json) =>
      MessageVoiceNote(
        voiceNote: VoiceNote.fromJson(json['voice_note']),
        caption: FormattedText.fromJson(json['caption']),
        isListened: json['is_listened'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote.toJson(),
      "caption": caption.toJson(),
      "is_listened": isListened,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: The voice note description
  /// * [caption]: Voice note caption
  /// * [is_listened]: True, if at least one of the recipients has listened to the voice note
  @override
  MessageVoiceNote copyWith({
    VoiceNote? voiceNote,
    FormattedText? caption,
    bool? isListened,
  }) =>
      MessageVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        caption: caption ?? this.caption,
        isListened: isListened ?? this.isListened,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageExpiredPhoto** *(messageExpiredPhoto)* - child of MessageContent
///
/// A self-destructed photo message.
final class MessageExpiredPhoto extends MessageContent {
  /// **MessageExpiredPhoto** *(messageExpiredPhoto)* - child of MessageContent
  ///
  /// A self-destructed photo message.
  const MessageExpiredPhoto();

  /// Parse from a json
  factory MessageExpiredPhoto.fromJson(Map<String, dynamic> json) =>
      const MessageExpiredPhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageExpiredPhoto copyWith() => const MessageExpiredPhoto();

  /// TDLib object type
  static const String defaultObjectId = 'messageExpiredPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageExpiredVideo** *(messageExpiredVideo)* - child of MessageContent
///
/// A self-destructed video message.
final class MessageExpiredVideo extends MessageContent {
  /// **MessageExpiredVideo** *(messageExpiredVideo)* - child of MessageContent
  ///
  /// A self-destructed video message.
  const MessageExpiredVideo();

  /// Parse from a json
  factory MessageExpiredVideo.fromJson(Map<String, dynamic> json) =>
      const MessageExpiredVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageExpiredVideo copyWith() => const MessageExpiredVideo();

  /// TDLib object type
  static const String defaultObjectId = 'messageExpiredVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageExpiredVideoNote** *(messageExpiredVideoNote)* - child of MessageContent
///
/// A self-destructed video note message.
final class MessageExpiredVideoNote extends MessageContent {
  /// **MessageExpiredVideoNote** *(messageExpiredVideoNote)* - child of MessageContent
  ///
  /// A self-destructed video note message.
  const MessageExpiredVideoNote();

  /// Parse from a json
  factory MessageExpiredVideoNote.fromJson(Map<String, dynamic> json) =>
      const MessageExpiredVideoNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageExpiredVideoNote copyWith() => const MessageExpiredVideoNote();

  /// TDLib object type
  static const String defaultObjectId = 'messageExpiredVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageExpiredVoiceNote** *(messageExpiredVoiceNote)* - child of MessageContent
///
/// A self-destructed voice note message.
final class MessageExpiredVoiceNote extends MessageContent {
  /// **MessageExpiredVoiceNote** *(messageExpiredVoiceNote)* - child of MessageContent
  ///
  /// A self-destructed voice note message.
  const MessageExpiredVoiceNote();

  /// Parse from a json
  factory MessageExpiredVoiceNote.fromJson(Map<String, dynamic> json) =>
      const MessageExpiredVoiceNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageExpiredVoiceNote copyWith() => const MessageExpiredVoiceNote();

  /// TDLib object type
  static const String defaultObjectId = 'messageExpiredVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageLiveLocation** *(messageLiveLocation)* - child of MessageContent
///
/// A message with a live location.
///
/// * [location]: The current location.
/// * [expiresIn]: Left time for which the location can be updated, in seconds. If 0, then the location can't be updated anymore. The update updateMessageContent is not sent when this field changes.
final class MessageLiveLocation extends MessageContent {
  /// **MessageLiveLocation** *(messageLiveLocation)* - child of MessageContent
  ///
  /// A message with a live location.
  ///
  /// * [location]: The current location.
  /// * [expiresIn]: Left time for which the location can be updated, in seconds. If 0, then the location can't be updated anymore. The update updateMessageContent is not sent when this field changes.
  const MessageLiveLocation({
    required this.location,
    required this.expiresIn,
  });

  /// The current location
  final LiveLocation location;

  /// Left time for which the location can be updated, in seconds. If 0, then the location can't be updated anymore. The update updateMessageContent is not sent when this field changes
  final int expiresIn;

  /// Parse from a json
  factory MessageLiveLocation.fromJson(Map<String, dynamic> json) =>
      MessageLiveLocation(
        location: LiveLocation.fromJson(json['location']),
        expiresIn: json['expires_in'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "expires_in": expiresIn,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The current location
  /// * [expires_in]: Left time for which the location can be updated, in seconds. If 0, then the location can't be updated anymore. The update updateMessageContent is not sent when this field changes
  @override
  MessageLiveLocation copyWith({
    LiveLocation? location,
    int? expiresIn,
  }) =>
      MessageLiveLocation(
        location: location ?? this.location,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageLiveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageLocation** *(messageLocation)* - child of MessageContent
///
/// A message with a location.
///
/// * [location]: The location.
final class MessageLocation extends MessageContent {
  /// **MessageLocation** *(messageLocation)* - child of MessageContent
  ///
  /// A message with a location.
  ///
  /// * [location]: The location.
  const MessageLocation({
    required this.location,
  });

  /// The location
  final Location location;

  /// Parse from a json
  factory MessageLocation.fromJson(Map<String, dynamic> json) =>
      MessageLocation(
        location: Location.fromJson(json['location']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The location
  @override
  MessageLocation copyWith({
    Location? location,
  }) =>
      MessageLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVenue** *(messageVenue)* - child of MessageContent
///
/// A message with information about a venue.
///
/// * [venue]: The venue description.
final class MessageVenue extends MessageContent {
  /// **MessageVenue** *(messageVenue)* - child of MessageContent
  ///
  /// A message with information about a venue.
  ///
  /// * [venue]: The venue description.
  const MessageVenue({
    required this.venue,
  });

  /// The venue description
  final Venue venue;

  /// Parse from a json
  factory MessageVenue.fromJson(Map<String, dynamic> json) => MessageVenue(
        venue: Venue.fromJson(json['venue']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "venue": venue.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [venue]: The venue description
  @override
  MessageVenue copyWith({
    Venue? venue,
  }) =>
      MessageVenue(
        venue: venue ?? this.venue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageContact** *(messageContact)* - child of MessageContent
///
/// A message with a user contact.
///
/// * [contact]: The contact description.
final class MessageContact extends MessageContent {
  /// **MessageContact** *(messageContact)* - child of MessageContent
  ///
  /// A message with a user contact.
  ///
  /// * [contact]: The contact description.
  const MessageContact({
    required this.contact,
  });

  /// The contact description
  final Contact contact;

  /// Parse from a json
  factory MessageContact.fromJson(Map<String, dynamic> json) => MessageContact(
        contact: Contact.fromJson(json['contact']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "contact": contact.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [contact]: The contact description
  @override
  MessageContact copyWith({
    Contact? contact,
  }) =>
      MessageContact(
        contact: contact ?? this.contact,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageAnimatedEmoji** *(messageAnimatedEmoji)* - child of MessageContent
///
/// A message with an animated emoji.
///
/// * [animatedEmoji]: The animated emoji.
/// * [emoji]: The corresponding emoji.
final class MessageAnimatedEmoji extends MessageContent {
  /// **MessageAnimatedEmoji** *(messageAnimatedEmoji)* - child of MessageContent
  ///
  /// A message with an animated emoji.
  ///
  /// * [animatedEmoji]: The animated emoji.
  /// * [emoji]: The corresponding emoji.
  const MessageAnimatedEmoji({
    required this.animatedEmoji,
    required this.emoji,
  });

  /// The animated emoji
  final AnimatedEmoji animatedEmoji;

  /// The corresponding emoji
  final String emoji;

  /// Parse from a json
  factory MessageAnimatedEmoji.fromJson(Map<String, dynamic> json) =>
      MessageAnimatedEmoji(
        animatedEmoji: AnimatedEmoji.fromJson(json['animated_emoji']),
        emoji: json['emoji'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animated_emoji": animatedEmoji.toJson(),
      "emoji": emoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animated_emoji]: The animated emoji
  /// * [emoji]: The corresponding emoji
  @override
  MessageAnimatedEmoji copyWith({
    AnimatedEmoji? animatedEmoji,
    String? emoji,
  }) =>
      MessageAnimatedEmoji(
        animatedEmoji: animatedEmoji ?? this.animatedEmoji,
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageAnimatedEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageDice** *(messageDice)* - child of MessageContent
///
/// A dice message. The dice value is randomly generated by the server.
///
/// * [initialState]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
/// * [finalState]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
/// * [emoji]: Emoji on which the dice throw animation is based.
/// * [value]: The dice value. If the value is 0, then the dice don't have final state yet.
/// * [successAnimationFrameNumber]: Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded.
final class MessageDice extends MessageContent {
  /// **MessageDice** *(messageDice)* - child of MessageContent
  ///
  /// A dice message. The dice value is randomly generated by the server.
  ///
  /// * [initialState]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
  /// * [finalState]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
  /// * [emoji]: Emoji on which the dice throw animation is based.
  /// * [value]: The dice value. If the value is 0, then the dice don't have final state yet.
  /// * [successAnimationFrameNumber]: Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded.
  const MessageDice({
    this.initialState,
    this.finalState,
    required this.emoji,
    required this.value,
    required this.successAnimationFrameNumber,
  });

  /// The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  final DiceStickers? initialState;

  /// The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  final DiceStickers? finalState;

  /// Emoji on which the dice throw animation is based
  final String emoji;

  /// The dice value. If the value is 0, then the dice don't have final state yet
  final int value;

  /// Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
  final int successAnimationFrameNumber;

  /// Parse from a json
  factory MessageDice.fromJson(Map<String, dynamic> json) => MessageDice(
        initialState: json['initial_state'] == null
            ? null
            : DiceStickers.fromJson(json['initial_state']),
        finalState: json['final_state'] == null
            ? null
            : DiceStickers.fromJson(json['final_state']),
        emoji: json['emoji'],
        value: json['value'],
        successAnimationFrameNumber: json['success_animation_frame_number'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "initial_state": initialState?.toJson(),
      "final_state": finalState?.toJson(),
      "emoji": emoji,
      "value": value,
      "success_animation_frame_number": successAnimationFrameNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [initial_state]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  /// * [final_state]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  /// * [emoji]: Emoji on which the dice throw animation is based
  /// * [value]: The dice value. If the value is 0, then the dice don't have final state yet
  /// * [success_animation_frame_number]: Number of frame after which a success animation like a shower of confetti needs to be shown on updateMessageSendSucceeded
  @override
  MessageDice copyWith({
    DiceStickers? initialState,
    DiceStickers? finalState,
    String? emoji,
    int? value,
    int? successAnimationFrameNumber,
  }) =>
      MessageDice(
        initialState: initialState ?? this.initialState,
        finalState: finalState ?? this.finalState,
        emoji: emoji ?? this.emoji,
        value: value ?? this.value,
        successAnimationFrameNumber:
            successAnimationFrameNumber ?? this.successAnimationFrameNumber,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageDice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGame** *(messageGame)* - child of MessageContent
///
/// A message with a game.
///
/// * [game]: The game description.
final class MessageGame extends MessageContent {
  /// **MessageGame** *(messageGame)* - child of MessageContent
  ///
  /// A message with a game.
  ///
  /// * [game]: The game description.
  const MessageGame({
    required this.game,
  });

  /// The game description
  final Game game;

  /// Parse from a json
  factory MessageGame.fromJson(Map<String, dynamic> json) => MessageGame(
        game: Game.fromJson(json['game']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "game": game.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [game]: The game description
  @override
  MessageGame copyWith({
    Game? game,
  }) =>
      MessageGame(
        game: game ?? this.game,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePoll** *(messagePoll)* - child of MessageContent
///
/// A message with a poll.
///
/// * [poll]: Information about the poll.
/// * [description]: Description of the poll.
/// * [media]: Media attached to the poll; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo *(optional)*.
/// * [canAddOption]: True, if an option can be added to the poll using addPollOption.
final class MessagePoll extends MessageContent {
  /// **MessagePoll** *(messagePoll)* - child of MessageContent
  ///
  /// A message with a poll.
  ///
  /// * [poll]: Information about the poll.
  /// * [description]: Description of the poll.
  /// * [media]: Media attached to the poll; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo *(optional)*.
  /// * [canAddOption]: True, if an option can be added to the poll using addPollOption.
  const MessagePoll({
    required this.poll,
    required this.description,
    this.media,
    required this.canAddOption,
  });

  /// Information about the poll
  final Poll poll;

  /// Description of the poll
  final FormattedText description;

  /// Media attached to the poll; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo
  final PollMedia? media;

  /// True, if an option can be added to the poll using addPollOption
  final bool canAddOption;

  /// Parse from a json
  factory MessagePoll.fromJson(Map<String, dynamic> json) => MessagePoll(
        poll: Poll.fromJson(json['poll']),
        description: FormattedText.fromJson(json['description']),
        media: json['media'] == null ? null : PollMedia.fromJson(json['media']),
        canAddOption: json['can_add_option'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poll": poll.toJson(),
      "description": description.toJson(),
      "media": media?.toJson(),
      "can_add_option": canAddOption,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poll]: Information about the poll
  /// * [description]: Description of the poll
  /// * [media]: Media attached to the poll; may be null if none. If present, currently, can be only of the types pollMediaAnimation, pollMediaAudio, pollMediaDocument, pollMediaLocation, pollMediaPhoto, pollMediaVenue, or pollMediaVideo
  /// * [can_add_option]: True, if an option can be added to the poll using addPollOption
  @override
  MessagePoll copyWith({
    Poll? poll,
    FormattedText? description,
    PollMedia? media,
    bool? canAddOption,
  }) =>
      MessagePoll(
        poll: poll ?? this.poll,
        description: description ?? this.description,
        media: media ?? this.media,
        canAddOption: canAddOption ?? this.canAddOption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageStakeDice** *(messageStakeDice)* - child of MessageContent
///
/// A stake dice message. The dice value is randomly generated by the server.
///
/// * [initialState]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
/// * [finalState]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
/// * [value]: The dice value. If the value is 0, then the dice don't have final state yet.
/// * [stakeGramAmount]: The TON Gram amount that was staked; in the smallest units of the currency.
/// * [prizeGramAmount]: The TON Gram amount that was gained from the roll; in the smallest units of the currency; -1 if the dice don't have final state yet.
final class MessageStakeDice extends MessageContent {
  /// **MessageStakeDice** *(messageStakeDice)* - child of MessageContent
  ///
  /// A stake dice message. The dice value is randomly generated by the server.
  ///
  /// * [initialState]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
  /// * [finalState]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known *(optional)*.
  /// * [value]: The dice value. If the value is 0, then the dice don't have final state yet.
  /// * [stakeGramAmount]: The TON Gram amount that was staked; in the smallest units of the currency.
  /// * [prizeGramAmount]: The TON Gram amount that was gained from the roll; in the smallest units of the currency; -1 if the dice don't have final state yet.
  const MessageStakeDice({
    this.initialState,
    this.finalState,
    required this.value,
    required this.stakeGramAmount,
    required this.prizeGramAmount,
  });

  /// The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  final DiceStickers? initialState;

  /// The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  final DiceStickers? finalState;

  /// The dice value. If the value is 0, then the dice don't have final state yet
  final int value;

  /// The TON Gram amount that was staked; in the smallest units of the currency
  final int stakeGramAmount;

  /// The TON Gram amount that was gained from the roll; in the smallest units of the currency; -1 if the dice don't have final state yet
  final int prizeGramAmount;

  /// Parse from a json
  factory MessageStakeDice.fromJson(Map<String, dynamic> json) =>
      MessageStakeDice(
        initialState: json['initial_state'] == null
            ? null
            : DiceStickers.fromJson(json['initial_state']),
        finalState: json['final_state'] == null
            ? null
            : DiceStickers.fromJson(json['final_state']),
        value: json['value'],
        stakeGramAmount: json['stake_gram_amount'],
        prizeGramAmount: json['prize_gram_amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "initial_state": initialState?.toJson(),
      "final_state": finalState?.toJson(),
      "value": value,
      "stake_gram_amount": stakeGramAmount,
      "prize_gram_amount": prizeGramAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [initial_state]: The animated stickers with the initial dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  /// * [final_state]: The animated stickers with the final dice animation; may be null if unknown. The update updateMessageContent will be sent when the sticker became known
  /// * [value]: The dice value. If the value is 0, then the dice don't have final state yet
  /// * [stake_gram_amount]: The TON Gram amount that was staked; in the smallest units of the currency
  /// * [prize_gram_amount]: The TON Gram amount that was gained from the roll; in the smallest units of the currency; -1 if the dice don't have final state yet
  @override
  MessageStakeDice copyWith({
    DiceStickers? initialState,
    DiceStickers? finalState,
    int? value,
    int? stakeGramAmount,
    int? prizeGramAmount,
  }) =>
      MessageStakeDice(
        initialState: initialState ?? this.initialState,
        finalState: finalState ?? this.finalState,
        value: value ?? this.value,
        stakeGramAmount: stakeGramAmount ?? this.stakeGramAmount,
        prizeGramAmount: prizeGramAmount ?? this.prizeGramAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageStakeDice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageStory** *(messageStory)* - child of MessageContent
///
/// A message with a forwarded story.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
/// * [viaMention]: True, if the story was automatically forwarded because of a mention of the user.
final class MessageStory extends MessageContent {
  /// **MessageStory** *(messageStory)* - child of MessageContent
  ///
  /// A message with a forwarded story.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  /// * [viaMention]: True, if the story was automatically forwarded because of a mention of the user.
  const MessageStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.viaMention,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// True, if the story was automatically forwarded because of a mention of the user
  final bool viaMention;

  /// Parse from a json
  factory MessageStory.fromJson(Map<String, dynamic> json) => MessageStory(
        storyPosterChatId: json['story_poster_chat_id'],
        storyId: json['story_id'],
        viaMention: json['via_mention'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "via_mention": viaMention,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Story identifier
  /// * [via_mention]: True, if the story was automatically forwarded because of a mention of the user
  @override
  MessageStory copyWith({
    int? storyPosterChatId,
    int? storyId,
    bool? viaMention,
  }) =>
      MessageStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        viaMention: viaMention ?? this.viaMention,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChecklist** *(messageChecklist)* - child of MessageContent
///
/// A message with a checklist.
///
/// * [list]: The checklist description.
final class MessageChecklist extends MessageContent {
  /// **MessageChecklist** *(messageChecklist)* - child of MessageContent
  ///
  /// A message with a checklist.
  ///
  /// * [list]: The checklist description.
  const MessageChecklist({
    required this.list,
  });

  /// The checklist description
  final Checklist list;

  /// Parse from a json
  factory MessageChecklist.fromJson(Map<String, dynamic> json) =>
      MessageChecklist(
        list: Checklist.fromJson(json['list']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "list": list.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [list]: The checklist description
  @override
  MessageChecklist copyWith({
    Checklist? list,
  }) =>
      MessageChecklist(
        list: list ?? this.list,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChecklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageInvoice** *(messageInvoice)* - child of MessageContent
///
/// A message with an invoice from a bot. Use getInternalLink with internalLinkTypeBotStart to share the invoice.
///
/// * [productInfo]: Information about the product.
/// * [currency]: Currency for the product price.
/// * [totalAmount]: Product total price in the smallest units of the currency.
/// * [startParameter]: Unique invoice bot start_parameter to be passed to getInternalLink.
/// * [isTest]: True, if the invoice is a test invoice.
/// * [needShippingAddress]: True, if the shipping address must be specified.
/// * [receiptMessageId]: The identifier of the message with the receipt, after the product has been purchased.
/// * [paidMedia]: Extended media attached to the invoice; may be null if none *(optional)*.
/// * [paidMediaCaption]: Extended media caption; may be null if none *(optional)*.
final class MessageInvoice extends MessageContent {
  /// **MessageInvoice** *(messageInvoice)* - child of MessageContent
  ///
  /// A message with an invoice from a bot. Use getInternalLink with internalLinkTypeBotStart to share the invoice.
  ///
  /// * [productInfo]: Information about the product.
  /// * [currency]: Currency for the product price.
  /// * [totalAmount]: Product total price in the smallest units of the currency.
  /// * [startParameter]: Unique invoice bot start_parameter to be passed to getInternalLink.
  /// * [isTest]: True, if the invoice is a test invoice.
  /// * [needShippingAddress]: True, if the shipping address must be specified.
  /// * [receiptMessageId]: The identifier of the message with the receipt, after the product has been purchased.
  /// * [paidMedia]: Extended media attached to the invoice; may be null if none *(optional)*.
  /// * [paidMediaCaption]: Extended media caption; may be null if none *(optional)*.
  const MessageInvoice({
    required this.productInfo,
    required this.currency,
    required this.totalAmount,
    required this.startParameter,
    required this.isTest,
    required this.needShippingAddress,
    required this.receiptMessageId,
    this.paidMedia,
    this.paidMediaCaption,
  });

  /// Information about the product
  final ProductInfo productInfo;

  /// Currency for the product price
  final String currency;

  /// Product total price in the smallest units of the currency
  final int totalAmount;

  /// Unique invoice bot start_parameter to be passed to getInternalLink
  final String startParameter;

  /// True, if the invoice is a test invoice
  final bool isTest;

  /// True, if the shipping address must be specified
  final bool needShippingAddress;

  /// The identifier of the message with the receipt, after the product has been purchased
  final int receiptMessageId;

  /// Extended media attached to the invoice; may be null if none
  final PaidMedia? paidMedia;

  /// Extended media caption; may be null if none
  final FormattedText? paidMediaCaption;

  /// Parse from a json
  factory MessageInvoice.fromJson(Map<String, dynamic> json) => MessageInvoice(
        productInfo: ProductInfo.fromJson(json['product_info']),
        currency: json['currency'],
        totalAmount: json['total_amount'],
        startParameter: json['start_parameter'],
        isTest: json['is_test'],
        needShippingAddress: json['need_shipping_address'],
        receiptMessageId: json['receipt_message_id'],
        paidMedia: json['paid_media'] == null
            ? null
            : PaidMedia.fromJson(json['paid_media']),
        paidMediaCaption: json['paid_media_caption'] == null
            ? null
            : FormattedText.fromJson(json['paid_media_caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "product_info": productInfo.toJson(),
      "currency": currency,
      "total_amount": totalAmount,
      "start_parameter": startParameter,
      "is_test": isTest,
      "need_shipping_address": needShippingAddress,
      "receipt_message_id": receiptMessageId,
      "paid_media": paidMedia?.toJson(),
      "paid_media_caption": paidMediaCaption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [product_info]: Information about the product
  /// * [currency]: Currency for the product price
  /// * [total_amount]: Product total price in the smallest units of the currency
  /// * [start_parameter]: Unique invoice bot start_parameter to be passed to getInternalLink
  /// * [is_test]: True, if the invoice is a test invoice
  /// * [need_shipping_address]: True, if the shipping address must be specified
  /// * [receipt_message_id]: The identifier of the message with the receipt, after the product has been purchased
  /// * [paid_media]: Extended media attached to the invoice; may be null if none
  /// * [paid_media_caption]: Extended media caption; may be null if none
  @override
  MessageInvoice copyWith({
    ProductInfo? productInfo,
    String? currency,
    int? totalAmount,
    String? startParameter,
    bool? isTest,
    bool? needShippingAddress,
    int? receiptMessageId,
    PaidMedia? paidMedia,
    FormattedText? paidMediaCaption,
  }) =>
      MessageInvoice(
        productInfo: productInfo ?? this.productInfo,
        currency: currency ?? this.currency,
        totalAmount: totalAmount ?? this.totalAmount,
        startParameter: startParameter ?? this.startParameter,
        isTest: isTest ?? this.isTest,
        needShippingAddress: needShippingAddress ?? this.needShippingAddress,
        receiptMessageId: receiptMessageId ?? this.receiptMessageId,
        paidMedia: paidMedia ?? this.paidMedia,
        paidMediaCaption: paidMediaCaption ?? this.paidMediaCaption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageCall** *(messageCall)* - child of MessageContent
///
/// A message with information about an ended call.
///
/// * [uniqueId]: Persistent unique call identifier; 0 for calls from other devices, which can't be passed as inputCallFromMessage.
/// * [isVideo]: True, if the call was a video call.
/// * [discardReason]: Reason why the call was discarded.
/// * [duration]: Call duration, in seconds.
final class MessageCall extends MessageContent {
  /// **MessageCall** *(messageCall)* - child of MessageContent
  ///
  /// A message with information about an ended call.
  ///
  /// * [uniqueId]: Persistent unique call identifier; 0 for calls from other devices, which can't be passed as inputCallFromMessage.
  /// * [isVideo]: True, if the call was a video call.
  /// * [discardReason]: Reason why the call was discarded.
  /// * [duration]: Call duration, in seconds.
  const MessageCall({
    required this.uniqueId,
    required this.isVideo,
    required this.discardReason,
    required this.duration,
  });

  /// Persistent unique call identifier; 0 for calls from other devices, which can't be passed as inputCallFromMessage
  final int uniqueId;

  /// True, if the call was a video call
  final bool isVideo;

  /// Reason why the call was discarded
  final CallDiscardReason discardReason;

  /// Call duration, in seconds
  final int duration;

  /// Parse from a json
  factory MessageCall.fromJson(Map<String, dynamic> json) => MessageCall(
        uniqueId: json['unique_id'] is int
            ? json['unique_id']
            : int.parse(json['unique_id']),
        isVideo: json['is_video'],
        discardReason: CallDiscardReason.fromJson(json['discard_reason']),
        duration: json['duration'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unique_id": uniqueId,
      "is_video": isVideo,
      "discard_reason": discardReason.toJson(),
      "duration": duration,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unique_id]: Persistent unique call identifier; 0 for calls from other devices, which can't be passed as inputCallFromMessage
  /// * [is_video]: True, if the call was a video call
  /// * [discard_reason]: Reason why the call was discarded
  /// * [duration]: Call duration, in seconds
  @override
  MessageCall copyWith({
    int? uniqueId,
    bool? isVideo,
    CallDiscardReason? discardReason,
    int? duration,
  }) =>
      MessageCall(
        uniqueId: uniqueId ?? this.uniqueId,
        isVideo: isVideo ?? this.isVideo,
        discardReason: discardReason ?? this.discardReason,
        duration: duration ?? this.duration,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGroupCall** *(messageGroupCall)* - child of MessageContent
///
/// A message with information about a group call not bound to a chat. If the message is incoming, the call isn't active, isn't missed, and has no duration,. and getOption("can_accept_calls") is true, then incoming call screen must be shown to the user. Use getGroupCallParticipants to show current group call participants on the screen.. Use joinGroupCall to accept the call or declineGroupCallInvitation to decline it. If the call becomes active or missed, then the call screen must be hidden.
///
/// * [uniqueId]: Persistent unique group call identifier.
/// * [isActive]: True, if the call is active, i.e. the called user joined the call.
/// * [wasMissed]: True, if the called user missed or declined the call.
/// * [isVideo]: True, if the call is a video call.
/// * [duration]: Call duration, in seconds; for left calls only.
/// * [otherParticipantIds]: Identifiers of some other call participants.
final class MessageGroupCall extends MessageContent {
  /// **MessageGroupCall** *(messageGroupCall)* - child of MessageContent
  ///
  /// A message with information about a group call not bound to a chat. If the message is incoming, the call isn't active, isn't missed, and has no duration,. and getOption("can_accept_calls") is true, then incoming call screen must be shown to the user. Use getGroupCallParticipants to show current group call participants on the screen.. Use joinGroupCall to accept the call or declineGroupCallInvitation to decline it. If the call becomes active or missed, then the call screen must be hidden.
  ///
  /// * [uniqueId]: Persistent unique group call identifier.
  /// * [isActive]: True, if the call is active, i.e. the called user joined the call.
  /// * [wasMissed]: True, if the called user missed or declined the call.
  /// * [isVideo]: True, if the call is a video call.
  /// * [duration]: Call duration, in seconds; for left calls only.
  /// * [otherParticipantIds]: Identifiers of some other call participants.
  const MessageGroupCall({
    required this.uniqueId,
    required this.isActive,
    required this.wasMissed,
    required this.isVideo,
    required this.duration,
    required this.otherParticipantIds,
  });

  /// Persistent unique group call identifier
  final int uniqueId;

  /// True, if the call is active, i.e. the called user joined the call
  final bool isActive;

  /// True, if the called user missed or declined the call
  final bool wasMissed;

  /// True, if the call is a video call
  final bool isVideo;

  /// Call duration, in seconds; for left calls only
  final int duration;

  /// Identifiers of some other call participants
  final List<MessageSender> otherParticipantIds;

  /// Parse from a json
  factory MessageGroupCall.fromJson(Map<String, dynamic> json) =>
      MessageGroupCall(
        uniqueId: json['unique_id'] is int
            ? json['unique_id']
            : int.parse(json['unique_id']),
        isActive: json['is_active'],
        wasMissed: json['was_missed'],
        isVideo: json['is_video'],
        duration: json['duration'],
        otherParticipantIds: List<MessageSender>.from(
            (json['other_participant_ids'] ?? [])
                .map((item) => MessageSender.fromJson(item))
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "unique_id": uniqueId,
      "is_active": isActive,
      "was_missed": wasMissed,
      "is_video": isVideo,
      "duration": duration,
      "other_participant_ids":
          otherParticipantIds.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [unique_id]: Persistent unique group call identifier
  /// * [is_active]: True, if the call is active, i.e. the called user joined the call
  /// * [was_missed]: True, if the called user missed or declined the call
  /// * [is_video]: True, if the call is a video call
  /// * [duration]: Call duration, in seconds; for left calls only
  /// * [other_participant_ids]: Identifiers of some other call participants
  @override
  MessageGroupCall copyWith({
    int? uniqueId,
    bool? isActive,
    bool? wasMissed,
    bool? isVideo,
    int? duration,
    List<MessageSender>? otherParticipantIds,
  }) =>
      MessageGroupCall(
        uniqueId: uniqueId ?? this.uniqueId,
        isActive: isActive ?? this.isActive,
        wasMissed: wasMissed ?? this.wasMissed,
        isVideo: isVideo ?? this.isVideo,
        duration: duration ?? this.duration,
        otherParticipantIds: otherParticipantIds ?? this.otherParticipantIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVideoChatScheduled** *(messageVideoChatScheduled)* - child of MessageContent
///
/// A new video chat was scheduled.
///
/// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
/// * [startDate]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator.
final class MessageVideoChatScheduled extends MessageContent {
  /// **MessageVideoChatScheduled** *(messageVideoChatScheduled)* - child of MessageContent
  ///
  /// A new video chat was scheduled.
  ///
  /// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
  /// * [startDate]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator.
  const MessageVideoChatScheduled({
    required this.groupCallId,
    required this.startDate,
  });

  /// Identifier of the video chat. The video chat can be received through the method getGroupCall
  final int groupCallId;

  /// Point in time (Unix timestamp) when the group call is expected to be started by an administrator
  final int startDate;

  /// Parse from a json
  factory MessageVideoChatScheduled.fromJson(Map<String, dynamic> json) =>
      MessageVideoChatScheduled(
        groupCallId: json['group_call_id'],
        startDate: json['start_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "start_date": startDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the video chat. The video chat can be received through the method getGroupCall
  /// * [start_date]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator
  @override
  MessageVideoChatScheduled copyWith({
    int? groupCallId,
    int? startDate,
  }) =>
      MessageVideoChatScheduled(
        groupCallId: groupCallId ?? this.groupCallId,
        startDate: startDate ?? this.startDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVideoChatScheduled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVideoChatStarted** *(messageVideoChatStarted)* - child of MessageContent
///
/// A newly created video chat.
///
/// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
final class MessageVideoChatStarted extends MessageContent {
  /// **MessageVideoChatStarted** *(messageVideoChatStarted)* - child of MessageContent
  ///
  /// A newly created video chat.
  ///
  /// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
  const MessageVideoChatStarted({
    required this.groupCallId,
  });

  /// Identifier of the video chat. The video chat can be received through the method getGroupCall
  final int groupCallId;

  /// Parse from a json
  factory MessageVideoChatStarted.fromJson(Map<String, dynamic> json) =>
      MessageVideoChatStarted(
        groupCallId: json['group_call_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the video chat. The video chat can be received through the method getGroupCall
  @override
  MessageVideoChatStarted copyWith({
    int? groupCallId,
  }) =>
      MessageVideoChatStarted(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVideoChatStarted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageVideoChatEnded** *(messageVideoChatEnded)* - child of MessageContent
///
/// A message with information about an ended video chat.
///
/// * [duration]: Call duration, in seconds.
final class MessageVideoChatEnded extends MessageContent {
  /// **MessageVideoChatEnded** *(messageVideoChatEnded)* - child of MessageContent
  ///
  /// A message with information about an ended video chat.
  ///
  /// * [duration]: Call duration, in seconds.
  const MessageVideoChatEnded({
    required this.duration,
  });

  /// Call duration, in seconds
  final int duration;

  /// Parse from a json
  factory MessageVideoChatEnded.fromJson(Map<String, dynamic> json) =>
      MessageVideoChatEnded(
        duration: json['duration'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "duration": duration,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [duration]: Call duration, in seconds
  @override
  MessageVideoChatEnded copyWith({
    int? duration,
  }) =>
      MessageVideoChatEnded(
        duration: duration ?? this.duration,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageVideoChatEnded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageInviteVideoChatParticipants** *(messageInviteVideoChatParticipants)* - child of MessageContent
///
/// A message with information about an invitation to a video chat.
///
/// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
/// * [userIds]: Invited user identifiers.
final class MessageInviteVideoChatParticipants extends MessageContent {
  /// **MessageInviteVideoChatParticipants** *(messageInviteVideoChatParticipants)* - child of MessageContent
  ///
  /// A message with information about an invitation to a video chat.
  ///
  /// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
  /// * [userIds]: Invited user identifiers.
  const MessageInviteVideoChatParticipants({
    required this.groupCallId,
    required this.userIds,
  });

  /// Identifier of the video chat. The video chat can be received through the method getGroupCall
  final int groupCallId;

  /// Invited user identifiers
  final List<int> userIds;

  /// Parse from a json
  factory MessageInviteVideoChatParticipants.fromJson(
          Map<String, dynamic> json) =>
      MessageInviteVideoChatParticipants(
        groupCallId: json['group_call_id'],
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "user_ids": userIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the video chat. The video chat can be received through the method getGroupCall
  /// * [user_ids]: Invited user identifiers
  @override
  MessageInviteVideoChatParticipants copyWith({
    int? groupCallId,
    List<int>? userIds,
  }) =>
      MessageInviteVideoChatParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageInviteVideoChatParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePollOptionAdded** *(messagePollOptionAdded)* - child of MessageContent
///
/// A message with information about an added poll option.
///
/// * [pollMessageId]: Identifier of the message with the poll; can be an identifier of a deleted message or 0.
/// * [optionId]: Identifier of the added option in the poll.
/// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities.
final class MessagePollOptionAdded extends MessageContent {
  /// **MessagePollOptionAdded** *(messagePollOptionAdded)* - child of MessageContent
  ///
  /// A message with information about an added poll option.
  ///
  /// * [pollMessageId]: Identifier of the message with the poll; can be an identifier of a deleted message or 0.
  /// * [optionId]: Identifier of the added option in the poll.
  /// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities.
  const MessagePollOptionAdded({
    required this.pollMessageId,
    required this.optionId,
    required this.text,
  });

  /// Identifier of the message with the poll; can be an identifier of a deleted message or 0
  final int pollMessageId;

  /// Identifier of the added option in the poll
  final String optionId;

  /// Text of the option; 1-100 characters; may contain only custom emoji entities
  final FormattedText text;

  /// Parse from a json
  factory MessagePollOptionAdded.fromJson(Map<String, dynamic> json) =>
      MessagePollOptionAdded(
        pollMessageId: json['poll_message_id'],
        optionId: json['option_id'],
        text: FormattedText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poll_message_id": pollMessageId,
      "option_id": optionId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poll_message_id]: Identifier of the message with the poll; can be an identifier of a deleted message or 0
  /// * [option_id]: Identifier of the added option in the poll
  /// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities
  @override
  MessagePollOptionAdded copyWith({
    int? pollMessageId,
    String? optionId,
    FormattedText? text,
  }) =>
      MessagePollOptionAdded(
        pollMessageId: pollMessageId ?? this.pollMessageId,
        optionId: optionId ?? this.optionId,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePollOptionAdded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePollOptionDeleted** *(messagePollOptionDeleted)* - child of MessageContent
///
/// A message with information about a deleted poll option.
///
/// * [pollMessageId]: Identifier of the message with the poll; can be an identifier of a deleted message or 0.
/// * [optionId]: Identifier of the deleted option in the poll.
/// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities.
final class MessagePollOptionDeleted extends MessageContent {
  /// **MessagePollOptionDeleted** *(messagePollOptionDeleted)* - child of MessageContent
  ///
  /// A message with information about a deleted poll option.
  ///
  /// * [pollMessageId]: Identifier of the message with the poll; can be an identifier of a deleted message or 0.
  /// * [optionId]: Identifier of the deleted option in the poll.
  /// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities.
  const MessagePollOptionDeleted({
    required this.pollMessageId,
    required this.optionId,
    required this.text,
  });

  /// Identifier of the message with the poll; can be an identifier of a deleted message or 0
  final int pollMessageId;

  /// Identifier of the deleted option in the poll
  final String optionId;

  /// Text of the option; 1-100 characters; may contain only custom emoji entities
  final FormattedText text;

  /// Parse from a json
  factory MessagePollOptionDeleted.fromJson(Map<String, dynamic> json) =>
      MessagePollOptionDeleted(
        pollMessageId: json['poll_message_id'],
        optionId: json['option_id'],
        text: FormattedText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poll_message_id": pollMessageId,
      "option_id": optionId,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poll_message_id]: Identifier of the message with the poll; can be an identifier of a deleted message or 0
  /// * [option_id]: Identifier of the deleted option in the poll
  /// * [text]: Text of the option; 1-100 characters; may contain only custom emoji entities
  @override
  MessagePollOptionDeleted copyWith({
    int? pollMessageId,
    String? optionId,
    FormattedText? text,
  }) =>
      MessagePollOptionDeleted(
        pollMessageId: pollMessageId ?? this.pollMessageId,
        optionId: optionId ?? this.optionId,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePollOptionDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageBasicGroupChatCreate** *(messageBasicGroupChatCreate)* - child of MessageContent
///
/// A newly created basic group.
///
/// * [title]: Title of the basic group.
/// * [memberUserIds]: User identifiers of members in the basic group.
final class MessageBasicGroupChatCreate extends MessageContent {
  /// **MessageBasicGroupChatCreate** *(messageBasicGroupChatCreate)* - child of MessageContent
  ///
  /// A newly created basic group.
  ///
  /// * [title]: Title of the basic group.
  /// * [memberUserIds]: User identifiers of members in the basic group.
  const MessageBasicGroupChatCreate({
    required this.title,
    required this.memberUserIds,
  });

  /// Title of the basic group
  final String title;

  /// User identifiers of members in the basic group
  final List<int> memberUserIds;

  /// Parse from a json
  factory MessageBasicGroupChatCreate.fromJson(Map<String, dynamic> json) =>
      MessageBasicGroupChatCreate(
        title: json['title'],
        memberUserIds: List<int>.from(
            (json['member_user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "member_user_ids": memberUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the basic group
  /// * [member_user_ids]: User identifiers of members in the basic group
  @override
  MessageBasicGroupChatCreate copyWith({
    String? title,
    List<int>? memberUserIds,
  }) =>
      MessageBasicGroupChatCreate(
        title: title ?? this.title,
        memberUserIds: memberUserIds ?? this.memberUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageBasicGroupChatCreate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSupergroupChatCreate** *(messageSupergroupChatCreate)* - child of MessageContent
///
/// A newly created supergroup or channel.
///
/// * [title]: Title of the supergroup or channel.
final class MessageSupergroupChatCreate extends MessageContent {
  /// **MessageSupergroupChatCreate** *(messageSupergroupChatCreate)* - child of MessageContent
  ///
  /// A newly created supergroup or channel.
  ///
  /// * [title]: Title of the supergroup or channel.
  const MessageSupergroupChatCreate({
    required this.title,
  });

  /// Title of the supergroup or channel
  final String title;

  /// Parse from a json
  factory MessageSupergroupChatCreate.fromJson(Map<String, dynamic> json) =>
      MessageSupergroupChatCreate(
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the supergroup or channel
  @override
  MessageSupergroupChatCreate copyWith({
    String? title,
  }) =>
      MessageSupergroupChatCreate(
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSupergroupChatCreate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatChangeTitle** *(messageChatChangeTitle)* - child of MessageContent
///
/// An updated chat title.
///
/// * [title]: New chat title.
final class MessageChatChangeTitle extends MessageContent {
  /// **MessageChatChangeTitle** *(messageChatChangeTitle)* - child of MessageContent
  ///
  /// An updated chat title.
  ///
  /// * [title]: New chat title.
  const MessageChatChangeTitle({
    required this.title,
  });

  /// New chat title
  final String title;

  /// Parse from a json
  factory MessageChatChangeTitle.fromJson(Map<String, dynamic> json) =>
      MessageChatChangeTitle(
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: New chat title
  @override
  MessageChatChangeTitle copyWith({
    String? title,
  }) =>
      MessageChatChangeTitle(
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatChangeTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatChangePhoto** *(messageChatChangePhoto)* - child of MessageContent
///
/// An updated chat photo.
///
/// * [photo]: New chat photo.
final class MessageChatChangePhoto extends MessageContent {
  /// **MessageChatChangePhoto** *(messageChatChangePhoto)* - child of MessageContent
  ///
  /// An updated chat photo.
  ///
  /// * [photo]: New chat photo.
  const MessageChatChangePhoto({
    required this.photo,
  });

  /// New chat photo
  final ChatPhoto photo;

  /// Parse from a json
  factory MessageChatChangePhoto.fromJson(Map<String, dynamic> json) =>
      MessageChatChangePhoto(
        photo: ChatPhoto.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: New chat photo
  @override
  MessageChatChangePhoto copyWith({
    ChatPhoto? photo,
  }) =>
      MessageChatChangePhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatChangePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatDeletePhoto** *(messageChatDeletePhoto)* - child of MessageContent
///
/// A deleted chat photo.
final class MessageChatDeletePhoto extends MessageContent {
  /// **MessageChatDeletePhoto** *(messageChatDeletePhoto)* - child of MessageContent
  ///
  /// A deleted chat photo.
  const MessageChatDeletePhoto();

  /// Parse from a json
  factory MessageChatDeletePhoto.fromJson(Map<String, dynamic> json) =>
      const MessageChatDeletePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageChatDeletePhoto copyWith() => const MessageChatDeletePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'messageChatDeletePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatOwnerLeft** *(messageChatOwnerLeft)* - child of MessageContent
///
/// The owner of the chat has left.
///
/// * [newOwnerUserId]: Identifier of the user who will become the new owner of the chat if the previous owner doesn't return; 0 if none.
final class MessageChatOwnerLeft extends MessageContent {
  /// **MessageChatOwnerLeft** *(messageChatOwnerLeft)* - child of MessageContent
  ///
  /// The owner of the chat has left.
  ///
  /// * [newOwnerUserId]: Identifier of the user who will become the new owner of the chat if the previous owner doesn't return; 0 if none.
  const MessageChatOwnerLeft({
    required this.newOwnerUserId,
  });

  /// Identifier of the user who will become the new owner of the chat if the previous owner doesn't return; 0 if none
  final int newOwnerUserId;

  /// Parse from a json
  factory MessageChatOwnerLeft.fromJson(Map<String, dynamic> json) =>
      MessageChatOwnerLeft(
        newOwnerUserId: json['new_owner_user_id'] ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "new_owner_user_id": newOwnerUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [new_owner_user_id]: Identifier of the user who will become the new owner of the chat if the previous owner doesn't return; 0 if none
  @override
  MessageChatOwnerLeft copyWith({
    int? newOwnerUserId,
  }) =>
      MessageChatOwnerLeft(
        newOwnerUserId: newOwnerUserId ?? this.newOwnerUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatOwnerLeft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatOwnerChanged** *(messageChatOwnerChanged)* - child of MessageContent
///
/// The owner of the chat has changed.
///
/// * [newOwnerUserId]: Identifier of the user who is the new owner of the chat.
final class MessageChatOwnerChanged extends MessageContent {
  /// **MessageChatOwnerChanged** *(messageChatOwnerChanged)* - child of MessageContent
  ///
  /// The owner of the chat has changed.
  ///
  /// * [newOwnerUserId]: Identifier of the user who is the new owner of the chat.
  const MessageChatOwnerChanged({
    required this.newOwnerUserId,
  });

  /// Identifier of the user who is the new owner of the chat
  final int newOwnerUserId;

  /// Parse from a json
  factory MessageChatOwnerChanged.fromJson(Map<String, dynamic> json) =>
      MessageChatOwnerChanged(
        newOwnerUserId: json['new_owner_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "new_owner_user_id": newOwnerUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [new_owner_user_id]: Identifier of the user who is the new owner of the chat
  @override
  MessageChatOwnerChanged copyWith({
    int? newOwnerUserId,
  }) =>
      MessageChatOwnerChanged(
        newOwnerUserId: newOwnerUserId ?? this.newOwnerUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatOwnerChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatHasProtectedContentToggled** *(messageChatHasProtectedContentToggled)* - child of MessageContent
///
/// Chat has_protected_content setting was changed or request to change it was rejected.
///
/// * [requestMessageId]: Identifier of the message with the request to change the setting; can be an identifier of a deleted message or 0.
/// * [oldHasProtectedContent]: Previous value of the setting.
/// * [newHasProtectedContent]: New value of the setting.
final class MessageChatHasProtectedContentToggled extends MessageContent {
  /// **MessageChatHasProtectedContentToggled** *(messageChatHasProtectedContentToggled)* - child of MessageContent
  ///
  /// Chat has_protected_content setting was changed or request to change it was rejected.
  ///
  /// * [requestMessageId]: Identifier of the message with the request to change the setting; can be an identifier of a deleted message or 0.
  /// * [oldHasProtectedContent]: Previous value of the setting.
  /// * [newHasProtectedContent]: New value of the setting.
  const MessageChatHasProtectedContentToggled({
    required this.requestMessageId,
    required this.oldHasProtectedContent,
    required this.newHasProtectedContent,
  });

  /// Identifier of the message with the request to change the setting; can be an identifier of a deleted message or 0
  final int requestMessageId;

  /// Previous value of the setting
  final bool oldHasProtectedContent;

  /// New value of the setting
  final bool newHasProtectedContent;

  /// Parse from a json
  factory MessageChatHasProtectedContentToggled.fromJson(
          Map<String, dynamic> json) =>
      MessageChatHasProtectedContentToggled(
        requestMessageId: json['request_message_id'],
        oldHasProtectedContent: json['old_has_protected_content'],
        newHasProtectedContent: json['new_has_protected_content'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "request_message_id": requestMessageId,
      "old_has_protected_content": oldHasProtectedContent,
      "new_has_protected_content": newHasProtectedContent,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [request_message_id]: Identifier of the message with the request to change the setting; can be an identifier of a deleted message or 0
  /// * [old_has_protected_content]: Previous value of the setting
  /// * [new_has_protected_content]: New value of the setting
  @override
  MessageChatHasProtectedContentToggled copyWith({
    int? requestMessageId,
    bool? oldHasProtectedContent,
    bool? newHasProtectedContent,
  }) =>
      MessageChatHasProtectedContentToggled(
        requestMessageId: requestMessageId ?? this.requestMessageId,
        oldHasProtectedContent:
            oldHasProtectedContent ?? this.oldHasProtectedContent,
        newHasProtectedContent:
            newHasProtectedContent ?? this.newHasProtectedContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatHasProtectedContentToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatHasProtectedContentDisableRequested** *(messageChatHasProtectedContentDisableRequested)* - child of MessageContent
///
/// Chat has_protected_content setting was requested to be disabled.
///
/// * [isExpired]: True, if the request has expired.
final class MessageChatHasProtectedContentDisableRequested
    extends MessageContent {
  /// **MessageChatHasProtectedContentDisableRequested** *(messageChatHasProtectedContentDisableRequested)* - child of MessageContent
  ///
  /// Chat has_protected_content setting was requested to be disabled.
  ///
  /// * [isExpired]: True, if the request has expired.
  const MessageChatHasProtectedContentDisableRequested({
    required this.isExpired,
  });

  /// True, if the request has expired
  final bool isExpired;

  /// Parse from a json
  factory MessageChatHasProtectedContentDisableRequested.fromJson(
          Map<String, dynamic> json) =>
      MessageChatHasProtectedContentDisableRequested(
        isExpired: json['is_expired'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_expired": isExpired,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_expired]: True, if the request has expired
  @override
  MessageChatHasProtectedContentDisableRequested copyWith({
    bool? isExpired,
  }) =>
      MessageChatHasProtectedContentDisableRequested(
        isExpired: isExpired ?? this.isExpired,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'messageChatHasProtectedContentDisableRequested';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatAddMembers** *(messageChatAddMembers)* - child of MessageContent
///
/// New chat members were added.
///
/// * [memberUserIds]: User identifiers of the new members.
final class MessageChatAddMembers extends MessageContent {
  /// **MessageChatAddMembers** *(messageChatAddMembers)* - child of MessageContent
  ///
  /// New chat members were added.
  ///
  /// * [memberUserIds]: User identifiers of the new members.
  const MessageChatAddMembers({
    required this.memberUserIds,
  });

  /// User identifiers of the new members
  final List<int> memberUserIds;

  /// Parse from a json
  factory MessageChatAddMembers.fromJson(Map<String, dynamic> json) =>
      MessageChatAddMembers(
        memberUserIds: List<int>.from(
            (json['member_user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_user_ids": memberUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_user_ids]: User identifiers of the new members
  @override
  MessageChatAddMembers copyWith({
    List<int>? memberUserIds,
  }) =>
      MessageChatAddMembers(
        memberUserIds: memberUserIds ?? this.memberUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatAddMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatJoinByLink** *(messageChatJoinByLink)* - child of MessageContent
///
/// A new member joined the chat via an invite link.
final class MessageChatJoinByLink extends MessageContent {
  /// **MessageChatJoinByLink** *(messageChatJoinByLink)* - child of MessageContent
  ///
  /// A new member joined the chat via an invite link.
  const MessageChatJoinByLink();

  /// Parse from a json
  factory MessageChatJoinByLink.fromJson(Map<String, dynamic> json) =>
      const MessageChatJoinByLink();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageChatJoinByLink copyWith() => const MessageChatJoinByLink();

  /// TDLib object type
  static const String defaultObjectId = 'messageChatJoinByLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatJoinByRequest** *(messageChatJoinByRequest)* - child of MessageContent
///
/// A new member was accepted to the chat by an administrator.
final class MessageChatJoinByRequest extends MessageContent {
  /// **MessageChatJoinByRequest** *(messageChatJoinByRequest)* - child of MessageContent
  ///
  /// A new member was accepted to the chat by an administrator.
  const MessageChatJoinByRequest();

  /// Parse from a json
  factory MessageChatJoinByRequest.fromJson(Map<String, dynamic> json) =>
      const MessageChatJoinByRequest();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageChatJoinByRequest copyWith() => const MessageChatJoinByRequest();

  /// TDLib object type
  static const String defaultObjectId = 'messageChatJoinByRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatJoinFromCommunity** *(messageChatJoinFromCommunity)* - child of MessageContent
///
/// A new member joined the chat from a community.
///
/// * [communityId]: Identifier of the community from which the user joined the chat.
final class MessageChatJoinFromCommunity extends MessageContent {
  /// **MessageChatJoinFromCommunity** *(messageChatJoinFromCommunity)* - child of MessageContent
  ///
  /// A new member joined the chat from a community.
  ///
  /// * [communityId]: Identifier of the community from which the user joined the chat.
  const MessageChatJoinFromCommunity({
    required this.communityId,
  });

  /// Identifier of the community from which the user joined the chat
  final int communityId;

  /// Parse from a json
  factory MessageChatJoinFromCommunity.fromJson(Map<String, dynamic> json) =>
      MessageChatJoinFromCommunity(
        communityId: json['community_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community from which the user joined the chat
  @override
  MessageChatJoinFromCommunity copyWith({
    int? communityId,
  }) =>
      MessageChatJoinFromCommunity(
        communityId: communityId ?? this.communityId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatJoinFromCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatDeleteMember** *(messageChatDeleteMember)* - child of MessageContent
///
/// A chat member was deleted.
///
/// * [userId]: User identifier of the deleted chat member.
final class MessageChatDeleteMember extends MessageContent {
  /// **MessageChatDeleteMember** *(messageChatDeleteMember)* - child of MessageContent
  ///
  /// A chat member was deleted.
  ///
  /// * [userId]: User identifier of the deleted chat member.
  const MessageChatDeleteMember({
    required this.userId,
  });

  /// User identifier of the deleted chat member
  final int userId;

  /// Parse from a json
  factory MessageChatDeleteMember.fromJson(Map<String, dynamic> json) =>
      MessageChatDeleteMember(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier of the deleted chat member
  @override
  MessageChatDeleteMember copyWith({
    int? userId,
  }) =>
      MessageChatDeleteMember(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatDeleteMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatAddedToCommunity** *(messageChatAddedToCommunity)* - child of MessageContent
///
/// The chat was added to a community.
///
/// * [communityId]: Identifier of the community to which the chat was added.
final class MessageChatAddedToCommunity extends MessageContent {
  /// **MessageChatAddedToCommunity** *(messageChatAddedToCommunity)* - child of MessageContent
  ///
  /// The chat was added to a community.
  ///
  /// * [communityId]: Identifier of the community to which the chat was added.
  const MessageChatAddedToCommunity({
    required this.communityId,
  });

  /// Identifier of the community to which the chat was added
  final int communityId;

  /// Parse from a json
  factory MessageChatAddedToCommunity.fromJson(Map<String, dynamic> json) =>
      MessageChatAddedToCommunity(
        communityId: json['community_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community to which the chat was added
  @override
  MessageChatAddedToCommunity copyWith({
    int? communityId,
  }) =>
      MessageChatAddedToCommunity(
        communityId: communityId ?? this.communityId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatAddedToCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatRemovedFromCommunity** *(messageChatRemovedFromCommunity)* - child of MessageContent
///
/// The chat was removed from a community.
final class MessageChatRemovedFromCommunity extends MessageContent {
  /// **MessageChatRemovedFromCommunity** *(messageChatRemovedFromCommunity)* - child of MessageContent
  ///
  /// The chat was removed from a community.
  const MessageChatRemovedFromCommunity();

  /// Parse from a json
  factory MessageChatRemovedFromCommunity.fromJson(Map<String, dynamic> json) =>
      const MessageChatRemovedFromCommunity();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageChatRemovedFromCommunity copyWith() =>
      const MessageChatRemovedFromCommunity();

  /// TDLib object type
  static const String defaultObjectId = 'messageChatRemovedFromCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatUpgradeTo** *(messageChatUpgradeTo)* - child of MessageContent
///
/// A basic group was upgraded to a supergroup and was deactivated as the result.
///
/// * [supergroupId]: Identifier of the supergroup to which the basic group was upgraded.
final class MessageChatUpgradeTo extends MessageContent {
  /// **MessageChatUpgradeTo** *(messageChatUpgradeTo)* - child of MessageContent
  ///
  /// A basic group was upgraded to a supergroup and was deactivated as the result.
  ///
  /// * [supergroupId]: Identifier of the supergroup to which the basic group was upgraded.
  const MessageChatUpgradeTo({
    required this.supergroupId,
  });

  /// Identifier of the supergroup to which the basic group was upgraded
  final int supergroupId;

  /// Parse from a json
  factory MessageChatUpgradeTo.fromJson(Map<String, dynamic> json) =>
      MessageChatUpgradeTo(
        supergroupId: json['supergroup_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup to which the basic group was upgraded
  @override
  MessageChatUpgradeTo copyWith({
    int? supergroupId,
  }) =>
      MessageChatUpgradeTo(
        supergroupId: supergroupId ?? this.supergroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatUpgradeTo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatUpgradeFrom** *(messageChatUpgradeFrom)* - child of MessageContent
///
/// A supergroup has been created from a basic group.
///
/// * [title]: Title of the newly created supergroup.
/// * [basicGroupId]: The identifier of the original basic group.
final class MessageChatUpgradeFrom extends MessageContent {
  /// **MessageChatUpgradeFrom** *(messageChatUpgradeFrom)* - child of MessageContent
  ///
  /// A supergroup has been created from a basic group.
  ///
  /// * [title]: Title of the newly created supergroup.
  /// * [basicGroupId]: The identifier of the original basic group.
  const MessageChatUpgradeFrom({
    required this.title,
    required this.basicGroupId,
  });

  /// Title of the newly created supergroup
  final String title;

  /// The identifier of the original basic group
  final int basicGroupId;

  /// Parse from a json
  factory MessageChatUpgradeFrom.fromJson(Map<String, dynamic> json) =>
      MessageChatUpgradeFrom(
        title: json['title'],
        basicGroupId: json['basic_group_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "basic_group_id": basicGroupId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the newly created supergroup
  /// * [basic_group_id]: The identifier of the original basic group
  @override
  MessageChatUpgradeFrom copyWith({
    String? title,
    int? basicGroupId,
  }) =>
      MessageChatUpgradeFrom(
        title: title ?? this.title,
        basicGroupId: basicGroupId ?? this.basicGroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatUpgradeFrom';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePinMessage** *(messagePinMessage)* - child of MessageContent
///
/// A message has been pinned.
///
/// * [messageId]: Identifier of the pinned message, can be an identifier of a deleted message or 0.
final class MessagePinMessage extends MessageContent {
  /// **MessagePinMessage** *(messagePinMessage)* - child of MessageContent
  ///
  /// A message has been pinned.
  ///
  /// * [messageId]: Identifier of the pinned message, can be an identifier of a deleted message or 0.
  const MessagePinMessage({
    required this.messageId,
  });

  /// Identifier of the pinned message, can be an identifier of a deleted message or 0
  final int messageId;

  /// Parse from a json
  factory MessagePinMessage.fromJson(Map<String, dynamic> json) =>
      MessagePinMessage(
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Identifier of the pinned message, can be an identifier of a deleted message or 0
  @override
  MessagePinMessage copyWith({
    int? messageId,
  }) =>
      MessagePinMessage(
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePinMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageScreenshotTaken** *(messageScreenshotTaken)* - child of MessageContent
///
/// A screenshot of a message in the chat has been taken.
final class MessageScreenshotTaken extends MessageContent {
  /// **MessageScreenshotTaken** *(messageScreenshotTaken)* - child of MessageContent
  ///
  /// A screenshot of a message in the chat has been taken.
  const MessageScreenshotTaken();

  /// Parse from a json
  factory MessageScreenshotTaken.fromJson(Map<String, dynamic> json) =>
      const MessageScreenshotTaken();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageScreenshotTaken copyWith() => const MessageScreenshotTaken();

  /// TDLib object type
  static const String defaultObjectId = 'messageScreenshotTaken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatSetBackground** *(messageChatSetBackground)* - child of MessageContent
///
/// A new background was set in the chat.
///
/// * [oldBackgroundMessageId]: Identifier of the message with a previously set same background; 0 if none. Can be an identifier of a deleted message.
/// * [background]: The new background.
/// * [onlyForSelf]: True, if the background was set only for self.
final class MessageChatSetBackground extends MessageContent {
  /// **MessageChatSetBackground** *(messageChatSetBackground)* - child of MessageContent
  ///
  /// A new background was set in the chat.
  ///
  /// * [oldBackgroundMessageId]: Identifier of the message with a previously set same background; 0 if none. Can be an identifier of a deleted message.
  /// * [background]: The new background.
  /// * [onlyForSelf]: True, if the background was set only for self.
  const MessageChatSetBackground({
    required this.oldBackgroundMessageId,
    required this.background,
    required this.onlyForSelf,
  });

  /// Identifier of the message with a previously set same background; 0 if none. Can be an identifier of a deleted message
  final int oldBackgroundMessageId;

  /// The new background
  final ChatBackground background;

  /// True, if the background was set only for self
  final bool onlyForSelf;

  /// Parse from a json
  factory MessageChatSetBackground.fromJson(Map<String, dynamic> json) =>
      MessageChatSetBackground(
        oldBackgroundMessageId: json['old_background_message_id'] ?? 0,
        background: ChatBackground.fromJson(json['background']),
        onlyForSelf: json['only_for_self'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_background_message_id": oldBackgroundMessageId,
      "background": background.toJson(),
      "only_for_self": onlyForSelf,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_background_message_id]: Identifier of the message with a previously set same background; 0 if none. Can be an identifier of a deleted message
  /// * [background]: The new background
  /// * [only_for_self]: True, if the background was set only for self
  @override
  MessageChatSetBackground copyWith({
    int? oldBackgroundMessageId,
    ChatBackground? background,
    bool? onlyForSelf,
  }) =>
      MessageChatSetBackground(
        oldBackgroundMessageId:
            oldBackgroundMessageId ?? this.oldBackgroundMessageId,
        background: background ?? this.background,
        onlyForSelf: onlyForSelf ?? this.onlyForSelf,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatSetBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatSetTheme** *(messageChatSetTheme)* - child of MessageContent
///
/// A theme in the chat has been changed.
///
/// * [theme]: New theme for the chat; may be null if chat theme was reset to the default one *(optional)*.
final class MessageChatSetTheme extends MessageContent {
  /// **MessageChatSetTheme** *(messageChatSetTheme)* - child of MessageContent
  ///
  /// A theme in the chat has been changed.
  ///
  /// * [theme]: New theme for the chat; may be null if chat theme was reset to the default one *(optional)*.
  const MessageChatSetTheme({
    this.theme,
  });

  /// New theme for the chat; may be null if chat theme was reset to the default one
  final ChatTheme? theme;

  /// Parse from a json
  factory MessageChatSetTheme.fromJson(Map<String, dynamic> json) =>
      MessageChatSetTheme(
        theme: json['theme'] == null ? null : ChatTheme.fromJson(json['theme']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "theme": theme?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [theme]: New theme for the chat; may be null if chat theme was reset to the default one
  @override
  MessageChatSetTheme copyWith({
    ChatTheme? theme,
  }) =>
      MessageChatSetTheme(
        theme: theme ?? this.theme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatSetTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatSetMessageAutoDeleteTime** *(messageChatSetMessageAutoDeleteTime)* - child of MessageContent
///
/// The auto-delete or self-destruct timer for messages in the chat has been changed.
///
/// * [messageAutoDeleteTime]: New value auto-delete or self-destruct time, in seconds; 0 if disabled.
/// * [fromUserId]: If not 0, a user identifier, which default setting was automatically applied.
final class MessageChatSetMessageAutoDeleteTime extends MessageContent {
  /// **MessageChatSetMessageAutoDeleteTime** *(messageChatSetMessageAutoDeleteTime)* - child of MessageContent
  ///
  /// The auto-delete or self-destruct timer for messages in the chat has been changed.
  ///
  /// * [messageAutoDeleteTime]: New value auto-delete or self-destruct time, in seconds; 0 if disabled.
  /// * [fromUserId]: If not 0, a user identifier, which default setting was automatically applied.
  const MessageChatSetMessageAutoDeleteTime({
    required this.messageAutoDeleteTime,
    required this.fromUserId,
  });

  /// New value auto-delete or self-destruct time, in seconds; 0 if disabled
  final int messageAutoDeleteTime;

  /// If not 0, a user identifier, which default setting was automatically applied
  final int fromUserId;

  /// Parse from a json
  factory MessageChatSetMessageAutoDeleteTime.fromJson(
          Map<String, dynamic> json) =>
      MessageChatSetMessageAutoDeleteTime(
        messageAutoDeleteTime: json['message_auto_delete_time'],
        fromUserId: json['from_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_auto_delete_time": messageAutoDeleteTime,
      "from_user_id": fromUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_auto_delete_time]: New value auto-delete or self-destruct time, in seconds; 0 if disabled
  /// * [from_user_id]: If not 0, a user identifier, which default setting was automatically applied
  @override
  MessageChatSetMessageAutoDeleteTime copyWith({
    int? messageAutoDeleteTime,
    int? fromUserId,
  }) =>
      MessageChatSetMessageAutoDeleteTime(
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
        fromUserId: fromUserId ?? this.fromUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatSetMessageAutoDeleteTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatBoost** *(messageChatBoost)* - child of MessageContent
///
/// The chat was boosted by the sender of the message.
///
/// * [boostCount]: Number of times the chat was boosted.
final class MessageChatBoost extends MessageContent {
  /// **MessageChatBoost** *(messageChatBoost)* - child of MessageContent
  ///
  /// The chat was boosted by the sender of the message.
  ///
  /// * [boostCount]: Number of times the chat was boosted.
  const MessageChatBoost({
    required this.boostCount,
  });

  /// Number of times the chat was boosted
  final int boostCount;

  /// Parse from a json
  factory MessageChatBoost.fromJson(Map<String, dynamic> json) =>
      MessageChatBoost(
        boostCount: json['boost_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "boost_count": boostCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boost_count]: Number of times the chat was boosted
  @override
  MessageChatBoost copyWith({
    int? boostCount,
  }) =>
      MessageChatBoost(
        boostCount: boostCount ?? this.boostCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageForumTopicCreated** *(messageForumTopicCreated)* - child of MessageContent
///
/// A forum topic has been created.
///
/// * [name]: Name of the topic.
/// * [isNameImplicit]: True, if the name of the topic wasn't added explicitly.
/// * [icon]: Icon of the topic.
final class MessageForumTopicCreated extends MessageContent {
  /// **MessageForumTopicCreated** *(messageForumTopicCreated)* - child of MessageContent
  ///
  /// A forum topic has been created.
  ///
  /// * [name]: Name of the topic.
  /// * [isNameImplicit]: True, if the name of the topic wasn't added explicitly.
  /// * [icon]: Icon of the topic.
  const MessageForumTopicCreated({
    required this.name,
    required this.isNameImplicit,
    required this.icon,
  });

  /// Name of the topic
  final String name;

  /// True, if the name of the topic wasn't added explicitly
  final bool isNameImplicit;

  /// Icon of the topic
  final ForumTopicIcon icon;

  /// Parse from a json
  factory MessageForumTopicCreated.fromJson(Map<String, dynamic> json) =>
      MessageForumTopicCreated(
        name: json['name'],
        isNameImplicit: json['is_name_implicit'],
        icon: ForumTopicIcon.fromJson(json['icon']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "is_name_implicit": isNameImplicit,
      "icon": icon.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the topic
  /// * [is_name_implicit]: True, if the name of the topic wasn't added explicitly
  /// * [icon]: Icon of the topic
  @override
  MessageForumTopicCreated copyWith({
    String? name,
    bool? isNameImplicit,
    ForumTopicIcon? icon,
  }) =>
      MessageForumTopicCreated(
        name: name ?? this.name,
        isNameImplicit: isNameImplicit ?? this.isNameImplicit,
        icon: icon ?? this.icon,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageForumTopicCreated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageForumTopicEdited** *(messageForumTopicEdited)* - child of MessageContent
///
/// A forum topic has been edited.
///
/// * [name]: If non-empty, the new name of the topic.
/// * [editIconCustomEmojiId]: True, if icon's custom_emoji_id is changed.
/// * [iconCustomEmojiId]: New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false.
final class MessageForumTopicEdited extends MessageContent {
  /// **MessageForumTopicEdited** *(messageForumTopicEdited)* - child of MessageContent
  ///
  /// A forum topic has been edited.
  ///
  /// * [name]: If non-empty, the new name of the topic.
  /// * [editIconCustomEmojiId]: True, if icon's custom_emoji_id is changed.
  /// * [iconCustomEmojiId]: New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false.
  const MessageForumTopicEdited({
    required this.name,
    required this.editIconCustomEmojiId,
    required this.iconCustomEmojiId,
  });

  /// If non-empty, the new name of the topic
  final String name;

  /// True, if icon's custom_emoji_id is changed
  final bool editIconCustomEmojiId;

  /// New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false
  final int iconCustomEmojiId;

  /// Parse from a json
  factory MessageForumTopicEdited.fromJson(Map<String, dynamic> json) =>
      MessageForumTopicEdited(
        name: json['name'],
        editIconCustomEmojiId: json['edit_icon_custom_emoji_id'],
        iconCustomEmojiId: json['icon_custom_emoji_id'] is int
            ? json['icon_custom_emoji_id']
            : int.tryParse(json['icon_custom_emoji_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "edit_icon_custom_emoji_id": editIconCustomEmojiId,
      "icon_custom_emoji_id": iconCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: If non-empty, the new name of the topic
  /// * [edit_icon_custom_emoji_id]: True, if icon's custom_emoji_id is changed
  /// * [icon_custom_emoji_id]: New unique identifier of the custom emoji shown on the topic icon; 0 if none. Must be ignored if edit_icon_custom_emoji_id is false
  @override
  MessageForumTopicEdited copyWith({
    String? name,
    bool? editIconCustomEmojiId,
    int? iconCustomEmojiId,
  }) =>
      MessageForumTopicEdited(
        name: name ?? this.name,
        editIconCustomEmojiId:
            editIconCustomEmojiId ?? this.editIconCustomEmojiId,
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageForumTopicEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageForumTopicIsClosedToggled** *(messageForumTopicIsClosedToggled)* - child of MessageContent
///
/// A forum topic has been closed or opened.
///
/// * [isClosed]: True, if the topic was closed; otherwise, the topic was reopened.
final class MessageForumTopicIsClosedToggled extends MessageContent {
  /// **MessageForumTopicIsClosedToggled** *(messageForumTopicIsClosedToggled)* - child of MessageContent
  ///
  /// A forum topic has been closed or opened.
  ///
  /// * [isClosed]: True, if the topic was closed; otherwise, the topic was reopened.
  const MessageForumTopicIsClosedToggled({
    required this.isClosed,
  });

  /// True, if the topic was closed; otherwise, the topic was reopened
  final bool isClosed;

  /// Parse from a json
  factory MessageForumTopicIsClosedToggled.fromJson(
          Map<String, dynamic> json) =>
      MessageForumTopicIsClosedToggled(
        isClosed: json['is_closed'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_closed": isClosed,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_closed]: True, if the topic was closed; otherwise, the topic was reopened
  @override
  MessageForumTopicIsClosedToggled copyWith({
    bool? isClosed,
  }) =>
      MessageForumTopicIsClosedToggled(
        isClosed: isClosed ?? this.isClosed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageForumTopicIsClosedToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageForumTopicIsHiddenToggled** *(messageForumTopicIsHiddenToggled)* - child of MessageContent
///
/// A General forum topic has been hidden or unhidden.
///
/// * [isHidden]: True, if the topic was hidden; otherwise, the topic was unhidden.
final class MessageForumTopicIsHiddenToggled extends MessageContent {
  /// **MessageForumTopicIsHiddenToggled** *(messageForumTopicIsHiddenToggled)* - child of MessageContent
  ///
  /// A General forum topic has been hidden or unhidden.
  ///
  /// * [isHidden]: True, if the topic was hidden; otherwise, the topic was unhidden.
  const MessageForumTopicIsHiddenToggled({
    required this.isHidden,
  });

  /// True, if the topic was hidden; otherwise, the topic was unhidden
  final bool isHidden;

  /// Parse from a json
  factory MessageForumTopicIsHiddenToggled.fromJson(
          Map<String, dynamic> json) =>
      MessageForumTopicIsHiddenToggled(
        isHidden: json['is_hidden'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_hidden": isHidden,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_hidden]: True, if the topic was hidden; otherwise, the topic was unhidden
  @override
  MessageForumTopicIsHiddenToggled copyWith({
    bool? isHidden,
  }) =>
      MessageForumTopicIsHiddenToggled(
        isHidden: isHidden ?? this.isHidden,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageForumTopicIsHiddenToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestProfilePhoto** *(messageSuggestProfilePhoto)* - child of MessageContent
///
/// A profile photo was suggested to a user in a private chat.
///
/// * [photo]: The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo.
final class MessageSuggestProfilePhoto extends MessageContent {
  /// **MessageSuggestProfilePhoto** *(messageSuggestProfilePhoto)* - child of MessageContent
  ///
  /// A profile photo was suggested to a user in a private chat.
  ///
  /// * [photo]: The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo.
  const MessageSuggestProfilePhoto({
    required this.photo,
  });

  /// The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo
  final ChatPhoto photo;

  /// Parse from a json
  factory MessageSuggestProfilePhoto.fromJson(Map<String, dynamic> json) =>
      MessageSuggestProfilePhoto(
        photo: ChatPhoto.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: The suggested chat photo. Use the method setProfilePhoto with inputChatPhotoPrevious to apply the photo
  @override
  MessageSuggestProfilePhoto copyWith({
    ChatPhoto? photo,
  }) =>
      MessageSuggestProfilePhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestBirthdate** *(messageSuggestBirthdate)* - child of MessageContent
///
/// A birthdate was suggested to be set.
///
/// * [birthdate]: The suggested birthdate. Use the method setBirthdate to apply the birthdate.
final class MessageSuggestBirthdate extends MessageContent {
  /// **MessageSuggestBirthdate** *(messageSuggestBirthdate)* - child of MessageContent
  ///
  /// A birthdate was suggested to be set.
  ///
  /// * [birthdate]: The suggested birthdate. Use the method setBirthdate to apply the birthdate.
  const MessageSuggestBirthdate({
    required this.birthdate,
  });

  /// The suggested birthdate. Use the method setBirthdate to apply the birthdate
  final Birthdate birthdate;

  /// Parse from a json
  factory MessageSuggestBirthdate.fromJson(Map<String, dynamic> json) =>
      MessageSuggestBirthdate(
        birthdate: Birthdate.fromJson(json['birthdate']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "birthdate": birthdate.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [birthdate]: The suggested birthdate. Use the method setBirthdate to apply the birthdate
  @override
  MessageSuggestBirthdate copyWith({
    Birthdate? birthdate,
  }) =>
      MessageSuggestBirthdate(
        birthdate: birthdate ?? this.birthdate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageCustomServiceAction** *(messageCustomServiceAction)* - child of MessageContent
///
/// A non-standard action has happened in the chat.
///
/// * [text]: Message text to be shown in the chat.
final class MessageCustomServiceAction extends MessageContent {
  /// **MessageCustomServiceAction** *(messageCustomServiceAction)* - child of MessageContent
  ///
  /// A non-standard action has happened in the chat.
  ///
  /// * [text]: Message text to be shown in the chat.
  const MessageCustomServiceAction({
    required this.text,
  });

  /// Message text to be shown in the chat
  final String text;

  /// Parse from a json
  factory MessageCustomServiceAction.fromJson(Map<String, dynamic> json) =>
      MessageCustomServiceAction(
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Message text to be shown in the chat
  @override
  MessageCustomServiceAction copyWith({
    String? text,
  }) =>
      MessageCustomServiceAction(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageCustomServiceAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGameScore** *(messageGameScore)* - child of MessageContent
///
/// A new high score was achieved in a game.
///
/// * [gameMessageId]: Identifier of the message with the game, can be an identifier of a deleted message.
/// * [gameId]: Identifier of the game; may be different from the games presented in the message with the game.
/// * [score]: New score.
final class MessageGameScore extends MessageContent {
  /// **MessageGameScore** *(messageGameScore)* - child of MessageContent
  ///
  /// A new high score was achieved in a game.
  ///
  /// * [gameMessageId]: Identifier of the message with the game, can be an identifier of a deleted message.
  /// * [gameId]: Identifier of the game; may be different from the games presented in the message with the game.
  /// * [score]: New score.
  const MessageGameScore({
    required this.gameMessageId,
    required this.gameId,
    required this.score,
  });

  /// Identifier of the message with the game, can be an identifier of a deleted message
  final int gameMessageId;

  /// Identifier of the game; may be different from the games presented in the message with the game
  final int gameId;

  /// New score
  final int score;

  /// Parse from a json
  factory MessageGameScore.fromJson(Map<String, dynamic> json) =>
      MessageGameScore(
        gameMessageId: json['game_message_id'],
        gameId: json['game_id'] is int
            ? json['game_id']
            : int.parse(json['game_id']),
        score: json['score'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "game_message_id": gameMessageId,
      "game_id": gameId,
      "score": score,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [game_message_id]: Identifier of the message with the game, can be an identifier of a deleted message
  /// * [game_id]: Identifier of the game; may be different from the games presented in the message with the game
  /// * [score]: New score
  @override
  MessageGameScore copyWith({
    int? gameMessageId,
    int? gameId,
    int? score,
  }) =>
      MessageGameScore(
        gameMessageId: gameMessageId ?? this.gameMessageId,
        gameId: gameId ?? this.gameId,
        score: score ?? this.score,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGameScore';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageManagedBotCreated** *(messageManagedBotCreated)* - child of MessageContent
///
/// A bot managed by another bot was created by the user.
///
/// * [botUserId]: User identifier of the created bot.
/// * [managerBotUserId]: Identifier of the bot which will manage the new bot.
final class MessageManagedBotCreated extends MessageContent {
  /// **MessageManagedBotCreated** *(messageManagedBotCreated)* - child of MessageContent
  ///
  /// A bot managed by another bot was created by the user.
  ///
  /// * [botUserId]: User identifier of the created bot.
  /// * [managerBotUserId]: Identifier of the bot which will manage the new bot.
  const MessageManagedBotCreated({
    required this.botUserId,
    required this.managerBotUserId,
  });

  /// User identifier of the created bot
  final int botUserId;

  /// Identifier of the bot which will manage the new bot
  final int managerBotUserId;

  /// Parse from a json
  factory MessageManagedBotCreated.fromJson(Map<String, dynamic> json) =>
      MessageManagedBotCreated(
        botUserId: json['bot_user_id'],
        managerBotUserId: json['manager_bot_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "manager_bot_user_id": managerBotUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the created bot
  /// * [manager_bot_user_id]: Identifier of the bot which will manage the new bot
  @override
  MessageManagedBotCreated copyWith({
    int? botUserId,
    int? managerBotUserId,
  }) =>
      MessageManagedBotCreated(
        botUserId: botUserId ?? this.botUserId,
        managerBotUserId: managerBotUserId ?? this.managerBotUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageManagedBotCreated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaymentSuccessful** *(messagePaymentSuccessful)* - child of MessageContent
///
/// A payment has been sent to a bot or a business account.
///
/// * [invoiceChatId]: Identifier of the chat, containing the corresponding invoice message.
/// * [invoiceMessageId]: Identifier of the message with the corresponding invoice; may be 0 or an identifier of a deleted message.
/// * [currency]: Currency for the price of the product.
/// * [totalAmount]: Total price for the product, in the smallest units of the currency.
/// * [subscriptionUntilDate]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring.
/// * [isRecurring]: True, if this is a recurring payment.
/// * [isFirstRecurring]: True, if this is the first recurring payment.
/// * [invoiceName]: Name of the invoice; may be empty if unknown.
final class MessagePaymentSuccessful extends MessageContent {
  /// **MessagePaymentSuccessful** *(messagePaymentSuccessful)* - child of MessageContent
  ///
  /// A payment has been sent to a bot or a business account.
  ///
  /// * [invoiceChatId]: Identifier of the chat, containing the corresponding invoice message.
  /// * [invoiceMessageId]: Identifier of the message with the corresponding invoice; may be 0 or an identifier of a deleted message.
  /// * [currency]: Currency for the price of the product.
  /// * [totalAmount]: Total price for the product, in the smallest units of the currency.
  /// * [subscriptionUntilDate]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring.
  /// * [isRecurring]: True, if this is a recurring payment.
  /// * [isFirstRecurring]: True, if this is the first recurring payment.
  /// * [invoiceName]: Name of the invoice; may be empty if unknown.
  const MessagePaymentSuccessful({
    required this.invoiceChatId,
    required this.invoiceMessageId,
    required this.currency,
    required this.totalAmount,
    required this.subscriptionUntilDate,
    required this.isRecurring,
    required this.isFirstRecurring,
    required this.invoiceName,
  });

  /// Identifier of the chat, containing the corresponding invoice message
  final int invoiceChatId;

  /// Identifier of the message with the corresponding invoice; may be 0 or an identifier of a deleted message
  final int invoiceMessageId;

  /// Currency for the price of the product
  final String currency;

  /// Total price for the product, in the smallest units of the currency
  final int totalAmount;

  /// Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
  final int subscriptionUntilDate;

  /// True, if this is a recurring payment
  final bool isRecurring;

  /// True, if this is the first recurring payment
  final bool isFirstRecurring;

  /// Name of the invoice; may be empty if unknown
  final String invoiceName;

  /// Parse from a json
  factory MessagePaymentSuccessful.fromJson(Map<String, dynamic> json) =>
      MessagePaymentSuccessful(
        invoiceChatId: json['invoice_chat_id'],
        invoiceMessageId: json['invoice_message_id'],
        currency: json['currency'],
        totalAmount: json['total_amount'],
        subscriptionUntilDate: json['subscription_until_date'],
        isRecurring: json['is_recurring'],
        isFirstRecurring: json['is_first_recurring'],
        invoiceName: json['invoice_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invoice_chat_id": invoiceChatId,
      "invoice_message_id": invoiceMessageId,
      "currency": currency,
      "total_amount": totalAmount,
      "subscription_until_date": subscriptionUntilDate,
      "is_recurring": isRecurring,
      "is_first_recurring": isFirstRecurring,
      "invoice_name": invoiceName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invoice_chat_id]: Identifier of the chat, containing the corresponding invoice message
  /// * [invoice_message_id]: Identifier of the message with the corresponding invoice; may be 0 or an identifier of a deleted message
  /// * [currency]: Currency for the price of the product
  /// * [total_amount]: Total price for the product, in the smallest units of the currency
  /// * [subscription_until_date]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
  /// * [is_recurring]: True, if this is a recurring payment
  /// * [is_first_recurring]: True, if this is the first recurring payment
  /// * [invoice_name]: Name of the invoice; may be empty if unknown
  @override
  MessagePaymentSuccessful copyWith({
    int? invoiceChatId,
    int? invoiceMessageId,
    String? currency,
    int? totalAmount,
    int? subscriptionUntilDate,
    bool? isRecurring,
    bool? isFirstRecurring,
    String? invoiceName,
  }) =>
      MessagePaymentSuccessful(
        invoiceChatId: invoiceChatId ?? this.invoiceChatId,
        invoiceMessageId: invoiceMessageId ?? this.invoiceMessageId,
        currency: currency ?? this.currency,
        totalAmount: totalAmount ?? this.totalAmount,
        subscriptionUntilDate:
            subscriptionUntilDate ?? this.subscriptionUntilDate,
        isRecurring: isRecurring ?? this.isRecurring,
        isFirstRecurring: isFirstRecurring ?? this.isFirstRecurring,
        invoiceName: invoiceName ?? this.invoiceName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaymentSuccessful';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaymentSuccessfulBot** *(messagePaymentSuccessfulBot)* - child of MessageContent
///
/// A payment has been received by the bot or the business account.
///
/// * [currency]: Currency for price of the product.
/// * [totalAmount]: Total price for the product, in the smallest units of the currency.
/// * [subscriptionUntilDate]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring.
/// * [isRecurring]: True, if this is a recurring payment.
/// * [isFirstRecurring]: True, if this is the first recurring payment.
/// * [invoicePayload]: Invoice payload.
/// * [shippingOptionId]: Identifier of the shipping option chosen by the user; may be empty if not applicable; for bots only.
/// * [orderInfo]: Information about the order; may be null; for bots only *(optional)*.
/// * [telegramPaymentChargeId]: Telegram payment identifier.
/// * [providerPaymentChargeId]: Provider payment identifier.
final class MessagePaymentSuccessfulBot extends MessageContent {
  /// **MessagePaymentSuccessfulBot** *(messagePaymentSuccessfulBot)* - child of MessageContent
  ///
  /// A payment has been received by the bot or the business account.
  ///
  /// * [currency]: Currency for price of the product.
  /// * [totalAmount]: Total price for the product, in the smallest units of the currency.
  /// * [subscriptionUntilDate]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring.
  /// * [isRecurring]: True, if this is a recurring payment.
  /// * [isFirstRecurring]: True, if this is the first recurring payment.
  /// * [invoicePayload]: Invoice payload.
  /// * [shippingOptionId]: Identifier of the shipping option chosen by the user; may be empty if not applicable; for bots only.
  /// * [orderInfo]: Information about the order; may be null; for bots only *(optional)*.
  /// * [telegramPaymentChargeId]: Telegram payment identifier.
  /// * [providerPaymentChargeId]: Provider payment identifier.
  const MessagePaymentSuccessfulBot({
    required this.currency,
    required this.totalAmount,
    required this.subscriptionUntilDate,
    required this.isRecurring,
    required this.isFirstRecurring,
    required this.invoicePayload,
    required this.shippingOptionId,
    this.orderInfo,
    required this.telegramPaymentChargeId,
    required this.providerPaymentChargeId,
  });

  /// Currency for price of the product
  final String currency;

  /// Total price for the product, in the smallest units of the currency
  final int totalAmount;

  /// Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
  final int subscriptionUntilDate;

  /// True, if this is a recurring payment
  final bool isRecurring;

  /// True, if this is the first recurring payment
  final bool isFirstRecurring;

  /// Invoice payload
  final String invoicePayload;

  /// Identifier of the shipping option chosen by the user; may be empty if not applicable; for bots only
  final String shippingOptionId;

  /// Information about the order; may be null; for bots only
  final OrderInfo? orderInfo;

  /// Telegram payment identifier
  final String telegramPaymentChargeId;

  /// Provider payment identifier
  final String providerPaymentChargeId;

  /// Parse from a json
  factory MessagePaymentSuccessfulBot.fromJson(Map<String, dynamic> json) =>
      MessagePaymentSuccessfulBot(
        currency: json['currency'],
        totalAmount: json['total_amount'],
        subscriptionUntilDate: json['subscription_until_date'],
        isRecurring: json['is_recurring'],
        isFirstRecurring: json['is_first_recurring'],
        invoicePayload: json['invoice_payload'],
        shippingOptionId: json['shipping_option_id'],
        orderInfo: json['order_info'] == null
            ? null
            : OrderInfo.fromJson(json['order_info']),
        telegramPaymentChargeId: json['telegram_payment_charge_id'],
        providerPaymentChargeId: json['provider_payment_charge_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "total_amount": totalAmount,
      "subscription_until_date": subscriptionUntilDate,
      "is_recurring": isRecurring,
      "is_first_recurring": isFirstRecurring,
      "invoice_payload": invoicePayload,
      "shipping_option_id": shippingOptionId,
      "order_info": orderInfo?.toJson(),
      "telegram_payment_charge_id": telegramPaymentChargeId,
      "provider_payment_charge_id": providerPaymentChargeId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: Currency for price of the product
  /// * [total_amount]: Total price for the product, in the smallest units of the currency
  /// * [subscription_until_date]: Point in time (Unix timestamp) when the subscription will expire; 0 if unknown or the payment isn't recurring
  /// * [is_recurring]: True, if this is a recurring payment
  /// * [is_first_recurring]: True, if this is the first recurring payment
  /// * [invoice_payload]: Invoice payload
  /// * [shipping_option_id]: Identifier of the shipping option chosen by the user; may be empty if not applicable; for bots only
  /// * [order_info]: Information about the order; may be null; for bots only
  /// * [telegram_payment_charge_id]: Telegram payment identifier
  /// * [provider_payment_charge_id]: Provider payment identifier
  @override
  MessagePaymentSuccessfulBot copyWith({
    String? currency,
    int? totalAmount,
    int? subscriptionUntilDate,
    bool? isRecurring,
    bool? isFirstRecurring,
    String? invoicePayload,
    String? shippingOptionId,
    OrderInfo? orderInfo,
    String? telegramPaymentChargeId,
    String? providerPaymentChargeId,
  }) =>
      MessagePaymentSuccessfulBot(
        currency: currency ?? this.currency,
        totalAmount: totalAmount ?? this.totalAmount,
        subscriptionUntilDate:
            subscriptionUntilDate ?? this.subscriptionUntilDate,
        isRecurring: isRecurring ?? this.isRecurring,
        isFirstRecurring: isFirstRecurring ?? this.isFirstRecurring,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        shippingOptionId: shippingOptionId ?? this.shippingOptionId,
        orderInfo: orderInfo ?? this.orderInfo,
        telegramPaymentChargeId:
            telegramPaymentChargeId ?? this.telegramPaymentChargeId,
        providerPaymentChargeId:
            providerPaymentChargeId ?? this.providerPaymentChargeId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaymentSuccessfulBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaymentRefunded** *(messagePaymentRefunded)* - child of MessageContent
///
/// A payment has been refunded.
///
/// * [ownerId]: Identifier of the previous owner of the Telegram Stars that refunds them.
/// * [currency]: Currency for the price of the product.
/// * [totalAmount]: Total price for the product, in the smallest units of the currency.
/// * [invoicePayload]: Invoice payload; only for bots.
/// * [telegramPaymentChargeId]: Telegram payment identifier.
/// * [providerPaymentChargeId]: Provider payment identifier.
final class MessagePaymentRefunded extends MessageContent {
  /// **MessagePaymentRefunded** *(messagePaymentRefunded)* - child of MessageContent
  ///
  /// A payment has been refunded.
  ///
  /// * [ownerId]: Identifier of the previous owner of the Telegram Stars that refunds them.
  /// * [currency]: Currency for the price of the product.
  /// * [totalAmount]: Total price for the product, in the smallest units of the currency.
  /// * [invoicePayload]: Invoice payload; only for bots.
  /// * [telegramPaymentChargeId]: Telegram payment identifier.
  /// * [providerPaymentChargeId]: Provider payment identifier.
  const MessagePaymentRefunded({
    required this.ownerId,
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    required this.telegramPaymentChargeId,
    required this.providerPaymentChargeId,
  });

  /// Identifier of the previous owner of the Telegram Stars that refunds them
  final MessageSender ownerId;

  /// Currency for the price of the product
  final String currency;

  /// Total price for the product, in the smallest units of the currency
  final int totalAmount;

  /// Invoice payload; only for bots
  final String invoicePayload;

  /// Telegram payment identifier
  final String telegramPaymentChargeId;

  /// Provider payment identifier
  final String providerPaymentChargeId;

  /// Parse from a json
  factory MessagePaymentRefunded.fromJson(Map<String, dynamic> json) =>
      MessagePaymentRefunded(
        ownerId: MessageSender.fromJson(json['owner_id']),
        currency: json['currency'],
        totalAmount: json['total_amount'],
        invoicePayload: json['invoice_payload'],
        telegramPaymentChargeId: json['telegram_payment_charge_id'],
        providerPaymentChargeId: json['provider_payment_charge_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "currency": currency,
      "total_amount": totalAmount,
      "invoice_payload": invoicePayload,
      "telegram_payment_charge_id": telegramPaymentChargeId,
      "provider_payment_charge_id": providerPaymentChargeId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the previous owner of the Telegram Stars that refunds them
  /// * [currency]: Currency for the price of the product
  /// * [total_amount]: Total price for the product, in the smallest units of the currency
  /// * [invoice_payload]: Invoice payload; only for bots
  /// * [telegram_payment_charge_id]: Telegram payment identifier
  /// * [provider_payment_charge_id]: Provider payment identifier
  @override
  MessagePaymentRefunded copyWith({
    MessageSender? ownerId,
    String? currency,
    int? totalAmount,
    String? invoicePayload,
    String? telegramPaymentChargeId,
    String? providerPaymentChargeId,
  }) =>
      MessagePaymentRefunded(
        ownerId: ownerId ?? this.ownerId,
        currency: currency ?? this.currency,
        totalAmount: totalAmount ?? this.totalAmount,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        telegramPaymentChargeId:
            telegramPaymentChargeId ?? this.telegramPaymentChargeId,
        providerPaymentChargeId:
            providerPaymentChargeId ?? this.providerPaymentChargeId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaymentRefunded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiftedPremium** *(messageGiftedPremium)* - child of MessageContent
///
/// Telegram Premium was gifted to a user.
///
/// * [gifterUserId]: The identifier of a user who gifted Telegram Premium; 0 if the gift was anonymous or is outgoing.
/// * [receiverUserId]: The identifier of a user who received Telegram Premium; 0 if the gift is incoming.
/// * [text]: Message added to the gifted Telegram Premium by the sender.
/// * [currency]: Currency for the paid amount.
/// * [amount]: The paid amount, in the smallest units of the currency.
/// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none.
/// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
/// * [dayCount]: Number of days the Telegram Premium subscription will be active.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
final class MessageGiftedPremium extends MessageContent {
  /// **MessageGiftedPremium** *(messageGiftedPremium)* - child of MessageContent
  ///
  /// Telegram Premium was gifted to a user.
  ///
  /// * [gifterUserId]: The identifier of a user who gifted Telegram Premium; 0 if the gift was anonymous or is outgoing.
  /// * [receiverUserId]: The identifier of a user who received Telegram Premium; 0 if the gift is incoming.
  /// * [text]: Message added to the gifted Telegram Premium by the sender.
  /// * [currency]: Currency for the paid amount.
  /// * [amount]: The paid amount, in the smallest units of the currency.
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none.
  /// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
  /// * [dayCount]: Number of days the Telegram Premium subscription will be active.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  const MessageGiftedPremium({
    required this.gifterUserId,
    required this.receiverUserId,
    required this.text,
    required this.currency,
    required this.amount,
    required this.cryptocurrency,
    required this.cryptocurrencyAmount,
    required this.monthCount,
    required this.dayCount,
    this.sticker,
  });

  /// The identifier of a user who gifted Telegram Premium; 0 if the gift was anonymous or is outgoing
  final int gifterUserId;

  /// The identifier of a user who received Telegram Premium; 0 if the gift is incoming
  final int receiverUserId;

  /// Message added to the gifted Telegram Premium by the sender
  final FormattedText text;

  /// Currency for the paid amount
  final String currency;

  /// The paid amount, in the smallest units of the currency
  final int amount;

  /// Cryptocurrency used to pay for the gift; may be empty if none
  final String cryptocurrency;

  /// The paid amount, in the smallest units of the cryptocurrency; 0 if none
  final int cryptocurrencyAmount;

  /// Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  final int monthCount;

  /// Number of days the Telegram Premium subscription will be active
  final int dayCount;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory MessageGiftedPremium.fromJson(Map<String, dynamic> json) =>
      MessageGiftedPremium(
        gifterUserId: json['gifter_user_id'],
        receiverUserId: json['receiver_user_id'],
        text: FormattedText.fromJson(json['text']),
        currency: json['currency'],
        amount: json['amount'],
        cryptocurrency: json['cryptocurrency'],
        cryptocurrencyAmount: json['cryptocurrency_amount'] is int
            ? json['cryptocurrency_amount']
            : int.tryParse(json['cryptocurrency_amount'] ?? "") ?? 0,
        monthCount: json['month_count'],
        dayCount: json['day_count'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gifter_user_id": gifterUserId,
      "receiver_user_id": receiverUserId,
      "text": text.toJson(),
      "currency": currency,
      "amount": amount,
      "cryptocurrency": cryptocurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "month_count": monthCount,
      "day_count": dayCount,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gifter_user_id]: The identifier of a user who gifted Telegram Premium; 0 if the gift was anonymous or is outgoing
  /// * [receiver_user_id]: The identifier of a user who received Telegram Premium; 0 if the gift is incoming
  /// * [text]: Message added to the gifted Telegram Premium by the sender
  /// * [currency]: Currency for the paid amount
  /// * [amount]: The paid amount, in the smallest units of the currency
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none
  /// * [cryptocurrency_amount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none
  /// * [month_count]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  /// * [day_count]: Number of days the Telegram Premium subscription will be active
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  @override
  MessageGiftedPremium copyWith({
    int? gifterUserId,
    int? receiverUserId,
    FormattedText? text,
    String? currency,
    int? amount,
    String? cryptocurrency,
    int? cryptocurrencyAmount,
    int? monthCount,
    int? dayCount,
    Sticker? sticker,
  }) =>
      MessageGiftedPremium(
        gifterUserId: gifterUserId ?? this.gifterUserId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        text: text ?? this.text,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        monthCount: monthCount ?? this.monthCount,
        dayCount: dayCount ?? this.dayCount,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiftedPremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePremiumGiftCode** *(messagePremiumGiftCode)* - child of MessageContent
///
/// A Telegram Premium gift code was created for the user.
///
/// * [creatorId]: Identifier of a chat or a user who created the gift code; may be null if unknown *(optional)*.
/// * [text]: Message added to the gift.
/// * [isFromGiveaway]: True, if the gift code was created for a giveaway.
/// * [isUnclaimed]: True, if the winner for the corresponding Telegram Premium subscription wasn't chosen.
/// * [currency]: Currency for the paid amount; empty if unknown.
/// * [amount]: The paid amount, in the smallest units of the currency; 0 if unknown.
/// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none or unknown.
/// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if unknown.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
/// * [dayCount]: Number of days the Telegram Premium subscription will be active after code activation.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
/// * [code]: The gift code.
final class MessagePremiumGiftCode extends MessageContent {
  /// **MessagePremiumGiftCode** *(messagePremiumGiftCode)* - child of MessageContent
  ///
  /// A Telegram Premium gift code was created for the user.
  ///
  /// * [creatorId]: Identifier of a chat or a user who created the gift code; may be null if unknown *(optional)*.
  /// * [text]: Message added to the gift.
  /// * [isFromGiveaway]: True, if the gift code was created for a giveaway.
  /// * [isUnclaimed]: True, if the winner for the corresponding Telegram Premium subscription wasn't chosen.
  /// * [currency]: Currency for the paid amount; empty if unknown.
  /// * [amount]: The paid amount, in the smallest units of the currency; 0 if unknown.
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none or unknown.
  /// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if unknown.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer.
  /// * [dayCount]: Number of days the Telegram Premium subscription will be active after code activation.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  /// * [code]: The gift code.
  const MessagePremiumGiftCode({
    this.creatorId,
    required this.text,
    required this.isFromGiveaway,
    required this.isUnclaimed,
    required this.currency,
    required this.amount,
    required this.cryptocurrency,
    required this.cryptocurrencyAmount,
    required this.monthCount,
    required this.dayCount,
    this.sticker,
    required this.code,
  });

  /// Identifier of a chat or a user who created the gift code; may be null if unknown
  final MessageSender? creatorId;

  /// Message added to the gift
  final FormattedText text;

  /// True, if the gift code was created for a giveaway
  final bool isFromGiveaway;

  /// True, if the winner for the corresponding Telegram Premium subscription wasn't chosen
  final bool isUnclaimed;

  /// Currency for the paid amount; empty if unknown
  final String currency;

  /// The paid amount, in the smallest units of the currency; 0 if unknown
  final int amount;

  /// Cryptocurrency used to pay for the gift; may be empty if none or unknown
  final String cryptocurrency;

  /// The paid amount, in the smallest units of the cryptocurrency; 0 if unknown
  final int cryptocurrencyAmount;

  /// Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  final int monthCount;

  /// Number of days the Telegram Premium subscription will be active after code activation
  final int dayCount;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// The gift code
  final String code;

  /// Parse from a json
  factory MessagePremiumGiftCode.fromJson(Map<String, dynamic> json) =>
      MessagePremiumGiftCode(
        creatorId: json['creator_id'] == null
            ? null
            : MessageSender.fromJson(json['creator_id']),
        text: FormattedText.fromJson(json['text']),
        isFromGiveaway: json['is_from_giveaway'],
        isUnclaimed: json['is_unclaimed'],
        currency: json['currency'],
        amount: json['amount'],
        cryptocurrency: json['cryptocurrency'],
        cryptocurrencyAmount: json['cryptocurrency_amount'] is int
            ? json['cryptocurrency_amount']
            : int.parse(json['cryptocurrency_amount']),
        monthCount: json['month_count'],
        dayCount: json['day_count'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
        code: json['code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "creator_id": creatorId?.toJson(),
      "text": text.toJson(),
      "is_from_giveaway": isFromGiveaway,
      "is_unclaimed": isUnclaimed,
      "currency": currency,
      "amount": amount,
      "cryptocurrency": cryptocurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "month_count": monthCount,
      "day_count": dayCount,
      "sticker": sticker?.toJson(),
      "code": code,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [creator_id]: Identifier of a chat or a user who created the gift code; may be null if unknown
  /// * [text]: Message added to the gift
  /// * [is_from_giveaway]: True, if the gift code was created for a giveaway
  /// * [is_unclaimed]: True, if the winner for the corresponding Telegram Premium subscription wasn't chosen
  /// * [currency]: Currency for the paid amount; empty if unknown
  /// * [amount]: The paid amount, in the smallest units of the currency; 0 if unknown
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none or unknown
  /// * [cryptocurrency_amount]: The paid amount, in the smallest units of the cryptocurrency; 0 if unknown
  /// * [month_count]: Number of months the Telegram Premium subscription will be active after code activation; 0 if the number of months isn't integer
  /// * [day_count]: Number of days the Telegram Premium subscription will be active after code activation
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  /// * [code]: The gift code
  @override
  MessagePremiumGiftCode copyWith({
    MessageSender? creatorId,
    FormattedText? text,
    bool? isFromGiveaway,
    bool? isUnclaimed,
    String? currency,
    int? amount,
    String? cryptocurrency,
    int? cryptocurrencyAmount,
    int? monthCount,
    int? dayCount,
    Sticker? sticker,
    String? code,
  }) =>
      MessagePremiumGiftCode(
        creatorId: creatorId ?? this.creatorId,
        text: text ?? this.text,
        isFromGiveaway: isFromGiveaway ?? this.isFromGiveaway,
        isUnclaimed: isUnclaimed ?? this.isUnclaimed,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        monthCount: monthCount ?? this.monthCount,
        dayCount: dayCount ?? this.dayCount,
        sticker: sticker ?? this.sticker,
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiveawayCreated** *(messageGiveawayCreated)* - child of MessageContent
///
/// A giveaway was created for the chat. Use telegramPaymentPurposePremiumGiveaway, storePaymentPurposePremiumGiveaway, telegramPaymentPurposeStarGiveaway, or storePaymentPurposeStarGiveaway to create a giveaway.
///
/// * [starCount]: Number of Telegram Stars that will be shared by winners of the giveaway; 0 for Telegram Premium giveaways.
final class MessageGiveawayCreated extends MessageContent {
  /// **MessageGiveawayCreated** *(messageGiveawayCreated)* - child of MessageContent
  ///
  /// A giveaway was created for the chat. Use telegramPaymentPurposePremiumGiveaway, storePaymentPurposePremiumGiveaway, telegramPaymentPurposeStarGiveaway, or storePaymentPurposeStarGiveaway to create a giveaway.
  ///
  /// * [starCount]: Number of Telegram Stars that will be shared by winners of the giveaway; 0 for Telegram Premium giveaways.
  const MessageGiveawayCreated({
    required this.starCount,
  });

  /// Number of Telegram Stars that will be shared by winners of the giveaway; 0 for Telegram Premium giveaways
  final int starCount;

  /// Parse from a json
  factory MessageGiveawayCreated.fromJson(Map<String, dynamic> json) =>
      MessageGiveawayCreated(
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that will be shared by winners of the giveaway; 0 for Telegram Premium giveaways
  @override
  MessageGiveawayCreated copyWith({
    int? starCount,
  }) =>
      MessageGiveawayCreated(
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiveawayCreated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiveaway** *(messageGiveaway)* - child of MessageContent
///
/// A giveaway.
///
/// * [parameters]: Giveaway parameters.
/// * [winnerCount]: Number of users who will receive Telegram Premium subscription gift codes.
/// * [prize]: Prize of the giveaway.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
final class MessageGiveaway extends MessageContent {
  /// **MessageGiveaway** *(messageGiveaway)* - child of MessageContent
  ///
  /// A giveaway.
  ///
  /// * [parameters]: Giveaway parameters.
  /// * [winnerCount]: Number of users who will receive Telegram Premium subscription gift codes.
  /// * [prize]: Prize of the giveaway.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  const MessageGiveaway({
    required this.parameters,
    required this.winnerCount,
    required this.prize,
    this.sticker,
  });

  /// Giveaway parameters
  final GiveawayParameters parameters;

  /// Number of users who will receive Telegram Premium subscription gift codes
  final int winnerCount;

  /// Prize of the giveaway
  final GiveawayPrize prize;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory MessageGiveaway.fromJson(Map<String, dynamic> json) =>
      MessageGiveaway(
        parameters: GiveawayParameters.fromJson(json['parameters']),
        winnerCount: json['winner_count'],
        prize: GiveawayPrize.fromJson(json['prize']),
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters.toJson(),
      "winner_count": winnerCount,
      "prize": prize.toJson(),
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Giveaway parameters
  /// * [winner_count]: Number of users who will receive Telegram Premium subscription gift codes
  /// * [prize]: Prize of the giveaway
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  @override
  MessageGiveaway copyWith({
    GiveawayParameters? parameters,
    int? winnerCount,
    GiveawayPrize? prize,
    Sticker? sticker,
  }) =>
      MessageGiveaway(
        parameters: parameters ?? this.parameters,
        winnerCount: winnerCount ?? this.winnerCount,
        prize: prize ?? this.prize,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiveawayCompleted** *(messageGiveawayCompleted)* - child of MessageContent
///
/// A giveaway without public winners has been completed for the chat.
///
/// * [giveawayMessageId]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message.
/// * [winnerCount]: Number of winners in the giveaway.
/// * [isStarGiveaway]: True, if the giveaway is a Telegram Star giveaway.
/// * [unclaimedPrizeCount]: Number of undistributed prizes; for Telegram Premium giveaways only.
final class MessageGiveawayCompleted extends MessageContent {
  /// **MessageGiveawayCompleted** *(messageGiveawayCompleted)* - child of MessageContent
  ///
  /// A giveaway without public winners has been completed for the chat.
  ///
  /// * [giveawayMessageId]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message.
  /// * [winnerCount]: Number of winners in the giveaway.
  /// * [isStarGiveaway]: True, if the giveaway is a Telegram Star giveaway.
  /// * [unclaimedPrizeCount]: Number of undistributed prizes; for Telegram Premium giveaways only.
  const MessageGiveawayCompleted({
    required this.giveawayMessageId,
    required this.winnerCount,
    required this.isStarGiveaway,
    required this.unclaimedPrizeCount,
  });

  /// Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message
  final int giveawayMessageId;

  /// Number of winners in the giveaway
  final int winnerCount;

  /// True, if the giveaway is a Telegram Star giveaway
  final bool isStarGiveaway;

  /// Number of undistributed prizes; for Telegram Premium giveaways only
  final int unclaimedPrizeCount;

  /// Parse from a json
  factory MessageGiveawayCompleted.fromJson(Map<String, dynamic> json) =>
      MessageGiveawayCompleted(
        giveawayMessageId: json['giveaway_message_id'],
        winnerCount: json['winner_count'],
        isStarGiveaway: json['is_star_giveaway'],
        unclaimedPrizeCount: json['unclaimed_prize_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "giveaway_message_id": giveawayMessageId,
      "winner_count": winnerCount,
      "is_star_giveaway": isStarGiveaway,
      "unclaimed_prize_count": unclaimedPrizeCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [giveaway_message_id]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message
  /// * [winner_count]: Number of winners in the giveaway
  /// * [is_star_giveaway]: True, if the giveaway is a Telegram Star giveaway
  /// * [unclaimed_prize_count]: Number of undistributed prizes; for Telegram Premium giveaways only
  @override
  MessageGiveawayCompleted copyWith({
    int? giveawayMessageId,
    int? winnerCount,
    bool? isStarGiveaway,
    int? unclaimedPrizeCount,
  }) =>
      MessageGiveawayCompleted(
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
        winnerCount: winnerCount ?? this.winnerCount,
        isStarGiveaway: isStarGiveaway ?? this.isStarGiveaway,
        unclaimedPrizeCount: unclaimedPrizeCount ?? this.unclaimedPrizeCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiveawayCompleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiveawayWinners** *(messageGiveawayWinners)* - child of MessageContent
///
/// A giveaway with public winners has been completed for the chat.
///
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway.
/// * [giveawayMessageId]: Identifier of the message with the giveaway in the boosted chat.
/// * [additionalChatCount]: Number of other chats that participated in the giveaway.
/// * [actualWinnersSelectionDate]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway.
/// * [onlyNewMembers]: True, if only new members of the chats were eligible for the giveaway.
/// * [wasRefunded]: True, if the giveaway was canceled and was fully refunded.
/// * [prize]: Prize of the giveaway.
/// * [prizeDescription]: Additional description of the giveaway prize.
/// * [winnerCount]: Total number of winners in the giveaway.
/// * [winnerUserIds]: Up to 100 user identifiers of the winners of the giveaway.
/// * [unclaimedPrizeCount]: Number of undistributed prizes; for Telegram Premium giveaways only.
final class MessageGiveawayWinners extends MessageContent {
  /// **MessageGiveawayWinners** *(messageGiveawayWinners)* - child of MessageContent
  ///
  /// A giveaway with public winners has been completed for the chat.
  ///
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway.
  /// * [giveawayMessageId]: Identifier of the message with the giveaway in the boosted chat.
  /// * [additionalChatCount]: Number of other chats that participated in the giveaway.
  /// * [actualWinnersSelectionDate]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway.
  /// * [onlyNewMembers]: True, if only new members of the chats were eligible for the giveaway.
  /// * [wasRefunded]: True, if the giveaway was canceled and was fully refunded.
  /// * [prize]: Prize of the giveaway.
  /// * [prizeDescription]: Additional description of the giveaway prize.
  /// * [winnerCount]: Total number of winners in the giveaway.
  /// * [winnerUserIds]: Up to 100 user identifiers of the winners of the giveaway.
  /// * [unclaimedPrizeCount]: Number of undistributed prizes; for Telegram Premium giveaways only.
  const MessageGiveawayWinners({
    required this.boostedChatId,
    required this.giveawayMessageId,
    required this.additionalChatCount,
    required this.actualWinnersSelectionDate,
    required this.onlyNewMembers,
    required this.wasRefunded,
    required this.prize,
    required this.prizeDescription,
    required this.winnerCount,
    required this.winnerUserIds,
    required this.unclaimedPrizeCount,
  });

  /// Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
  final int boostedChatId;

  /// Identifier of the message with the giveaway in the boosted chat
  final int giveawayMessageId;

  /// Number of other chats that participated in the giveaway
  final int additionalChatCount;

  /// Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
  final int actualWinnersSelectionDate;

  /// True, if only new members of the chats were eligible for the giveaway
  final bool onlyNewMembers;

  /// True, if the giveaway was canceled and was fully refunded
  final bool wasRefunded;

  /// Prize of the giveaway
  final GiveawayPrize prize;

  /// Additional description of the giveaway prize
  final String prizeDescription;

  /// Total number of winners in the giveaway
  final int winnerCount;

  /// Up to 100 user identifiers of the winners of the giveaway
  final List<int> winnerUserIds;

  /// Number of undistributed prizes; for Telegram Premium giveaways only
  final int unclaimedPrizeCount;

  /// Parse from a json
  factory MessageGiveawayWinners.fromJson(Map<String, dynamic> json) =>
      MessageGiveawayWinners(
        boostedChatId: json['boosted_chat_id'],
        giveawayMessageId: json['giveaway_message_id'],
        additionalChatCount: json['additional_chat_count'],
        actualWinnersSelectionDate: json['actual_winners_selection_date'],
        onlyNewMembers: json['only_new_members'],
        wasRefunded: json['was_refunded'],
        prize: GiveawayPrize.fromJson(json['prize']),
        prizeDescription: json['prize_description'],
        winnerCount: json['winner_count'],
        winnerUserIds: List<int>.from(
            (json['winner_user_ids'] ?? []).map((item) => item).toList()),
        unclaimedPrizeCount: json['unclaimed_prize_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "boosted_chat_id": boostedChatId,
      "giveaway_message_id": giveawayMessageId,
      "additional_chat_count": additionalChatCount,
      "actual_winners_selection_date": actualWinnersSelectionDate,
      "only_new_members": onlyNewMembers,
      "was_refunded": wasRefunded,
      "prize": prize.toJson(),
      "prize_description": prizeDescription,
      "winner_count": winnerCount,
      "winner_user_ids": winnerUserIds.map((i) => i).toList(),
      "unclaimed_prize_count": unclaimedPrizeCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boosted_chat_id]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
  /// * [giveaway_message_id]: Identifier of the message with the giveaway in the boosted chat
  /// * [additional_chat_count]: Number of other chats that participated in the giveaway
  /// * [actual_winners_selection_date]: Point in time (Unix timestamp) when the winners were selected. May be bigger than winners selection date specified in parameters of the giveaway
  /// * [only_new_members]: True, if only new members of the chats were eligible for the giveaway
  /// * [was_refunded]: True, if the giveaway was canceled and was fully refunded
  /// * [prize]: Prize of the giveaway
  /// * [prize_description]: Additional description of the giveaway prize
  /// * [winner_count]: Total number of winners in the giveaway
  /// * [winner_user_ids]: Up to 100 user identifiers of the winners of the giveaway
  /// * [unclaimed_prize_count]: Number of undistributed prizes; for Telegram Premium giveaways only
  @override
  MessageGiveawayWinners copyWith({
    int? boostedChatId,
    int? giveawayMessageId,
    int? additionalChatCount,
    int? actualWinnersSelectionDate,
    bool? onlyNewMembers,
    bool? wasRefunded,
    GiveawayPrize? prize,
    String? prizeDescription,
    int? winnerCount,
    List<int>? winnerUserIds,
    int? unclaimedPrizeCount,
  }) =>
      MessageGiveawayWinners(
        boostedChatId: boostedChatId ?? this.boostedChatId,
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
        additionalChatCount: additionalChatCount ?? this.additionalChatCount,
        actualWinnersSelectionDate:
            actualWinnersSelectionDate ?? this.actualWinnersSelectionDate,
        onlyNewMembers: onlyNewMembers ?? this.onlyNewMembers,
        wasRefunded: wasRefunded ?? this.wasRefunded,
        prize: prize ?? this.prize,
        prizeDescription: prizeDescription ?? this.prizeDescription,
        winnerCount: winnerCount ?? this.winnerCount,
        winnerUserIds: winnerUserIds ?? this.winnerUserIds,
        unclaimedPrizeCount: unclaimedPrizeCount ?? this.unclaimedPrizeCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiveawayWinners';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiftedStars** *(messageGiftedStars)* - child of MessageContent
///
/// Telegram Stars were gifted to a user.
///
/// * [gifterUserId]: The identifier of a user who gifted Telegram Stars; 0 if the gift was anonymous or is outgoing.
/// * [receiverUserId]: The identifier of a user who received Telegram Stars; 0 if the gift is incoming.
/// * [currency]: Currency for the paid amount.
/// * [amount]: The paid amount, in the smallest units of the currency.
/// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none.
/// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none.
/// * [starCount]: Number of Telegram Stars that were gifted.
/// * [transactionId]: Identifier of the transaction for Telegram Stars purchase; for receiver only.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
final class MessageGiftedStars extends MessageContent {
  /// **MessageGiftedStars** *(messageGiftedStars)* - child of MessageContent
  ///
  /// Telegram Stars were gifted to a user.
  ///
  /// * [gifterUserId]: The identifier of a user who gifted Telegram Stars; 0 if the gift was anonymous or is outgoing.
  /// * [receiverUserId]: The identifier of a user who received Telegram Stars; 0 if the gift is incoming.
  /// * [currency]: Currency for the paid amount.
  /// * [amount]: The paid amount, in the smallest units of the currency.
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none.
  /// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none.
  /// * [starCount]: Number of Telegram Stars that were gifted.
  /// * [transactionId]: Identifier of the transaction for Telegram Stars purchase; for receiver only.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  const MessageGiftedStars({
    required this.gifterUserId,
    required this.receiverUserId,
    required this.currency,
    required this.amount,
    required this.cryptocurrency,
    required this.cryptocurrencyAmount,
    required this.starCount,
    required this.transactionId,
    this.sticker,
  });

  /// The identifier of a user who gifted Telegram Stars; 0 if the gift was anonymous or is outgoing
  final int gifterUserId;

  /// The identifier of a user who received Telegram Stars; 0 if the gift is incoming
  final int receiverUserId;

  /// Currency for the paid amount
  final String currency;

  /// The paid amount, in the smallest units of the currency
  final int amount;

  /// Cryptocurrency used to pay for the gift; may be empty if none
  final String cryptocurrency;

  /// The paid amount, in the smallest units of the cryptocurrency; 0 if none
  final int cryptocurrencyAmount;

  /// Number of Telegram Stars that were gifted
  final int starCount;

  /// Identifier of the transaction for Telegram Stars purchase; for receiver only
  final String transactionId;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory MessageGiftedStars.fromJson(Map<String, dynamic> json) =>
      MessageGiftedStars(
        gifterUserId: json['gifter_user_id'],
        receiverUserId: json['receiver_user_id'],
        currency: json['currency'],
        amount: json['amount'],
        cryptocurrency: json['cryptocurrency'],
        cryptocurrencyAmount: json['cryptocurrency_amount'] is int
            ? json['cryptocurrency_amount']
            : int.tryParse(json['cryptocurrency_amount'] ?? "") ?? 0,
        starCount: json['star_count'],
        transactionId: json['transaction_id'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gifter_user_id": gifterUserId,
      "receiver_user_id": receiverUserId,
      "currency": currency,
      "amount": amount,
      "cryptocurrency": cryptocurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "star_count": starCount,
      "transaction_id": transactionId,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gifter_user_id]: The identifier of a user who gifted Telegram Stars; 0 if the gift was anonymous or is outgoing
  /// * [receiver_user_id]: The identifier of a user who received Telegram Stars; 0 if the gift is incoming
  /// * [currency]: Currency for the paid amount
  /// * [amount]: The paid amount, in the smallest units of the currency
  /// * [cryptocurrency]: Cryptocurrency used to pay for the gift; may be empty if none
  /// * [cryptocurrency_amount]: The paid amount, in the smallest units of the cryptocurrency; 0 if none
  /// * [star_count]: Number of Telegram Stars that were gifted
  /// * [transaction_id]: Identifier of the transaction for Telegram Stars purchase; for receiver only
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  @override
  MessageGiftedStars copyWith({
    int? gifterUserId,
    int? receiverUserId,
    String? currency,
    int? amount,
    String? cryptocurrency,
    int? cryptocurrencyAmount,
    int? starCount,
    String? transactionId,
    Sticker? sticker,
  }) =>
      MessageGiftedStars(
        gifterUserId: gifterUserId ?? this.gifterUserId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        starCount: starCount ?? this.starCount,
        transactionId: transactionId ?? this.transactionId,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiftedStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiftedGrams** *(messageGiftedGrams)* - child of MessageContent
///
/// TON Grams were gifted to a user.
///
/// * [gifterUserId]: The identifier of a user who gifted Grams; 0 if the gift was anonymous or is outgoing.
/// * [receiverUserId]: The identifier of a user who received Grams; 0 if the gift is incoming.
/// * [gramAmount]: The received Gram amount, in the smallest units of the cryptocurrency.
/// * [transactionId]: Identifier of the transaction for Gram credit; for receiver only.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
final class MessageGiftedGrams extends MessageContent {
  /// **MessageGiftedGrams** *(messageGiftedGrams)* - child of MessageContent
  ///
  /// TON Grams were gifted to a user.
  ///
  /// * [gifterUserId]: The identifier of a user who gifted Grams; 0 if the gift was anonymous or is outgoing.
  /// * [receiverUserId]: The identifier of a user who received Grams; 0 if the gift is incoming.
  /// * [gramAmount]: The received Gram amount, in the smallest units of the cryptocurrency.
  /// * [transactionId]: Identifier of the transaction for Gram credit; for receiver only.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  const MessageGiftedGrams({
    required this.gifterUserId,
    required this.receiverUserId,
    required this.gramAmount,
    required this.transactionId,
    this.sticker,
  });

  /// The identifier of a user who gifted Grams; 0 if the gift was anonymous or is outgoing
  final int gifterUserId;

  /// The identifier of a user who received Grams; 0 if the gift is incoming
  final int receiverUserId;

  /// The received Gram amount, in the smallest units of the cryptocurrency
  final int gramAmount;

  /// Identifier of the transaction for Gram credit; for receiver only
  final String transactionId;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory MessageGiftedGrams.fromJson(Map<String, dynamic> json) =>
      MessageGiftedGrams(
        gifterUserId: json['gifter_user_id'],
        receiverUserId: json['receiver_user_id'],
        gramAmount: json['gram_amount'],
        transactionId: json['transaction_id'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gifter_user_id": gifterUserId,
      "receiver_user_id": receiverUserId,
      "gram_amount": gramAmount,
      "transaction_id": transactionId,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gifter_user_id]: The identifier of a user who gifted Grams; 0 if the gift was anonymous or is outgoing
  /// * [receiver_user_id]: The identifier of a user who received Grams; 0 if the gift is incoming
  /// * [gram_amount]: The received Gram amount, in the smallest units of the cryptocurrency
  /// * [transaction_id]: Identifier of the transaction for Gram credit; for receiver only
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  @override
  MessageGiftedGrams copyWith({
    int? gifterUserId,
    int? receiverUserId,
    int? gramAmount,
    String? transactionId,
    Sticker? sticker,
  }) =>
      MessageGiftedGrams(
        gifterUserId: gifterUserId ?? this.gifterUserId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        gramAmount: gramAmount ?? this.gramAmount,
        transactionId: transactionId ?? this.transactionId,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiftedGrams';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGiveawayPrizeStars** *(messageGiveawayPrizeStars)* - child of MessageContent
///
/// Telegram Stars were received by the current user from a giveaway.
///
/// * [starCount]: Number of Telegram Stars that were received.
/// * [transactionId]: Identifier of the transaction for Telegram Stars credit.
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway.
/// * [giveawayMessageId]: Identifier of the message with the giveaway in the boosted chat; may be 0 or an identifier of a deleted message.
/// * [isUnclaimed]: True, if the corresponding winner wasn't chosen and the Telegram Stars were received by the owner of the boosted chat.
/// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
final class MessageGiveawayPrizeStars extends MessageContent {
  /// **MessageGiveawayPrizeStars** *(messageGiveawayPrizeStars)* - child of MessageContent
  ///
  /// Telegram Stars were received by the current user from a giveaway.
  ///
  /// * [starCount]: Number of Telegram Stars that were received.
  /// * [transactionId]: Identifier of the transaction for Telegram Stars credit.
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway.
  /// * [giveawayMessageId]: Identifier of the message with the giveaway in the boosted chat; may be 0 or an identifier of a deleted message.
  /// * [isUnclaimed]: True, if the corresponding winner wasn't chosen and the Telegram Stars were received by the owner of the boosted chat.
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown *(optional)*.
  const MessageGiveawayPrizeStars({
    required this.starCount,
    required this.transactionId,
    required this.boostedChatId,
    required this.giveawayMessageId,
    required this.isUnclaimed,
    this.sticker,
  });

  /// Number of Telegram Stars that were received
  final int starCount;

  /// Identifier of the transaction for Telegram Stars credit
  final String transactionId;

  /// Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
  final int boostedChatId;

  /// Identifier of the message with the giveaway in the boosted chat; may be 0 or an identifier of a deleted message
  final int giveawayMessageId;

  /// True, if the corresponding winner wasn't chosen and the Telegram Stars were received by the owner of the boosted chat
  final bool isUnclaimed;

  /// A sticker to be shown in the message; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory MessageGiveawayPrizeStars.fromJson(Map<String, dynamic> json) =>
      MessageGiveawayPrizeStars(
        starCount: json['star_count'],
        transactionId: json['transaction_id'],
        boostedChatId: json['boosted_chat_id'],
        giveawayMessageId: json['giveaway_message_id'],
        isUnclaimed: json['is_unclaimed'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "transaction_id": transactionId,
      "boosted_chat_id": boostedChatId,
      "giveaway_message_id": giveawayMessageId,
      "is_unclaimed": isUnclaimed,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that were received
  /// * [transaction_id]: Identifier of the transaction for Telegram Stars credit
  /// * [boosted_chat_id]: Identifier of the supergroup or channel chat, which was automatically boosted by the winners of the giveaway
  /// * [giveaway_message_id]: Identifier of the message with the giveaway in the boosted chat; may be 0 or an identifier of a deleted message
  /// * [is_unclaimed]: True, if the corresponding winner wasn't chosen and the Telegram Stars were received by the owner of the boosted chat
  /// * [sticker]: A sticker to be shown in the message; may be null if unknown
  @override
  MessageGiveawayPrizeStars copyWith({
    int? starCount,
    String? transactionId,
    int? boostedChatId,
    int? giveawayMessageId,
    bool? isUnclaimed,
    Sticker? sticker,
  }) =>
      MessageGiveawayPrizeStars(
        starCount: starCount ?? this.starCount,
        transactionId: transactionId ?? this.transactionId,
        boostedChatId: boostedChatId ?? this.boostedChatId,
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
        isUnclaimed: isUnclaimed ?? this.isUnclaimed,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGiveawayPrizeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTonWalletTransfer** *(messageTonWalletTransfer)* - child of MessageContent
///
/// Represents a transfer with the TON wallet of the current user.
///
/// * [senderUserId]: Sender of the transfer; 0 if unknown.
/// * [transactionId]: Unique identifier of the transaction; may be empty if the transfer isn't sent yet. Use getTonWalletTransaction to get additional information about the transaction.
/// * [peerAddress]: Address in the TON blockchain of the transaction peer.
/// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions.
/// * [comment]: Comment added to the transaction.
/// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the receiver's or sender's private key.
final class MessageTonWalletTransfer extends MessageContent {
  /// **MessageTonWalletTransfer** *(messageTonWalletTransfer)* - child of MessageContent
  ///
  /// Represents a transfer with the TON wallet of the current user.
  ///
  /// * [senderUserId]: Sender of the transfer; 0 if unknown.
  /// * [transactionId]: Unique identifier of the transaction; may be empty if the transfer isn't sent yet. Use getTonWalletTransaction to get additional information about the transaction.
  /// * [peerAddress]: Address in the TON blockchain of the transaction peer.
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions.
  /// * [comment]: Comment added to the transaction.
  /// * [isCommentEncrypted]: True, if the comment is encrypted and must be decrypted using the receiver's or sender's private key.
  const MessageTonWalletTransfer({
    required this.senderUserId,
    required this.transactionId,
    required this.peerAddress,
    required this.amount,
    required this.comment,
    required this.isCommentEncrypted,
  });

  /// Sender of the transfer; 0 if unknown
  final int senderUserId;

  /// Unique identifier of the transaction; may be empty if the transfer isn't sent yet. Use getTonWalletTransaction to get additional information about the transaction
  final String transactionId;

  /// Address in the TON blockchain of the transaction peer
  final String peerAddress;

  /// The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions
  final int amount;

  /// Comment added to the transaction
  final String comment;

  /// True, if the comment is encrypted and must be decrypted using the receiver's or sender's private key
  final bool isCommentEncrypted;

  /// Parse from a json
  factory MessageTonWalletTransfer.fromJson(Map<String, dynamic> json) =>
      MessageTonWalletTransfer(
        senderUserId: json['sender_user_id'],
        transactionId: json['transaction_id'],
        peerAddress: json['peer_address'],
        amount: json['amount'],
        comment: json['comment'],
        isCommentEncrypted: json['is_comment_encrypted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_user_id": senderUserId,
      "transaction_id": transactionId,
      "peer_address": peerAddress,
      "amount": amount,
      "comment": comment,
      "is_comment_encrypted": isCommentEncrypted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_user_id]: Sender of the transfer; 0 if unknown
  /// * [transaction_id]: Unique identifier of the transaction; may be empty if the transfer isn't sent yet. Use getTonWalletTransaction to get additional information about the transaction
  /// * [peer_address]: Address in the TON blockchain of the transaction peer
  /// * [amount]: The amount of received cryptocurrency, in the smallest units of the cryptocurrency; negative for outgoing transactions
  /// * [comment]: Comment added to the transaction
  /// * [is_comment_encrypted]: True, if the comment is encrypted and must be decrypted using the receiver's or sender's private key
  @override
  MessageTonWalletTransfer copyWith({
    int? senderUserId,
    String? transactionId,
    String? peerAddress,
    int? amount,
    String? comment,
    bool? isCommentEncrypted,
  }) =>
      MessageTonWalletTransfer(
        senderUserId: senderUserId ?? this.senderUserId,
        transactionId: transactionId ?? this.transactionId,
        peerAddress: peerAddress ?? this.peerAddress,
        amount: amount ?? this.amount,
        comment: comment ?? this.comment,
        isCommentEncrypted: isCommentEncrypted ?? this.isCommentEncrypted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTonWalletTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageTonConnectRequest** *(messageTonConnectRequest)* - child of MessageContent
///
/// A request from a dApp was received through TON Connect.
///
/// * [sessionId]: Unique identifier of the TON Connect session.
/// * [state]: State of the request.
/// * [dappName]: Name of the dApp; may be empty if unknown.
/// * [topic]: Topic of the request; may be empty if none.
/// * [traceId]: Identifier to trace the request; may be empty if none.
final class MessageTonConnectRequest extends MessageContent {
  /// **MessageTonConnectRequest** *(messageTonConnectRequest)* - child of MessageContent
  ///
  /// A request from a dApp was received through TON Connect.
  ///
  /// * [sessionId]: Unique identifier of the TON Connect session.
  /// * [state]: State of the request.
  /// * [dappName]: Name of the dApp; may be empty if unknown.
  /// * [topic]: Topic of the request; may be empty if none.
  /// * [traceId]: Identifier to trace the request; may be empty if none.
  const MessageTonConnectRequest({
    required this.sessionId,
    required this.state,
    required this.dappName,
    required this.topic,
    required this.traceId,
  });

  /// Unique identifier of the TON Connect session
  final int sessionId;

  /// State of the request
  final TonConnectRequestState state;

  /// Name of the dApp; may be empty if unknown
  final String dappName;

  /// Topic of the request; may be empty if none
  final String topic;

  /// Identifier to trace the request; may be empty if none
  final String traceId;

  /// Parse from a json
  factory MessageTonConnectRequest.fromJson(Map<String, dynamic> json) =>
      MessageTonConnectRequest(
        sessionId: json['session_id'] is int
            ? json['session_id']
            : int.parse(json['session_id']),
        state: TonConnectRequestState.fromJson(json['state']),
        dappName: json['dapp_name'],
        topic: json['topic'],
        traceId: json['trace_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "state": state.toJson(),
      "dapp_name": dappName,
      "topic": topic,
      "trace_id": traceId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the TON Connect session
  /// * [state]: State of the request
  /// * [dapp_name]: Name of the dApp; may be empty if unknown
  /// * [topic]: Topic of the request; may be empty if none
  /// * [trace_id]: Identifier to trace the request; may be empty if none
  @override
  MessageTonConnectRequest copyWith({
    int? sessionId,
    TonConnectRequestState? state,
    String? dappName,
    String? topic,
    String? traceId,
  }) =>
      MessageTonConnectRequest(
        sessionId: sessionId ?? this.sessionId,
        state: state ?? this.state,
        dappName: dappName ?? this.dappName,
        topic: topic ?? this.topic,
        traceId: traceId ?? this.traceId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageTonConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageGift** *(messageGift)* - child of MessageContent
///
/// A regular gift was received or sent by the current user, or the current user was notified about a channel gift.
///
/// * [gift]: The gift.
/// * [senderId]: Sender of the gift; may be null for outgoing messages about prepaid upgrade of gifts from unknown users *(optional)*.
/// * [receiverId]: Receiver of the gift.
/// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
/// * [text]: Message added to the gift.
/// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
/// * [sellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the receiver.
/// * [prepaidUpgradeStarCount]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift.
/// * [isUpgradeSeparate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost.
/// * [isFromAuction]: True, if the message is a notification about a gift won on an auction.
/// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
/// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift.
/// * [isPrepaidUpgrade]: True, if the message is about prepaid upgrade of the gift by another user.
/// * [canBeUpgraded]: True, if the gift can be upgraded to a unique gift; only for the receiver of the gift.
/// * [canBeDeleted]: True, if the gift can be deleted using deleteGift; only for the receiver of the gift.
/// * [wasConverted]: True, if the gift was converted to Telegram Stars; only for the receiver of the gift.
/// * [wasUpgraded]: True, if the gift was upgraded to a unique gift.
/// * [wasRefunded]: True, if the gift was refunded and isn't available anymore.
/// * [upgradedReceivedGiftId]: Identifier of the corresponding upgraded gift; may be empty if unknown. Use getReceivedGift to get information about the gift.
/// * [prepaidUpgradeHash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade.
final class MessageGift extends MessageContent {
  /// **MessageGift** *(messageGift)* - child of MessageContent
  ///
  /// A regular gift was received or sent by the current user, or the current user was notified about a channel gift.
  ///
  /// * [gift]: The gift.
  /// * [senderId]: Sender of the gift; may be null for outgoing messages about prepaid upgrade of gifts from unknown users *(optional)*.
  /// * [receiverId]: Receiver of the gift.
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
  /// * [text]: Message added to the gift.
  /// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
  /// * [sellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the receiver.
  /// * [prepaidUpgradeStarCount]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift.
  /// * [isUpgradeSeparate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost.
  /// * [isFromAuction]: True, if the message is a notification about a gift won on an auction.
  /// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
  /// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift.
  /// * [isPrepaidUpgrade]: True, if the message is about prepaid upgrade of the gift by another user.
  /// * [canBeUpgraded]: True, if the gift can be upgraded to a unique gift; only for the receiver of the gift.
  /// * [canBeDeleted]: True, if the gift can be deleted using deleteGift; only for the receiver of the gift.
  /// * [wasConverted]: True, if the gift was converted to Telegram Stars; only for the receiver of the gift.
  /// * [wasUpgraded]: True, if the gift was upgraded to a unique gift.
  /// * [wasRefunded]: True, if the gift was refunded and isn't available anymore.
  /// * [upgradedReceivedGiftId]: Identifier of the corresponding upgraded gift; may be empty if unknown. Use getReceivedGift to get information about the gift.
  /// * [prepaidUpgradeHash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade.
  const MessageGift({
    required this.gift,
    this.senderId,
    required this.receiverId,
    required this.receivedGiftId,
    required this.text,
    required this.uniqueGiftNumber,
    required this.sellStarCount,
    required this.prepaidUpgradeStarCount,
    required this.isUpgradeSeparate,
    required this.isFromAuction,
    required this.isPrivate,
    required this.isSaved,
    required this.isPrepaidUpgrade,
    required this.canBeUpgraded,
    required this.canBeDeleted,
    required this.wasConverted,
    required this.wasUpgraded,
    required this.wasRefunded,
    required this.upgradedReceivedGiftId,
    required this.prepaidUpgradeHash,
  });

  /// The gift
  final Gift gift;

  /// Sender of the gift; may be null for outgoing messages about prepaid upgrade of gifts from unknown users
  final MessageSender? senderId;

  /// Receiver of the gift
  final MessageSender receiverId;

  /// Unique identifier of the received gift for the current user; only for the receiver of the gift
  final String receivedGiftId;

  /// Message added to the gift
  final FormattedText text;

  /// Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  final int uniqueGiftNumber;

  /// Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the receiver
  final int sellStarCount;

  /// Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
  final int prepaidUpgradeStarCount;

  /// True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost
  final bool isUpgradeSeparate;

  /// True, if the message is a notification about a gift won on an auction
  final bool isFromAuction;

  /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift
  final bool isSaved;

  /// True, if the message is about prepaid upgrade of the gift by another user
  final bool isPrepaidUpgrade;

  /// True, if the gift can be upgraded to a unique gift; only for the receiver of the gift
  final bool canBeUpgraded;

  /// True, if the gift can be deleted using deleteGift; only for the receiver of the gift
  final bool canBeDeleted;

  /// True, if the gift was converted to Telegram Stars; only for the receiver of the gift
  final bool wasConverted;

  /// True, if the gift was upgraded to a unique gift
  final bool wasUpgraded;

  /// True, if the gift was refunded and isn't available anymore
  final bool wasRefunded;

  /// Identifier of the corresponding upgraded gift; may be empty if unknown. Use getReceivedGift to get information about the gift
  final String upgradedReceivedGiftId;

  /// If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade
  final String prepaidUpgradeHash;

  /// Parse from a json
  factory MessageGift.fromJson(Map<String, dynamic> json) => MessageGift(
        gift: Gift.fromJson(json['gift']),
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        receiverId: MessageSender.fromJson(json['receiver_id']),
        receivedGiftId: json['received_gift_id'],
        text: FormattedText.fromJson(json['text']),
        uniqueGiftNumber: json['unique_gift_number'],
        sellStarCount: json['sell_star_count'],
        prepaidUpgradeStarCount: json['prepaid_upgrade_star_count'],
        isUpgradeSeparate: json['is_upgrade_separate'],
        isFromAuction: json['is_from_auction'],
        isPrivate: json['is_private'],
        isSaved: json['is_saved'],
        isPrepaidUpgrade: json['is_prepaid_upgrade'],
        canBeUpgraded: json['can_be_upgraded'],
        canBeDeleted: json['can_be_deleted'],
        wasConverted: json['was_converted'],
        wasUpgraded: json['was_upgraded'],
        wasRefunded: json['was_refunded'],
        upgradedReceivedGiftId: json['upgraded_received_gift_id'],
        prepaidUpgradeHash: json['prepaid_upgrade_hash'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "sender_id": senderId?.toJson(),
      "receiver_id": receiverId.toJson(),
      "received_gift_id": receivedGiftId,
      "text": text.toJson(),
      "unique_gift_number": uniqueGiftNumber,
      "sell_star_count": sellStarCount,
      "prepaid_upgrade_star_count": prepaidUpgradeStarCount,
      "is_upgrade_separate": isUpgradeSeparate,
      "is_from_auction": isFromAuction,
      "is_private": isPrivate,
      "is_saved": isSaved,
      "is_prepaid_upgrade": isPrepaidUpgrade,
      "can_be_upgraded": canBeUpgraded,
      "can_be_deleted": canBeDeleted,
      "was_converted": wasConverted,
      "was_upgraded": wasUpgraded,
      "was_refunded": wasRefunded,
      "upgraded_received_gift_id": upgradedReceivedGiftId,
      "prepaid_upgrade_hash": prepaidUpgradeHash,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [sender_id]: Sender of the gift; may be null for outgoing messages about prepaid upgrade of gifts from unknown users
  /// * [receiver_id]: Receiver of the gift
  /// * [received_gift_id]: Unique identifier of the received gift for the current user; only for the receiver of the gift
  /// * [text]: Message added to the gift
  /// * [unique_gift_number]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  /// * [sell_star_count]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the receiver
  /// * [prepaid_upgrade_star_count]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
  /// * [is_upgrade_separate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost
  /// * [is_from_auction]: True, if the message is a notification about a gift won on an auction
  /// * [is_private]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  /// * [is_saved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift
  /// * [is_prepaid_upgrade]: True, if the message is about prepaid upgrade of the gift by another user
  /// * [can_be_upgraded]: True, if the gift can be upgraded to a unique gift; only for the receiver of the gift
  /// * [can_be_deleted]: True, if the gift can be deleted using deleteGift; only for the receiver of the gift
  /// * [was_converted]: True, if the gift was converted to Telegram Stars; only for the receiver of the gift
  /// * [was_upgraded]: True, if the gift was upgraded to a unique gift
  /// * [was_refunded]: True, if the gift was refunded and isn't available anymore
  /// * [upgraded_received_gift_id]: Identifier of the corresponding upgraded gift; may be empty if unknown. Use getReceivedGift to get information about the gift
  /// * [prepaid_upgrade_hash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade
  @override
  MessageGift copyWith({
    Gift? gift,
    MessageSender? senderId,
    MessageSender? receiverId,
    String? receivedGiftId,
    FormattedText? text,
    int? uniqueGiftNumber,
    int? sellStarCount,
    int? prepaidUpgradeStarCount,
    bool? isUpgradeSeparate,
    bool? isFromAuction,
    bool? isPrivate,
    bool? isSaved,
    bool? isPrepaidUpgrade,
    bool? canBeUpgraded,
    bool? canBeDeleted,
    bool? wasConverted,
    bool? wasUpgraded,
    bool? wasRefunded,
    String? upgradedReceivedGiftId,
    String? prepaidUpgradeHash,
  }) =>
      MessageGift(
        gift: gift ?? this.gift,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        text: text ?? this.text,
        uniqueGiftNumber: uniqueGiftNumber ?? this.uniqueGiftNumber,
        sellStarCount: sellStarCount ?? this.sellStarCount,
        prepaidUpgradeStarCount:
            prepaidUpgradeStarCount ?? this.prepaidUpgradeStarCount,
        isUpgradeSeparate: isUpgradeSeparate ?? this.isUpgradeSeparate,
        isFromAuction: isFromAuction ?? this.isFromAuction,
        isPrivate: isPrivate ?? this.isPrivate,
        isSaved: isSaved ?? this.isSaved,
        isPrepaidUpgrade: isPrepaidUpgrade ?? this.isPrepaidUpgrade,
        canBeUpgraded: canBeUpgraded ?? this.canBeUpgraded,
        canBeDeleted: canBeDeleted ?? this.canBeDeleted,
        wasConverted: wasConverted ?? this.wasConverted,
        wasUpgraded: wasUpgraded ?? this.wasUpgraded,
        wasRefunded: wasRefunded ?? this.wasRefunded,
        upgradedReceivedGiftId:
            upgradedReceivedGiftId ?? this.upgradedReceivedGiftId,
        prepaidUpgradeHash: prepaidUpgradeHash ?? this.prepaidUpgradeHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUpgradedGift** *(messageUpgradedGift)* - child of MessageContent
///
/// An upgraded gift was received or sent by the current user, or the current user was notified about a channel gift.
///
/// * [gift]: The gift.
/// * [senderId]: Sender of the gift; may be null for anonymous gifts *(optional)*.
/// * [receiverId]: Receiver of the gift.
/// * [origin]: Origin of the upgraded gift.
/// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
/// * [text]: Message added to the gift.
/// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
/// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift.
/// * [canBeTransferred]: True, if the gift can be transferred to another owner; only for the receiver of the gift.
/// * [wasTransferred]: True, if the gift has already been transferred to another owner; only for the receiver of the gift.
/// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift.
/// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift.
/// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift.
/// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
/// * [exportDate]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift.
/// * [craftDate]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift.
final class MessageUpgradedGift extends MessageContent {
  /// **MessageUpgradedGift** *(messageUpgradedGift)* - child of MessageContent
  ///
  /// An upgraded gift was received or sent by the current user, or the current user was notified about a channel gift.
  ///
  /// * [gift]: The gift.
  /// * [senderId]: Sender of the gift; may be null for anonymous gifts *(optional)*.
  /// * [receiverId]: Receiver of the gift.
  /// * [origin]: Origin of the upgraded gift.
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
  /// * [text]: Message added to the gift.
  /// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
  /// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift.
  /// * [canBeTransferred]: True, if the gift can be transferred to another owner; only for the receiver of the gift.
  /// * [wasTransferred]: True, if the gift has already been transferred to another owner; only for the receiver of the gift.
  /// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift.
  /// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift.
  /// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift.
  /// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
  /// * [exportDate]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift.
  /// * [craftDate]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift.
  const MessageUpgradedGift({
    required this.gift,
    this.senderId,
    required this.receiverId,
    required this.origin,
    required this.receivedGiftId,
    required this.text,
    required this.isPrivate,
    required this.isSaved,
    required this.canBeTransferred,
    required this.wasTransferred,
    required this.transferStarCount,
    required this.dropOriginalDetailsStarCount,
    required this.nextTransferDate,
    required this.nextResaleDate,
    required this.exportDate,
    required this.craftDate,
  });

  /// The gift
  final UpgradedGift gift;

  /// Sender of the gift; may be null for anonymous gifts
  final MessageSender? senderId;

  /// Receiver of the gift
  final MessageSender receiverId;

  /// Origin of the upgraded gift
  final UpgradedGiftOrigin origin;

  /// Unique identifier of the received gift for the current user; only for the receiver of the gift
  final String receivedGiftId;

  /// Message added to the gift
  final FormattedText text;

  /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift
  final bool isSaved;

  /// True, if the gift can be transferred to another owner; only for the receiver of the gift
  final bool canBeTransferred;

  /// True, if the gift has already been transferred to another owner; only for the receiver of the gift
  final bool wasTransferred;

  /// Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
  final int transferStarCount;

  /// Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift
  final int dropOriginalDetailsStarCount;

  /// Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift
  final int nextTransferDate;

  /// Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  final int nextResaleDate;

  /// Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift
  final int exportDate;

  /// Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift
  final int craftDate;

  /// Parse from a json
  factory MessageUpgradedGift.fromJson(Map<String, dynamic> json) =>
      MessageUpgradedGift(
        gift: UpgradedGift.fromJson(json['gift']),
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        receiverId: MessageSender.fromJson(json['receiver_id']),
        origin: UpgradedGiftOrigin.fromJson(json['origin']),
        receivedGiftId: json['received_gift_id'],
        text: FormattedText.fromJson(json['text']),
        isPrivate: json['is_private'],
        isSaved: json['is_saved'],
        canBeTransferred: json['can_be_transferred'],
        wasTransferred: json['was_transferred'],
        transferStarCount: json['transfer_star_count'],
        dropOriginalDetailsStarCount: json['drop_original_details_star_count'],
        nextTransferDate: json['next_transfer_date'],
        nextResaleDate: json['next_resale_date'],
        exportDate: json['export_date'],
        craftDate: json['craft_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "sender_id": senderId?.toJson(),
      "receiver_id": receiverId.toJson(),
      "origin": origin.toJson(),
      "received_gift_id": receivedGiftId,
      "text": text.toJson(),
      "is_private": isPrivate,
      "is_saved": isSaved,
      "can_be_transferred": canBeTransferred,
      "was_transferred": wasTransferred,
      "transfer_star_count": transferStarCount,
      "drop_original_details_star_count": dropOriginalDetailsStarCount,
      "next_transfer_date": nextTransferDate,
      "next_resale_date": nextResaleDate,
      "export_date": exportDate,
      "craft_date": craftDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [sender_id]: Sender of the gift; may be null for anonymous gifts
  /// * [receiver_id]: Receiver of the gift
  /// * [origin]: Origin of the upgraded gift
  /// * [received_gift_id]: Unique identifier of the received gift for the current user; only for the receiver of the gift
  /// * [text]: Message added to the gift
  /// * [is_private]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  /// * [is_saved]: True, if the gift is displayed on the user's or the channel's profile page; only for the receiver of the gift
  /// * [can_be_transferred]: True, if the gift can be transferred to another owner; only for the receiver of the gift
  /// * [was_transferred]: True, if the gift has already been transferred to another owner; only for the receiver of the gift
  /// * [transfer_star_count]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
  /// * [drop_original_details_star_count]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift
  /// * [next_transfer_date]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift
  /// * [next_resale_date]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  /// * [export_date]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift
  /// * [craft_date]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift
  @override
  MessageUpgradedGift copyWith({
    UpgradedGift? gift,
    MessageSender? senderId,
    MessageSender? receiverId,
    UpgradedGiftOrigin? origin,
    String? receivedGiftId,
    FormattedText? text,
    bool? isPrivate,
    bool? isSaved,
    bool? canBeTransferred,
    bool? wasTransferred,
    int? transferStarCount,
    int? dropOriginalDetailsStarCount,
    int? nextTransferDate,
    int? nextResaleDate,
    int? exportDate,
    int? craftDate,
  }) =>
      MessageUpgradedGift(
        gift: gift ?? this.gift,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        origin: origin ?? this.origin,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        text: text ?? this.text,
        isPrivate: isPrivate ?? this.isPrivate,
        isSaved: isSaved ?? this.isSaved,
        canBeTransferred: canBeTransferred ?? this.canBeTransferred,
        wasTransferred: wasTransferred ?? this.wasTransferred,
        transferStarCount: transferStarCount ?? this.transferStarCount,
        dropOriginalDetailsStarCount:
            dropOriginalDetailsStarCount ?? this.dropOriginalDetailsStarCount,
        nextTransferDate: nextTransferDate ?? this.nextTransferDate,
        nextResaleDate: nextResaleDate ?? this.nextResaleDate,
        exportDate: exportDate ?? this.exportDate,
        craftDate: craftDate ?? this.craftDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageRefundedUpgradedGift** *(messageRefundedUpgradedGift)* - child of MessageContent
///
/// A gift which purchase, upgrade, or transfer were refunded.
///
/// * [gift]: The gift.
/// * [senderId]: Sender of the gift.
/// * [receiverId]: Receiver of the gift.
/// * [origin]: Origin of the upgraded gift.
final class MessageRefundedUpgradedGift extends MessageContent {
  /// **MessageRefundedUpgradedGift** *(messageRefundedUpgradedGift)* - child of MessageContent
  ///
  /// A gift which purchase, upgrade, or transfer were refunded.
  ///
  /// * [gift]: The gift.
  /// * [senderId]: Sender of the gift.
  /// * [receiverId]: Receiver of the gift.
  /// * [origin]: Origin of the upgraded gift.
  const MessageRefundedUpgradedGift({
    required this.gift,
    required this.senderId,
    required this.receiverId,
    required this.origin,
  });

  /// The gift
  final Gift gift;

  /// Sender of the gift
  final MessageSender senderId;

  /// Receiver of the gift
  final MessageSender receiverId;

  /// Origin of the upgraded gift
  final UpgradedGiftOrigin origin;

  /// Parse from a json
  factory MessageRefundedUpgradedGift.fromJson(Map<String, dynamic> json) =>
      MessageRefundedUpgradedGift(
        gift: Gift.fromJson(json['gift']),
        senderId: MessageSender.fromJson(json['sender_id']),
        receiverId: MessageSender.fromJson(json['receiver_id']),
        origin: UpgradedGiftOrigin.fromJson(json['origin']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "sender_id": senderId.toJson(),
      "receiver_id": receiverId.toJson(),
      "origin": origin.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [sender_id]: Sender of the gift
  /// * [receiver_id]: Receiver of the gift
  /// * [origin]: Origin of the upgraded gift
  @override
  MessageRefundedUpgradedGift copyWith({
    Gift? gift,
    MessageSender? senderId,
    MessageSender? receiverId,
    UpgradedGiftOrigin? origin,
  }) =>
      MessageRefundedUpgradedGift(
        gift: gift ?? this.gift,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        origin: origin ?? this.origin,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageRefundedUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUpgradedGiftPurchaseOffer** *(messageUpgradedGiftPurchaseOffer)* - child of MessageContent
///
/// An offer to purchase an upgraded gift was sent or received.
///
/// * [gift]: The gift.
/// * [state]: State of the offer.
/// * [price]: The proposed price.
/// * [expirationDate]: Point in time (Unix timestamp) when the offer will expire or has expired.
final class MessageUpgradedGiftPurchaseOffer extends MessageContent {
  /// **MessageUpgradedGiftPurchaseOffer** *(messageUpgradedGiftPurchaseOffer)* - child of MessageContent
  ///
  /// An offer to purchase an upgraded gift was sent or received.
  ///
  /// * [gift]: The gift.
  /// * [state]: State of the offer.
  /// * [price]: The proposed price.
  /// * [expirationDate]: Point in time (Unix timestamp) when the offer will expire or has expired.
  const MessageUpgradedGiftPurchaseOffer({
    required this.gift,
    required this.state,
    required this.price,
    required this.expirationDate,
  });

  /// The gift
  final UpgradedGift gift;

  /// State of the offer
  final GiftPurchaseOfferState state;

  /// The proposed price
  final GiftResalePrice price;

  /// Point in time (Unix timestamp) when the offer will expire or has expired
  final int expirationDate;

  /// Parse from a json
  factory MessageUpgradedGiftPurchaseOffer.fromJson(
          Map<String, dynamic> json) =>
      MessageUpgradedGiftPurchaseOffer(
        gift: UpgradedGift.fromJson(json['gift']),
        state: GiftPurchaseOfferState.fromJson(json['state']),
        price: GiftResalePrice.fromJson(json['price']),
        expirationDate: json['expiration_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "state": state.toJson(),
      "price": price.toJson(),
      "expiration_date": expirationDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [state]: State of the offer
  /// * [price]: The proposed price
  /// * [expiration_date]: Point in time (Unix timestamp) when the offer will expire or has expired
  @override
  MessageUpgradedGiftPurchaseOffer copyWith({
    UpgradedGift? gift,
    GiftPurchaseOfferState? state,
    GiftResalePrice? price,
    int? expirationDate,
  }) =>
      MessageUpgradedGiftPurchaseOffer(
        gift: gift ?? this.gift,
        state: state ?? this.state,
        price: price ?? this.price,
        expirationDate: expirationDate ?? this.expirationDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageUpgradedGiftPurchaseOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUpgradedGiftPurchaseOfferRejected** *(messageUpgradedGiftPurchaseOfferRejected)* - child of MessageContent
///
/// An offer to purchase a gift was rejected or expired.
///
/// * [gift]: The gift.
/// * [price]: The proposed price.
/// * [offerMessageId]: Identifier of the message with purchase offer which was rejected or expired; may be 0 or an identifier of a deleted message.
/// * [wasExpired]: True, if the offer has expired; otherwise, the offer was explicitly rejected.
final class MessageUpgradedGiftPurchaseOfferRejected extends MessageContent {
  /// **MessageUpgradedGiftPurchaseOfferRejected** *(messageUpgradedGiftPurchaseOfferRejected)* - child of MessageContent
  ///
  /// An offer to purchase a gift was rejected or expired.
  ///
  /// * [gift]: The gift.
  /// * [price]: The proposed price.
  /// * [offerMessageId]: Identifier of the message with purchase offer which was rejected or expired; may be 0 or an identifier of a deleted message.
  /// * [wasExpired]: True, if the offer has expired; otherwise, the offer was explicitly rejected.
  const MessageUpgradedGiftPurchaseOfferRejected({
    required this.gift,
    required this.price,
    required this.offerMessageId,
    required this.wasExpired,
  });

  /// The gift
  final UpgradedGift gift;

  /// The proposed price
  final GiftResalePrice price;

  /// Identifier of the message with purchase offer which was rejected or expired; may be 0 or an identifier of a deleted message
  final int offerMessageId;

  /// True, if the offer has expired; otherwise, the offer was explicitly rejected
  final bool wasExpired;

  /// Parse from a json
  factory MessageUpgradedGiftPurchaseOfferRejected.fromJson(
          Map<String, dynamic> json) =>
      MessageUpgradedGiftPurchaseOfferRejected(
        gift: UpgradedGift.fromJson(json['gift']),
        price: GiftResalePrice.fromJson(json['price']),
        offerMessageId: json['offer_message_id'],
        wasExpired: json['was_expired'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "price": price.toJson(),
      "offer_message_id": offerMessageId,
      "was_expired": wasExpired,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [price]: The proposed price
  /// * [offer_message_id]: Identifier of the message with purchase offer which was rejected or expired; may be 0 or an identifier of a deleted message
  /// * [was_expired]: True, if the offer has expired; otherwise, the offer was explicitly rejected
  @override
  MessageUpgradedGiftPurchaseOfferRejected copyWith({
    UpgradedGift? gift,
    GiftResalePrice? price,
    int? offerMessageId,
    bool? wasExpired,
  }) =>
      MessageUpgradedGiftPurchaseOfferRejected(
        gift: gift ?? this.gift,
        price: price ?? this.price,
        offerMessageId: offerMessageId ?? this.offerMessageId,
        wasExpired: wasExpired ?? this.wasExpired,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'messageUpgradedGiftPurchaseOfferRejected';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaidMessagesRefunded** *(messagePaidMessagesRefunded)* - child of MessageContent
///
/// Paid messages were refunded.
///
/// * [messageCount]: The number of refunded messages.
/// * [starCount]: The number of refunded Telegram Stars.
final class MessagePaidMessagesRefunded extends MessageContent {
  /// **MessagePaidMessagesRefunded** *(messagePaidMessagesRefunded)* - child of MessageContent
  ///
  /// Paid messages were refunded.
  ///
  /// * [messageCount]: The number of refunded messages.
  /// * [starCount]: The number of refunded Telegram Stars.
  const MessagePaidMessagesRefunded({
    required this.messageCount,
    required this.starCount,
  });

  /// The number of refunded messages
  final int messageCount;

  /// The number of refunded Telegram Stars
  final int starCount;

  /// Parse from a json
  factory MessagePaidMessagesRefunded.fromJson(Map<String, dynamic> json) =>
      MessagePaidMessagesRefunded(
        messageCount: json['message_count'],
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_count": messageCount,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_count]: The number of refunded messages
  /// * [star_count]: The number of refunded Telegram Stars
  @override
  MessagePaidMessagesRefunded copyWith({
    int? messageCount,
    int? starCount,
  }) =>
      MessagePaidMessagesRefunded(
        messageCount: messageCount ?? this.messageCount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaidMessagesRefunded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePaidMessagePriceChanged** *(messagePaidMessagePriceChanged)* - child of MessageContent
///
/// A price for paid messages was changed in the supergroup chat.
///
/// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message.
final class MessagePaidMessagePriceChanged extends MessageContent {
  /// **MessagePaidMessagePriceChanged** *(messagePaidMessagePriceChanged)* - child of MessageContent
  ///
  /// A price for paid messages was changed in the supergroup chat.
  ///
  /// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message.
  const MessagePaidMessagePriceChanged({
    required this.paidMessageStarCount,
  });

  /// The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
  final int paidMessageStarCount;

  /// Parse from a json
  factory MessagePaidMessagePriceChanged.fromJson(Map<String, dynamic> json) =>
      MessagePaidMessagePriceChanged(
        paidMessageStarCount: json['paid_message_star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "paid_message_star_count": paidMessageStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [paid_message_star_count]: The new number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
  @override
  MessagePaidMessagePriceChanged copyWith({
    int? paidMessageStarCount,
  }) =>
      MessagePaidMessagePriceChanged(
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePaidMessagePriceChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageDirectMessagePriceChanged** *(messageDirectMessagePriceChanged)* - child of MessageContent
///
/// A price for direct messages was changed in the channel chat.
///
/// * [isEnabled]: True, if direct messages group was enabled for the channel; false otherwise.
/// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid by non-administrator users of the channel chat for each message sent to the direct messages group;. 0 if the direct messages group was disabled or the messages are free.
final class MessageDirectMessagePriceChanged extends MessageContent {
  /// **MessageDirectMessagePriceChanged** *(messageDirectMessagePriceChanged)* - child of MessageContent
  ///
  /// A price for direct messages was changed in the channel chat.
  ///
  /// * [isEnabled]: True, if direct messages group was enabled for the channel; false otherwise.
  /// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid by non-administrator users of the channel chat for each message sent to the direct messages group;. 0 if the direct messages group was disabled or the messages are free.
  const MessageDirectMessagePriceChanged({
    required this.isEnabled,
    required this.paidMessageStarCount,
  });

  /// True, if direct messages group was enabled for the channel; false otherwise
  final bool isEnabled;

  /// The new number of Telegram Stars that must be paid by non-administrator users of the channel chat for each message sent to the direct messages group;. 0 if the direct messages group was disabled or the messages are free
  final int paidMessageStarCount;

  /// Parse from a json
  factory MessageDirectMessagePriceChanged.fromJson(
          Map<String, dynamic> json) =>
      MessageDirectMessagePriceChanged(
        isEnabled: json['is_enabled'],
        paidMessageStarCount: json['paid_message_star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_enabled": isEnabled,
      "paid_message_star_count": paidMessageStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_enabled]: True, if direct messages group was enabled for the channel; false otherwise
  /// * [paid_message_star_count]: The new number of Telegram Stars that must be paid by non-administrator users of the channel chat for each message sent to the direct messages group;. 0 if the direct messages group was disabled or the messages are free
  @override
  MessageDirectMessagePriceChanged copyWith({
    bool? isEnabled,
    int? paidMessageStarCount,
  }) =>
      MessageDirectMessagePriceChanged(
        isEnabled: isEnabled ?? this.isEnabled,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageDirectMessagePriceChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUnpaidMessagesAllowedByLink** *(messageUnpaidMessagesAllowedByLink)* - child of MessageContent
///
/// The sender of the message used a link of the other user, which allows sending unpaid messages to the user.
final class MessageUnpaidMessagesAllowedByLink extends MessageContent {
  /// **MessageUnpaidMessagesAllowedByLink** *(messageUnpaidMessagesAllowedByLink)* - child of MessageContent
  ///
  /// The sender of the message used a link of the other user, which allows sending unpaid messages to the user.
  const MessageUnpaidMessagesAllowedByLink();

  /// Parse from a json
  factory MessageUnpaidMessagesAllowedByLink.fromJson(
          Map<String, dynamic> json) =>
      const MessageUnpaidMessagesAllowedByLink();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageUnpaidMessagesAllowedByLink copyWith() =>
      const MessageUnpaidMessagesAllowedByLink();

  /// TDLib object type
  static const String defaultObjectId = 'messageUnpaidMessagesAllowedByLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChecklistTasksDone** *(messageChecklistTasksDone)* - child of MessageContent
///
/// Some tasks from a checklist were marked as done or not done.
///
/// * [checklistMessageId]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message.
/// * [markedAsDoneTaskIds]: Identifiers of tasks that were marked as done.
/// * [markedAsNotDoneTaskIds]: Identifiers of tasks that were marked as not done.
final class MessageChecklistTasksDone extends MessageContent {
  /// **MessageChecklistTasksDone** *(messageChecklistTasksDone)* - child of MessageContent
  ///
  /// Some tasks from a checklist were marked as done or not done.
  ///
  /// * [checklistMessageId]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message.
  /// * [markedAsDoneTaskIds]: Identifiers of tasks that were marked as done.
  /// * [markedAsNotDoneTaskIds]: Identifiers of tasks that were marked as not done.
  const MessageChecklistTasksDone({
    required this.checklistMessageId,
    required this.markedAsDoneTaskIds,
    required this.markedAsNotDoneTaskIds,
  });

  /// Identifier of the message with the checklist; may be 0 or an identifier of a deleted message
  final int checklistMessageId;

  /// Identifiers of tasks that were marked as done
  final List<int> markedAsDoneTaskIds;

  /// Identifiers of tasks that were marked as not done
  final List<int> markedAsNotDoneTaskIds;

  /// Parse from a json
  factory MessageChecklistTasksDone.fromJson(Map<String, dynamic> json) =>
      MessageChecklistTasksDone(
        checklistMessageId: json['checklist_message_id'],
        markedAsDoneTaskIds: List<int>.from(
            (json['marked_as_done_task_ids'] ?? [])
                .map((item) => item)
                .toList()),
        markedAsNotDoneTaskIds: List<int>.from(
            (json['marked_as_not_done_task_ids'] ?? [])
                .map((item) => item)
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "checklist_message_id": checklistMessageId,
      "marked_as_done_task_ids": markedAsDoneTaskIds.map((i) => i).toList(),
      "marked_as_not_done_task_ids":
          markedAsNotDoneTaskIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [checklist_message_id]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message
  /// * [marked_as_done_task_ids]: Identifiers of tasks that were marked as done
  /// * [marked_as_not_done_task_ids]: Identifiers of tasks that were marked as not done
  @override
  MessageChecklistTasksDone copyWith({
    int? checklistMessageId,
    List<int>? markedAsDoneTaskIds,
    List<int>? markedAsNotDoneTaskIds,
  }) =>
      MessageChecklistTasksDone(
        checklistMessageId: checklistMessageId ?? this.checklistMessageId,
        markedAsDoneTaskIds: markedAsDoneTaskIds ?? this.markedAsDoneTaskIds,
        markedAsNotDoneTaskIds:
            markedAsNotDoneTaskIds ?? this.markedAsNotDoneTaskIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChecklistTasksDone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChecklistTasksAdded** *(messageChecklistTasksAdded)* - child of MessageContent
///
/// Some tasks were added to a checklist.
///
/// * [checklistMessageId]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message.
/// * [tasks]: List of tasks added to the checklist.
final class MessageChecklistTasksAdded extends MessageContent {
  /// **MessageChecklistTasksAdded** *(messageChecklistTasksAdded)* - child of MessageContent
  ///
  /// Some tasks were added to a checklist.
  ///
  /// * [checklistMessageId]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message.
  /// * [tasks]: List of tasks added to the checklist.
  const MessageChecklistTasksAdded({
    required this.checklistMessageId,
    required this.tasks,
  });

  /// Identifier of the message with the checklist; may be 0 or an identifier of a deleted message
  final int checklistMessageId;

  /// List of tasks added to the checklist
  final List<ChecklistTask> tasks;

  /// Parse from a json
  factory MessageChecklistTasksAdded.fromJson(Map<String, dynamic> json) =>
      MessageChecklistTasksAdded(
        checklistMessageId: json['checklist_message_id'],
        tasks: List<ChecklistTask>.from((json['tasks'] ?? [])
            .map((item) => ChecklistTask.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "checklist_message_id": checklistMessageId,
      "tasks": tasks.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [checklist_message_id]: Identifier of the message with the checklist; may be 0 or an identifier of a deleted message
  /// * [tasks]: List of tasks added to the checklist
  @override
  MessageChecklistTasksAdded copyWith({
    int? checklistMessageId,
    List<ChecklistTask>? tasks,
  }) =>
      MessageChecklistTasksAdded(
        checklistMessageId: checklistMessageId ?? this.checklistMessageId,
        tasks: tasks ?? this.tasks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChecklistTasksAdded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestedPostApprovalFailed** *(messageSuggestedPostApprovalFailed)* - child of MessageContent
///
/// Approval of suggested post has failed, because the user who proposed the post didn't have enough funds.
///
/// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
/// * [price]: Price of the suggested post.
final class MessageSuggestedPostApprovalFailed extends MessageContent {
  /// **MessageSuggestedPostApprovalFailed** *(messageSuggestedPostApprovalFailed)* - child of MessageContent
  ///
  /// Approval of suggested post has failed, because the user who proposed the post didn't have enough funds.
  ///
  /// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
  /// * [price]: Price of the suggested post.
  const MessageSuggestedPostApprovalFailed({
    required this.suggestedPostMessageId,
    required this.price,
  });

  /// Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  final int suggestedPostMessageId;

  /// Price of the suggested post
  final SuggestedPostPrice price;

  /// Parse from a json
  factory MessageSuggestedPostApprovalFailed.fromJson(
          Map<String, dynamic> json) =>
      MessageSuggestedPostApprovalFailed(
        suggestedPostMessageId: json['suggested_post_message_id'],
        price: SuggestedPostPrice.fromJson(json['price']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_message_id": suggestedPostMessageId,
      "price": price.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_message_id]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  /// * [price]: Price of the suggested post
  @override
  MessageSuggestedPostApprovalFailed copyWith({
    int? suggestedPostMessageId,
    SuggestedPostPrice? price,
  }) =>
      MessageSuggestedPostApprovalFailed(
        suggestedPostMessageId:
            suggestedPostMessageId ?? this.suggestedPostMessageId,
        price: price ?? this.price,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestedPostApprovalFailed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestedPostApproved** *(messageSuggestedPostApproved)* - child of MessageContent
///
/// A suggested post was approved.
///
/// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
/// * [price]: Price of the suggested post; may be null if the post is non-paid *(optional)*.
/// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published.
final class MessageSuggestedPostApproved extends MessageContent {
  /// **MessageSuggestedPostApproved** *(messageSuggestedPostApproved)* - child of MessageContent
  ///
  /// A suggested post was approved.
  ///
  /// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
  /// * [price]: Price of the suggested post; may be null if the post is non-paid *(optional)*.
  /// * [sendDate]: Point in time (Unix timestamp) when the post is expected to be published.
  const MessageSuggestedPostApproved({
    required this.suggestedPostMessageId,
    this.price,
    required this.sendDate,
  });

  /// Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  final int suggestedPostMessageId;

  /// Price of the suggested post; may be null if the post is non-paid
  final SuggestedPostPrice? price;

  /// Point in time (Unix timestamp) when the post is expected to be published
  final int sendDate;

  /// Parse from a json
  factory MessageSuggestedPostApproved.fromJson(Map<String, dynamic> json) =>
      MessageSuggestedPostApproved(
        suggestedPostMessageId: json['suggested_post_message_id'],
        price: json['price'] == null
            ? null
            : SuggestedPostPrice.fromJson(json['price']),
        sendDate: json['send_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_message_id": suggestedPostMessageId,
      "price": price?.toJson(),
      "send_date": sendDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_message_id]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  /// * [price]: Price of the suggested post; may be null if the post is non-paid
  /// * [send_date]: Point in time (Unix timestamp) when the post is expected to be published
  @override
  MessageSuggestedPostApproved copyWith({
    int? suggestedPostMessageId,
    SuggestedPostPrice? price,
    int? sendDate,
  }) =>
      MessageSuggestedPostApproved(
        suggestedPostMessageId:
            suggestedPostMessageId ?? this.suggestedPostMessageId,
        price: price ?? this.price,
        sendDate: sendDate ?? this.sendDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestedPostApproved';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestedPostDeclined** *(messageSuggestedPostDeclined)* - child of MessageContent
///
/// A suggested post was declined.
///
/// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
/// * [comment]: Comment added by administrator of the channel when the post was declined.
final class MessageSuggestedPostDeclined extends MessageContent {
  /// **MessageSuggestedPostDeclined** *(messageSuggestedPostDeclined)* - child of MessageContent
  ///
  /// A suggested post was declined.
  ///
  /// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
  /// * [comment]: Comment added by administrator of the channel when the post was declined.
  const MessageSuggestedPostDeclined({
    required this.suggestedPostMessageId,
    required this.comment,
  });

  /// Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  final int suggestedPostMessageId;

  /// Comment added by administrator of the channel when the post was declined
  final String comment;

  /// Parse from a json
  factory MessageSuggestedPostDeclined.fromJson(Map<String, dynamic> json) =>
      MessageSuggestedPostDeclined(
        suggestedPostMessageId: json['suggested_post_message_id'],
        comment: json['comment'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_message_id": suggestedPostMessageId,
      "comment": comment,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_message_id]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  /// * [comment]: Comment added by administrator of the channel when the post was declined
  @override
  MessageSuggestedPostDeclined copyWith({
    int? suggestedPostMessageId,
    String? comment,
  }) =>
      MessageSuggestedPostDeclined(
        suggestedPostMessageId:
            suggestedPostMessageId ?? this.suggestedPostMessageId,
        comment: comment ?? this.comment,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestedPostDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestedPostPaid** *(messageSuggestedPostPaid)* - child of MessageContent
///
/// A suggested post was published for getOption("suggested_post_lifetime_min") seconds and payment for the post was received.
///
/// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
/// * [starAmount]: The amount of received Telegram Stars.
/// * [gramAmount]: The amount of received TON Grams; in the smallest units of the cryptocurrency.
final class MessageSuggestedPostPaid extends MessageContent {
  /// **MessageSuggestedPostPaid** *(messageSuggestedPostPaid)* - child of MessageContent
  ///
  /// A suggested post was published for getOption("suggested_post_lifetime_min") seconds and payment for the post was received.
  ///
  /// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
  /// * [starAmount]: The amount of received Telegram Stars.
  /// * [gramAmount]: The amount of received TON Grams; in the smallest units of the cryptocurrency.
  const MessageSuggestedPostPaid({
    required this.suggestedPostMessageId,
    required this.starAmount,
    required this.gramAmount,
  });

  /// Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  final int suggestedPostMessageId;

  /// The amount of received Telegram Stars
  final StarAmount starAmount;

  /// The amount of received TON Grams; in the smallest units of the cryptocurrency
  final int gramAmount;

  /// Parse from a json
  factory MessageSuggestedPostPaid.fromJson(Map<String, dynamic> json) =>
      MessageSuggestedPostPaid(
        suggestedPostMessageId: json['suggested_post_message_id'],
        starAmount: StarAmount.fromJson(json['star_amount']),
        gramAmount: json['gram_amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_message_id": suggestedPostMessageId,
      "star_amount": starAmount.toJson(),
      "gram_amount": gramAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_message_id]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  /// * [star_amount]: The amount of received Telegram Stars
  /// * [gram_amount]: The amount of received TON Grams; in the smallest units of the cryptocurrency
  @override
  MessageSuggestedPostPaid copyWith({
    int? suggestedPostMessageId,
    StarAmount? starAmount,
    int? gramAmount,
  }) =>
      MessageSuggestedPostPaid(
        suggestedPostMessageId:
            suggestedPostMessageId ?? this.suggestedPostMessageId,
        starAmount: starAmount ?? this.starAmount,
        gramAmount: gramAmount ?? this.gramAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestedPostPaid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSuggestedPostRefunded** *(messageSuggestedPostRefunded)* - child of MessageContent
///
/// A suggested post was refunded.
///
/// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
/// * [reason]: Reason of the refund.
final class MessageSuggestedPostRefunded extends MessageContent {
  /// **MessageSuggestedPostRefunded** *(messageSuggestedPostRefunded)* - child of MessageContent
  ///
  /// A suggested post was refunded.
  ///
  /// * [suggestedPostMessageId]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message.
  /// * [reason]: Reason of the refund.
  const MessageSuggestedPostRefunded({
    required this.suggestedPostMessageId,
    required this.reason,
  });

  /// Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  final int suggestedPostMessageId;

  /// Reason of the refund
  final SuggestedPostRefundReason reason;

  /// Parse from a json
  factory MessageSuggestedPostRefunded.fromJson(Map<String, dynamic> json) =>
      MessageSuggestedPostRefunded(
        suggestedPostMessageId: json['suggested_post_message_id'],
        reason: SuggestedPostRefundReason.fromJson(json['reason']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_message_id": suggestedPostMessageId,
      "reason": reason.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_message_id]: Identifier of the message with the suggested post; may be 0 or an identifier of a deleted message
  /// * [reason]: Reason of the refund
  @override
  MessageSuggestedPostRefunded copyWith({
    int? suggestedPostMessageId,
    SuggestedPostRefundReason? reason,
  }) =>
      MessageSuggestedPostRefunded(
        suggestedPostMessageId:
            suggestedPostMessageId ?? this.suggestedPostMessageId,
        reason: reason ?? this.reason,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSuggestedPostRefunded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageContactRegistered** *(messageContactRegistered)* - child of MessageContent
///
/// A contact has registered with Telegram.
final class MessageContactRegistered extends MessageContent {
  /// **MessageContactRegistered** *(messageContactRegistered)* - child of MessageContent
  ///
  /// A contact has registered with Telegram.
  const MessageContactRegistered();

  /// Parse from a json
  factory MessageContactRegistered.fromJson(Map<String, dynamic> json) =>
      const MessageContactRegistered();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageContactRegistered copyWith() => const MessageContactRegistered();

  /// TDLib object type
  static const String defaultObjectId = 'messageContactRegistered';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUsersShared** *(messageUsersShared)* - child of MessageContent
///
/// The current user shared users who were requested by the bot.
///
/// * [users]: The shared users.
/// * [buttonId]: Identifier of the keyboard button with the request.
final class MessageUsersShared extends MessageContent {
  /// **MessageUsersShared** *(messageUsersShared)* - child of MessageContent
  ///
  /// The current user shared users who were requested by the bot.
  ///
  /// * [users]: The shared users.
  /// * [buttonId]: Identifier of the keyboard button with the request.
  const MessageUsersShared({
    required this.users,
    required this.buttonId,
  });

  /// The shared users
  final List<SharedUser> users;

  /// Identifier of the keyboard button with the request
  final int buttonId;

  /// Parse from a json
  factory MessageUsersShared.fromJson(Map<String, dynamic> json) =>
      MessageUsersShared(
        users: List<SharedUser>.from((json['users'] ?? [])
            .map((item) => SharedUser.fromJson(item))
            .toList()),
        buttonId: json['button_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "users": users.map((i) => i.toJson()).toList(),
      "button_id": buttonId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [users]: The shared users
  /// * [button_id]: Identifier of the keyboard button with the request
  @override
  MessageUsersShared copyWith({
    List<SharedUser>? users,
    int? buttonId,
  }) =>
      MessageUsersShared(
        users: users ?? this.users,
        buttonId: buttonId ?? this.buttonId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageUsersShared';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageChatShared** *(messageChatShared)* - child of MessageContent
///
/// The current user shared a chat, which was requested by the bot.
///
/// * [chat]: The shared chat.
/// * [buttonId]: Identifier of the keyboard button with the request.
final class MessageChatShared extends MessageContent {
  /// **MessageChatShared** *(messageChatShared)* - child of MessageContent
  ///
  /// The current user shared a chat, which was requested by the bot.
  ///
  /// * [chat]: The shared chat.
  /// * [buttonId]: Identifier of the keyboard button with the request.
  const MessageChatShared({
    required this.chat,
    required this.buttonId,
  });

  /// The shared chat
  final SharedChat chat;

  /// Identifier of the keyboard button with the request
  final int buttonId;

  /// Parse from a json
  factory MessageChatShared.fromJson(Map<String, dynamic> json) =>
      MessageChatShared(
        chat: SharedChat.fromJson(json['chat']),
        buttonId: json['button_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat": chat.toJson(),
      "button_id": buttonId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat]: The shared chat
  /// * [button_id]: Identifier of the keyboard button with the request
  @override
  MessageChatShared copyWith({
    SharedChat? chat,
    int? buttonId,
  }) =>
      MessageChatShared(
        chat: chat ?? this.chat,
        buttonId: buttonId ?? this.buttonId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageChatShared';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageBotWriteAccessAllowed** *(messageBotWriteAccessAllowed)* - child of MessageContent
///
/// The user allowed the bot to send messages.
///
/// * [reason]: The reason why the bot was allowed to write messages.
final class MessageBotWriteAccessAllowed extends MessageContent {
  /// **MessageBotWriteAccessAllowed** *(messageBotWriteAccessAllowed)* - child of MessageContent
  ///
  /// The user allowed the bot to send messages.
  ///
  /// * [reason]: The reason why the bot was allowed to write messages.
  const MessageBotWriteAccessAllowed({
    required this.reason,
  });

  /// The reason why the bot was allowed to write messages
  final BotWriteAccessAllowReason reason;

  /// Parse from a json
  factory MessageBotWriteAccessAllowed.fromJson(Map<String, dynamic> json) =>
      MessageBotWriteAccessAllowed(
        reason: BotWriteAccessAllowReason.fromJson(json['reason']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reason": reason.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: The reason why the bot was allowed to write messages
  @override
  MessageBotWriteAccessAllowed copyWith({
    BotWriteAccessAllowReason? reason,
  }) =>
      MessageBotWriteAccessAllowed(
        reason: reason ?? this.reason,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageBotWriteAccessAllowed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageWebAppDataSent** *(messageWebAppDataSent)* - child of MessageContent
///
/// Data from a Web App has been sent to a bot.
///
/// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
final class MessageWebAppDataSent extends MessageContent {
  /// **MessageWebAppDataSent** *(messageWebAppDataSent)* - child of MessageContent
  ///
  /// Data from a Web App has been sent to a bot.
  ///
  /// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
  const MessageWebAppDataSent({
    required this.buttonText,
  });

  /// Text of the keyboardButtonTypeWebApp button, which opened the Web App
  final String buttonText;

  /// Parse from a json
  factory MessageWebAppDataSent.fromJson(Map<String, dynamic> json) =>
      MessageWebAppDataSent(
        buttonText: json['button_text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "button_text": buttonText,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [button_text]: Text of the keyboardButtonTypeWebApp button, which opened the Web App
  @override
  MessageWebAppDataSent copyWith({
    String? buttonText,
  }) =>
      MessageWebAppDataSent(
        buttonText: buttonText ?? this.buttonText,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageWebAppDataSent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageWebAppDataReceived** *(messageWebAppDataReceived)* - child of MessageContent
///
/// Data from a Web App has been received; for bots only.
///
/// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
/// * [data]: The data.
final class MessageWebAppDataReceived extends MessageContent {
  /// **MessageWebAppDataReceived** *(messageWebAppDataReceived)* - child of MessageContent
  ///
  /// Data from a Web App has been received; for bots only.
  ///
  /// * [buttonText]: Text of the keyboardButtonTypeWebApp button, which opened the Web App.
  /// * [data]: The data.
  const MessageWebAppDataReceived({
    required this.buttonText,
    required this.data,
  });

  /// Text of the keyboardButtonTypeWebApp button, which opened the Web App
  final String buttonText;

  /// The data
  final String data;

  /// Parse from a json
  factory MessageWebAppDataReceived.fromJson(Map<String, dynamic> json) =>
      MessageWebAppDataReceived(
        buttonText: json['button_text'],
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "button_text": buttonText,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [button_text]: Text of the keyboardButtonTypeWebApp button, which opened the Web App
  /// * [data]: The data
  @override
  MessageWebAppDataReceived copyWith({
    String? buttonText,
    String? data,
  }) =>
      MessageWebAppDataReceived(
        buttonText: buttonText ?? this.buttonText,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageWebAppDataReceived';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePassportDataSent** *(messagePassportDataSent)* - child of MessageContent
///
/// Telegram Passport data has been sent to a bot.
///
/// * [types]: List of Telegram Passport element types sent.
final class MessagePassportDataSent extends MessageContent {
  /// **MessagePassportDataSent** *(messagePassportDataSent)* - child of MessageContent
  ///
  /// Telegram Passport data has been sent to a bot.
  ///
  /// * [types]: List of Telegram Passport element types sent.
  const MessagePassportDataSent({
    required this.types,
  });

  /// List of Telegram Passport element types sent
  final List<PassportElementType> types;

  /// Parse from a json
  factory MessagePassportDataSent.fromJson(Map<String, dynamic> json) =>
      MessagePassportDataSent(
        types: List<PassportElementType>.from((json['types'] ?? [])
            .map((item) => PassportElementType.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "types": types.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [types]: List of Telegram Passport element types sent
  @override
  MessagePassportDataSent copyWith({
    List<PassportElementType>? types,
  }) =>
      MessagePassportDataSent(
        types: types ?? this.types,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePassportDataSent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessagePassportDataReceived** *(messagePassportDataReceived)* - child of MessageContent
///
/// Telegram Passport data has been received; for bots only.
///
/// * [elements]: List of received Telegram Passport elements.
/// * [credentials]: Encrypted data credentials.
final class MessagePassportDataReceived extends MessageContent {
  /// **MessagePassportDataReceived** *(messagePassportDataReceived)* - child of MessageContent
  ///
  /// Telegram Passport data has been received; for bots only.
  ///
  /// * [elements]: List of received Telegram Passport elements.
  /// * [credentials]: Encrypted data credentials.
  const MessagePassportDataReceived({
    required this.elements,
    required this.credentials,
  });

  /// List of received Telegram Passport elements
  final List<EncryptedPassportElement> elements;

  /// Encrypted data credentials
  final EncryptedCredentials credentials;

  /// Parse from a json
  factory MessagePassportDataReceived.fromJson(Map<String, dynamic> json) =>
      MessagePassportDataReceived(
        elements: List<EncryptedPassportElement>.from((json['elements'] ?? [])
            .map((item) => EncryptedPassportElement.fromJson(item))
            .toList()),
        credentials: EncryptedCredentials.fromJson(json['credentials']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "elements": elements.map((i) => i.toJson()).toList(),
      "credentials": credentials.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [elements]: List of received Telegram Passport elements
  /// * [credentials]: Encrypted data credentials
  @override
  MessagePassportDataReceived copyWith({
    List<EncryptedPassportElement>? elements,
    EncryptedCredentials? credentials,
  }) =>
      MessagePassportDataReceived(
        elements: elements ?? this.elements,
        credentials: credentials ?? this.credentials,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messagePassportDataReceived';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageProximityAlertTriggered** *(messageProximityAlertTriggered)* - child of MessageContent
///
/// A user in the chat came within proximity alert range.
///
/// * [travelerId]: The identifier of a user or chat that triggered the proximity alert.
/// * [watcherId]: The identifier of a user or chat that subscribed for the proximity alert.
/// * [distance]: The distance between the users.
final class MessageProximityAlertTriggered extends MessageContent {
  /// **MessageProximityAlertTriggered** *(messageProximityAlertTriggered)* - child of MessageContent
  ///
  /// A user in the chat came within proximity alert range.
  ///
  /// * [travelerId]: The identifier of a user or chat that triggered the proximity alert.
  /// * [watcherId]: The identifier of a user or chat that subscribed for the proximity alert.
  /// * [distance]: The distance between the users.
  const MessageProximityAlertTriggered({
    required this.travelerId,
    required this.watcherId,
    required this.distance,
  });

  /// The identifier of a user or chat that triggered the proximity alert
  final MessageSender travelerId;

  /// The identifier of a user or chat that subscribed for the proximity alert
  final MessageSender watcherId;

  /// The distance between the users
  final int distance;

  /// Parse from a json
  factory MessageProximityAlertTriggered.fromJson(Map<String, dynamic> json) =>
      MessageProximityAlertTriggered(
        travelerId: MessageSender.fromJson(json['traveler_id']),
        watcherId: MessageSender.fromJson(json['watcher_id']),
        distance: json['distance'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "traveler_id": travelerId.toJson(),
      "watcher_id": watcherId.toJson(),
      "distance": distance,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [traveler_id]: The identifier of a user or chat that triggered the proximity alert
  /// * [watcher_id]: The identifier of a user or chat that subscribed for the proximity alert
  /// * [distance]: The distance between the users
  @override
  MessageProximityAlertTriggered copyWith({
    MessageSender? travelerId,
    MessageSender? watcherId,
    int? distance,
  }) =>
      MessageProximityAlertTriggered(
        travelerId: travelerId ?? this.travelerId,
        watcherId: watcherId ?? this.watcherId,
        distance: distance ?? this.distance,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageProximityAlertTriggered';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageUnsupported** *(messageUnsupported)* - child of MessageContent
///
/// A message content that is not supported in the current TDLib version.
final class MessageUnsupported extends MessageContent {
  /// **MessageUnsupported** *(messageUnsupported)* - child of MessageContent
  ///
  /// A message content that is not supported in the current TDLib version.
  const MessageUnsupported();

  /// Parse from a json
  factory MessageUnsupported.fromJson(Map<String, dynamic> json) =>
      const MessageUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageUnsupported copyWith() => const MessageUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'messageUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
