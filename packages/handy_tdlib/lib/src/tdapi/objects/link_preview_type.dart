part of '../tdapi.dart';

/// **LinkPreviewType** *(linkPreviewType)* - parent
///
/// Describes type of link preview.
sealed class LinkPreviewType extends TdObject {
  /// **LinkPreviewType** *(linkPreviewType)* - parent
  ///
  /// Describes type of link preview.
  const LinkPreviewType();

  /// a LinkPreviewType return type can be :
  /// * [LinkPreviewTypeAlbum]
  /// * [LinkPreviewTypeAnimation]
  /// * [LinkPreviewTypeApp]
  /// * [LinkPreviewTypeArticle]
  /// * [LinkPreviewTypeAudio]
  /// * [LinkPreviewTypeBackground]
  /// * [LinkPreviewTypeChannelBoost]
  /// * [LinkPreviewTypeChat]
  /// * [LinkPreviewTypeDirectMessagesChat]
  /// * [LinkPreviewTypeDocument]
  /// * [LinkPreviewTypeEmbeddedAnimationPlayer]
  /// * [LinkPreviewTypeEmbeddedAudioPlayer]
  /// * [LinkPreviewTypeEmbeddedVideoPlayer]
  /// * [LinkPreviewTypeExternalAudio]
  /// * [LinkPreviewTypeExternalVideo]
  /// * [LinkPreviewTypeGiftAuction]
  /// * [LinkPreviewTypeGiftCollection]
  /// * [LinkPreviewTypeGroupCall]
  /// * [LinkPreviewTypeInvoice]
  /// * [LinkPreviewTypeLiveStory]
  /// * [LinkPreviewTypeMessage]
  /// * [LinkPreviewTypePhoto]
  /// * [LinkPreviewTypePremiumGiftCode]
  /// * [LinkPreviewTypeRequestManagedBot]
  /// * [LinkPreviewTypeShareableChatFolder]
  /// * [LinkPreviewTypeSticker]
  /// * [LinkPreviewTypeStickerSet]
  /// * [LinkPreviewTypeStory]
  /// * [LinkPreviewTypeStoryAlbum]
  /// * [LinkPreviewTypeSupergroupBoost]
  /// * [LinkPreviewTypeTextCompositionStyle]
  /// * [LinkPreviewTypeTheme]
  /// * [LinkPreviewTypeUnsupported]
  /// * [LinkPreviewTypeUpgradedGift]
  /// * [LinkPreviewTypeUser]
  /// * [LinkPreviewTypeVideo]
  /// * [LinkPreviewTypeVideoChat]
  /// * [LinkPreviewTypeVideoNote]
  /// * [LinkPreviewTypeVoiceNote]
  /// * [LinkPreviewTypeWebApp]
  factory LinkPreviewType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case LinkPreviewTypeAlbum.defaultObjectId:
        return LinkPreviewTypeAlbum.fromJson(json);
      case LinkPreviewTypeAnimation.defaultObjectId:
        return LinkPreviewTypeAnimation.fromJson(json);
      case LinkPreviewTypeApp.defaultObjectId:
        return LinkPreviewTypeApp.fromJson(json);
      case LinkPreviewTypeArticle.defaultObjectId:
        return LinkPreviewTypeArticle.fromJson(json);
      case LinkPreviewTypeAudio.defaultObjectId:
        return LinkPreviewTypeAudio.fromJson(json);
      case LinkPreviewTypeBackground.defaultObjectId:
        return LinkPreviewTypeBackground.fromJson(json);
      case LinkPreviewTypeChannelBoost.defaultObjectId:
        return LinkPreviewTypeChannelBoost.fromJson(json);
      case LinkPreviewTypeChat.defaultObjectId:
        return LinkPreviewTypeChat.fromJson(json);
      case LinkPreviewTypeDirectMessagesChat.defaultObjectId:
        return LinkPreviewTypeDirectMessagesChat.fromJson(json);
      case LinkPreviewTypeDocument.defaultObjectId:
        return LinkPreviewTypeDocument.fromJson(json);
      case LinkPreviewTypeEmbeddedAnimationPlayer.defaultObjectId:
        return LinkPreviewTypeEmbeddedAnimationPlayer.fromJson(json);
      case LinkPreviewTypeEmbeddedAudioPlayer.defaultObjectId:
        return LinkPreviewTypeEmbeddedAudioPlayer.fromJson(json);
      case LinkPreviewTypeEmbeddedVideoPlayer.defaultObjectId:
        return LinkPreviewTypeEmbeddedVideoPlayer.fromJson(json);
      case LinkPreviewTypeExternalAudio.defaultObjectId:
        return LinkPreviewTypeExternalAudio.fromJson(json);
      case LinkPreviewTypeExternalVideo.defaultObjectId:
        return LinkPreviewTypeExternalVideo.fromJson(json);
      case LinkPreviewTypeGiftAuction.defaultObjectId:
        return LinkPreviewTypeGiftAuction.fromJson(json);
      case LinkPreviewTypeGiftCollection.defaultObjectId:
        return LinkPreviewTypeGiftCollection.fromJson(json);
      case LinkPreviewTypeGroupCall.defaultObjectId:
        return LinkPreviewTypeGroupCall.fromJson(json);
      case LinkPreviewTypeInvoice.defaultObjectId:
        return LinkPreviewTypeInvoice.fromJson(json);
      case LinkPreviewTypeLiveStory.defaultObjectId:
        return LinkPreviewTypeLiveStory.fromJson(json);
      case LinkPreviewTypeMessage.defaultObjectId:
        return LinkPreviewTypeMessage.fromJson(json);
      case LinkPreviewTypePhoto.defaultObjectId:
        return LinkPreviewTypePhoto.fromJson(json);
      case LinkPreviewTypePremiumGiftCode.defaultObjectId:
        return LinkPreviewTypePremiumGiftCode.fromJson(json);
      case LinkPreviewTypeRequestManagedBot.defaultObjectId:
        return LinkPreviewTypeRequestManagedBot.fromJson(json);
      case LinkPreviewTypeShareableChatFolder.defaultObjectId:
        return LinkPreviewTypeShareableChatFolder.fromJson(json);
      case LinkPreviewTypeSticker.defaultObjectId:
        return LinkPreviewTypeSticker.fromJson(json);
      case LinkPreviewTypeStickerSet.defaultObjectId:
        return LinkPreviewTypeStickerSet.fromJson(json);
      case LinkPreviewTypeStory.defaultObjectId:
        return LinkPreviewTypeStory.fromJson(json);
      case LinkPreviewTypeStoryAlbum.defaultObjectId:
        return LinkPreviewTypeStoryAlbum.fromJson(json);
      case LinkPreviewTypeSupergroupBoost.defaultObjectId:
        return LinkPreviewTypeSupergroupBoost.fromJson(json);
      case LinkPreviewTypeTextCompositionStyle.defaultObjectId:
        return LinkPreviewTypeTextCompositionStyle.fromJson(json);
      case LinkPreviewTypeTheme.defaultObjectId:
        return LinkPreviewTypeTheme.fromJson(json);
      case LinkPreviewTypeUnsupported.defaultObjectId:
        return LinkPreviewTypeUnsupported.fromJson(json);
      case LinkPreviewTypeUpgradedGift.defaultObjectId:
        return LinkPreviewTypeUpgradedGift.fromJson(json);
      case LinkPreviewTypeUser.defaultObjectId:
        return LinkPreviewTypeUser.fromJson(json);
      case LinkPreviewTypeVideo.defaultObjectId:
        return LinkPreviewTypeVideo.fromJson(json);
      case LinkPreviewTypeVideoChat.defaultObjectId:
        return LinkPreviewTypeVideoChat.fromJson(json);
      case LinkPreviewTypeVideoNote.defaultObjectId:
        return LinkPreviewTypeVideoNote.fromJson(json);
      case LinkPreviewTypeVoiceNote.defaultObjectId:
        return LinkPreviewTypeVoiceNote.fromJson(json);
      case LinkPreviewTypeWebApp.defaultObjectId:
        return LinkPreviewTypeWebApp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of LinkPreviewType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  LinkPreviewType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeAlbum** *(linkPreviewTypeAlbum)* - child of LinkPreviewType
///
/// The link is a link to a media album consisting of photos and videos.
///
/// * [media]: The list of album media.
/// * [caption]: Album caption.
final class LinkPreviewTypeAlbum extends LinkPreviewType {
  /// **LinkPreviewTypeAlbum** *(linkPreviewTypeAlbum)* - child of LinkPreviewType
  ///
  /// The link is a link to a media album consisting of photos and videos.
  ///
  /// * [media]: The list of album media.
  /// * [caption]: Album caption.
  const LinkPreviewTypeAlbum({
    required this.media,
    required this.caption,
  });

  /// The list of album media
  final List<LinkPreviewAlbumMedia> media;

  /// Album caption
  final String caption;

  /// Parse from a json
  factory LinkPreviewTypeAlbum.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeAlbum(
        media: List<LinkPreviewAlbumMedia>.from((json['media'] ?? [])
            .map((item) => LinkPreviewAlbumMedia.fromJson(item))
            .toList()),
        caption: json['caption'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "media": media.map((i) => i.toJson()).toList(),
      "caption": caption,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [media]: The list of album media
  /// * [caption]: Album caption
  @override
  LinkPreviewTypeAlbum copyWith({
    List<LinkPreviewAlbumMedia>? media,
    String? caption,
  }) =>
      LinkPreviewTypeAlbum(
        media: media ?? this.media,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeAnimation** *(linkPreviewTypeAnimation)* - child of LinkPreviewType
///
/// The link is a link to an animation.
///
/// * [animation]: The animation.
final class LinkPreviewTypeAnimation extends LinkPreviewType {
  /// **LinkPreviewTypeAnimation** *(linkPreviewTypeAnimation)* - child of LinkPreviewType
  ///
  /// The link is a link to an animation.
  ///
  /// * [animation]: The animation.
  const LinkPreviewTypeAnimation({
    required this.animation,
  });

  /// The animation
  final Animation animation;

  /// Parse from a json
  factory LinkPreviewTypeAnimation.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeAnimation(
        animation: Animation.fromJson(json['animation']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: The animation
  @override
  LinkPreviewTypeAnimation copyWith({
    Animation? animation,
  }) =>
      LinkPreviewTypeAnimation(
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeApp** *(linkPreviewTypeApp)* - child of LinkPreviewType
///
/// The link is a link to an app at App Store or Google Play.
///
/// * [photo]: Photo for the app.
final class LinkPreviewTypeApp extends LinkPreviewType {
  /// **LinkPreviewTypeApp** *(linkPreviewTypeApp)* - child of LinkPreviewType
  ///
  /// The link is a link to an app at App Store or Google Play.
  ///
  /// * [photo]: Photo for the app.
  const LinkPreviewTypeApp({
    required this.photo,
  });

  /// Photo for the app
  final Photo photo;

  /// Parse from a json
  factory LinkPreviewTypeApp.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeApp(
        photo: Photo.fromJson(json['photo']),
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
  /// * [photo]: Photo for the app
  @override
  LinkPreviewTypeApp copyWith({
    Photo? photo,
  }) =>
      LinkPreviewTypeApp(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeArticle** *(linkPreviewTypeArticle)* - child of LinkPreviewType
///
/// The link is a link to a website.
///
/// * [photo]: Article's main photo; may be null *(optional)*.
final class LinkPreviewTypeArticle extends LinkPreviewType {
  /// **LinkPreviewTypeArticle** *(linkPreviewTypeArticle)* - child of LinkPreviewType
  ///
  /// The link is a link to a website.
  ///
  /// * [photo]: Article's main photo; may be null *(optional)*.
  const LinkPreviewTypeArticle({
    this.photo,
  });

  /// Article's main photo; may be null
  final Photo? photo;

  /// Parse from a json
  factory LinkPreviewTypeArticle.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeArticle(
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Article's main photo; may be null
  @override
  LinkPreviewTypeArticle copyWith({
    Photo? photo,
  }) =>
      LinkPreviewTypeArticle(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeArticle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeAudio** *(linkPreviewTypeAudio)* - child of LinkPreviewType
///
/// The link is a link to an audio.
///
/// * [audio]: The audio description.
final class LinkPreviewTypeAudio extends LinkPreviewType {
  /// **LinkPreviewTypeAudio** *(linkPreviewTypeAudio)* - child of LinkPreviewType
  ///
  /// The link is a link to an audio.
  ///
  /// * [audio]: The audio description.
  const LinkPreviewTypeAudio({
    required this.audio,
  });

  /// The audio description
  final Audio audio;

  /// Parse from a json
  factory LinkPreviewTypeAudio.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeAudio(
        audio: Audio.fromJson(json['audio']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: The audio description
  @override
  LinkPreviewTypeAudio copyWith({
    Audio? audio,
  }) =>
      LinkPreviewTypeAudio(
        audio: audio ?? this.audio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeBackground** *(linkPreviewTypeBackground)* - child of LinkPreviewType
///
/// The link is a link to a background. Link preview title and description are available only for filled backgrounds.
///
/// * [document]: Document with the background; may be null for filled backgrounds *(optional)*.
/// * [backgroundType]: Type of the background; may be null if unknown *(optional)*.
final class LinkPreviewTypeBackground extends LinkPreviewType {
  /// **LinkPreviewTypeBackground** *(linkPreviewTypeBackground)* - child of LinkPreviewType
  ///
  /// The link is a link to a background. Link preview title and description are available only for filled backgrounds.
  ///
  /// * [document]: Document with the background; may be null for filled backgrounds *(optional)*.
  /// * [backgroundType]: Type of the background; may be null if unknown *(optional)*.
  const LinkPreviewTypeBackground({
    this.document,
    this.backgroundType,
  });

  /// Document with the background; may be null for filled backgrounds
  final Document? document;

  /// Type of the background; may be null if unknown
  final BackgroundType? backgroundType;

  /// Parse from a json
  factory LinkPreviewTypeBackground.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeBackground(
        document: json['document'] == null
            ? null
            : Document.fromJson(json['document']),
        backgroundType: json['background_type'] == null
            ? null
            : BackgroundType.fromJson(json['background_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document?.toJson(),
      "background_type": backgroundType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: Document with the background; may be null for filled backgrounds
  /// * [background_type]: Type of the background; may be null if unknown
  @override
  LinkPreviewTypeBackground copyWith({
    Document? document,
    BackgroundType? backgroundType,
  }) =>
      LinkPreviewTypeBackground(
        document: document ?? this.document,
        backgroundType: backgroundType ?? this.backgroundType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeChannelBoost** *(linkPreviewTypeChannelBoost)* - child of LinkPreviewType
///
/// The link is a link to boost a channel chat.
///
/// * [photo]: Photo of the chat; may be null *(optional)*.
final class LinkPreviewTypeChannelBoost extends LinkPreviewType {
  /// **LinkPreviewTypeChannelBoost** *(linkPreviewTypeChannelBoost)* - child of LinkPreviewType
  ///
  /// The link is a link to boost a channel chat.
  ///
  /// * [photo]: Photo of the chat; may be null *(optional)*.
  const LinkPreviewTypeChannelBoost({
    this.photo,
  });

  /// Photo of the chat; may be null
  final ChatPhoto? photo;

  /// Parse from a json
  factory LinkPreviewTypeChannelBoost.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeChannelBoost(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the chat; may be null
  @override
  LinkPreviewTypeChannelBoost copyWith({
    ChatPhoto? photo,
  }) =>
      LinkPreviewTypeChannelBoost(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeChannelBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeChat** *(linkPreviewTypeChat)* - child of LinkPreviewType
///
/// The link is a link to a chat.
///
/// * [type]: Type of the chat.
/// * [photo]: Photo of the chat; may be null *(optional)*.
/// * [createsJoinRequest]: True, if the link only creates join request.
final class LinkPreviewTypeChat extends LinkPreviewType {
  /// **LinkPreviewTypeChat** *(linkPreviewTypeChat)* - child of LinkPreviewType
  ///
  /// The link is a link to a chat.
  ///
  /// * [type]: Type of the chat.
  /// * [photo]: Photo of the chat; may be null *(optional)*.
  /// * [createsJoinRequest]: True, if the link only creates join request.
  const LinkPreviewTypeChat({
    required this.type,
    this.photo,
    required this.createsJoinRequest,
  });

  /// Type of the chat
  final InviteLinkChatType type;

  /// Photo of the chat; may be null
  final ChatPhoto? photo;

  /// True, if the link only creates join request
  final bool createsJoinRequest;

  /// Parse from a json
  factory LinkPreviewTypeChat.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeChat(
        type: InviteLinkChatType.fromJson(json['type']),
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        createsJoinRequest: json['creates_join_request'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "photo": photo?.toJson(),
      "creates_join_request": createsJoinRequest,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the chat
  /// * [photo]: Photo of the chat; may be null
  /// * [creates_join_request]: True, if the link only creates join request
  @override
  LinkPreviewTypeChat copyWith({
    InviteLinkChatType? type,
    ChatPhoto? photo,
    bool? createsJoinRequest,
  }) =>
      LinkPreviewTypeChat(
        type: type ?? this.type,
        photo: photo ?? this.photo,
        createsJoinRequest: createsJoinRequest ?? this.createsJoinRequest,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeDirectMessagesChat** *(linkPreviewTypeDirectMessagesChat)* - child of LinkPreviewType
///
/// The link is a link to a direct messages chat of a channel.
///
/// * [photo]: Photo of the channel chat; may be null *(optional)*.
final class LinkPreviewTypeDirectMessagesChat extends LinkPreviewType {
  /// **LinkPreviewTypeDirectMessagesChat** *(linkPreviewTypeDirectMessagesChat)* - child of LinkPreviewType
  ///
  /// The link is a link to a direct messages chat of a channel.
  ///
  /// * [photo]: Photo of the channel chat; may be null *(optional)*.
  const LinkPreviewTypeDirectMessagesChat({
    this.photo,
  });

  /// Photo of the channel chat; may be null
  final ChatPhoto? photo;

  /// Parse from a json
  factory LinkPreviewTypeDirectMessagesChat.fromJson(
          Map<String, dynamic> json) =>
      LinkPreviewTypeDirectMessagesChat(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the channel chat; may be null
  @override
  LinkPreviewTypeDirectMessagesChat copyWith({
    ChatPhoto? photo,
  }) =>
      LinkPreviewTypeDirectMessagesChat(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeDirectMessagesChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeDocument** *(linkPreviewTypeDocument)* - child of LinkPreviewType
///
/// The link is a link to a general file.
///
/// * [document]: The document description.
final class LinkPreviewTypeDocument extends LinkPreviewType {
  /// **LinkPreviewTypeDocument** *(linkPreviewTypeDocument)* - child of LinkPreviewType
  ///
  /// The link is a link to a general file.
  ///
  /// * [document]: The document description.
  const LinkPreviewTypeDocument({
    required this.document,
  });

  /// The document description
  final Document document;

  /// Parse from a json
  factory LinkPreviewTypeDocument.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeDocument(
        document: Document.fromJson(json['document']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "document": document.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [document]: The document description
  @override
  LinkPreviewTypeDocument copyWith({
    Document? document,
  }) =>
      LinkPreviewTypeDocument(
        document: document ?? this.document,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeEmbeddedAnimationPlayer** *(linkPreviewTypeEmbeddedAnimationPlayer)* - child of LinkPreviewType
///
/// The link is a link to an animation player.
///
/// * [url]: URL of the external animation player.
/// * [animation]: The cached animation; may be null if unknown *(optional)*.
/// * [thumbnail]: Thumbnail of the animation; may be null if unknown *(optional)*.
/// * [duration]: Duration of the animation, in seconds.
/// * [width]: Expected width of the embedded player.
/// * [height]: Expected height of the embedded player.
final class LinkPreviewTypeEmbeddedAnimationPlayer extends LinkPreviewType {
  /// **LinkPreviewTypeEmbeddedAnimationPlayer** *(linkPreviewTypeEmbeddedAnimationPlayer)* - child of LinkPreviewType
  ///
  /// The link is a link to an animation player.
  ///
  /// * [url]: URL of the external animation player.
  /// * [animation]: The cached animation; may be null if unknown *(optional)*.
  /// * [thumbnail]: Thumbnail of the animation; may be null if unknown *(optional)*.
  /// * [duration]: Duration of the animation, in seconds.
  /// * [width]: Expected width of the embedded player.
  /// * [height]: Expected height of the embedded player.
  const LinkPreviewTypeEmbeddedAnimationPlayer({
    required this.url,
    this.animation,
    this.thumbnail,
    required this.duration,
    required this.width,
    required this.height,
  });

  /// URL of the external animation player
  final String url;

  /// The cached animation; may be null if unknown
  final Animation? animation;

  /// Thumbnail of the animation; may be null if unknown
  final Photo? thumbnail;

  /// Duration of the animation, in seconds
  final int duration;

  /// Expected width of the embedded player
  final int width;

  /// Expected height of the embedded player
  final int height;

  /// Parse from a json
  factory LinkPreviewTypeEmbeddedAnimationPlayer.fromJson(
          Map<String, dynamic> json) =>
      LinkPreviewTypeEmbeddedAnimationPlayer(
        url: json['url'],
        animation: json['animation'] == null
            ? null
            : Animation.fromJson(json['animation']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Photo.fromJson(json['thumbnail']),
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "animation": animation?.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "duration": duration,
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the external animation player
  /// * [animation]: The cached animation; may be null if unknown
  /// * [thumbnail]: Thumbnail of the animation; may be null if unknown
  /// * [duration]: Duration of the animation, in seconds
  /// * [width]: Expected width of the embedded player
  /// * [height]: Expected height of the embedded player
  @override
  LinkPreviewTypeEmbeddedAnimationPlayer copyWith({
    String? url,
    Animation? animation,
    Photo? thumbnail,
    int? duration,
    int? width,
    int? height,
  }) =>
      LinkPreviewTypeEmbeddedAnimationPlayer(
        url: url ?? this.url,
        animation: animation ?? this.animation,
        thumbnail: thumbnail ?? this.thumbnail,
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'linkPreviewTypeEmbeddedAnimationPlayer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeEmbeddedAudioPlayer** *(linkPreviewTypeEmbeddedAudioPlayer)* - child of LinkPreviewType
///
/// The link is a link to an audio player.
///
/// * [url]: URL of the external audio player.
/// * [audio]: The cached audio; may be null if unknown *(optional)*.
/// * [thumbnail]: Thumbnail of the audio; may be null if unknown *(optional)*.
/// * [duration]: Duration of the audio, in seconds.
/// * [width]: Expected width of the embedded player.
/// * [height]: Expected height of the embedded player.
final class LinkPreviewTypeEmbeddedAudioPlayer extends LinkPreviewType {
  /// **LinkPreviewTypeEmbeddedAudioPlayer** *(linkPreviewTypeEmbeddedAudioPlayer)* - child of LinkPreviewType
  ///
  /// The link is a link to an audio player.
  ///
  /// * [url]: URL of the external audio player.
  /// * [audio]: The cached audio; may be null if unknown *(optional)*.
  /// * [thumbnail]: Thumbnail of the audio; may be null if unknown *(optional)*.
  /// * [duration]: Duration of the audio, in seconds.
  /// * [width]: Expected width of the embedded player.
  /// * [height]: Expected height of the embedded player.
  const LinkPreviewTypeEmbeddedAudioPlayer({
    required this.url,
    this.audio,
    this.thumbnail,
    required this.duration,
    required this.width,
    required this.height,
  });

  /// URL of the external audio player
  final String url;

  /// The cached audio; may be null if unknown
  final Audio? audio;

  /// Thumbnail of the audio; may be null if unknown
  final Photo? thumbnail;

  /// Duration of the audio, in seconds
  final int duration;

  /// Expected width of the embedded player
  final int width;

  /// Expected height of the embedded player
  final int height;

  /// Parse from a json
  factory LinkPreviewTypeEmbeddedAudioPlayer.fromJson(
          Map<String, dynamic> json) =>
      LinkPreviewTypeEmbeddedAudioPlayer(
        url: json['url'],
        audio: json['audio'] == null ? null : Audio.fromJson(json['audio']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Photo.fromJson(json['thumbnail']),
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "audio": audio?.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "duration": duration,
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the external audio player
  /// * [audio]: The cached audio; may be null if unknown
  /// * [thumbnail]: Thumbnail of the audio; may be null if unknown
  /// * [duration]: Duration of the audio, in seconds
  /// * [width]: Expected width of the embedded player
  /// * [height]: Expected height of the embedded player
  @override
  LinkPreviewTypeEmbeddedAudioPlayer copyWith({
    String? url,
    Audio? audio,
    Photo? thumbnail,
    int? duration,
    int? width,
    int? height,
  }) =>
      LinkPreviewTypeEmbeddedAudioPlayer(
        url: url ?? this.url,
        audio: audio ?? this.audio,
        thumbnail: thumbnail ?? this.thumbnail,
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeEmbeddedAudioPlayer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeEmbeddedVideoPlayer** *(linkPreviewTypeEmbeddedVideoPlayer)* - child of LinkPreviewType
///
/// The link is a link to a video player.
///
/// * [url]: URL of the external video player.
/// * [video]: The cached video; may be null if unknown *(optional)*.
/// * [thumbnail]: Thumbnail of the video; may be null if unknown *(optional)*.
/// * [duration]: Duration of the video, in seconds.
/// * [width]: Expected width of the embedded player.
/// * [height]: Expected height of the embedded player.
final class LinkPreviewTypeEmbeddedVideoPlayer extends LinkPreviewType {
  /// **LinkPreviewTypeEmbeddedVideoPlayer** *(linkPreviewTypeEmbeddedVideoPlayer)* - child of LinkPreviewType
  ///
  /// The link is a link to a video player.
  ///
  /// * [url]: URL of the external video player.
  /// * [video]: The cached video; may be null if unknown *(optional)*.
  /// * [thumbnail]: Thumbnail of the video; may be null if unknown *(optional)*.
  /// * [duration]: Duration of the video, in seconds.
  /// * [width]: Expected width of the embedded player.
  /// * [height]: Expected height of the embedded player.
  const LinkPreviewTypeEmbeddedVideoPlayer({
    required this.url,
    this.video,
    this.thumbnail,
    required this.duration,
    required this.width,
    required this.height,
  });

  /// URL of the external video player
  final String url;

  /// The cached video; may be null if unknown
  final Video? video;

  /// Thumbnail of the video; may be null if unknown
  final Photo? thumbnail;

  /// Duration of the video, in seconds
  final int duration;

  /// Expected width of the embedded player
  final int width;

  /// Expected height of the embedded player
  final int height;

  /// Parse from a json
  factory LinkPreviewTypeEmbeddedVideoPlayer.fromJson(
          Map<String, dynamic> json) =>
      LinkPreviewTypeEmbeddedVideoPlayer(
        url: json['url'],
        video: json['video'] == null ? null : Video.fromJson(json['video']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Photo.fromJson(json['thumbnail']),
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "video": video?.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "duration": duration,
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the external video player
  /// * [video]: The cached video; may be null if unknown
  /// * [thumbnail]: Thumbnail of the video; may be null if unknown
  /// * [duration]: Duration of the video, in seconds
  /// * [width]: Expected width of the embedded player
  /// * [height]: Expected height of the embedded player
  @override
  LinkPreviewTypeEmbeddedVideoPlayer copyWith({
    String? url,
    Video? video,
    Photo? thumbnail,
    int? duration,
    int? width,
    int? height,
  }) =>
      LinkPreviewTypeEmbeddedVideoPlayer(
        url: url ?? this.url,
        video: video ?? this.video,
        thumbnail: thumbnail ?? this.thumbnail,
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeEmbeddedVideoPlayer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeExternalAudio** *(linkPreviewTypeExternalAudio)* - child of LinkPreviewType
///
/// The link is a link to an audio file.
///
/// * [url]: URL of the audio file.
/// * [mimeType]: MIME type of the audio file.
/// * [duration]: Duration of the audio, in seconds; 0 if unknown.
final class LinkPreviewTypeExternalAudio extends LinkPreviewType {
  /// **LinkPreviewTypeExternalAudio** *(linkPreviewTypeExternalAudio)* - child of LinkPreviewType
  ///
  /// The link is a link to an audio file.
  ///
  /// * [url]: URL of the audio file.
  /// * [mimeType]: MIME type of the audio file.
  /// * [duration]: Duration of the audio, in seconds; 0 if unknown.
  const LinkPreviewTypeExternalAudio({
    required this.url,
    required this.mimeType,
    required this.duration,
  });

  /// URL of the audio file
  final String url;

  /// MIME type of the audio file
  final String mimeType;

  /// Duration of the audio, in seconds; 0 if unknown
  final int duration;

  /// Parse from a json
  factory LinkPreviewTypeExternalAudio.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeExternalAudio(
        url: json['url'],
        mimeType: json['mime_type'],
        duration: json['duration'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "mime_type": mimeType,
      "duration": duration,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the audio file
  /// * [mime_type]: MIME type of the audio file
  /// * [duration]: Duration of the audio, in seconds; 0 if unknown
  @override
  LinkPreviewTypeExternalAudio copyWith({
    String? url,
    String? mimeType,
    int? duration,
  }) =>
      LinkPreviewTypeExternalAudio(
        url: url ?? this.url,
        mimeType: mimeType ?? this.mimeType,
        duration: duration ?? this.duration,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeExternalAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeExternalVideo** *(linkPreviewTypeExternalVideo)* - child of LinkPreviewType
///
/// The link is a link to a video file.
///
/// * [url]: URL of the video file.
/// * [mimeType]: MIME type of the video file.
/// * [width]: Expected width of the video preview; 0 if unknown.
/// * [height]: Expected height of the video preview; 0 if unknown.
/// * [duration]: Duration of the video, in seconds; 0 if unknown.
final class LinkPreviewTypeExternalVideo extends LinkPreviewType {
  /// **LinkPreviewTypeExternalVideo** *(linkPreviewTypeExternalVideo)* - child of LinkPreviewType
  ///
  /// The link is a link to a video file.
  ///
  /// * [url]: URL of the video file.
  /// * [mimeType]: MIME type of the video file.
  /// * [width]: Expected width of the video preview; 0 if unknown.
  /// * [height]: Expected height of the video preview; 0 if unknown.
  /// * [duration]: Duration of the video, in seconds; 0 if unknown.
  const LinkPreviewTypeExternalVideo({
    required this.url,
    required this.mimeType,
    required this.width,
    required this.height,
    required this.duration,
  });

  /// URL of the video file
  final String url;

  /// MIME type of the video file
  final String mimeType;

  /// Expected width of the video preview; 0 if unknown
  final int width;

  /// Expected height of the video preview; 0 if unknown
  final int height;

  /// Duration of the video, in seconds; 0 if unknown
  final int duration;

  /// Parse from a json
  factory LinkPreviewTypeExternalVideo.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeExternalVideo(
        url: json['url'],
        mimeType: json['mime_type'],
        width: json['width'],
        height: json['height'],
        duration: json['duration'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "mime_type": mimeType,
      "width": width,
      "height": height,
      "duration": duration,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the video file
  /// * [mime_type]: MIME type of the video file
  /// * [width]: Expected width of the video preview; 0 if unknown
  /// * [height]: Expected height of the video preview; 0 if unknown
  /// * [duration]: Duration of the video, in seconds; 0 if unknown
  @override
  LinkPreviewTypeExternalVideo copyWith({
    String? url,
    String? mimeType,
    int? width,
    int? height,
    int? duration,
  }) =>
      LinkPreviewTypeExternalVideo(
        url: url ?? this.url,
        mimeType: mimeType ?? this.mimeType,
        width: width ?? this.width,
        height: height ?? this.height,
        duration: duration ?? this.duration,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeExternalVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeGiftAuction** *(linkPreviewTypeGiftAuction)* - child of LinkPreviewType
///
/// The link is a link to a gift auction.
///
/// * [gift]: The gift.
/// * [auctionEndDate]: Point in time (Unix timestamp) when the auction will be ended.
final class LinkPreviewTypeGiftAuction extends LinkPreviewType {
  /// **LinkPreviewTypeGiftAuction** *(linkPreviewTypeGiftAuction)* - child of LinkPreviewType
  ///
  /// The link is a link to a gift auction.
  ///
  /// * [gift]: The gift.
  /// * [auctionEndDate]: Point in time (Unix timestamp) when the auction will be ended.
  const LinkPreviewTypeGiftAuction({
    required this.gift,
    required this.auctionEndDate,
  });

  /// The gift
  final Gift gift;

  /// Point in time (Unix timestamp) when the auction will be ended
  final int auctionEndDate;

  /// Parse from a json
  factory LinkPreviewTypeGiftAuction.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeGiftAuction(
        gift: Gift.fromJson(json['gift']),
        auctionEndDate: json['auction_end_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "auction_end_date": auctionEndDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [auction_end_date]: Point in time (Unix timestamp) when the auction will be ended
  @override
  LinkPreviewTypeGiftAuction copyWith({
    Gift? gift,
    int? auctionEndDate,
  }) =>
      LinkPreviewTypeGiftAuction(
        gift: gift ?? this.gift,
        auctionEndDate: auctionEndDate ?? this.auctionEndDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeGiftAuction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeGiftCollection** *(linkPreviewTypeGiftCollection)* - child of LinkPreviewType
///
/// The link is a link to a gift collection.
///
/// * [icons]: Icons for some gifts from the collection; may be empty.
final class LinkPreviewTypeGiftCollection extends LinkPreviewType {
  /// **LinkPreviewTypeGiftCollection** *(linkPreviewTypeGiftCollection)* - child of LinkPreviewType
  ///
  /// The link is a link to a gift collection.
  ///
  /// * [icons]: Icons for some gifts from the collection; may be empty.
  const LinkPreviewTypeGiftCollection({
    required this.icons,
  });

  /// Icons for some gifts from the collection; may be empty
  final List<Sticker> icons;

  /// Parse from a json
  factory LinkPreviewTypeGiftCollection.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeGiftCollection(
        icons: List<Sticker>.from((json['icons'] ?? [])
            .map((item) => Sticker.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "icons": icons.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [icons]: Icons for some gifts from the collection; may be empty
  @override
  LinkPreviewTypeGiftCollection copyWith({
    List<Sticker>? icons,
  }) =>
      LinkPreviewTypeGiftCollection(
        icons: icons ?? this.icons,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeGiftCollection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeGroupCall** *(linkPreviewTypeGroupCall)* - child of LinkPreviewType
///
/// The link is a link to a group call that isn't bound to a chat.
final class LinkPreviewTypeGroupCall extends LinkPreviewType {
  /// **LinkPreviewTypeGroupCall** *(linkPreviewTypeGroupCall)* - child of LinkPreviewType
  ///
  /// The link is a link to a group call that isn't bound to a chat.
  const LinkPreviewTypeGroupCall();

  /// Parse from a json
  factory LinkPreviewTypeGroupCall.fromJson(Map<String, dynamic> json) =>
      const LinkPreviewTypeGroupCall();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeGroupCall copyWith() => const LinkPreviewTypeGroupCall();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeInvoice** *(linkPreviewTypeInvoice)* - child of LinkPreviewType
///
/// The link is a link to an invoice.
final class LinkPreviewTypeInvoice extends LinkPreviewType {
  /// **LinkPreviewTypeInvoice** *(linkPreviewTypeInvoice)* - child of LinkPreviewType
  ///
  /// The link is a link to an invoice.
  const LinkPreviewTypeInvoice();

  /// Parse from a json
  factory LinkPreviewTypeInvoice.fromJson(Map<String, dynamic> json) =>
      const LinkPreviewTypeInvoice();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeInvoice copyWith() => const LinkPreviewTypeInvoice();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeLiveStory** *(linkPreviewTypeLiveStory)* - child of LinkPreviewType
///
/// The link is a link to a live story group call.
///
/// * [storyPosterChatId]: The identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
final class LinkPreviewTypeLiveStory extends LinkPreviewType {
  /// **LinkPreviewTypeLiveStory** *(linkPreviewTypeLiveStory)* - child of LinkPreviewType
  ///
  /// The link is a link to a live story group call.
  ///
  /// * [storyPosterChatId]: The identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  const LinkPreviewTypeLiveStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// The identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// Parse from a json
  factory LinkPreviewTypeLiveStory.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeLiveStory(
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
  /// * [story_poster_chat_id]: The identifier of the chat that posted the story
  /// * [story_id]: Story identifier
  @override
  LinkPreviewTypeLiveStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      LinkPreviewTypeLiveStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeLiveStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeMessage** *(linkPreviewTypeMessage)* - child of LinkPreviewType
///
/// The link is a link to a text or a poll Telegram message.
final class LinkPreviewTypeMessage extends LinkPreviewType {
  /// **LinkPreviewTypeMessage** *(linkPreviewTypeMessage)* - child of LinkPreviewType
  ///
  /// The link is a link to a text or a poll Telegram message.
  const LinkPreviewTypeMessage();

  /// Parse from a json
  factory LinkPreviewTypeMessage.fromJson(Map<String, dynamic> json) =>
      const LinkPreviewTypeMessage();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeMessage copyWith() => const LinkPreviewTypeMessage();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypePhoto** *(linkPreviewTypePhoto)* - child of LinkPreviewType
///
/// The link is a link to a photo.
///
/// * [photo]: The photo.
final class LinkPreviewTypePhoto extends LinkPreviewType {
  /// **LinkPreviewTypePhoto** *(linkPreviewTypePhoto)* - child of LinkPreviewType
  ///
  /// The link is a link to a photo.
  ///
  /// * [photo]: The photo.
  const LinkPreviewTypePhoto({
    required this.photo,
  });

  /// The photo
  final Photo photo;

  /// Parse from a json
  factory LinkPreviewTypePhoto.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypePhoto(
        photo: Photo.fromJson(json['photo']),
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
  /// * [photo]: The photo
  @override
  LinkPreviewTypePhoto copyWith({
    Photo? photo,
  }) =>
      LinkPreviewTypePhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypePremiumGiftCode** *(linkPreviewTypePremiumGiftCode)* - child of LinkPreviewType
///
/// The link is a link to a Telegram Premium gift code.
final class LinkPreviewTypePremiumGiftCode extends LinkPreviewType {
  /// **LinkPreviewTypePremiumGiftCode** *(linkPreviewTypePremiumGiftCode)* - child of LinkPreviewType
  ///
  /// The link is a link to a Telegram Premium gift code.
  const LinkPreviewTypePremiumGiftCode();

  /// Parse from a json
  factory LinkPreviewTypePremiumGiftCode.fromJson(Map<String, dynamic> json) =>
      const LinkPreviewTypePremiumGiftCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypePremiumGiftCode copyWith() =>
      const LinkPreviewTypePremiumGiftCode();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypePremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeRequestManagedBot** *(linkPreviewTypeRequestManagedBot)* - child of LinkPreviewType
///
/// The link is a link to a dialog for creating a managed bot.
final class LinkPreviewTypeRequestManagedBot extends LinkPreviewType {
  /// **LinkPreviewTypeRequestManagedBot** *(linkPreviewTypeRequestManagedBot)* - child of LinkPreviewType
  ///
  /// The link is a link to a dialog for creating a managed bot.
  const LinkPreviewTypeRequestManagedBot();

  /// Parse from a json
  factory LinkPreviewTypeRequestManagedBot.fromJson(
          Map<String, dynamic> json) =>
      const LinkPreviewTypeRequestManagedBot();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeRequestManagedBot copyWith() =>
      const LinkPreviewTypeRequestManagedBot();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeRequestManagedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeShareableChatFolder** *(linkPreviewTypeShareableChatFolder)* - child of LinkPreviewType
///
/// The link is a link to a shareable chat folder.
final class LinkPreviewTypeShareableChatFolder extends LinkPreviewType {
  /// **LinkPreviewTypeShareableChatFolder** *(linkPreviewTypeShareableChatFolder)* - child of LinkPreviewType
  ///
  /// The link is a link to a shareable chat folder.
  const LinkPreviewTypeShareableChatFolder();

  /// Parse from a json
  factory LinkPreviewTypeShareableChatFolder.fromJson(
          Map<String, dynamic> json) =>
      const LinkPreviewTypeShareableChatFolder();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeShareableChatFolder copyWith() =>
      const LinkPreviewTypeShareableChatFolder();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeShareableChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeSticker** *(linkPreviewTypeSticker)* - child of LinkPreviewType
///
/// The link is a link to a sticker.
///
/// * [sticker]: The sticker. It can be an arbitrary WEBP image and can have dimensions bigger than 512.
final class LinkPreviewTypeSticker extends LinkPreviewType {
  /// **LinkPreviewTypeSticker** *(linkPreviewTypeSticker)* - child of LinkPreviewType
  ///
  /// The link is a link to a sticker.
  ///
  /// * [sticker]: The sticker. It can be an arbitrary WEBP image and can have dimensions bigger than 512.
  const LinkPreviewTypeSticker({
    required this.sticker,
  });

  /// The sticker. It can be an arbitrary WEBP image and can have dimensions bigger than 512
  final Sticker sticker;

  /// Parse from a json
  factory LinkPreviewTypeSticker.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeSticker(
        sticker: Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: The sticker. It can be an arbitrary WEBP image and can have dimensions bigger than 512
  @override
  LinkPreviewTypeSticker copyWith({
    Sticker? sticker,
  }) =>
      LinkPreviewTypeSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeStickerSet** *(linkPreviewTypeStickerSet)* - child of LinkPreviewType
///
/// The link is a link to a sticker set.
///
/// * [stickers]: Up to 4 stickers from the sticker set.
final class LinkPreviewTypeStickerSet extends LinkPreviewType {
  /// **LinkPreviewTypeStickerSet** *(linkPreviewTypeStickerSet)* - child of LinkPreviewType
  ///
  /// The link is a link to a sticker set.
  ///
  /// * [stickers]: Up to 4 stickers from the sticker set.
  const LinkPreviewTypeStickerSet({
    required this.stickers,
  });

  /// Up to 4 stickers from the sticker set
  final List<Sticker> stickers;

  /// Parse from a json
  factory LinkPreviewTypeStickerSet.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeStickerSet(
        stickers: List<Sticker>.from((json['stickers'] ?? [])
            .map((item) => Sticker.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "stickers": stickers.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [stickers]: Up to 4 stickers from the sticker set
  @override
  LinkPreviewTypeStickerSet copyWith({
    List<Sticker>? stickers,
  }) =>
      LinkPreviewTypeStickerSet(
        stickers: stickers ?? this.stickers,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeStory** *(linkPreviewTypeStory)* - child of LinkPreviewType
///
/// The link is a link to a story. Link preview description is unavailable.
///
/// * [storyPosterChatId]: The identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
final class LinkPreviewTypeStory extends LinkPreviewType {
  /// **LinkPreviewTypeStory** *(linkPreviewTypeStory)* - child of LinkPreviewType
  ///
  /// The link is a link to a story. Link preview description is unavailable.
  ///
  /// * [storyPosterChatId]: The identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  const LinkPreviewTypeStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// The identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// Parse from a json
  factory LinkPreviewTypeStory.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeStory(
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
  /// * [story_poster_chat_id]: The identifier of the chat that posted the story
  /// * [story_id]: Story identifier
  @override
  LinkPreviewTypeStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      LinkPreviewTypeStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeStoryAlbum** *(linkPreviewTypeStoryAlbum)* - child of LinkPreviewType
///
/// The link is a link to an album of stories.
///
/// * [photoIcon]: Icon of the album; may be null if none *(optional)*.
/// * [videoIcon]: Video icon of the album; may be null if none *(optional)*.
final class LinkPreviewTypeStoryAlbum extends LinkPreviewType {
  /// **LinkPreviewTypeStoryAlbum** *(linkPreviewTypeStoryAlbum)* - child of LinkPreviewType
  ///
  /// The link is a link to an album of stories.
  ///
  /// * [photoIcon]: Icon of the album; may be null if none *(optional)*.
  /// * [videoIcon]: Video icon of the album; may be null if none *(optional)*.
  const LinkPreviewTypeStoryAlbum({
    this.photoIcon,
    this.videoIcon,
  });

  /// Icon of the album; may be null if none
  final Photo? photoIcon;

  /// Video icon of the album; may be null if none
  final Video? videoIcon;

  /// Parse from a json
  factory LinkPreviewTypeStoryAlbum.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeStoryAlbum(
        photoIcon: json['photo_icon'] == null
            ? null
            : Photo.fromJson(json['photo_icon']),
        videoIcon: json['video_icon'] == null
            ? null
            : Video.fromJson(json['video_icon']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo_icon": photoIcon?.toJson(),
      "video_icon": videoIcon?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo_icon]: Icon of the album; may be null if none
  /// * [video_icon]: Video icon of the album; may be null if none
  @override
  LinkPreviewTypeStoryAlbum copyWith({
    Photo? photoIcon,
    Video? videoIcon,
  }) =>
      LinkPreviewTypeStoryAlbum(
        photoIcon: photoIcon ?? this.photoIcon,
        videoIcon: videoIcon ?? this.videoIcon,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeStoryAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeSupergroupBoost** *(linkPreviewTypeSupergroupBoost)* - child of LinkPreviewType
///
/// The link is a link to boost a supergroup chat.
///
/// * [photo]: Photo of the chat; may be null *(optional)*.
final class LinkPreviewTypeSupergroupBoost extends LinkPreviewType {
  /// **LinkPreviewTypeSupergroupBoost** *(linkPreviewTypeSupergroupBoost)* - child of LinkPreviewType
  ///
  /// The link is a link to boost a supergroup chat.
  ///
  /// * [photo]: Photo of the chat; may be null *(optional)*.
  const LinkPreviewTypeSupergroupBoost({
    this.photo,
  });

  /// Photo of the chat; may be null
  final ChatPhoto? photo;

  /// Parse from a json
  factory LinkPreviewTypeSupergroupBoost.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeSupergroupBoost(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the chat; may be null
  @override
  LinkPreviewTypeSupergroupBoost copyWith({
    ChatPhoto? photo,
  }) =>
      LinkPreviewTypeSupergroupBoost(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeSupergroupBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeTextCompositionStyle** *(linkPreviewTypeTextCompositionStyle)* - child of LinkPreviewType
///
/// The link is a link to a text composition style.
///
/// * [customEmojiId]: Identifier of the custom emoji corresponding to the style; 0 if none.
final class LinkPreviewTypeTextCompositionStyle extends LinkPreviewType {
  /// **LinkPreviewTypeTextCompositionStyle** *(linkPreviewTypeTextCompositionStyle)* - child of LinkPreviewType
  ///
  /// The link is a link to a text composition style.
  ///
  /// * [customEmojiId]: Identifier of the custom emoji corresponding to the style; 0 if none.
  const LinkPreviewTypeTextCompositionStyle({
    required this.customEmojiId,
  });

  /// Identifier of the custom emoji corresponding to the style; 0 if none
  final int customEmojiId;

  /// Parse from a json
  factory LinkPreviewTypeTextCompositionStyle.fromJson(
          Map<String, dynamic> json) =>
      LinkPreviewTypeTextCompositionStyle(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.tryParse(json['custom_emoji_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Identifier of the custom emoji corresponding to the style; 0 if none
  @override
  LinkPreviewTypeTextCompositionStyle copyWith({
    int? customEmojiId,
  }) =>
      LinkPreviewTypeTextCompositionStyle(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeTheme** *(linkPreviewTypeTheme)* - child of LinkPreviewType
///
/// The link is a link to a cloud theme. TDLib has no theme support yet.
///
/// * [documents]: The list of files with theme description.
/// * [settings]: Settings for the cloud theme; may be null if unknown *(optional)*.
final class LinkPreviewTypeTheme extends LinkPreviewType {
  /// **LinkPreviewTypeTheme** *(linkPreviewTypeTheme)* - child of LinkPreviewType
  ///
  /// The link is a link to a cloud theme. TDLib has no theme support yet.
  ///
  /// * [documents]: The list of files with theme description.
  /// * [settings]: Settings for the cloud theme; may be null if unknown *(optional)*.
  const LinkPreviewTypeTheme({
    required this.documents,
    this.settings,
  });

  /// The list of files with theme description
  final List<Document> documents;

  /// Settings for the cloud theme; may be null if unknown
  final ThemeSettings? settings;

  /// Parse from a json
  factory LinkPreviewTypeTheme.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeTheme(
        documents: List<Document>.from((json['documents'] ?? [])
            .map((item) => Document.fromJson(item))
            .toList()),
        settings: json['settings'] == null
            ? null
            : ThemeSettings.fromJson(json['settings']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "documents": documents.map((i) => i.toJson()).toList(),
      "settings": settings?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [documents]: The list of files with theme description
  /// * [settings]: Settings for the cloud theme; may be null if unknown
  @override
  LinkPreviewTypeTheme copyWith({
    List<Document>? documents,
    ThemeSettings? settings,
  }) =>
      LinkPreviewTypeTheme(
        documents: documents ?? this.documents,
        settings: settings ?? this.settings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeUnsupported** *(linkPreviewTypeUnsupported)* - child of LinkPreviewType
///
/// The link preview type is unsupported yet.
final class LinkPreviewTypeUnsupported extends LinkPreviewType {
  /// **LinkPreviewTypeUnsupported** *(linkPreviewTypeUnsupported)* - child of LinkPreviewType
  ///
  /// The link preview type is unsupported yet.
  const LinkPreviewTypeUnsupported();

  /// Parse from a json
  factory LinkPreviewTypeUnsupported.fromJson(Map<String, dynamic> json) =>
      const LinkPreviewTypeUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  LinkPreviewTypeUnsupported copyWith() => const LinkPreviewTypeUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeUpgradedGift** *(linkPreviewTypeUpgradedGift)* - child of LinkPreviewType
///
/// The link is a link to an upgraded gift.
///
/// * [gift]: The gift.
final class LinkPreviewTypeUpgradedGift extends LinkPreviewType {
  /// **LinkPreviewTypeUpgradedGift** *(linkPreviewTypeUpgradedGift)* - child of LinkPreviewType
  ///
  /// The link is a link to an upgraded gift.
  ///
  /// * [gift]: The gift.
  const LinkPreviewTypeUpgradedGift({
    required this.gift,
  });

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory LinkPreviewTypeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeUpgradedGift(
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  @override
  LinkPreviewTypeUpgradedGift copyWith({
    UpgradedGift? gift,
  }) =>
      LinkPreviewTypeUpgradedGift(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeUser** *(linkPreviewTypeUser)* - child of LinkPreviewType
///
/// The link is a link to a user.
///
/// * [photo]: Photo of the user; may be null if none *(optional)*.
/// * [isBot]: True, if the user is a bot.
final class LinkPreviewTypeUser extends LinkPreviewType {
  /// **LinkPreviewTypeUser** *(linkPreviewTypeUser)* - child of LinkPreviewType
  ///
  /// The link is a link to a user.
  ///
  /// * [photo]: Photo of the user; may be null if none *(optional)*.
  /// * [isBot]: True, if the user is a bot.
  const LinkPreviewTypeUser({
    this.photo,
    required this.isBot,
  });

  /// Photo of the user; may be null if none
  final ChatPhoto? photo;

  /// True, if the user is a bot
  final bool isBot;

  /// Parse from a json
  factory LinkPreviewTypeUser.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeUser(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        isBot: json['is_bot'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
      "is_bot": isBot,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the user; may be null if none
  /// * [is_bot]: True, if the user is a bot
  @override
  LinkPreviewTypeUser copyWith({
    ChatPhoto? photo,
    bool? isBot,
  }) =>
      LinkPreviewTypeUser(
        photo: photo ?? this.photo,
        isBot: isBot ?? this.isBot,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeVideo** *(linkPreviewTypeVideo)* - child of LinkPreviewType
///
/// The link is a link to a video.
///
/// * [video]: The video description.
/// * [cover]: Cover of the video; may be null if none *(optional)*.
/// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
final class LinkPreviewTypeVideo extends LinkPreviewType {
  /// **LinkPreviewTypeVideo** *(linkPreviewTypeVideo)* - child of LinkPreviewType
  ///
  /// The link is a link to a video.
  ///
  /// * [video]: The video description.
  /// * [cover]: Cover of the video; may be null if none *(optional)*.
  /// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
  const LinkPreviewTypeVideo({
    required this.video,
    this.cover,
    required this.startTimestamp,
  });

  /// The video description
  final Video video;

  /// Cover of the video; may be null if none
  final Photo? cover;

  /// Timestamp from which the video playing must start, in seconds
  final int startTimestamp;

  /// Parse from a json
  factory LinkPreviewTypeVideo.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeVideo(
        video: Video.fromJson(json['video']),
        cover: json['cover'] == null ? null : Photo.fromJson(json['cover']),
        startTimestamp: json['start_timestamp'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "cover": cover?.toJson(),
      "start_timestamp": startTimestamp,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: The video description
  /// * [cover]: Cover of the video; may be null if none
  /// * [start_timestamp]: Timestamp from which the video playing must start, in seconds
  @override
  LinkPreviewTypeVideo copyWith({
    Video? video,
    Photo? cover,
    int? startTimestamp,
  }) =>
      LinkPreviewTypeVideo(
        video: video ?? this.video,
        cover: cover ?? this.cover,
        startTimestamp: startTimestamp ?? this.startTimestamp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeVideoChat** *(linkPreviewTypeVideoChat)* - child of LinkPreviewType
///
/// The link is a link to a video chat.
///
/// * [photo]: Photo of the chat with the video chat; may be null if none *(optional)*.
/// * [isLiveStream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group.
/// * [joinsAsSpeaker]: True, if the user can use the link to join the video chat without being muted by administrators.
final class LinkPreviewTypeVideoChat extends LinkPreviewType {
  /// **LinkPreviewTypeVideoChat** *(linkPreviewTypeVideoChat)* - child of LinkPreviewType
  ///
  /// The link is a link to a video chat.
  ///
  /// * [photo]: Photo of the chat with the video chat; may be null if none *(optional)*.
  /// * [isLiveStream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group.
  /// * [joinsAsSpeaker]: True, if the user can use the link to join the video chat without being muted by administrators.
  const LinkPreviewTypeVideoChat({
    this.photo,
    required this.isLiveStream,
    required this.joinsAsSpeaker,
  });

  /// Photo of the chat with the video chat; may be null if none
  final ChatPhoto? photo;

  /// True, if the video chat is expected to be a live stream in a channel or a broadcast group
  final bool isLiveStream;

  /// True, if the user can use the link to join the video chat without being muted by administrators
  final bool joinsAsSpeaker;

  /// Parse from a json
  factory LinkPreviewTypeVideoChat.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeVideoChat(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        isLiveStream: json['is_live_stream'],
        joinsAsSpeaker: json['joins_as_speaker'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
      "is_live_stream": isLiveStream,
      "joins_as_speaker": joinsAsSpeaker,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the chat with the video chat; may be null if none
  /// * [is_live_stream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group
  /// * [joins_as_speaker]: True, if the user can use the link to join the video chat without being muted by administrators
  @override
  LinkPreviewTypeVideoChat copyWith({
    ChatPhoto? photo,
    bool? isLiveStream,
    bool? joinsAsSpeaker,
  }) =>
      LinkPreviewTypeVideoChat(
        photo: photo ?? this.photo,
        isLiveStream: isLiveStream ?? this.isLiveStream,
        joinsAsSpeaker: joinsAsSpeaker ?? this.joinsAsSpeaker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeVideoChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeVideoNote** *(linkPreviewTypeVideoNote)* - child of LinkPreviewType
///
/// The link is a link to a video note message.
///
/// * [videoNote]: The video note.
final class LinkPreviewTypeVideoNote extends LinkPreviewType {
  /// **LinkPreviewTypeVideoNote** *(linkPreviewTypeVideoNote)* - child of LinkPreviewType
  ///
  /// The link is a link to a video note message.
  ///
  /// * [videoNote]: The video note.
  const LinkPreviewTypeVideoNote({
    required this.videoNote,
  });

  /// The video note
  final VideoNote videoNote;

  /// Parse from a json
  factory LinkPreviewTypeVideoNote.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeVideoNote(
        videoNote: VideoNote.fromJson(json['video_note']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video_note": videoNote.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video_note]: The video note
  @override
  LinkPreviewTypeVideoNote copyWith({
    VideoNote? videoNote,
  }) =>
      LinkPreviewTypeVideoNote(
        videoNote: videoNote ?? this.videoNote,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeVoiceNote** *(linkPreviewTypeVoiceNote)* - child of LinkPreviewType
///
/// The link is a link to a voice note message.
///
/// * [voiceNote]: The voice note.
final class LinkPreviewTypeVoiceNote extends LinkPreviewType {
  /// **LinkPreviewTypeVoiceNote** *(linkPreviewTypeVoiceNote)* - child of LinkPreviewType
  ///
  /// The link is a link to a voice note message.
  ///
  /// * [voiceNote]: The voice note.
  const LinkPreviewTypeVoiceNote({
    required this.voiceNote,
  });

  /// The voice note
  final VoiceNote voiceNote;

  /// Parse from a json
  factory LinkPreviewTypeVoiceNote.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeVoiceNote(
        voiceNote: VoiceNote.fromJson(json['voice_note']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "voice_note": voiceNote.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [voice_note]: The voice note
  @override
  LinkPreviewTypeVoiceNote copyWith({
    VoiceNote? voiceNote,
  }) =>
      LinkPreviewTypeVoiceNote(
        voiceNote: voiceNote ?? this.voiceNote,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewTypeWebApp** *(linkPreviewTypeWebApp)* - child of LinkPreviewType
///
/// The link is a link to a Web App.
///
/// * [photo]: Web App photo; may be null if none *(optional)*.
final class LinkPreviewTypeWebApp extends LinkPreviewType {
  /// **LinkPreviewTypeWebApp** *(linkPreviewTypeWebApp)* - child of LinkPreviewType
  ///
  /// The link is a link to a Web App.
  ///
  /// * [photo]: Web App photo; may be null if none *(optional)*.
  const LinkPreviewTypeWebApp({
    this.photo,
  });

  /// Web App photo; may be null if none
  final Photo? photo;

  /// Parse from a json
  factory LinkPreviewTypeWebApp.fromJson(Map<String, dynamic> json) =>
      LinkPreviewTypeWebApp(
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Web App photo; may be null if none
  @override
  LinkPreviewTypeWebApp copyWith({
    Photo? photo,
  }) =>
      LinkPreviewTypeWebApp(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewTypeWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
