part of '../tdapi.dart';

/// **PushMessageContent** *(pushMessageContent)* - parent
///
/// Contains content of a push message notification.
sealed class PushMessageContent extends TdObject {
  /// **PushMessageContent** *(pushMessageContent)* - parent
  ///
  /// Contains content of a push message notification.
  const PushMessageContent();

  /// a PushMessageContent return type can be :
  /// * [PushMessageContentHidden]
  /// * [PushMessageContentAnimation]
  /// * [PushMessageContentAudio]
  /// * [PushMessageContentContact]
  /// * [PushMessageContentContactRegistered]
  /// * [PushMessageContentDocument]
  /// * [PushMessageContentGame]
  /// * [PushMessageContentGameScore]
  /// * [PushMessageContentInvoice]
  /// * [PushMessageContentLocation]
  /// * [PushMessageContentPaidMedia]
  /// * [PushMessageContentPhoto]
  /// * [PushMessageContentPoll]
  /// * [PushMessageContentPremiumGiftCode]
  /// * [PushMessageContentGiveaway]
  /// * [PushMessageContentTonWalletTransfer]
  /// * [PushMessageContentTonConnectRequest]
  /// * [PushMessageContentGift]
  /// * [PushMessageContentUpgradedGift]
  /// * [PushMessageContentScreenshotTaken]
  /// * [PushMessageContentSticker]
  /// * [PushMessageContentStory]
  /// * [PushMessageContentText]
  /// * [PushMessageContentChecklist]
  /// * [PushMessageContentVideo]
  /// * [PushMessageContentVideoNote]
  /// * [PushMessageContentVoiceNote]
  /// * [PushMessageContentBasicGroupChatCreate]
  /// * [PushMessageContentVideoChatStarted]
  /// * [PushMessageContentVideoChatEnded]
  /// * [PushMessageContentInviteVideoChatParticipants]
  /// * [PushMessageContentChatAddMembers]
  /// * [PushMessageContentChatChangePhoto]
  /// * [PushMessageContentChatChangeTitle]
  /// * [PushMessageContentChatSetBackground]
  /// * [PushMessageContentChatSetTheme]
  /// * [PushMessageContentChatDeleteMember]
  /// * [PushMessageContentChatJoinByLink]
  /// * [PushMessageContentChatJoinByRequest]
  /// * [PushMessageContentRecurringPayment]
  /// * [PushMessageContentSuggestProfilePhoto]
  /// * [PushMessageContentSuggestBirthdate]
  /// * [PushMessageContentProximityAlertTriggered]
  /// * [PushMessageContentChecklistTasksAdded]
  /// * [PushMessageContentChecklistTasksDone]
  /// * [PushMessageContentPollOptionAdded]
  /// * [PushMessageContentMessageForwards]
  /// * [PushMessageContentMediaAlbum]
  factory PushMessageContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PushMessageContentHidden.defaultObjectId:
        return PushMessageContentHidden.fromJson(json);
      case PushMessageContentAnimation.defaultObjectId:
        return PushMessageContentAnimation.fromJson(json);
      case PushMessageContentAudio.defaultObjectId:
        return PushMessageContentAudio.fromJson(json);
      case PushMessageContentContact.defaultObjectId:
        return PushMessageContentContact.fromJson(json);
      case PushMessageContentContactRegistered.defaultObjectId:
        return PushMessageContentContactRegistered.fromJson(json);
      case PushMessageContentDocument.defaultObjectId:
        return PushMessageContentDocument.fromJson(json);
      case PushMessageContentGame.defaultObjectId:
        return PushMessageContentGame.fromJson(json);
      case PushMessageContentGameScore.defaultObjectId:
        return PushMessageContentGameScore.fromJson(json);
      case PushMessageContentInvoice.defaultObjectId:
        return PushMessageContentInvoice.fromJson(json);
      case PushMessageContentLocation.defaultObjectId:
        return PushMessageContentLocation.fromJson(json);
      case PushMessageContentPaidMedia.defaultObjectId:
        return PushMessageContentPaidMedia.fromJson(json);
      case PushMessageContentPhoto.defaultObjectId:
        return PushMessageContentPhoto.fromJson(json);
      case PushMessageContentPoll.defaultObjectId:
        return PushMessageContentPoll.fromJson(json);
      case PushMessageContentPremiumGiftCode.defaultObjectId:
        return PushMessageContentPremiumGiftCode.fromJson(json);
      case PushMessageContentGiveaway.defaultObjectId:
        return PushMessageContentGiveaway.fromJson(json);
      case PushMessageContentTonWalletTransfer.defaultObjectId:
        return PushMessageContentTonWalletTransfer.fromJson(json);
      case PushMessageContentTonConnectRequest.defaultObjectId:
        return PushMessageContentTonConnectRequest.fromJson(json);
      case PushMessageContentGift.defaultObjectId:
        return PushMessageContentGift.fromJson(json);
      case PushMessageContentUpgradedGift.defaultObjectId:
        return PushMessageContentUpgradedGift.fromJson(json);
      case PushMessageContentScreenshotTaken.defaultObjectId:
        return PushMessageContentScreenshotTaken.fromJson(json);
      case PushMessageContentSticker.defaultObjectId:
        return PushMessageContentSticker.fromJson(json);
      case PushMessageContentStory.defaultObjectId:
        return PushMessageContentStory.fromJson(json);
      case PushMessageContentText.defaultObjectId:
        return PushMessageContentText.fromJson(json);
      case PushMessageContentChecklist.defaultObjectId:
        return PushMessageContentChecklist.fromJson(json);
      case PushMessageContentVideo.defaultObjectId:
        return PushMessageContentVideo.fromJson(json);
      case PushMessageContentVideoNote.defaultObjectId:
        return PushMessageContentVideoNote.fromJson(json);
      case PushMessageContentVoiceNote.defaultObjectId:
        return PushMessageContentVoiceNote.fromJson(json);
      case PushMessageContentBasicGroupChatCreate.defaultObjectId:
        return PushMessageContentBasicGroupChatCreate.fromJson(json);
      case PushMessageContentVideoChatStarted.defaultObjectId:
        return PushMessageContentVideoChatStarted.fromJson(json);
      case PushMessageContentVideoChatEnded.defaultObjectId:
        return PushMessageContentVideoChatEnded.fromJson(json);
      case PushMessageContentInviteVideoChatParticipants.defaultObjectId:
        return PushMessageContentInviteVideoChatParticipants.fromJson(json);
      case PushMessageContentChatAddMembers.defaultObjectId:
        return PushMessageContentChatAddMembers.fromJson(json);
      case PushMessageContentChatChangePhoto.defaultObjectId:
        return PushMessageContentChatChangePhoto.fromJson(json);
      case PushMessageContentChatChangeTitle.defaultObjectId:
        return PushMessageContentChatChangeTitle.fromJson(json);
      case PushMessageContentChatSetBackground.defaultObjectId:
        return PushMessageContentChatSetBackground.fromJson(json);
      case PushMessageContentChatSetTheme.defaultObjectId:
        return PushMessageContentChatSetTheme.fromJson(json);
      case PushMessageContentChatDeleteMember.defaultObjectId:
        return PushMessageContentChatDeleteMember.fromJson(json);
      case PushMessageContentChatJoinByLink.defaultObjectId:
        return PushMessageContentChatJoinByLink.fromJson(json);
      case PushMessageContentChatJoinByRequest.defaultObjectId:
        return PushMessageContentChatJoinByRequest.fromJson(json);
      case PushMessageContentRecurringPayment.defaultObjectId:
        return PushMessageContentRecurringPayment.fromJson(json);
      case PushMessageContentSuggestProfilePhoto.defaultObjectId:
        return PushMessageContentSuggestProfilePhoto.fromJson(json);
      case PushMessageContentSuggestBirthdate.defaultObjectId:
        return PushMessageContentSuggestBirthdate.fromJson(json);
      case PushMessageContentProximityAlertTriggered.defaultObjectId:
        return PushMessageContentProximityAlertTriggered.fromJson(json);
      case PushMessageContentChecklistTasksAdded.defaultObjectId:
        return PushMessageContentChecklistTasksAdded.fromJson(json);
      case PushMessageContentChecklistTasksDone.defaultObjectId:
        return PushMessageContentChecklistTasksDone.fromJson(json);
      case PushMessageContentPollOptionAdded.defaultObjectId:
        return PushMessageContentPollOptionAdded.fromJson(json);
      case PushMessageContentMessageForwards.defaultObjectId:
        return PushMessageContentMessageForwards.fromJson(json);
      case PushMessageContentMediaAlbum.defaultObjectId:
        return PushMessageContentMediaAlbum.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PushMessageContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PushMessageContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentHidden** *(pushMessageContentHidden)* - child of PushMessageContent
///
/// A general message with hidden content.
///
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentHidden extends PushMessageContent {
  /// **PushMessageContentHidden** *(pushMessageContentHidden)* - child of PushMessageContent
  ///
  /// A general message with hidden content.
  ///
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentHidden({
    required this.isPinned,
  });

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentHidden.fromJson(Map<String, dynamic> json) =>
      PushMessageContentHidden(
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentHidden copyWith({
    bool? isPinned,
  }) =>
      PushMessageContentHidden(
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentHidden';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentAnimation** *(pushMessageContentAnimation)* - child of PushMessageContent
///
/// An animation message (GIF-style).
///
/// * [animation]: Message content; may be null *(optional)*.
/// * [caption]: Animation caption.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentAnimation extends PushMessageContent {
  /// **PushMessageContentAnimation** *(pushMessageContentAnimation)* - child of PushMessageContent
  ///
  /// An animation message (GIF-style).
  ///
  /// * [animation]: Message content; may be null *(optional)*.
  /// * [caption]: Animation caption.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentAnimation({
    this.animation,
    required this.caption,
    required this.isPinned,
  });

  /// Message content; may be null
  final Animation? animation;

  /// Animation caption
  final String caption;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentAnimation.fromJson(Map<String, dynamic> json) =>
      PushMessageContentAnimation(
        animation: json['animation'] == null
            ? null
            : Animation.fromJson(json['animation']),
        caption: json['caption'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation?.toJson(),
      "caption": caption,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: Message content; may be null
  /// * [caption]: Animation caption
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentAnimation copyWith({
    Animation? animation,
    String? caption,
    bool? isPinned,
  }) =>
      PushMessageContentAnimation(
        animation: animation ?? this.animation,
        caption: caption ?? this.caption,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentAudio** *(pushMessageContentAudio)* - child of PushMessageContent
///
/// An audio message.
///
/// * [audio]: Message content; may be null *(optional)*.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentAudio extends PushMessageContent {
  /// **PushMessageContentAudio** *(pushMessageContentAudio)* - child of PushMessageContent
  ///
  /// An audio message.
  ///
  /// * [audio]: Message content; may be null *(optional)*.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentAudio({
    this.audio,
    required this.isPinned,
  });

  /// Message content; may be null
  final Audio? audio;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentAudio.fromJson(Map<String, dynamic> json) =>
      PushMessageContentAudio(
        audio: json['audio'] == null ? null : Audio.fromJson(json['audio']),
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio?.toJson(),
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: Message content; may be null
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentAudio copyWith({
    Audio? audio,
    bool? isPinned,
  }) =>
      PushMessageContentAudio(
        audio: audio ?? this.audio,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentContact** *(pushMessageContentContact)* - child of PushMessageContent
///
/// A message with a user contact.
///
/// * [name]: Contact's name.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentContact extends PushMessageContent {
  /// **PushMessageContentContact** *(pushMessageContentContact)* - child of PushMessageContent
  ///
  /// A message with a user contact.
  ///
  /// * [name]: Contact's name.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentContact({
    required this.name,
    required this.isPinned,
  });

  /// Contact's name
  final String name;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentContact.fromJson(Map<String, dynamic> json) =>
      PushMessageContentContact(
        name: json['name'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Contact's name
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentContact copyWith({
    String? name,
    bool? isPinned,
  }) =>
      PushMessageContentContact(
        name: name ?? this.name,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentContactRegistered** *(pushMessageContentContactRegistered)* - child of PushMessageContent
///
/// A contact has registered with Telegram.
///
/// * [asPremiumAccount]: True, if the user joined Telegram as a Telegram Premium account.
final class PushMessageContentContactRegistered extends PushMessageContent {
  /// **PushMessageContentContactRegistered** *(pushMessageContentContactRegistered)* - child of PushMessageContent
  ///
  /// A contact has registered with Telegram.
  ///
  /// * [asPremiumAccount]: True, if the user joined Telegram as a Telegram Premium account.
  const PushMessageContentContactRegistered({
    required this.asPremiumAccount,
  });

  /// True, if the user joined Telegram as a Telegram Premium account
  final bool asPremiumAccount;

  /// Parse from a json
  factory PushMessageContentContactRegistered.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentContactRegistered(
        asPremiumAccount: json['as_premium_account'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "as_premium_account": asPremiumAccount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [as_premium_account]: True, if the user joined Telegram as a Telegram Premium account
  @override
  PushMessageContentContactRegistered copyWith({
    bool? asPremiumAccount,
  }) =>
      PushMessageContentContactRegistered(
        asPremiumAccount: asPremiumAccount ?? this.asPremiumAccount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentContactRegistered';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentDocument** *(pushMessageContentDocument)* - child of PushMessageContent
///
/// A document message (a general file).
///
/// * [document]: Message content; may be null *(optional)*.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentDocument extends PushMessageContent {
  /// **PushMessageContentDocument** *(pushMessageContentDocument)* - child of PushMessageContent
  ///
  /// A document message (a general file).
  ///
  /// * [document]: Message content; may be null *(optional)*.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentDocument({
    this.document,
    required this.isPinned,
  });

  /// Message content; may be null
  final Document? document;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentDocument.fromJson(Map<String, dynamic> json) =>
      PushMessageContentDocument(
        document: json['document'] == null
            ? null
            : Document.fromJson(json['document']),
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document?.toJson(),
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: Message content; may be null
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentDocument copyWith({
    Document? document,
    bool? isPinned,
  }) =>
      PushMessageContentDocument(
        document: document ?? this.document,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentGame** *(pushMessageContentGame)* - child of PushMessageContent
///
/// A message with a game.
///
/// * [title]: Game title, empty for pinned game message.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentGame extends PushMessageContent {
  /// **PushMessageContentGame** *(pushMessageContentGame)* - child of PushMessageContent
  ///
  /// A message with a game.
  ///
  /// * [title]: Game title, empty for pinned game message.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentGame({
    required this.title,
    required this.isPinned,
  });

  /// Game title, empty for pinned game message
  final String title;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentGame.fromJson(Map<String, dynamic> json) =>
      PushMessageContentGame(
        title: json['title'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Game title, empty for pinned game message
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentGame copyWith({
    String? title,
    bool? isPinned,
  }) =>
      PushMessageContentGame(
        title: title ?? this.title,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentGameScore** *(pushMessageContentGameScore)* - child of PushMessageContent
///
/// A new high score was achieved in a game.
///
/// * [title]: Game title, empty for pinned message.
/// * [score]: New score, 0 for pinned message.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentGameScore extends PushMessageContent {
  /// **PushMessageContentGameScore** *(pushMessageContentGameScore)* - child of PushMessageContent
  ///
  /// A new high score was achieved in a game.
  ///
  /// * [title]: Game title, empty for pinned message.
  /// * [score]: New score, 0 for pinned message.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentGameScore({
    required this.title,
    required this.score,
    required this.isPinned,
  });

  /// Game title, empty for pinned message
  final String title;

  /// New score, 0 for pinned message
  final int score;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentGameScore.fromJson(Map<String, dynamic> json) =>
      PushMessageContentGameScore(
        title: json['title'],
        score: json['score'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "score": score,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Game title, empty for pinned message
  /// * [score]: New score, 0 for pinned message
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentGameScore copyWith({
    String? title,
    int? score,
    bool? isPinned,
  }) =>
      PushMessageContentGameScore(
        title: title ?? this.title,
        score: score ?? this.score,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentGameScore';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentInvoice** *(pushMessageContentInvoice)* - child of PushMessageContent
///
/// A message with an invoice from a bot.
///
/// * [price]: Product price.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentInvoice extends PushMessageContent {
  /// **PushMessageContentInvoice** *(pushMessageContentInvoice)* - child of PushMessageContent
  ///
  /// A message with an invoice from a bot.
  ///
  /// * [price]: Product price.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentInvoice({
    required this.price,
    required this.isPinned,
  });

  /// Product price
  final String price;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentInvoice.fromJson(Map<String, dynamic> json) =>
      PushMessageContentInvoice(
        price: json['price'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: Product price
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentInvoice copyWith({
    String? price,
    bool? isPinned,
  }) =>
      PushMessageContentInvoice(
        price: price ?? this.price,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentLocation** *(pushMessageContentLocation)* - child of PushMessageContent
///
/// A message with a location.
///
/// * [isLive]: True, if the location is live.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentLocation extends PushMessageContent {
  /// **PushMessageContentLocation** *(pushMessageContentLocation)* - child of PushMessageContent
  ///
  /// A message with a location.
  ///
  /// * [isLive]: True, if the location is live.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentLocation({
    required this.isLive,
    required this.isPinned,
  });

  /// True, if the location is live
  final bool isLive;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentLocation.fromJson(Map<String, dynamic> json) =>
      PushMessageContentLocation(
        isLive: json['is_live'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_live": isLive,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_live]: True, if the location is live
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentLocation copyWith({
    bool? isLive,
    bool? isPinned,
  }) =>
      PushMessageContentLocation(
        isLive: isLive ?? this.isLive,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentPaidMedia** *(pushMessageContentPaidMedia)* - child of PushMessageContent
///
/// A message with paid media.
///
/// * [starCount]: Number of Telegram Stars needed to buy access to the media in the message; 0 for pinned message.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentPaidMedia extends PushMessageContent {
  /// **PushMessageContentPaidMedia** *(pushMessageContentPaidMedia)* - child of PushMessageContent
  ///
  /// A message with paid media.
  ///
  /// * [starCount]: Number of Telegram Stars needed to buy access to the media in the message; 0 for pinned message.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentPaidMedia({
    required this.starCount,
    required this.isPinned,
  });

  /// Number of Telegram Stars needed to buy access to the media in the message; 0 for pinned message
  final int starCount;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentPaidMedia.fromJson(Map<String, dynamic> json) =>
      PushMessageContentPaidMedia(
        starCount: json['star_count'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars needed to buy access to the media in the message; 0 for pinned message
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentPaidMedia copyWith({
    int? starCount,
    bool? isPinned,
  }) =>
      PushMessageContentPaidMedia(
        starCount: starCount ?? this.starCount,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentPaidMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentPhoto** *(pushMessageContentPhoto)* - child of PushMessageContent
///
/// A photo message.
///
/// * [photo]: Message content; may be null *(optional)*.
/// * [caption]: Photo caption.
/// * [isSecret]: True, if the photo is secret.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentPhoto extends PushMessageContent {
  /// **PushMessageContentPhoto** *(pushMessageContentPhoto)* - child of PushMessageContent
  ///
  /// A photo message.
  ///
  /// * [photo]: Message content; may be null *(optional)*.
  /// * [caption]: Photo caption.
  /// * [isSecret]: True, if the photo is secret.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentPhoto({
    this.photo,
    required this.caption,
    required this.isSecret,
    required this.isPinned,
  });

  /// Message content; may be null
  final Photo? photo;

  /// Photo caption
  final String caption;

  /// True, if the photo is secret
  final bool isSecret;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentPhoto.fromJson(Map<String, dynamic> json) =>
      PushMessageContentPhoto(
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
        caption: json['caption'],
        isSecret: json['is_secret'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
      "caption": caption,
      "is_secret": isSecret,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Message content; may be null
  /// * [caption]: Photo caption
  /// * [is_secret]: True, if the photo is secret
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentPhoto copyWith({
    Photo? photo,
    String? caption,
    bool? isSecret,
    bool? isPinned,
  }) =>
      PushMessageContentPhoto(
        photo: photo ?? this.photo,
        caption: caption ?? this.caption,
        isSecret: isSecret ?? this.isSecret,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentPoll** *(pushMessageContentPoll)* - child of PushMessageContent
///
/// A message with a poll.
///
/// * [question]: Poll question.
/// * [isRegular]: True, if the poll is regular and not in quiz mode.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentPoll extends PushMessageContent {
  /// **PushMessageContentPoll** *(pushMessageContentPoll)* - child of PushMessageContent
  ///
  /// A message with a poll.
  ///
  /// * [question]: Poll question.
  /// * [isRegular]: True, if the poll is regular and not in quiz mode.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentPoll({
    required this.question,
    required this.isRegular,
    required this.isPinned,
  });

  /// Poll question
  final String question;

  /// True, if the poll is regular and not in quiz mode
  final bool isRegular;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentPoll.fromJson(Map<String, dynamic> json) =>
      PushMessageContentPoll(
        question: json['question'],
        isRegular: json['is_regular'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "question": question,
      "is_regular": isRegular,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [question]: Poll question
  /// * [is_regular]: True, if the poll is regular and not in quiz mode
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentPoll copyWith({
    String? question,
    bool? isRegular,
    bool? isPinned,
  }) =>
      PushMessageContentPoll(
        question: question ?? this.question,
        isRegular: isRegular ?? this.isRegular,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentPoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentPremiumGiftCode** *(pushMessageContentPremiumGiftCode)* - child of PushMessageContent
///
/// A message with a Telegram Premium gift code created for the user.
///
/// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation.
final class PushMessageContentPremiumGiftCode extends PushMessageContent {
  /// **PushMessageContentPremiumGiftCode** *(pushMessageContentPremiumGiftCode)* - child of PushMessageContent
  ///
  /// A message with a Telegram Premium gift code created for the user.
  ///
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active after code activation.
  const PushMessageContentPremiumGiftCode({
    required this.monthCount,
  });

  /// Number of months the Telegram Premium subscription will be active after code activation
  final int monthCount;

  /// Parse from a json
  factory PushMessageContentPremiumGiftCode.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentPremiumGiftCode(
        monthCount: json['month_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "month_count": monthCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [month_count]: Number of months the Telegram Premium subscription will be active after code activation
  @override
  PushMessageContentPremiumGiftCode copyWith({
    int? monthCount,
  }) =>
      PushMessageContentPremiumGiftCode(
        monthCount: monthCount ?? this.monthCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentPremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentGiveaway** *(pushMessageContentGiveaway)* - child of PushMessageContent
///
/// A message with a giveaway.
///
/// * [winnerCount]: Number of users who will receive giveaway prizes; 0 for pinned message.
/// * [prize]: Prize of the giveaway; may be null for pinned message *(optional)*.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentGiveaway extends PushMessageContent {
  /// **PushMessageContentGiveaway** *(pushMessageContentGiveaway)* - child of PushMessageContent
  ///
  /// A message with a giveaway.
  ///
  /// * [winnerCount]: Number of users who will receive giveaway prizes; 0 for pinned message.
  /// * [prize]: Prize of the giveaway; may be null for pinned message *(optional)*.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentGiveaway({
    required this.winnerCount,
    this.prize,
    required this.isPinned,
  });

  /// Number of users who will receive giveaway prizes; 0 for pinned message
  final int winnerCount;

  /// Prize of the giveaway; may be null for pinned message
  final GiveawayPrize? prize;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentGiveaway.fromJson(Map<String, dynamic> json) =>
      PushMessageContentGiveaway(
        winnerCount: json['winner_count'],
        prize: json['prize'] == null
            ? null
            : GiveawayPrize.fromJson(json['prize']),
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "winner_count": winnerCount,
      "prize": prize?.toJson(),
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [winner_count]: Number of users who will receive giveaway prizes; 0 for pinned message
  /// * [prize]: Prize of the giveaway; may be null for pinned message
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentGiveaway copyWith({
    int? winnerCount,
    GiveawayPrize? prize,
    bool? isPinned,
  }) =>
      PushMessageContentGiveaway(
        winnerCount: winnerCount ?? this.winnerCount,
        prize: prize ?? this.prize,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentTonWalletTransfer** *(pushMessageContentTonWalletTransfer)* - child of PushMessageContent
///
/// A message with a TON wallet transfer.
///
/// * [senderUserId]: Sender of the transfer; 0 if unknown.
/// * [amount]: String representation of the received amount.
/// * [comment]: Comment added to the transaction if it is public.
final class PushMessageContentTonWalletTransfer extends PushMessageContent {
  /// **PushMessageContentTonWalletTransfer** *(pushMessageContentTonWalletTransfer)* - child of PushMessageContent
  ///
  /// A message with a TON wallet transfer.
  ///
  /// * [senderUserId]: Sender of the transfer; 0 if unknown.
  /// * [amount]: String representation of the received amount.
  /// * [comment]: Comment added to the transaction if it is public.
  const PushMessageContentTonWalletTransfer({
    required this.senderUserId,
    required this.amount,
    required this.comment,
  });

  /// Sender of the transfer; 0 if unknown
  final int senderUserId;

  /// String representation of the received amount
  final String amount;

  /// Comment added to the transaction if it is public
  final String comment;

  /// Parse from a json
  factory PushMessageContentTonWalletTransfer.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentTonWalletTransfer(
        senderUserId: json['sender_user_id'],
        amount: json['amount'],
        comment: json['comment'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_user_id": senderUserId,
      "amount": amount,
      "comment": comment,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_user_id]: Sender of the transfer; 0 if unknown
  /// * [amount]: String representation of the received amount
  /// * [comment]: Comment added to the transaction if it is public
  @override
  PushMessageContentTonWalletTransfer copyWith({
    int? senderUserId,
    String? amount,
    String? comment,
  }) =>
      PushMessageContentTonWalletTransfer(
        senderUserId: senderUserId ?? this.senderUserId,
        amount: amount ?? this.amount,
        comment: comment ?? this.comment,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentTonWalletTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentTonConnectRequest** *(pushMessageContentTonConnectRequest)* - child of PushMessageContent
///
/// A message with a request from a dApp was received through TON Connect.
///
/// * [dappName]: Name of the dApp; may be empty if unknown.
final class PushMessageContentTonConnectRequest extends PushMessageContent {
  /// **PushMessageContentTonConnectRequest** *(pushMessageContentTonConnectRequest)* - child of PushMessageContent
  ///
  /// A message with a request from a dApp was received through TON Connect.
  ///
  /// * [dappName]: Name of the dApp; may be empty if unknown.
  const PushMessageContentTonConnectRequest({
    required this.dappName,
  });

  /// Name of the dApp; may be empty if unknown
  final String dappName;

  /// Parse from a json
  factory PushMessageContentTonConnectRequest.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentTonConnectRequest(
        dappName: json['dapp_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "dapp_name": dappName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [dapp_name]: Name of the dApp; may be empty if unknown
  @override
  PushMessageContentTonConnectRequest copyWith({
    String? dappName,
  }) =>
      PushMessageContentTonConnectRequest(
        dappName: dappName ?? this.dappName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentTonConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentGift** *(pushMessageContentGift)* - child of PushMessageContent
///
/// A message with a gift.
///
/// * [starCount]: Number of Telegram Stars that sender paid for the gift.
/// * [isPrepaidUpgrade]: True, if the message is about prepaid upgrade of the gift by another user instead of actual receiving of a new gift.
final class PushMessageContentGift extends PushMessageContent {
  /// **PushMessageContentGift** *(pushMessageContentGift)* - child of PushMessageContent
  ///
  /// A message with a gift.
  ///
  /// * [starCount]: Number of Telegram Stars that sender paid for the gift.
  /// * [isPrepaidUpgrade]: True, if the message is about prepaid upgrade of the gift by another user instead of actual receiving of a new gift.
  const PushMessageContentGift({
    required this.starCount,
    required this.isPrepaidUpgrade,
  });

  /// Number of Telegram Stars that sender paid for the gift
  final int starCount;

  /// True, if the message is about prepaid upgrade of the gift by another user instead of actual receiving of a new gift
  final bool isPrepaidUpgrade;

  /// Parse from a json
  factory PushMessageContentGift.fromJson(Map<String, dynamic> json) =>
      PushMessageContentGift(
        starCount: json['star_count'],
        isPrepaidUpgrade: json['is_prepaid_upgrade'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "is_prepaid_upgrade": isPrepaidUpgrade,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that sender paid for the gift
  /// * [is_prepaid_upgrade]: True, if the message is about prepaid upgrade of the gift by another user instead of actual receiving of a new gift
  @override
  PushMessageContentGift copyWith({
    int? starCount,
    bool? isPrepaidUpgrade,
  }) =>
      PushMessageContentGift(
        starCount: starCount ?? this.starCount,
        isPrepaidUpgrade: isPrepaidUpgrade ?? this.isPrepaidUpgrade,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentUpgradedGift** *(pushMessageContentUpgradedGift)* - child of PushMessageContent
///
/// A message with an upgraded gift.
///
/// * [isUpgrade]: True, if the gift was obtained by upgrading of a previously received gift; otherwise, if is_prepaid_upgrade == false, then this is a transferred or resold gift.
/// * [isPrepaidUpgrade]: True, if the message is about completion of prepaid upgrade of the gift instead of actual receiving of a new gift.
final class PushMessageContentUpgradedGift extends PushMessageContent {
  /// **PushMessageContentUpgradedGift** *(pushMessageContentUpgradedGift)* - child of PushMessageContent
  ///
  /// A message with an upgraded gift.
  ///
  /// * [isUpgrade]: True, if the gift was obtained by upgrading of a previously received gift; otherwise, if is_prepaid_upgrade == false, then this is a transferred or resold gift.
  /// * [isPrepaidUpgrade]: True, if the message is about completion of prepaid upgrade of the gift instead of actual receiving of a new gift.
  const PushMessageContentUpgradedGift({
    required this.isUpgrade,
    required this.isPrepaidUpgrade,
  });

  /// True, if the gift was obtained by upgrading of a previously received gift; otherwise, if is_prepaid_upgrade == false, then this is a transferred or resold gift
  final bool isUpgrade;

  /// True, if the message is about completion of prepaid upgrade of the gift instead of actual receiving of a new gift
  final bool isPrepaidUpgrade;

  /// Parse from a json
  factory PushMessageContentUpgradedGift.fromJson(Map<String, dynamic> json) =>
      PushMessageContentUpgradedGift(
        isUpgrade: json['is_upgrade'],
        isPrepaidUpgrade: json['is_prepaid_upgrade'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_upgrade": isUpgrade,
      "is_prepaid_upgrade": isPrepaidUpgrade,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_upgrade]: True, if the gift was obtained by upgrading of a previously received gift; otherwise, if is_prepaid_upgrade == false, then this is a transferred or resold gift
  /// * [is_prepaid_upgrade]: True, if the message is about completion of prepaid upgrade of the gift instead of actual receiving of a new gift
  @override
  PushMessageContentUpgradedGift copyWith({
    bool? isUpgrade,
    bool? isPrepaidUpgrade,
  }) =>
      PushMessageContentUpgradedGift(
        isUpgrade: isUpgrade ?? this.isUpgrade,
        isPrepaidUpgrade: isPrepaidUpgrade ?? this.isPrepaidUpgrade,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentScreenshotTaken** *(pushMessageContentScreenshotTaken)* - child of PushMessageContent
///
/// A screenshot of a message in the chat has been taken.
final class PushMessageContentScreenshotTaken extends PushMessageContent {
  /// **PushMessageContentScreenshotTaken** *(pushMessageContentScreenshotTaken)* - child of PushMessageContent
  ///
  /// A screenshot of a message in the chat has been taken.
  const PushMessageContentScreenshotTaken();

  /// Parse from a json
  factory PushMessageContentScreenshotTaken.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentScreenshotTaken();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentScreenshotTaken copyWith() =>
      const PushMessageContentScreenshotTaken();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentScreenshotTaken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentSticker** *(pushMessageContentSticker)* - child of PushMessageContent
///
/// A message with a sticker.
///
/// * [sticker]: Message content; may be null *(optional)*.
/// * [emoji]: Emoji corresponding to the sticker; may be empty.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentSticker extends PushMessageContent {
  /// **PushMessageContentSticker** *(pushMessageContentSticker)* - child of PushMessageContent
  ///
  /// A message with a sticker.
  ///
  /// * [sticker]: Message content; may be null *(optional)*.
  /// * [emoji]: Emoji corresponding to the sticker; may be empty.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentSticker({
    this.sticker,
    required this.emoji,
    required this.isPinned,
  });

  /// Message content; may be null
  final Sticker? sticker;

  /// Emoji corresponding to the sticker; may be empty
  final String emoji;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentSticker.fromJson(Map<String, dynamic> json) =>
      PushMessageContentSticker(
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
        emoji: json['emoji'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker?.toJson(),
      "emoji": emoji,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Message content; may be null
  /// * [emoji]: Emoji corresponding to the sticker; may be empty
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentSticker copyWith({
    Sticker? sticker,
    String? emoji,
    bool? isPinned,
  }) =>
      PushMessageContentSticker(
        sticker: sticker ?? this.sticker,
        emoji: emoji ?? this.emoji,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentStory** *(pushMessageContentStory)* - child of PushMessageContent
///
/// A message with a story.
///
/// * [isMention]: True, if the user was mentioned in the story.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentStory extends PushMessageContent {
  /// **PushMessageContentStory** *(pushMessageContentStory)* - child of PushMessageContent
  ///
  /// A message with a story.
  ///
  /// * [isMention]: True, if the user was mentioned in the story.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentStory({
    required this.isMention,
    required this.isPinned,
  });

  /// True, if the user was mentioned in the story
  final bool isMention;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentStory.fromJson(Map<String, dynamic> json) =>
      PushMessageContentStory(
        isMention: json['is_mention'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_mention": isMention,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_mention]: True, if the user was mentioned in the story
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentStory copyWith({
    bool? isMention,
    bool? isPinned,
  }) =>
      PushMessageContentStory(
        isMention: isMention ?? this.isMention,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentText** *(pushMessageContentText)* - child of PushMessageContent
///
/// A text message.
///
/// * [text]: Message text.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentText extends PushMessageContent {
  /// **PushMessageContentText** *(pushMessageContentText)* - child of PushMessageContent
  ///
  /// A text message.
  ///
  /// * [text]: Message text.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentText({
    required this.text,
    required this.isPinned,
  });

  /// Message text
  final String text;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentText.fromJson(Map<String, dynamic> json) =>
      PushMessageContentText(
        text: json['text'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Message text
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentText copyWith({
    String? text,
    bool? isPinned,
  }) =>
      PushMessageContentText(
        text: text ?? this.text,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChecklist** *(pushMessageContentChecklist)* - child of PushMessageContent
///
/// A message with a checklist.
///
/// * [title]: Checklist title.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentChecklist extends PushMessageContent {
  /// **PushMessageContentChecklist** *(pushMessageContentChecklist)* - child of PushMessageContent
  ///
  /// A message with a checklist.
  ///
  /// * [title]: Checklist title.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentChecklist({
    required this.title,
    required this.isPinned,
  });

  /// Checklist title
  final String title;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentChecklist.fromJson(Map<String, dynamic> json) =>
      PushMessageContentChecklist(
        title: json['title'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Checklist title
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentChecklist copyWith({
    String? title,
    bool? isPinned,
  }) =>
      PushMessageContentChecklist(
        title: title ?? this.title,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChecklist';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentVideo** *(pushMessageContentVideo)* - child of PushMessageContent
///
/// A video message.
///
/// * [video]: Message content; may be null *(optional)*.
/// * [caption]: Video caption.
/// * [isSecret]: True, if the video is secret.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentVideo extends PushMessageContent {
  /// **PushMessageContentVideo** *(pushMessageContentVideo)* - child of PushMessageContent
  ///
  /// A video message.
  ///
  /// * [video]: Message content; may be null *(optional)*.
  /// * [caption]: Video caption.
  /// * [isSecret]: True, if the video is secret.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentVideo({
    this.video,
    required this.caption,
    required this.isSecret,
    required this.isPinned,
  });

  /// Message content; may be null
  final Video? video;

  /// Video caption
  final String caption;

  /// True, if the video is secret
  final bool isSecret;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentVideo.fromJson(Map<String, dynamic> json) =>
      PushMessageContentVideo(
        video: json['video'] == null ? null : Video.fromJson(json['video']),
        caption: json['caption'],
        isSecret: json['is_secret'],
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video?.toJson(),
      "caption": caption,
      "is_secret": isSecret,
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Message content; may be null
  /// * [caption]: Video caption
  /// * [is_secret]: True, if the video is secret
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentVideo copyWith({
    Video? video,
    String? caption,
    bool? isSecret,
    bool? isPinned,
  }) =>
      PushMessageContentVideo(
        video: video ?? this.video,
        caption: caption ?? this.caption,
        isSecret: isSecret ?? this.isSecret,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentVideoNote** *(pushMessageContentVideoNote)* - child of PushMessageContent
///
/// A video note message.
///
/// * [videoNote]: Message content; may be null *(optional)*.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentVideoNote extends PushMessageContent {
  /// **PushMessageContentVideoNote** *(pushMessageContentVideoNote)* - child of PushMessageContent
  ///
  /// A video note message.
  ///
  /// * [videoNote]: Message content; may be null *(optional)*.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentVideoNote({
    this.videoNote,
    required this.isPinned,
  });

  /// Message content; may be null
  final VideoNote? videoNote;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentVideoNote.fromJson(Map<String, dynamic> json) =>
      PushMessageContentVideoNote(
        videoNote: json['video_note'] == null
            ? null
            : VideoNote.fromJson(json['video_note']),
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video_note": videoNote?.toJson(),
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video_note]: Message content; may be null
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentVideoNote copyWith({
    VideoNote? videoNote,
    bool? isPinned,
  }) =>
      PushMessageContentVideoNote(
        videoNote: videoNote ?? this.videoNote,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentVoiceNote** *(pushMessageContentVoiceNote)* - child of PushMessageContent
///
/// A voice note message.
///
/// * [voiceNote]: Message content; may be null *(optional)*.
/// * [isPinned]: True, if the message is a pinned message with the specified content.
final class PushMessageContentVoiceNote extends PushMessageContent {
  /// **PushMessageContentVoiceNote** *(pushMessageContentVoiceNote)* - child of PushMessageContent
  ///
  /// A voice note message.
  ///
  /// * [voiceNote]: Message content; may be null *(optional)*.
  /// * [isPinned]: True, if the message is a pinned message with the specified content.
  const PushMessageContentVoiceNote({
    this.voiceNote,
    required this.isPinned,
  });

  /// Message content; may be null
  final VoiceNote? voiceNote;

  /// True, if the message is a pinned message with the specified content
  final bool isPinned;

  /// Parse from a json
  factory PushMessageContentVoiceNote.fromJson(Map<String, dynamic> json) =>
      PushMessageContentVoiceNote(
        voiceNote: json['voice_note'] == null
            ? null
            : VoiceNote.fromJson(json['voice_note']),
        isPinned: json['is_pinned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote?.toJson(),
      "is_pinned": isPinned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: Message content; may be null
  /// * [is_pinned]: True, if the message is a pinned message with the specified content
  @override
  PushMessageContentVoiceNote copyWith({
    VoiceNote? voiceNote,
    bool? isPinned,
  }) =>
      PushMessageContentVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentBasicGroupChatCreate** *(pushMessageContentBasicGroupChatCreate)* - child of PushMessageContent
///
/// A newly created basic group.
final class PushMessageContentBasicGroupChatCreate extends PushMessageContent {
  /// **PushMessageContentBasicGroupChatCreate** *(pushMessageContentBasicGroupChatCreate)* - child of PushMessageContent
  ///
  /// A newly created basic group.
  const PushMessageContentBasicGroupChatCreate();

  /// Parse from a json
  factory PushMessageContentBasicGroupChatCreate.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentBasicGroupChatCreate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentBasicGroupChatCreate copyWith() =>
      const PushMessageContentBasicGroupChatCreate();

  /// TDLib object type
  static const String defaultObjectId =
      'pushMessageContentBasicGroupChatCreate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentVideoChatStarted** *(pushMessageContentVideoChatStarted)* - child of PushMessageContent
///
/// A video chat or live stream was started.
final class PushMessageContentVideoChatStarted extends PushMessageContent {
  /// **PushMessageContentVideoChatStarted** *(pushMessageContentVideoChatStarted)* - child of PushMessageContent
  ///
  /// A video chat or live stream was started.
  const PushMessageContentVideoChatStarted();

  /// Parse from a json
  factory PushMessageContentVideoChatStarted.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentVideoChatStarted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentVideoChatStarted copyWith() =>
      const PushMessageContentVideoChatStarted();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentVideoChatStarted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentVideoChatEnded** *(pushMessageContentVideoChatEnded)* - child of PushMessageContent
///
/// A video chat or live stream has ended.
final class PushMessageContentVideoChatEnded extends PushMessageContent {
  /// **PushMessageContentVideoChatEnded** *(pushMessageContentVideoChatEnded)* - child of PushMessageContent
  ///
  /// A video chat or live stream has ended.
  const PushMessageContentVideoChatEnded();

  /// Parse from a json
  factory PushMessageContentVideoChatEnded.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentVideoChatEnded();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentVideoChatEnded copyWith() =>
      const PushMessageContentVideoChatEnded();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentVideoChatEnded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentInviteVideoChatParticipants** *(pushMessageContentInviteVideoChatParticipants)* - child of PushMessageContent
///
/// An invitation of participants to a video chat or live stream.
///
/// * [isCurrentUser]: True, if the current user was invited to the video chat or the live stream.
final class PushMessageContentInviteVideoChatParticipants
    extends PushMessageContent {
  /// **PushMessageContentInviteVideoChatParticipants** *(pushMessageContentInviteVideoChatParticipants)* - child of PushMessageContent
  ///
  /// An invitation of participants to a video chat or live stream.
  ///
  /// * [isCurrentUser]: True, if the current user was invited to the video chat or the live stream.
  const PushMessageContentInviteVideoChatParticipants({
    required this.isCurrentUser,
  });

  /// True, if the current user was invited to the video chat or the live stream
  final bool isCurrentUser;

  /// Parse from a json
  factory PushMessageContentInviteVideoChatParticipants.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentInviteVideoChatParticipants(
        isCurrentUser: json['is_current_user'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_current_user": isCurrentUser,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_current_user]: True, if the current user was invited to the video chat or the live stream
  @override
  PushMessageContentInviteVideoChatParticipants copyWith({
    bool? isCurrentUser,
  }) =>
      PushMessageContentInviteVideoChatParticipants(
        isCurrentUser: isCurrentUser ?? this.isCurrentUser,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'pushMessageContentInviteVideoChatParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatAddMembers** *(pushMessageContentChatAddMembers)* - child of PushMessageContent
///
/// New chat members were invited to a group.
///
/// * [memberName]: Name of the added member.
/// * [isCurrentUser]: True, if the current user was added to the group.
/// * [isReturned]: True, if the user has returned to the group themselves.
final class PushMessageContentChatAddMembers extends PushMessageContent {
  /// **PushMessageContentChatAddMembers** *(pushMessageContentChatAddMembers)* - child of PushMessageContent
  ///
  /// New chat members were invited to a group.
  ///
  /// * [memberName]: Name of the added member.
  /// * [isCurrentUser]: True, if the current user was added to the group.
  /// * [isReturned]: True, if the user has returned to the group themselves.
  const PushMessageContentChatAddMembers({
    required this.memberName,
    required this.isCurrentUser,
    required this.isReturned,
  });

  /// Name of the added member
  final String memberName;

  /// True, if the current user was added to the group
  final bool isCurrentUser;

  /// True, if the user has returned to the group themselves
  final bool isReturned;

  /// Parse from a json
  factory PushMessageContentChatAddMembers.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChatAddMembers(
        memberName: json['member_name'],
        isCurrentUser: json['is_current_user'],
        isReturned: json['is_returned'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_name": memberName,
      "is_current_user": isCurrentUser,
      "is_returned": isReturned,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_name]: Name of the added member
  /// * [is_current_user]: True, if the current user was added to the group
  /// * [is_returned]: True, if the user has returned to the group themselves
  @override
  PushMessageContentChatAddMembers copyWith({
    String? memberName,
    bool? isCurrentUser,
    bool? isReturned,
  }) =>
      PushMessageContentChatAddMembers(
        memberName: memberName ?? this.memberName,
        isCurrentUser: isCurrentUser ?? this.isCurrentUser,
        isReturned: isReturned ?? this.isReturned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatAddMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatChangePhoto** *(pushMessageContentChatChangePhoto)* - child of PushMessageContent
///
/// A chat photo was edited.
final class PushMessageContentChatChangePhoto extends PushMessageContent {
  /// **PushMessageContentChatChangePhoto** *(pushMessageContentChatChangePhoto)* - child of PushMessageContent
  ///
  /// A chat photo was edited.
  const PushMessageContentChatChangePhoto();

  /// Parse from a json
  factory PushMessageContentChatChangePhoto.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentChatChangePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentChatChangePhoto copyWith() =>
      const PushMessageContentChatChangePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatChangePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatChangeTitle** *(pushMessageContentChatChangeTitle)* - child of PushMessageContent
///
/// A chat title was edited.
///
/// * [title]: New chat title.
final class PushMessageContentChatChangeTitle extends PushMessageContent {
  /// **PushMessageContentChatChangeTitle** *(pushMessageContentChatChangeTitle)* - child of PushMessageContent
  ///
  /// A chat title was edited.
  ///
  /// * [title]: New chat title.
  const PushMessageContentChatChangeTitle({
    required this.title,
  });

  /// New chat title
  final String title;

  /// Parse from a json
  factory PushMessageContentChatChangeTitle.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChatChangeTitle(
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
  PushMessageContentChatChangeTitle copyWith({
    String? title,
  }) =>
      PushMessageContentChatChangeTitle(
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatChangeTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatSetBackground** *(pushMessageContentChatSetBackground)* - child of PushMessageContent
///
/// A chat background was edited.
///
/// * [isSame]: True, if the set background is the same as the background of the current user.
final class PushMessageContentChatSetBackground extends PushMessageContent {
  /// **PushMessageContentChatSetBackground** *(pushMessageContentChatSetBackground)* - child of PushMessageContent
  ///
  /// A chat background was edited.
  ///
  /// * [isSame]: True, if the set background is the same as the background of the current user.
  const PushMessageContentChatSetBackground({
    required this.isSame,
  });

  /// True, if the set background is the same as the background of the current user
  final bool isSame;

  /// Parse from a json
  factory PushMessageContentChatSetBackground.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChatSetBackground(
        isSame: json['is_same'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_same": isSame,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_same]: True, if the set background is the same as the background of the current user
  @override
  PushMessageContentChatSetBackground copyWith({
    bool? isSame,
  }) =>
      PushMessageContentChatSetBackground(
        isSame: isSame ?? this.isSame,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatSetBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatSetTheme** *(pushMessageContentChatSetTheme)* - child of PushMessageContent
///
/// A chat theme was edited.
///
/// * [name]: If non-empty, human-readable name of the new theme. Otherwise, the chat theme was reset to the default one.
final class PushMessageContentChatSetTheme extends PushMessageContent {
  /// **PushMessageContentChatSetTheme** *(pushMessageContentChatSetTheme)* - child of PushMessageContent
  ///
  /// A chat theme was edited.
  ///
  /// * [name]: If non-empty, human-readable name of the new theme. Otherwise, the chat theme was reset to the default one.
  const PushMessageContentChatSetTheme({
    required this.name,
  });

  /// If non-empty, human-readable name of the new theme. Otherwise, the chat theme was reset to the default one
  final String name;

  /// Parse from a json
  factory PushMessageContentChatSetTheme.fromJson(Map<String, dynamic> json) =>
      PushMessageContentChatSetTheme(
        name: json['name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: If non-empty, human-readable name of the new theme. Otherwise, the chat theme was reset to the default one
  @override
  PushMessageContentChatSetTheme copyWith({
    String? name,
  }) =>
      PushMessageContentChatSetTheme(
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatSetTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatDeleteMember** *(pushMessageContentChatDeleteMember)* - child of PushMessageContent
///
/// A chat member was deleted.
///
/// * [memberName]: Name of the deleted member.
/// * [isCurrentUser]: True, if the current user was deleted from the group.
/// * [isLeft]: True, if the user has left the group themselves.
final class PushMessageContentChatDeleteMember extends PushMessageContent {
  /// **PushMessageContentChatDeleteMember** *(pushMessageContentChatDeleteMember)* - child of PushMessageContent
  ///
  /// A chat member was deleted.
  ///
  /// * [memberName]: Name of the deleted member.
  /// * [isCurrentUser]: True, if the current user was deleted from the group.
  /// * [isLeft]: True, if the user has left the group themselves.
  const PushMessageContentChatDeleteMember({
    required this.memberName,
    required this.isCurrentUser,
    required this.isLeft,
  });

  /// Name of the deleted member
  final String memberName;

  /// True, if the current user was deleted from the group
  final bool isCurrentUser;

  /// True, if the user has left the group themselves
  final bool isLeft;

  /// Parse from a json
  factory PushMessageContentChatDeleteMember.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChatDeleteMember(
        memberName: json['member_name'],
        isCurrentUser: json['is_current_user'],
        isLeft: json['is_left'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_name": memberName,
      "is_current_user": isCurrentUser,
      "is_left": isLeft,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_name]: Name of the deleted member
  /// * [is_current_user]: True, if the current user was deleted from the group
  /// * [is_left]: True, if the user has left the group themselves
  @override
  PushMessageContentChatDeleteMember copyWith({
    String? memberName,
    bool? isCurrentUser,
    bool? isLeft,
  }) =>
      PushMessageContentChatDeleteMember(
        memberName: memberName ?? this.memberName,
        isCurrentUser: isCurrentUser ?? this.isCurrentUser,
        isLeft: isLeft ?? this.isLeft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatDeleteMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatJoinByLink** *(pushMessageContentChatJoinByLink)* - child of PushMessageContent
///
/// A new member joined the chat via an invite link.
final class PushMessageContentChatJoinByLink extends PushMessageContent {
  /// **PushMessageContentChatJoinByLink** *(pushMessageContentChatJoinByLink)* - child of PushMessageContent
  ///
  /// A new member joined the chat via an invite link.
  const PushMessageContentChatJoinByLink();

  /// Parse from a json
  factory PushMessageContentChatJoinByLink.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentChatJoinByLink();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentChatJoinByLink copyWith() =>
      const PushMessageContentChatJoinByLink();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatJoinByLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChatJoinByRequest** *(pushMessageContentChatJoinByRequest)* - child of PushMessageContent
///
/// A new member was accepted to the chat by an administrator.
final class PushMessageContentChatJoinByRequest extends PushMessageContent {
  /// **PushMessageContentChatJoinByRequest** *(pushMessageContentChatJoinByRequest)* - child of PushMessageContent
  ///
  /// A new member was accepted to the chat by an administrator.
  const PushMessageContentChatJoinByRequest();

  /// Parse from a json
  factory PushMessageContentChatJoinByRequest.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentChatJoinByRequest();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentChatJoinByRequest copyWith() =>
      const PushMessageContentChatJoinByRequest();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChatJoinByRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentRecurringPayment** *(pushMessageContentRecurringPayment)* - child of PushMessageContent
///
/// A new recurring payment was made by the current user.
///
/// * [amount]: The paid amount.
final class PushMessageContentRecurringPayment extends PushMessageContent {
  /// **PushMessageContentRecurringPayment** *(pushMessageContentRecurringPayment)* - child of PushMessageContent
  ///
  /// A new recurring payment was made by the current user.
  ///
  /// * [amount]: The paid amount.
  const PushMessageContentRecurringPayment({
    required this.amount,
  });

  /// The paid amount
  final String amount;

  /// Parse from a json
  factory PushMessageContentRecurringPayment.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentRecurringPayment(
        amount: json['amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "amount": amount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [amount]: The paid amount
  @override
  PushMessageContentRecurringPayment copyWith({
    String? amount,
  }) =>
      PushMessageContentRecurringPayment(
        amount: amount ?? this.amount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentRecurringPayment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentSuggestProfilePhoto** *(pushMessageContentSuggestProfilePhoto)* - child of PushMessageContent
///
/// A profile photo was suggested to the user.
final class PushMessageContentSuggestProfilePhoto extends PushMessageContent {
  /// **PushMessageContentSuggestProfilePhoto** *(pushMessageContentSuggestProfilePhoto)* - child of PushMessageContent
  ///
  /// A profile photo was suggested to the user.
  const PushMessageContentSuggestProfilePhoto();

  /// Parse from a json
  factory PushMessageContentSuggestProfilePhoto.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentSuggestProfilePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentSuggestProfilePhoto copyWith() =>
      const PushMessageContentSuggestProfilePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentSuggestProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentSuggestBirthdate** *(pushMessageContentSuggestBirthdate)* - child of PushMessageContent
///
/// A birthdate was suggested to be set.
final class PushMessageContentSuggestBirthdate extends PushMessageContent {
  /// **PushMessageContentSuggestBirthdate** *(pushMessageContentSuggestBirthdate)* - child of PushMessageContent
  ///
  /// A birthdate was suggested to be set.
  const PushMessageContentSuggestBirthdate();

  /// Parse from a json
  factory PushMessageContentSuggestBirthdate.fromJson(
          Map<String, dynamic> json) =>
      const PushMessageContentSuggestBirthdate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PushMessageContentSuggestBirthdate copyWith() =>
      const PushMessageContentSuggestBirthdate();

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentSuggestBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentProximityAlertTriggered** *(pushMessageContentProximityAlertTriggered)* - child of PushMessageContent
///
/// A user in the chat came within proximity alert range from the current user.
///
/// * [distance]: The distance to the user.
final class PushMessageContentProximityAlertTriggered
    extends PushMessageContent {
  /// **PushMessageContentProximityAlertTriggered** *(pushMessageContentProximityAlertTriggered)* - child of PushMessageContent
  ///
  /// A user in the chat came within proximity alert range from the current user.
  ///
  /// * [distance]: The distance to the user.
  const PushMessageContentProximityAlertTriggered({
    required this.distance,
  });

  /// The distance to the user
  final int distance;

  /// Parse from a json
  factory PushMessageContentProximityAlertTriggered.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentProximityAlertTriggered(
        distance: json['distance'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "distance": distance,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [distance]: The distance to the user
  @override
  PushMessageContentProximityAlertTriggered copyWith({
    int? distance,
  }) =>
      PushMessageContentProximityAlertTriggered(
        distance: distance ?? this.distance,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'pushMessageContentProximityAlertTriggered';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChecklistTasksAdded** *(pushMessageContentChecklistTasksAdded)* - child of PushMessageContent
///
/// Some tasks were added to a checklist.
///
/// * [taskCount]: Number of added tasks.
final class PushMessageContentChecklistTasksAdded extends PushMessageContent {
  /// **PushMessageContentChecklistTasksAdded** *(pushMessageContentChecklistTasksAdded)* - child of PushMessageContent
  ///
  /// Some tasks were added to a checklist.
  ///
  /// * [taskCount]: Number of added tasks.
  const PushMessageContentChecklistTasksAdded({
    required this.taskCount,
  });

  /// Number of added tasks
  final int taskCount;

  /// Parse from a json
  factory PushMessageContentChecklistTasksAdded.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChecklistTasksAdded(
        taskCount: json['task_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "task_count": taskCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [task_count]: Number of added tasks
  @override
  PushMessageContentChecklistTasksAdded copyWith({
    int? taskCount,
  }) =>
      PushMessageContentChecklistTasksAdded(
        taskCount: taskCount ?? this.taskCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChecklistTasksAdded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentChecklistTasksDone** *(pushMessageContentChecklistTasksDone)* - child of PushMessageContent
///
/// Some tasks from a checklist were marked as done or not done.
///
/// * [taskCount]: Number of changed tasks.
final class PushMessageContentChecklistTasksDone extends PushMessageContent {
  /// **PushMessageContentChecklistTasksDone** *(pushMessageContentChecklistTasksDone)* - child of PushMessageContent
  ///
  /// Some tasks from a checklist were marked as done or not done.
  ///
  /// * [taskCount]: Number of changed tasks.
  const PushMessageContentChecklistTasksDone({
    required this.taskCount,
  });

  /// Number of changed tasks
  final int taskCount;

  /// Parse from a json
  factory PushMessageContentChecklistTasksDone.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentChecklistTasksDone(
        taskCount: json['task_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "task_count": taskCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [task_count]: Number of changed tasks
  @override
  PushMessageContentChecklistTasksDone copyWith({
    int? taskCount,
  }) =>
      PushMessageContentChecklistTasksDone(
        taskCount: taskCount ?? this.taskCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentChecklistTasksDone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentPollOptionAdded** *(pushMessageContentPollOptionAdded)* - child of PushMessageContent
///
/// An option was added to a poll.
///
/// * [text]: Text of the option.
final class PushMessageContentPollOptionAdded extends PushMessageContent {
  /// **PushMessageContentPollOptionAdded** *(pushMessageContentPollOptionAdded)* - child of PushMessageContent
  ///
  /// An option was added to a poll.
  ///
  /// * [text]: Text of the option.
  const PushMessageContentPollOptionAdded({
    required this.text,
  });

  /// Text of the option
  final String text;

  /// Parse from a json
  factory PushMessageContentPollOptionAdded.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentPollOptionAdded(
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
  /// * [text]: Text of the option
  @override
  PushMessageContentPollOptionAdded copyWith({
    String? text,
  }) =>
      PushMessageContentPollOptionAdded(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentPollOptionAdded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentMessageForwards** *(pushMessageContentMessageForwards)* - child of PushMessageContent
///
/// Forwarded messages.
///
/// * [totalCount]: Number of forwarded messages.
final class PushMessageContentMessageForwards extends PushMessageContent {
  /// **PushMessageContentMessageForwards** *(pushMessageContentMessageForwards)* - child of PushMessageContent
  ///
  /// Forwarded messages.
  ///
  /// * [totalCount]: Number of forwarded messages.
  const PushMessageContentMessageForwards({
    required this.totalCount,
  });

  /// Number of forwarded messages
  final int totalCount;

  /// Parse from a json
  factory PushMessageContentMessageForwards.fromJson(
          Map<String, dynamic> json) =>
      PushMessageContentMessageForwards(
        totalCount: json['total_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Number of forwarded messages
  @override
  PushMessageContentMessageForwards copyWith({
    int? totalCount,
  }) =>
      PushMessageContentMessageForwards(
        totalCount: totalCount ?? this.totalCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentMessageForwards';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PushMessageContentMediaAlbum** *(pushMessageContentMediaAlbum)* - child of PushMessageContent
///
/// A media album.
///
/// * [totalCount]: Number of messages in the album.
/// * [hasPhotos]: True, if the album has at least one photo.
/// * [hasVideos]: True, if the album has at least one video file.
/// * [hasAudios]: True, if the album has at least one audio file.
/// * [hasDocuments]: True, if the album has at least one document.
final class PushMessageContentMediaAlbum extends PushMessageContent {
  /// **PushMessageContentMediaAlbum** *(pushMessageContentMediaAlbum)* - child of PushMessageContent
  ///
  /// A media album.
  ///
  /// * [totalCount]: Number of messages in the album.
  /// * [hasPhotos]: True, if the album has at least one photo.
  /// * [hasVideos]: True, if the album has at least one video file.
  /// * [hasAudios]: True, if the album has at least one audio file.
  /// * [hasDocuments]: True, if the album has at least one document.
  const PushMessageContentMediaAlbum({
    required this.totalCount,
    required this.hasPhotos,
    required this.hasVideos,
    required this.hasAudios,
    required this.hasDocuments,
  });

  /// Number of messages in the album
  final int totalCount;

  /// True, if the album has at least one photo
  final bool hasPhotos;

  /// True, if the album has at least one video file
  final bool hasVideos;

  /// True, if the album has at least one audio file
  final bool hasAudios;

  /// True, if the album has at least one document
  final bool hasDocuments;

  /// Parse from a json
  factory PushMessageContentMediaAlbum.fromJson(Map<String, dynamic> json) =>
      PushMessageContentMediaAlbum(
        totalCount: json['total_count'],
        hasPhotos: json['has_photos'],
        hasVideos: json['has_videos'],
        hasAudios: json['has_audios'],
        hasDocuments: json['has_documents'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "has_photos": hasPhotos,
      "has_videos": hasVideos,
      "has_audios": hasAudios,
      "has_documents": hasDocuments,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Number of messages in the album
  /// * [has_photos]: True, if the album has at least one photo
  /// * [has_videos]: True, if the album has at least one video file
  /// * [has_audios]: True, if the album has at least one audio file
  /// * [has_documents]: True, if the album has at least one document
  @override
  PushMessageContentMediaAlbum copyWith({
    int? totalCount,
    bool? hasPhotos,
    bool? hasVideos,
    bool? hasAudios,
    bool? hasDocuments,
  }) =>
      PushMessageContentMediaAlbum(
        totalCount: totalCount ?? this.totalCount,
        hasPhotos: hasPhotos ?? this.hasPhotos,
        hasVideos: hasVideos ?? this.hasVideos,
        hasAudios: hasAudios ?? this.hasAudios,
        hasDocuments: hasDocuments ?? this.hasDocuments,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushMessageContentMediaAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
