part of '../tdapi.dart';

/// **InputMessageContent** *(inputMessageContent)* - parent
///
/// The content of a message to send.
sealed class InputMessageContent extends TdObject {
  /// **InputMessageContent** *(inputMessageContent)* - parent
  ///
  /// The content of a message to send.
  const InputMessageContent();

  /// a InputMessageContent return type can be :
  /// * [InputMessageText]
  /// * [InputMessageRichMessage]
  /// * [InputMessageAnimation]
  /// * [InputMessageAudio]
  /// * [InputMessageDocument]
  /// * [InputMessagePaidMedia]
  /// * [InputMessagePhoto]
  /// * [InputMessageSticker]
  /// * [InputMessageVideo]
  /// * [InputMessageVideoNote]
  /// * [InputMessageVoiceNote]
  /// * [InputMessageLiveLocation]
  /// * [InputMessageLocation]
  /// * [InputMessageVenue]
  /// * [InputMessageContact]
  /// * [InputMessageDice]
  /// * [InputMessageGame]
  /// * [InputMessageInvoice]
  /// * [InputMessagePoll]
  /// * [InputMessageStakeDice]
  /// * [InputMessageStory]
  /// * [InputMessageChecklist]
  /// * [InputMessageForwarded]
  factory InputMessageContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputMessageText.defaultObjectId:
        return InputMessageText.fromJson(json);
      case InputMessageRichMessage.defaultObjectId:
        return InputMessageRichMessage.fromJson(json);
      case InputMessageAnimation.defaultObjectId:
        return InputMessageAnimation.fromJson(json);
      case InputMessageAudio.defaultObjectId:
        return InputMessageAudio.fromJson(json);
      case InputMessageDocument.defaultObjectId:
        return InputMessageDocument.fromJson(json);
      case InputMessagePaidMedia.defaultObjectId:
        return InputMessagePaidMedia.fromJson(json);
      case InputMessagePhoto.defaultObjectId:
        return InputMessagePhoto.fromJson(json);
      case InputMessageSticker.defaultObjectId:
        return InputMessageSticker.fromJson(json);
      case InputMessageVideo.defaultObjectId:
        return InputMessageVideo.fromJson(json);
      case InputMessageVideoNote.defaultObjectId:
        return InputMessageVideoNote.fromJson(json);
      case InputMessageVoiceNote.defaultObjectId:
        return InputMessageVoiceNote.fromJson(json);
      case InputMessageLiveLocation.defaultObjectId:
        return InputMessageLiveLocation.fromJson(json);
      case InputMessageLocation.defaultObjectId:
        return InputMessageLocation.fromJson(json);
      case InputMessageVenue.defaultObjectId:
        return InputMessageVenue.fromJson(json);
      case InputMessageContact.defaultObjectId:
        return InputMessageContact.fromJson(json);
      case InputMessageDice.defaultObjectId:
        return InputMessageDice.fromJson(json);
      case InputMessageGame.defaultObjectId:
        return InputMessageGame.fromJson(json);
      case InputMessageInvoice.defaultObjectId:
        return InputMessageInvoice.fromJson(json);
      case InputMessagePoll.defaultObjectId:
        return InputMessagePoll.fromJson(json);
      case InputMessageStakeDice.defaultObjectId:
        return InputMessageStakeDice.fromJson(json);
      case InputMessageStory.defaultObjectId:
        return InputMessageStory.fromJson(json);
      case InputMessageChecklist.defaultObjectId:
        return InputMessageChecklist.fromJson(json);
      case InputMessageForwarded.defaultObjectId:
        return InputMessageForwarded.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputMessageContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputMessageContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageText** *(inputMessageText)* - child of InputMessageContent
///
/// A text message.
///
/// * [text]: Formatted text to be sent; 0-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote,. Code, Pre, PreCode, TextUrl, MentionName, and DateTime entities are allowed to be specified manually.
/// * [linkPreviewOptions]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options *(optional)*.
/// * [clearDraft]: Pass true to delete message draft in the chat.
final class InputMessageText extends InputMessageContent {
  /// **InputMessageText** *(inputMessageText)* - child of InputMessageContent
  ///
  /// A text message.
  ///
  /// * [text]: Formatted text to be sent; 0-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote,. Code, Pre, PreCode, TextUrl, MentionName, and DateTime entities are allowed to be specified manually.
  /// * [linkPreviewOptions]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options *(optional)*.
  /// * [clearDraft]: Pass true to delete message draft in the chat.
  const InputMessageText({
    required this.text,
    this.linkPreviewOptions,
    required this.clearDraft,
  });

  /// Formatted text to be sent; 0-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote,. Code, Pre, PreCode, TextUrl, MentionName, and DateTime entities are allowed to be specified manually
  final FormattedText text;

  /// Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
  final LinkPreviewOptions? linkPreviewOptions;

  /// Pass true to delete message draft in the chat
  final bool clearDraft;

  /// Parse from a json
  factory InputMessageText.fromJson(Map<String, dynamic> json) =>
      InputMessageText(
        text: FormattedText.fromJson(json['text']),
        linkPreviewOptions: json['link_preview_options'] == null
            ? null
            : LinkPreviewOptions.fromJson(json['link_preview_options']),
        clearDraft: json['clear_draft'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "link_preview_options": linkPreviewOptions?.toJson(),
      "clear_draft": clearDraft,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Formatted text to be sent; 0-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote,. Code, Pre, PreCode, TextUrl, MentionName, and DateTime entities are allowed to be specified manually
  /// * [link_preview_options]: Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
  /// * [clear_draft]: Pass true to delete message draft in the chat
  @override
  InputMessageText copyWith({
    FormattedText? text,
    LinkPreviewOptions? linkPreviewOptions,
    bool? clearDraft,
  }) =>
      InputMessageText(
        text: text ?? this.text,
        linkPreviewOptions: linkPreviewOptions ?? this.linkPreviewOptions,
        clearDraft: clearDraft ?? this.clearDraft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageRichMessage** *(inputMessageRichMessage)* - child of InputMessageContent
///
/// A rich message.
///
/// * [message]: The rich message to send.
/// * [clearDraft]: Pass true to delete message draft in the chat.
final class InputMessageRichMessage extends InputMessageContent {
  /// **InputMessageRichMessage** *(inputMessageRichMessage)* - child of InputMessageContent
  ///
  /// A rich message.
  ///
  /// * [message]: The rich message to send.
  /// * [clearDraft]: Pass true to delete message draft in the chat.
  const InputMessageRichMessage({
    required this.message,
    required this.clearDraft,
  });

  /// The rich message to send
  final InputRichMessage message;

  /// Pass true to delete message draft in the chat
  final bool clearDraft;

  /// Parse from a json
  factory InputMessageRichMessage.fromJson(Map<String, dynamic> json) =>
      InputMessageRichMessage(
        message: InputRichMessage.fromJson(json['message']),
        clearDraft: json['clear_draft'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "clear_draft": clearDraft,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The rich message to send
  /// * [clear_draft]: Pass true to delete message draft in the chat
  @override
  InputMessageRichMessage copyWith({
    InputRichMessage? message,
    bool? clearDraft,
  }) =>
      InputMessageRichMessage(
        message: message ?? this.message,
        clearDraft: clearDraft ?? this.clearDraft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageAnimation** *(inputMessageAnimation)* - child of InputMessageContent
///
/// An animation message (GIF-style).
///
/// * [animation]: The animation to be sent.
/// * [caption]: Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation; not supported in secret chats.
/// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation; not supported in secret chats.
final class InputMessageAnimation extends InputMessageContent {
  /// **InputMessageAnimation** *(inputMessageAnimation)* - child of InputMessageContent
  ///
  /// An animation message (GIF-style).
  ///
  /// * [animation]: The animation to be sent.
  /// * [caption]: Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation; not supported in secret chats.
  /// * [hasSpoiler]: True, if the animation preview must be covered by a spoiler animation; not supported in secret chats.
  const InputMessageAnimation({
    required this.animation,
    this.caption,
    required this.showCaptionAboveMedia,
    required this.hasSpoiler,
  });

  /// The animation to be sent
  final InputAnimation animation;

  /// Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation; not supported in secret chats
  final bool showCaptionAboveMedia;

  /// True, if the animation preview must be covered by a spoiler animation; not supported in secret chats
  final bool hasSpoiler;

  /// Parse from a json
  factory InputMessageAnimation.fromJson(Map<String, dynamic> json) =>
      InputMessageAnimation(
        animation: InputAnimation.fromJson(json['animation']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: The animation to be sent
  /// * [caption]: Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation; not supported in secret chats
  /// * [has_spoiler]: True, if the animation preview must be covered by a spoiler animation; not supported in secret chats
  @override
  InputMessageAnimation copyWith({
    InputAnimation? animation,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
  }) =>
      InputMessageAnimation(
        animation: animation ?? this.animation,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageAudio** *(inputMessageAudio)* - child of InputMessageContent
///
/// An audio message.
///
/// * [audio]: Audio to be sent.
/// * [caption]: Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
final class InputMessageAudio extends InputMessageContent {
  /// **InputMessageAudio** *(inputMessageAudio)* - child of InputMessageContent
  ///
  /// An audio message.
  ///
  /// * [audio]: Audio to be sent.
  /// * [caption]: Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  const InputMessageAudio({
    required this.audio,
    this.caption,
  });

  /// Audio to be sent
  final InputAudio audio;

  /// Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// Parse from a json
  factory InputMessageAudio.fromJson(Map<String, dynamic> json) =>
      InputMessageAudio(
        audio: InputAudio.fromJson(json['audio']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: Audio to be sent
  /// * [caption]: Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  @override
  InputMessageAudio copyWith({
    InputAudio? audio,
    FormattedText? caption,
  }) =>
      InputMessageAudio(
        audio: audio ?? this.audio,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageDocument** *(inputMessageDocument)* - child of InputMessageContent
///
/// A document message (general file).
///
/// * [document]: Document to be sent.
/// * [caption]: Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
final class InputMessageDocument extends InputMessageContent {
  /// **InputMessageDocument** *(inputMessageDocument)* - child of InputMessageContent
  ///
  /// A document message (general file).
  ///
  /// * [document]: Document to be sent.
  /// * [caption]: Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  const InputMessageDocument({
    required this.document,
    this.caption,
  });

  /// Document to be sent
  final InputDocument document;

  /// Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// Parse from a json
  factory InputMessageDocument.fromJson(Map<String, dynamic> json) =>
      InputMessageDocument(
        document: InputDocument.fromJson(json['document']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
      "caption": caption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: Document to be sent
  /// * [caption]: Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  @override
  InputMessageDocument copyWith({
    InputDocument? document,
    FormattedText? caption,
  }) =>
      InputMessageDocument(
        document: document ?? this.document,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessagePaidMedia** *(inputMessagePaidMedia)* - child of InputMessageContent
///
/// A message with paid media; can be used only in channel chats with supergroupFullInfo.has_paid_media_allowed.
///
/// * [starCount]: The number of Telegram Stars that must be paid to see the media; 1-getOption("paid_media_message_star_count_max").
/// * [paidMedia]: The content of the paid media.
/// * [caption]: Message caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media; not supported in secret chats.
/// * [payload]: Bot-provided data for the paid media; bots only.
final class InputMessagePaidMedia extends InputMessageContent {
  /// **InputMessagePaidMedia** *(inputMessagePaidMedia)* - child of InputMessageContent
  ///
  /// A message with paid media; can be used only in channel chats with supergroupFullInfo.has_paid_media_allowed.
  ///
  /// * [starCount]: The number of Telegram Stars that must be paid to see the media; 1-getOption("paid_media_message_star_count_max").
  /// * [paidMedia]: The content of the paid media.
  /// * [caption]: Message caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media; not supported in secret chats.
  /// * [payload]: Bot-provided data for the paid media; bots only.
  const InputMessagePaidMedia({
    required this.starCount,
    required this.paidMedia,
    this.caption,
    required this.showCaptionAboveMedia,
    required this.payload,
  });

  /// The number of Telegram Stars that must be paid to see the media; 1-getOption("paid_media_message_star_count_max")
  final int starCount;

  /// The content of the paid media
  final List<InputPaidMedia> paidMedia;

  /// Message caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// True, if the caption must be shown above the media; otherwise, the caption must be shown below the media; not supported in secret chats
  final bool showCaptionAboveMedia;

  /// Bot-provided data for the paid media; bots only
  final String payload;

  /// Parse from a json
  factory InputMessagePaidMedia.fromJson(Map<String, dynamic> json) =>
      InputMessagePaidMedia(
        starCount: json['star_count'],
        paidMedia: List<InputPaidMedia>.from((json['paid_media'] ?? [])
            .map((item) => InputPaidMedia.fromJson(item))
            .toList()),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        payload: json['payload'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "paid_media": paidMedia.map((i) => i.toJson()).toList(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "payload": payload,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The number of Telegram Stars that must be paid to see the media; 1-getOption("paid_media_message_star_count_max")
  /// * [paid_media]: The content of the paid media
  /// * [caption]: Message caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: True, if the caption must be shown above the media; otherwise, the caption must be shown below the media; not supported in secret chats
  /// * [payload]: Bot-provided data for the paid media; bots only
  @override
  InputMessagePaidMedia copyWith({
    int? starCount,
    List<InputPaidMedia>? paidMedia,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    String? payload,
  }) =>
      InputMessagePaidMedia(
        starCount: starCount ?? this.starCount,
        paidMedia: paidMedia ?? this.paidMedia,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessagePaidMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessagePhoto** *(inputMessagePhoto)* - child of InputMessageContent
///
/// A photo message.
///
/// * [photo]: Photo to be sent.
/// * [caption]: Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo; not supported in secret chats.
/// * [selfDestructType]: Photo self-destruct type; pass null if none; private chats only *(optional)*.
/// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation; not supported in secret chats.
final class InputMessagePhoto extends InputMessageContent {
  /// **InputMessagePhoto** *(inputMessagePhoto)* - child of InputMessageContent
  ///
  /// A photo message.
  ///
  /// * [photo]: Photo to be sent.
  /// * [caption]: Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo; not supported in secret chats.
  /// * [selfDestructType]: Photo self-destruct type; pass null if none; private chats only *(optional)*.
  /// * [hasSpoiler]: True, if the photo preview must be covered by a spoiler animation; not supported in secret chats.
  const InputMessagePhoto({
    required this.photo,
    this.caption,
    required this.showCaptionAboveMedia,
    this.selfDestructType,
    required this.hasSpoiler,
  });

  /// Photo to be sent
  final InputPhoto photo;

  /// Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo; not supported in secret chats
  final bool showCaptionAboveMedia;

  /// Photo self-destruct type; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// True, if the photo preview must be covered by a spoiler animation; not supported in secret chats
  final bool hasSpoiler;

  /// Parse from a json
  factory InputMessagePhoto.fromJson(Map<String, dynamic> json) =>
      InputMessagePhoto(
        photo: InputPhoto.fromJson(json['photo']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "self_destruct_type": selfDestructType?.toJson(),
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo to be sent
  /// * [caption]: Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo; not supported in secret chats
  /// * [self_destruct_type]: Photo self-destruct type; pass null if none; private chats only
  /// * [has_spoiler]: True, if the photo preview must be covered by a spoiler animation; not supported in secret chats
  @override
  InputMessagePhoto copyWith({
    InputPhoto? photo,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    MessageSelfDestructType? selfDestructType,
    bool? hasSpoiler,
  }) =>
      InputMessagePhoto(
        photo: photo ?? this.photo,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        selfDestructType: selfDestructType ?? this.selfDestructType,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessagePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageSticker** *(inputMessageSticker)* - child of InputMessageContent
///
/// A sticker message.
///
/// * [sticker]: Sticker to be sent.
/// * [emoji]: Emoji used to choose the sticker.
final class InputMessageSticker extends InputMessageContent {
  /// **InputMessageSticker** *(inputMessageSticker)* - child of InputMessageContent
  ///
  /// A sticker message.
  ///
  /// * [sticker]: Sticker to be sent.
  /// * [emoji]: Emoji used to choose the sticker.
  const InputMessageSticker({
    required this.sticker,
    required this.emoji,
  });

  /// Sticker to be sent
  final InputSticker sticker;

  /// Emoji used to choose the sticker
  final String emoji;

  /// Parse from a json
  factory InputMessageSticker.fromJson(Map<String, dynamic> json) =>
      InputMessageSticker(
        sticker: InputSticker.fromJson(json['sticker']),
        emoji: json['emoji'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "emoji": emoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker to be sent
  /// * [emoji]: Emoji used to choose the sticker
  @override
  InputMessageSticker copyWith({
    InputSticker? sticker,
    String? emoji,
  }) =>
      InputMessageSticker(
        sticker: sticker ?? this.sticker,
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageVideo** *(inputMessageVideo)* - child of InputMessageContent
///
/// A video message.
///
/// * [video]: Video to be sent.
/// * [caption]: Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video; not supported in secret chats.
/// * [selfDestructType]: Video self-destruct type; pass null if none; private chats only *(optional)*.
/// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation; not supported in secret chats.
final class InputMessageVideo extends InputMessageContent {
  /// **InputMessageVideo** *(inputMessageVideo)* - child of InputMessageContent
  ///
  /// A video message.
  ///
  /// * [video]: Video to be sent.
  /// * [caption]: Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video; not supported in secret chats.
  /// * [selfDestructType]: Video self-destruct type; pass null if none; private chats only *(optional)*.
  /// * [hasSpoiler]: True, if the video preview must be covered by a spoiler animation; not supported in secret chats.
  const InputMessageVideo({
    required this.video,
    this.caption,
    required this.showCaptionAboveMedia,
    this.selfDestructType,
    required this.hasSpoiler,
  });

  /// Video to be sent
  final InputVideo video;

  /// Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// True, if the caption must be shown above the video; otherwise, the caption must be shown below the video; not supported in secret chats
  final bool showCaptionAboveMedia;

  /// Video self-destruct type; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// True, if the video preview must be covered by a spoiler animation; not supported in secret chats
  final bool hasSpoiler;

  /// Parse from a json
  factory InputMessageVideo.fromJson(Map<String, dynamic> json) =>
      InputMessageVideo(
        video: InputVideo.fromJson(json['video']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
        showCaptionAboveMedia: json['show_caption_above_media'],
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
        hasSpoiler: json['has_spoiler'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "self_destruct_type": selfDestructType?.toJson(),
      "has_spoiler": hasSpoiler,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Video to be sent
  /// * [caption]: Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: True, if the caption must be shown above the video; otherwise, the caption must be shown below the video; not supported in secret chats
  /// * [self_destruct_type]: Video self-destruct type; pass null if none; private chats only
  /// * [has_spoiler]: True, if the video preview must be covered by a spoiler animation; not supported in secret chats
  @override
  InputMessageVideo copyWith({
    InputVideo? video,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
    MessageSelfDestructType? selfDestructType,
    bool? hasSpoiler,
  }) =>
      InputMessageVideo(
        video: video ?? this.video,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
        selfDestructType: selfDestructType ?? this.selfDestructType,
        hasSpoiler: hasSpoiler ?? this.hasSpoiler,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageVideoNote** *(inputMessageVideoNote)* - child of InputMessageContent
///
/// A video note message.
///
/// * [videoNote]: Video note to be sent.
/// * [selfDestructType]: Video note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
final class InputMessageVideoNote extends InputMessageContent {
  /// **InputMessageVideoNote** *(inputMessageVideoNote)* - child of InputMessageContent
  ///
  /// A video note message.
  ///
  /// * [videoNote]: Video note to be sent.
  /// * [selfDestructType]: Video note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
  const InputMessageVideoNote({
    required this.videoNote,
    this.selfDestructType,
  });

  /// Video note to be sent
  final InputVideoNote videoNote;

  /// Video note self-destruct type; may be null if none; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// Parse from a json
  factory InputMessageVideoNote.fromJson(Map<String, dynamic> json) =>
      InputMessageVideoNote(
        videoNote: InputVideoNote.fromJson(json['video_note']),
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video_note": videoNote.toJson(),
      "self_destruct_type": selfDestructType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video_note]: Video note to be sent
  /// * [self_destruct_type]: Video note self-destruct type; may be null if none; pass null if none; private chats only
  @override
  InputMessageVideoNote copyWith({
    InputVideoNote? videoNote,
    MessageSelfDestructType? selfDestructType,
  }) =>
      InputMessageVideoNote(
        videoNote: videoNote ?? this.videoNote,
        selfDestructType: selfDestructType ?? this.selfDestructType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageVoiceNote** *(inputMessageVoiceNote)* - child of InputMessageContent
///
/// A voice note message.
///
/// * [voiceNote]: Voice note to be sent.
/// * [caption]: Voice note caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [selfDestructType]: Voice note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
final class InputMessageVoiceNote extends InputMessageContent {
  /// **InputMessageVoiceNote** *(inputMessageVoiceNote)* - child of InputMessageContent
  ///
  /// A voice note message.
  ///
  /// * [voiceNote]: Voice note to be sent.
  /// * [caption]: Voice note caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [selfDestructType]: Voice note self-destruct type; may be null if none; pass null if none; private chats only *(optional)*.
  const InputMessageVoiceNote({
    required this.voiceNote,
    this.caption,
    this.selfDestructType,
  });

  /// Voice note to be sent
  final InputVoiceNote voiceNote;

  /// Voice note caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// Voice note self-destruct type; may be null if none; pass null if none; private chats only
  final MessageSelfDestructType? selfDestructType;

  /// Parse from a json
  factory InputMessageVoiceNote.fromJson(Map<String, dynamic> json) =>
      InputMessageVoiceNote(
        voiceNote: InputVoiceNote.fromJson(json['voice_note']),
        caption: json['caption'] == null
            ? null
            : FormattedText.fromJson(json['caption']),
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote.toJson(),
      "caption": caption?.toJson(),
      "self_destruct_type": selfDestructType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: Voice note to be sent
  /// * [caption]: Voice note caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  /// * [self_destruct_type]: Voice note self-destruct type; may be null if none; pass null if none; private chats only
  @override
  InputMessageVoiceNote copyWith({
    InputVoiceNote? voiceNote,
    FormattedText? caption,
    MessageSelfDestructType? selfDestructType,
  }) =>
      InputMessageVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        caption: caption ?? this.caption,
        selfDestructType: selfDestructType ?? this.selfDestructType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageLiveLocation** *(inputMessageLiveLocation)* - child of InputMessageContent
///
/// A message with a live location.
///
/// * [location]: Initial state of the live location to be sent. Live period must be equal to 0x7FFFFFFF for permanent live locations, or between 60 and 86400.
final class InputMessageLiveLocation extends InputMessageContent {
  /// **InputMessageLiveLocation** *(inputMessageLiveLocation)* - child of InputMessageContent
  ///
  /// A message with a live location.
  ///
  /// * [location]: Initial state of the live location to be sent. Live period must be equal to 0x7FFFFFFF for permanent live locations, or between 60 and 86400.
  const InputMessageLiveLocation({
    required this.location,
  });

  /// Initial state of the live location to be sent. Live period must be equal to 0x7FFFFFFF for permanent live locations, or between 60 and 86400
  final LiveLocation location;

  /// Parse from a json
  factory InputMessageLiveLocation.fromJson(Map<String, dynamic> json) =>
      InputMessageLiveLocation(
        location: LiveLocation.fromJson(json['location']),
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
  /// * [location]: Initial state of the live location to be sent. Live period must be equal to 0x7FFFFFFF for permanent live locations, or between 60 and 86400
  @override
  InputMessageLiveLocation copyWith({
    LiveLocation? location,
  }) =>
      InputMessageLiveLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageLiveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageLocation** *(inputMessageLocation)* - child of InputMessageContent
///
/// A message with a location.
///
/// * [location]: Location to be sent.
final class InputMessageLocation extends InputMessageContent {
  /// **InputMessageLocation** *(inputMessageLocation)* - child of InputMessageContent
  ///
  /// A message with a location.
  ///
  /// * [location]: Location to be sent.
  const InputMessageLocation({
    required this.location,
  });

  /// Location to be sent
  final Location location;

  /// Parse from a json
  factory InputMessageLocation.fromJson(Map<String, dynamic> json) =>
      InputMessageLocation(
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
  /// * [location]: Location to be sent
  @override
  InputMessageLocation copyWith({
    Location? location,
  }) =>
      InputMessageLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageVenue** *(inputMessageVenue)* - child of InputMessageContent
///
/// A message with information about a venue.
///
/// * [venue]: Venue to send.
final class InputMessageVenue extends InputMessageContent {
  /// **InputMessageVenue** *(inputMessageVenue)* - child of InputMessageContent
  ///
  /// A message with information about a venue.
  ///
  /// * [venue]: Venue to send.
  const InputMessageVenue({
    required this.venue,
  });

  /// Venue to send
  final Venue venue;

  /// Parse from a json
  factory InputMessageVenue.fromJson(Map<String, dynamic> json) =>
      InputMessageVenue(
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
  /// * [venue]: Venue to send
  @override
  InputMessageVenue copyWith({
    Venue? venue,
  }) =>
      InputMessageVenue(
        venue: venue ?? this.venue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageContact** *(inputMessageContact)* - child of InputMessageContent
///
/// A message containing a user contact.
///
/// * [contact]: Contact to send.
final class InputMessageContact extends InputMessageContent {
  /// **InputMessageContact** *(inputMessageContact)* - child of InputMessageContent
  ///
  /// A message containing a user contact.
  ///
  /// * [contact]: Contact to send.
  const InputMessageContact({
    required this.contact,
  });

  /// Contact to send
  final Contact contact;

  /// Parse from a json
  factory InputMessageContact.fromJson(Map<String, dynamic> json) =>
      InputMessageContact(
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
  /// * [contact]: Contact to send
  @override
  InputMessageContact copyWith({
    Contact? contact,
  }) =>
      InputMessageContact(
        contact: contact ?? this.contact,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageDice** *(inputMessageDice)* - child of InputMessageContent
///
/// A dice message.
///
/// * [emoji]: Emoji on which the dice throw animation is based.
/// * [clearDraft]: Pass true to delete message draft in the chat.
final class InputMessageDice extends InputMessageContent {
  /// **InputMessageDice** *(inputMessageDice)* - child of InputMessageContent
  ///
  /// A dice message.
  ///
  /// * [emoji]: Emoji on which the dice throw animation is based.
  /// * [clearDraft]: Pass true to delete message draft in the chat.
  const InputMessageDice({
    required this.emoji,
    required this.clearDraft,
  });

  /// Emoji on which the dice throw animation is based
  final String emoji;

  /// Pass true to delete message draft in the chat
  final bool clearDraft;

  /// Parse from a json
  factory InputMessageDice.fromJson(Map<String, dynamic> json) =>
      InputMessageDice(
        emoji: json['emoji'],
        clearDraft: json['clear_draft'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emoji": emoji,
      "clear_draft": clearDraft,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji]: Emoji on which the dice throw animation is based
  /// * [clear_draft]: Pass true to delete message draft in the chat
  @override
  InputMessageDice copyWith({
    String? emoji,
    bool? clearDraft,
  }) =>
      InputMessageDice(
        emoji: emoji ?? this.emoji,
        clearDraft: clearDraft ?? this.clearDraft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageDice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageGame** *(inputMessageGame)* - child of InputMessageContent
///
/// A message with a game; not supported for channels or secret chats.
///
/// * [botUserId]: User identifier of the bot that owns the game.
/// * [gameShortName]: Short name of the game.
final class InputMessageGame extends InputMessageContent {
  /// **InputMessageGame** *(inputMessageGame)* - child of InputMessageContent
  ///
  /// A message with a game; not supported for channels or secret chats.
  ///
  /// * [botUserId]: User identifier of the bot that owns the game.
  /// * [gameShortName]: Short name of the game.
  const InputMessageGame({
    required this.botUserId,
    required this.gameShortName,
  });

  /// User identifier of the bot that owns the game
  final int botUserId;

  /// Short name of the game
  final String gameShortName;

  /// Parse from a json
  factory InputMessageGame.fromJson(Map<String, dynamic> json) =>
      InputMessageGame(
        botUserId: json['bot_user_id'],
        gameShortName: json['game_short_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "game_short_name": gameShortName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot that owns the game
  /// * [game_short_name]: Short name of the game
  @override
  InputMessageGame copyWith({
    int? botUserId,
    String? gameShortName,
  }) =>
      InputMessageGame(
        botUserId: botUserId ?? this.botUserId,
        gameShortName: gameShortName ?? this.gameShortName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageInvoice** *(inputMessageInvoice)* - child of InputMessageContent
///
/// A message with an invoice; can be used only by bots.
///
/// * [invoice]: Invoice.
/// * [title]: Product title; 1-32 characters.
/// * [description]: Product description; 0-255 characters.
/// * [photoUrl]: Product photo URL; optional.
/// * [photoSize]: Product photo size.
/// * [photoWidth]: Product photo width.
/// * [photoHeight]: Product photo height.
/// * [payload]: The invoice payload.
/// * [providerToken]: Payment provider token; may be empty for payments in Telegram Stars.
/// * [providerData]: JSON-encoded data about the invoice, which will be shared with the payment provider.
/// * [startParameter]: Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message.
/// * [paidMedia]: The content of paid media attached to the invoice; pass null if none *(optional)*.
/// * [paidMediaCaption]: Paid media caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
final class InputMessageInvoice extends InputMessageContent {
  /// **InputMessageInvoice** *(inputMessageInvoice)* - child of InputMessageContent
  ///
  /// A message with an invoice; can be used only by bots.
  ///
  /// * [invoice]: Invoice.
  /// * [title]: Product title; 1-32 characters.
  /// * [description]: Product description; 0-255 characters.
  /// * [photoUrl]: Product photo URL; optional.
  /// * [photoSize]: Product photo size.
  /// * [photoWidth]: Product photo width.
  /// * [photoHeight]: Product photo height.
  /// * [payload]: The invoice payload.
  /// * [providerToken]: Payment provider token; may be empty for payments in Telegram Stars.
  /// * [providerData]: JSON-encoded data about the invoice, which will be shared with the payment provider.
  /// * [startParameter]: Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message.
  /// * [paidMedia]: The content of paid media attached to the invoice; pass null if none *(optional)*.
  /// * [paidMediaCaption]: Paid media caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  const InputMessageInvoice({
    required this.invoice,
    required this.title,
    required this.description,
    required this.photoUrl,
    required this.photoSize,
    required this.photoWidth,
    required this.photoHeight,
    required this.payload,
    required this.providerToken,
    required this.providerData,
    required this.startParameter,
    this.paidMedia,
    this.paidMediaCaption,
  });

  /// Invoice
  final Invoice invoice;

  /// Product title; 1-32 characters
  final String title;

  /// Product description; 0-255 characters
  final String description;

  /// Product photo URL; optional
  final String photoUrl;

  /// Product photo size
  final int photoSize;

  /// Product photo width
  final int photoWidth;

  /// Product photo height
  final int photoHeight;

  /// The invoice payload
  final String payload;

  /// Payment provider token; may be empty for payments in Telegram Stars
  final String providerToken;

  /// JSON-encoded data about the invoice, which will be shared with the payment provider
  final String providerData;

  /// Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
  final String startParameter;

  /// The content of paid media attached to the invoice; pass null if none
  final InputPaidMedia? paidMedia;

  /// Paid media caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? paidMediaCaption;

  /// Parse from a json
  factory InputMessageInvoice.fromJson(Map<String, dynamic> json) =>
      InputMessageInvoice(
        invoice: Invoice.fromJson(json['invoice']),
        title: json['title'],
        description: json['description'],
        photoUrl: json['photo_url'],
        photoSize: json['photo_size'],
        photoWidth: json['photo_width'],
        photoHeight: json['photo_height'],
        payload: json['payload'],
        providerToken: json['provider_token'],
        providerData: json['provider_data'],
        startParameter: json['start_parameter'],
        paidMedia: json['paid_media'] == null
            ? null
            : InputPaidMedia.fromJson(json['paid_media']),
        paidMediaCaption: json['paid_media_caption'] == null
            ? null
            : FormattedText.fromJson(json['paid_media_caption']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invoice": invoice.toJson(),
      "title": title,
      "description": description,
      "photo_url": photoUrl,
      "photo_size": photoSize,
      "photo_width": photoWidth,
      "photo_height": photoHeight,
      "payload": payload,
      "provider_token": providerToken,
      "provider_data": providerData,
      "start_parameter": startParameter,
      "paid_media": paidMedia?.toJson(),
      "paid_media_caption": paidMediaCaption?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invoice]: Invoice
  /// * [title]: Product title; 1-32 characters
  /// * [description]: Product description; 0-255 characters
  /// * [photo_url]: Product photo URL; optional
  /// * [photo_size]: Product photo size
  /// * [photo_width]: Product photo width
  /// * [photo_height]: Product photo height
  /// * [payload]: The invoice payload
  /// * [provider_token]: Payment provider token; may be empty for payments in Telegram Stars
  /// * [provider_data]: JSON-encoded data about the invoice, which will be shared with the payment provider
  /// * [start_parameter]: Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
  /// * [paid_media]: The content of paid media attached to the invoice; pass null if none
  /// * [paid_media_caption]: Paid media caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
  @override
  InputMessageInvoice copyWith({
    Invoice? invoice,
    String? title,
    String? description,
    String? photoUrl,
    int? photoSize,
    int? photoWidth,
    int? photoHeight,
    String? payload,
    String? providerToken,
    String? providerData,
    String? startParameter,
    InputPaidMedia? paidMedia,
    FormattedText? paidMediaCaption,
  }) =>
      InputMessageInvoice(
        invoice: invoice ?? this.invoice,
        title: title ?? this.title,
        description: description ?? this.description,
        photoUrl: photoUrl ?? this.photoUrl,
        photoSize: photoSize ?? this.photoSize,
        photoWidth: photoWidth ?? this.photoWidth,
        photoHeight: photoHeight ?? this.photoHeight,
        payload: payload ?? this.payload,
        providerToken: providerToken ?? this.providerToken,
        providerData: providerData ?? this.providerData,
        startParameter: startParameter ?? this.startParameter,
        paidMedia: paidMedia ?? this.paidMedia,
        paidMediaCaption: paidMediaCaption ?? this.paidMediaCaption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessagePoll** *(inputMessagePoll)* - child of InputMessageContent
///
/// A message with a poll. Polls can't be sent to secret chats and channel direct messages chats. Polls can be sent to a private chat only if the chat is a chat with a bot or the Saved Messages chat.
///
/// * [question]: Poll question; 1-255 characters (up to 300 characters for bots). Only custom emoji entities are allowed to be added and only by Premium users.
/// * [options]: List of poll answer options; 1-getOption("poll_answer_count_max") options.
/// * [description]: Poll description; pass null to use an empty description; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [media]: Media attached to the poll; pass null if none. Must be one of the following types: inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation,. inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
/// * [isAnonymous]: True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels.
/// * [allowsMultipleAnswers]: True, if multiple answer options can be chosen simultaneously.
/// * [allowsRevoting]: True, if the poll can be answered multiple times.
/// * [membersOnly]: True, if only the users that are members of the chat for more than a day will be able to vote; for channel chats only.
/// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote; for channel chats only. If empty, then all users can participate in the poll.. There can be up to getOption("poll_country_count_max") chosen countries.
/// * [shuffleOptions]: True, if poll options must be shown in a fixed random order.
/// * [hideResultsUntilCloses]: True, if the poll results will appear only after the poll closes.
/// * [type]: Type of the poll.
/// * [openPeriod]: Amount of time the poll will be active after creation, in seconds; 0-getOption("poll_open_period_max"); pass 0 if not specified.
/// * [closeDate]: Point in time (Unix timestamp) when the poll will automatically be closed; must be 0-getOption("poll_open_period_max") seconds in the future; pass 0 if not specified.
/// * [isClosed]: True, if the poll needs to be sent already closed; for bots only.
final class InputMessagePoll extends InputMessageContent {
  /// **InputMessagePoll** *(inputMessagePoll)* - child of InputMessageContent
  ///
  /// A message with a poll. Polls can't be sent to secret chats and channel direct messages chats. Polls can be sent to a private chat only if the chat is a chat with a bot or the Saved Messages chat.
  ///
  /// * [question]: Poll question; 1-255 characters (up to 300 characters for bots). Only custom emoji entities are allowed to be added and only by Premium users.
  /// * [options]: List of poll answer options; 1-getOption("poll_answer_count_max") options.
  /// * [description]: Poll description; pass null to use an empty description; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [media]: Media attached to the poll; pass null if none. Must be one of the following types: inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation,. inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption *(optional)*.
  /// * [isAnonymous]: True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels.
  /// * [allowsMultipleAnswers]: True, if multiple answer options can be chosen simultaneously.
  /// * [allowsRevoting]: True, if the poll can be answered multiple times.
  /// * [membersOnly]: True, if only the users that are members of the chat for more than a day will be able to vote; for channel chats only.
  /// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote; for channel chats only. If empty, then all users can participate in the poll.. There can be up to getOption("poll_country_count_max") chosen countries.
  /// * [shuffleOptions]: True, if poll options must be shown in a fixed random order.
  /// * [hideResultsUntilCloses]: True, if the poll results will appear only after the poll closes.
  /// * [type]: Type of the poll.
  /// * [openPeriod]: Amount of time the poll will be active after creation, in seconds; 0-getOption("poll_open_period_max"); pass 0 if not specified.
  /// * [closeDate]: Point in time (Unix timestamp) when the poll will automatically be closed; must be 0-getOption("poll_open_period_max") seconds in the future; pass 0 if not specified.
  /// * [isClosed]: True, if the poll needs to be sent already closed; for bots only.
  const InputMessagePoll({
    required this.question,
    required this.options,
    this.description,
    this.media,
    required this.isAnonymous,
    required this.allowsMultipleAnswers,
    required this.allowsRevoting,
    required this.membersOnly,
    required this.countryCodes,
    required this.shuffleOptions,
    required this.hideResultsUntilCloses,
    required this.type,
    required this.openPeriod,
    required this.closeDate,
    required this.isClosed,
  });

  /// Poll question; 1-255 characters (up to 300 characters for bots). Only custom emoji entities are allowed to be added and only by Premium users
  final FormattedText question;

  /// List of poll answer options; 1-getOption("poll_answer_count_max") options
  final List<InputPollOption> options;

  /// Poll description; pass null to use an empty description; 0-getOption("message_caption_length_max") characters
  final FormattedText? description;

  /// Media attached to the poll; pass null if none. Must be one of the following types: inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation,. inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption
  final InputPollMedia? media;

  /// True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
  final bool isAnonymous;

  /// True, if multiple answer options can be chosen simultaneously
  final bool allowsMultipleAnswers;

  /// True, if the poll can be answered multiple times
  final bool allowsRevoting;

  /// True, if only the users that are members of the chat for more than a day will be able to vote; for channel chats only
  final bool membersOnly;

  /// The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote; for channel chats only. If empty, then all users can participate in the poll.. There can be up to getOption("poll_country_count_max") chosen countries
  final List<String> countryCodes;

  /// True, if poll options must be shown in a fixed random order
  final bool shuffleOptions;

  /// True, if the poll results will appear only after the poll closes
  final bool hideResultsUntilCloses;

  /// Type of the poll
  final InputPollType type;

  /// Amount of time the poll will be active after creation, in seconds; 0-getOption("poll_open_period_max"); pass 0 if not specified
  final int openPeriod;

  /// Point in time (Unix timestamp) when the poll will automatically be closed; must be 0-getOption("poll_open_period_max") seconds in the future; pass 0 if not specified
  final int closeDate;

  /// True, if the poll needs to be sent already closed; for bots only
  final bool isClosed;

  /// Parse from a json
  factory InputMessagePoll.fromJson(Map<String, dynamic> json) =>
      InputMessagePoll(
        question: FormattedText.fromJson(json['question']),
        options: List<InputPollOption>.from((json['options'] ?? [])
            .map((item) => InputPollOption.fromJson(item))
            .toList()),
        description: json['description'] == null
            ? null
            : FormattedText.fromJson(json['description']),
        media: json['media'] == null
            ? null
            : InputPollMedia.fromJson(json['media']),
        isAnonymous: json['is_anonymous'],
        allowsMultipleAnswers: json['allows_multiple_answers'],
        allowsRevoting: json['allows_revoting'],
        membersOnly: json['members_only'],
        countryCodes: List<String>.from(
            (json['country_codes'] ?? []).map((item) => item).toList()),
        shuffleOptions: json['shuffle_options'],
        hideResultsUntilCloses: json['hide_results_until_closes'],
        type: InputPollType.fromJson(json['type']),
        openPeriod: json['open_period'],
        closeDate: json['close_date'],
        isClosed: json['is_closed'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "question": question.toJson(),
      "options": options.map((i) => i.toJson()).toList(),
      "description": description?.toJson(),
      "media": media?.toJson(),
      "is_anonymous": isAnonymous,
      "allows_multiple_answers": allowsMultipleAnswers,
      "allows_revoting": allowsRevoting,
      "members_only": membersOnly,
      "country_codes": countryCodes.map((i) => i).toList(),
      "shuffle_options": shuffleOptions,
      "hide_results_until_closes": hideResultsUntilCloses,
      "type": type.toJson(),
      "open_period": openPeriod,
      "close_date": closeDate,
      "is_closed": isClosed,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [question]: Poll question; 1-255 characters (up to 300 characters for bots). Only custom emoji entities are allowed to be added and only by Premium users
  /// * [options]: List of poll answer options; 1-getOption("poll_answer_count_max") options
  /// * [description]: Poll description; pass null to use an empty description; 0-getOption("message_caption_length_max") characters
  /// * [media]: Media attached to the poll; pass null if none. Must be one of the following types: inputPollMediaAnimation, inputPollMediaAudio, inputPollMediaDocument, inputPollMediaLocation,. inputPollMediaPhoto, inputPollMediaVenue, or inputPollMediaVideo without caption
  /// * [is_anonymous]: True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
  /// * [allows_multiple_answers]: True, if multiple answer options can be chosen simultaneously
  /// * [allows_revoting]: True, if the poll can be answered multiple times
  /// * [members_only]: True, if only the users that are members of the chat for more than a day will be able to vote; for channel chats only
  /// * [country_codes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be able to vote; for channel chats only. If empty, then all users can participate in the poll.. There can be up to getOption("poll_country_count_max") chosen countries
  /// * [shuffle_options]: True, if poll options must be shown in a fixed random order
  /// * [hide_results_until_closes]: True, if the poll results will appear only after the poll closes
  /// * [type]: Type of the poll
  /// * [open_period]: Amount of time the poll will be active after creation, in seconds; 0-getOption("poll_open_period_max"); pass 0 if not specified
  /// * [close_date]: Point in time (Unix timestamp) when the poll will automatically be closed; must be 0-getOption("poll_open_period_max") seconds in the future; pass 0 if not specified
  /// * [is_closed]: True, if the poll needs to be sent already closed; for bots only
  @override
  InputMessagePoll copyWith({
    FormattedText? question,
    List<InputPollOption>? options,
    FormattedText? description,
    InputPollMedia? media,
    bool? isAnonymous,
    bool? allowsMultipleAnswers,
    bool? allowsRevoting,
    bool? membersOnly,
    List<String>? countryCodes,
    bool? shuffleOptions,
    bool? hideResultsUntilCloses,
    InputPollType? type,
    int? openPeriod,
    int? closeDate,
    bool? isClosed,
  }) =>
      InputMessagePoll(
        question: question ?? this.question,
        options: options ?? this.options,
        description: description ?? this.description,
        media: media ?? this.media,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        allowsMultipleAnswers:
            allowsMultipleAnswers ?? this.allowsMultipleAnswers,
        allowsRevoting: allowsRevoting ?? this.allowsRevoting,
        membersOnly: membersOnly ?? this.membersOnly,
        countryCodes: countryCodes ?? this.countryCodes,
        shuffleOptions: shuffleOptions ?? this.shuffleOptions,
        hideResultsUntilCloses:
            hideResultsUntilCloses ?? this.hideResultsUntilCloses,
        type: type ?? this.type,
        openPeriod: openPeriod ?? this.openPeriod,
        closeDate: closeDate ?? this.closeDate,
        isClosed: isClosed ?? this.isClosed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessagePoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageStakeDice** *(inputMessageStakeDice)* - child of InputMessageContent
///
/// A stake dice message.
///
/// * [stateHash]: Hash of the stake dice state. The state hash can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState.
/// * [stakeGramAmount]: The TON Gram amount that will be staked; in the smallest units of the currency. Must be in the range. getOption("stake_dice_stake_amount_min")-getOption("stake_dice_stake_amount_max").
/// * [clearDraft]: Pass true to delete message draft in the chat.
final class InputMessageStakeDice extends InputMessageContent {
  /// **InputMessageStakeDice** *(inputMessageStakeDice)* - child of InputMessageContent
  ///
  /// A stake dice message.
  ///
  /// * [stateHash]: Hash of the stake dice state. The state hash can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState.
  /// * [stakeGramAmount]: The TON Gram amount that will be staked; in the smallest units of the currency. Must be in the range. getOption("stake_dice_stake_amount_min")-getOption("stake_dice_stake_amount_max").
  /// * [clearDraft]: Pass true to delete message draft in the chat.
  const InputMessageStakeDice({
    required this.stateHash,
    required this.stakeGramAmount,
    required this.clearDraft,
  });

  /// Hash of the stake dice state. The state hash can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState
  final String stateHash;

  /// The TON Gram amount that will be staked; in the smallest units of the currency. Must be in the range. getOption("stake_dice_stake_amount_min")-getOption("stake_dice_stake_amount_max")
  final int stakeGramAmount;

  /// Pass true to delete message draft in the chat
  final bool clearDraft;

  /// Parse from a json
  factory InputMessageStakeDice.fromJson(Map<String, dynamic> json) =>
      InputMessageStakeDice(
        stateHash: json['state_hash'],
        stakeGramAmount: json['stake_gram_amount'],
        clearDraft: json['clear_draft'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "state_hash": stateHash,
      "stake_gram_amount": stakeGramAmount,
      "clear_draft": clearDraft,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [state_hash]: Hash of the stake dice state. The state hash can be used only if it was received recently enough. Otherwise, a new state must be requested using getStakeDiceState
  /// * [stake_gram_amount]: The TON Gram amount that will be staked; in the smallest units of the currency. Must be in the range. getOption("stake_dice_stake_amount_min")-getOption("stake_dice_stake_amount_max")
  /// * [clear_draft]: Pass true to delete message draft in the chat
  @override
  InputMessageStakeDice copyWith({
    String? stateHash,
    int? stakeGramAmount,
    bool? clearDraft,
  }) =>
      InputMessageStakeDice(
        stateHash: stateHash ?? this.stateHash,
        stakeGramAmount: stakeGramAmount ?? this.stakeGramAmount,
        clearDraft: clearDraft ?? this.clearDraft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageStakeDice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageStory** *(inputMessageStory)* - child of InputMessageContent
///
/// A message with a forwarded story. Stories can't be forwarded to secret chats. A story can be forwarded only if story.can_be_forwarded.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
final class InputMessageStory extends InputMessageContent {
  /// **InputMessageStory** *(inputMessageStory)* - child of InputMessageContent
  ///
  /// A message with a forwarded story. Stories can't be forwarded to secret chats. A story can be forwarded only if story.can_be_forwarded.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  const InputMessageStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// Parse from a json
  factory InputMessageStory.fromJson(Map<String, dynamic> json) =>
      InputMessageStory(
        storyPosterChatId: json['story_poster_chat_id'],
        storyId: json['story_id'],
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
  InputMessageStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      InputMessageStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageChecklist** *(inputMessageChecklist)* - child of InputMessageContent
///
/// A message with a checklist. Checklists can't be sent to secret chats, channel chats and channel direct messages chats; for Telegram Premium users only.
///
/// * [checklist]: The checklist to send.
final class InputMessageChecklist extends InputMessageContent {
  /// **InputMessageChecklist** *(inputMessageChecklist)* - child of InputMessageContent
  ///
  /// A message with a checklist. Checklists can't be sent to secret chats, channel chats and channel direct messages chats; for Telegram Premium users only.
  ///
  /// * [checklist]: The checklist to send.
  const InputMessageChecklist({
    required this.checklist,
  });

  /// The checklist to send
  final InputChecklist checklist;

  /// Parse from a json
  factory InputMessageChecklist.fromJson(Map<String, dynamic> json) =>
      InputMessageChecklist(
        checklist: InputChecklist.fromJson(json['checklist']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "checklist": checklist.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [checklist]: The checklist to send
  @override
  InputMessageChecklist copyWith({
    InputChecklist? checklist,
  }) =>
      InputMessageChecklist(
        checklist: checklist ?? this.checklist,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageChecklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageForwarded** *(inputMessageForwarded)* - child of InputMessageContent
///
/// A forwarded message.
///
/// * [fromChatId]: Identifier for the chat this forwarded message came from.
/// * [messageId]: Identifier of the message to forward. A message can be forwarded only if messageProperties.can_be_forwarded.
/// * [inGameShare]: Pass true if a game message is being shared from a launched game; applies only to game messages.
/// * [replaceVideoStartTimestamp]: Pass true to replace video start timestamp in the forwarded message.
/// * [newVideoStartTimestamp]: The new video start timestamp; ignored if replace_video_start_timestamp == false.
/// * [copyOptions]: Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual *(optional)*.
final class InputMessageForwarded extends InputMessageContent {
  /// **InputMessageForwarded** *(inputMessageForwarded)* - child of InputMessageContent
  ///
  /// A forwarded message.
  ///
  /// * [fromChatId]: Identifier for the chat this forwarded message came from.
  /// * [messageId]: Identifier of the message to forward. A message can be forwarded only if messageProperties.can_be_forwarded.
  /// * [inGameShare]: Pass true if a game message is being shared from a launched game; applies only to game messages.
  /// * [replaceVideoStartTimestamp]: Pass true to replace video start timestamp in the forwarded message.
  /// * [newVideoStartTimestamp]: The new video start timestamp; ignored if replace_video_start_timestamp == false.
  /// * [copyOptions]: Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual *(optional)*.
  const InputMessageForwarded({
    required this.fromChatId,
    required this.messageId,
    required this.inGameShare,
    required this.replaceVideoStartTimestamp,
    required this.newVideoStartTimestamp,
    this.copyOptions,
  });

  /// Identifier for the chat this forwarded message came from
  final int fromChatId;

  /// Identifier of the message to forward. A message can be forwarded only if messageProperties.can_be_forwarded
  final int messageId;

  /// Pass true if a game message is being shared from a launched game; applies only to game messages
  final bool inGameShare;

  /// Pass true to replace video start timestamp in the forwarded message
  final bool replaceVideoStartTimestamp;

  /// The new video start timestamp; ignored if replace_video_start_timestamp == false
  final int newVideoStartTimestamp;

  /// Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual
  final MessageCopyOptions? copyOptions;

  /// Parse from a json
  factory InputMessageForwarded.fromJson(Map<String, dynamic> json) =>
      InputMessageForwarded(
        fromChatId: json['from_chat_id'],
        messageId: json['message_id'],
        inGameShare: json['in_game_share'],
        replaceVideoStartTimestamp: json['replace_video_start_timestamp'],
        newVideoStartTimestamp: json['new_video_start_timestamp'],
        copyOptions: json['copy_options'] == null
            ? null
            : MessageCopyOptions.fromJson(json['copy_options']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "from_chat_id": fromChatId,
      "message_id": messageId,
      "in_game_share": inGameShare,
      "replace_video_start_timestamp": replaceVideoStartTimestamp,
      "new_video_start_timestamp": newVideoStartTimestamp,
      "copy_options": copyOptions?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [from_chat_id]: Identifier for the chat this forwarded message came from
  /// * [message_id]: Identifier of the message to forward. A message can be forwarded only if messageProperties.can_be_forwarded
  /// * [in_game_share]: Pass true if a game message is being shared from a launched game; applies only to game messages
  /// * [replace_video_start_timestamp]: Pass true to replace video start timestamp in the forwarded message
  /// * [new_video_start_timestamp]: The new video start timestamp; ignored if replace_video_start_timestamp == false
  /// * [copy_options]: Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual
  @override
  InputMessageForwarded copyWith({
    int? fromChatId,
    int? messageId,
    bool? inGameShare,
    bool? replaceVideoStartTimestamp,
    int? newVideoStartTimestamp,
    MessageCopyOptions? copyOptions,
  }) =>
      InputMessageForwarded(
        fromChatId: fromChatId ?? this.fromChatId,
        messageId: messageId ?? this.messageId,
        inGameShare: inGameShare ?? this.inGameShare,
        replaceVideoStartTimestamp:
            replaceVideoStartTimestamp ?? this.replaceVideoStartTimestamp,
        newVideoStartTimestamp:
            newVideoStartTimestamp ?? this.newVideoStartTimestamp,
        copyOptions: copyOptions ?? this.copyOptions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageForwarded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
