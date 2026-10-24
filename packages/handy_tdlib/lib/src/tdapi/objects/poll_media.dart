part of '../tdapi.dart';

/// **PollMedia** *(pollMedia)* - parent
///
/// Contains the media in a poll.
sealed class PollMedia extends TdObject {
  /// **PollMedia** *(pollMedia)* - parent
  ///
  /// Contains the media in a poll.
  const PollMedia();

  /// a PollMedia return type can be :
  /// * [PollMediaAnimation]
  /// * [PollMediaAudio]
  /// * [PollMediaDocument]
  /// * [PollMediaLink]
  /// * [PollMediaLocation]
  /// * [PollMediaPhoto]
  /// * [PollMediaSticker]
  /// * [PollMediaVenue]
  /// * [PollMediaVideo]
  factory PollMedia.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PollMediaAnimation.defaultObjectId:
        return PollMediaAnimation.fromJson(json);
      case PollMediaAudio.defaultObjectId:
        return PollMediaAudio.fromJson(json);
      case PollMediaDocument.defaultObjectId:
        return PollMediaDocument.fromJson(json);
      case PollMediaLink.defaultObjectId:
        return PollMediaLink.fromJson(json);
      case PollMediaLocation.defaultObjectId:
        return PollMediaLocation.fromJson(json);
      case PollMediaPhoto.defaultObjectId:
        return PollMediaPhoto.fromJson(json);
      case PollMediaSticker.defaultObjectId:
        return PollMediaSticker.fromJson(json);
      case PollMediaVenue.defaultObjectId:
        return PollMediaVenue.fromJson(json);
      case PollMediaVideo.defaultObjectId:
        return PollMediaVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PollMedia)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PollMedia copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pollMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaAnimation** *(pollMediaAnimation)* - child of PollMedia
///
/// An animation.
///
/// * [animation]: The animation.
final class PollMediaAnimation extends PollMedia {
  /// **PollMediaAnimation** *(pollMediaAnimation)* - child of PollMedia
  ///
  /// An animation.
  ///
  /// * [animation]: The animation.
  const PollMediaAnimation({
    required this.animation,
  });

  /// The animation
  final Animation animation;

  /// Parse from a json
  factory PollMediaAnimation.fromJson(Map<String, dynamic> json) =>
      PollMediaAnimation(
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
  PollMediaAnimation copyWith({
    Animation? animation,
  }) =>
      PollMediaAnimation(
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaAudio** *(pollMediaAudio)* - child of PollMedia
///
/// An audio.
///
/// * [audio]: The audio.
final class PollMediaAudio extends PollMedia {
  /// **PollMediaAudio** *(pollMediaAudio)* - child of PollMedia
  ///
  /// An audio.
  ///
  /// * [audio]: The audio.
  const PollMediaAudio({
    required this.audio,
  });

  /// The audio
  final Audio audio;

  /// Parse from a json
  factory PollMediaAudio.fromJson(Map<String, dynamic> json) => PollMediaAudio(
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
  /// * [audio]: The audio
  @override
  PollMediaAudio copyWith({
    Audio? audio,
  }) =>
      PollMediaAudio(
        audio: audio ?? this.audio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaDocument** *(pollMediaDocument)* - child of PollMedia
///
/// A document (general file).
///
/// * [document]: The document.
final class PollMediaDocument extends PollMedia {
  /// **PollMediaDocument** *(pollMediaDocument)* - child of PollMedia
  ///
  /// A document (general file).
  ///
  /// * [document]: The document.
  const PollMediaDocument({
    required this.document,
  });

  /// The document
  final Document document;

  /// Parse from a json
  factory PollMediaDocument.fromJson(Map<String, dynamic> json) =>
      PollMediaDocument(
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
  /// * [document]: The document
  @override
  PollMediaDocument copyWith({
    Document? document,
  }) =>
      PollMediaDocument(
        document: document ?? this.document,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaLink** *(pollMediaLink)* - child of PollMedia
///
/// A link.
///
/// * [url]: URL of the link.
/// * [linkPreview]: Preview of the link; may be null if unknown *(optional)*.
final class PollMediaLink extends PollMedia {
  /// **PollMediaLink** *(pollMediaLink)* - child of PollMedia
  ///
  /// A link.
  ///
  /// * [url]: URL of the link.
  /// * [linkPreview]: Preview of the link; may be null if unknown *(optional)*.
  const PollMediaLink({
    required this.url,
    this.linkPreview,
  });

  /// URL of the link
  final String url;

  /// Preview of the link; may be null if unknown
  final LinkPreview? linkPreview;

  /// Parse from a json
  factory PollMediaLink.fromJson(Map<String, dynamic> json) => PollMediaLink(
        url: json['url'],
        linkPreview: json['link_preview'] == null
            ? null
            : LinkPreview.fromJson(json['link_preview']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "link_preview": linkPreview?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the link
  /// * [link_preview]: Preview of the link; may be null if unknown
  @override
  PollMediaLink copyWith({
    String? url,
    LinkPreview? linkPreview,
  }) =>
      PollMediaLink(
        url: url ?? this.url,
        linkPreview: linkPreview ?? this.linkPreview,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaLocation** *(pollMediaLocation)* - child of PollMedia
///
/// A location.
///
/// * [location]: The location.
final class PollMediaLocation extends PollMedia {
  /// **PollMediaLocation** *(pollMediaLocation)* - child of PollMedia
  ///
  /// A location.
  ///
  /// * [location]: The location.
  const PollMediaLocation({
    required this.location,
  });

  /// The location
  final Location location;

  /// Parse from a json
  factory PollMediaLocation.fromJson(Map<String, dynamic> json) =>
      PollMediaLocation(
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
  PollMediaLocation copyWith({
    Location? location,
  }) =>
      PollMediaLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaPhoto** *(pollMediaPhoto)* - child of PollMedia
///
/// A photo.
///
/// * [photo]: The photo.
/// * [video]: The video representing the live photo; may be null if the photo is static *(optional)*.
final class PollMediaPhoto extends PollMedia {
  /// **PollMediaPhoto** *(pollMediaPhoto)* - child of PollMedia
  ///
  /// A photo.
  ///
  /// * [photo]: The photo.
  /// * [video]: The video representing the live photo; may be null if the photo is static *(optional)*.
  const PollMediaPhoto({
    required this.photo,
    this.video,
  });

  /// The photo
  final Photo photo;

  /// The video representing the live photo; may be null if the photo is static
  final Video? video;

  /// Parse from a json
  factory PollMediaPhoto.fromJson(Map<String, dynamic> json) => PollMediaPhoto(
        photo: Photo.fromJson(json['photo']),
        video: json['video'] == null ? null : Video.fromJson(json['video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "video": video?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: The photo
  /// * [video]: The video representing the live photo; may be null if the photo is static
  @override
  PollMediaPhoto copyWith({
    Photo? photo,
    Video? video,
  }) =>
      PollMediaPhoto(
        photo: photo ?? this.photo,
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaSticker** *(pollMediaSticker)* - child of PollMedia
///
/// A sticker.
///
/// * [sticker]: The sticker.
final class PollMediaSticker extends PollMedia {
  /// **PollMediaSticker** *(pollMediaSticker)* - child of PollMedia
  ///
  /// A sticker.
  ///
  /// * [sticker]: The sticker.
  const PollMediaSticker({
    required this.sticker,
  });

  /// The sticker
  final Sticker sticker;

  /// Parse from a json
  factory PollMediaSticker.fromJson(Map<String, dynamic> json) =>
      PollMediaSticker(
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
  /// * [sticker]: The sticker
  @override
  PollMediaSticker copyWith({
    Sticker? sticker,
  }) =>
      PollMediaSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaVenue** *(pollMediaVenue)* - child of PollMedia
///
/// A venue.
///
/// * [venue]: The venue.
final class PollMediaVenue extends PollMedia {
  /// **PollMediaVenue** *(pollMediaVenue)* - child of PollMedia
  ///
  /// A venue.
  ///
  /// * [venue]: The venue.
  const PollMediaVenue({
    required this.venue,
  });

  /// The venue
  final Venue venue;

  /// Parse from a json
  factory PollMediaVenue.fromJson(Map<String, dynamic> json) => PollMediaVenue(
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
  /// * [venue]: The venue
  @override
  PollMediaVenue copyWith({
    Venue? venue,
  }) =>
      PollMediaVenue(
        venue: venue ?? this.venue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollMediaVideo** *(pollMediaVideo)* - child of PollMedia
///
/// A video.
///
/// * [video]: The video description.
/// * [alternativeVideos]: Alternative qualities of the video.
/// * [storyboards]: Available storyboards for the video.
/// * [cover]: Cover of the video; may be null if none *(optional)*.
/// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
final class PollMediaVideo extends PollMedia {
  /// **PollMediaVideo** *(pollMediaVideo)* - child of PollMedia
  ///
  /// A video.
  ///
  /// * [video]: The video description.
  /// * [alternativeVideos]: Alternative qualities of the video.
  /// * [storyboards]: Available storyboards for the video.
  /// * [cover]: Cover of the video; may be null if none *(optional)*.
  /// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
  const PollMediaVideo({
    required this.video,
    required this.alternativeVideos,
    required this.storyboards,
    this.cover,
    required this.startTimestamp,
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

  /// Parse from a json
  factory PollMediaVideo.fromJson(Map<String, dynamic> json) => PollMediaVideo(
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
  @override
  PollMediaVideo copyWith({
    Video? video,
    List<AlternativeVideo>? alternativeVideos,
    List<VideoStoryboard>? storyboards,
    Photo? cover,
    int? startTimestamp,
  }) =>
      PollMediaVideo(
        video: video ?? this.video,
        alternativeVideos: alternativeVideos ?? this.alternativeVideos,
        storyboards: storyboards ?? this.storyboards,
        cover: cover ?? this.cover,
        startTimestamp: startTimestamp ?? this.startTimestamp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollMediaVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
