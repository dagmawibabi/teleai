part of '../tdapi.dart';

/// **InputPollMedia** *(inputPollMedia)* - parent
///
/// The content of a poll media to send.
sealed class InputPollMedia extends TdObject {
  /// **InputPollMedia** *(inputPollMedia)* - parent
  ///
  /// The content of a poll media to send.
  const InputPollMedia();

  /// a InputPollMedia return type can be :
  /// * [InputPollMediaAnimation]
  /// * [InputPollMediaAudio]
  /// * [InputPollMediaDocument]
  /// * [InputPollMediaLink]
  /// * [InputPollMediaLocation]
  /// * [InputPollMediaPhoto]
  /// * [InputPollMediaSticker]
  /// * [InputPollMediaVenue]
  /// * [InputPollMediaVideo]
  factory InputPollMedia.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPollMediaAnimation.defaultObjectId:
        return InputPollMediaAnimation.fromJson(json);
      case InputPollMediaAudio.defaultObjectId:
        return InputPollMediaAudio.fromJson(json);
      case InputPollMediaDocument.defaultObjectId:
        return InputPollMediaDocument.fromJson(json);
      case InputPollMediaLink.defaultObjectId:
        return InputPollMediaLink.fromJson(json);
      case InputPollMediaLocation.defaultObjectId:
        return InputPollMediaLocation.fromJson(json);
      case InputPollMediaPhoto.defaultObjectId:
        return InputPollMediaPhoto.fromJson(json);
      case InputPollMediaSticker.defaultObjectId:
        return InputPollMediaSticker.fromJson(json);
      case InputPollMediaVenue.defaultObjectId:
        return InputPollMediaVenue.fromJson(json);
      case InputPollMediaVideo.defaultObjectId:
        return InputPollMediaVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPollMedia)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPollMedia copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaAnimation** *(inputPollMediaAnimation)* - child of InputPollMedia
///
/// An animation.
///
/// * [animation]: The animation to be sent.
final class InputPollMediaAnimation extends InputPollMedia {
  /// **InputPollMediaAnimation** *(inputPollMediaAnimation)* - child of InputPollMedia
  ///
  /// An animation.
  ///
  /// * [animation]: The animation to be sent.
  const InputPollMediaAnimation({
    required this.animation,
  });

  /// The animation to be sent
  final InputAnimation animation;

  /// Parse from a json
  factory InputPollMediaAnimation.fromJson(Map<String, dynamic> json) =>
      InputPollMediaAnimation(
        animation: InputAnimation.fromJson(json['animation']),
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
  /// * [animation]: The animation to be sent
  @override
  InputPollMediaAnimation copyWith({
    InputAnimation? animation,
  }) =>
      InputPollMediaAnimation(
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaAudio** *(inputPollMediaAudio)* - child of InputPollMedia
///
/// An audio.
///
/// * [audio]: The audio to be sent.
final class InputPollMediaAudio extends InputPollMedia {
  /// **InputPollMediaAudio** *(inputPollMediaAudio)* - child of InputPollMedia
  ///
  /// An audio.
  ///
  /// * [audio]: The audio to be sent.
  const InputPollMediaAudio({
    required this.audio,
  });

  /// The audio to be sent
  final InputAudio audio;

  /// Parse from a json
  factory InputPollMediaAudio.fromJson(Map<String, dynamic> json) =>
      InputPollMediaAudio(
        audio: InputAudio.fromJson(json['audio']),
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
  /// * [audio]: The audio to be sent
  @override
  InputPollMediaAudio copyWith({
    InputAudio? audio,
  }) =>
      InputPollMediaAudio(
        audio: audio ?? this.audio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaDocument** *(inputPollMediaDocument)* - child of InputPollMedia
///
/// A document (general file).
///
/// * [document]: The document to be sent.
final class InputPollMediaDocument extends InputPollMedia {
  /// **InputPollMediaDocument** *(inputPollMediaDocument)* - child of InputPollMedia
  ///
  /// A document (general file).
  ///
  /// * [document]: The document to be sent.
  const InputPollMediaDocument({
    required this.document,
  });

  /// The document to be sent
  final InputDocument document;

  /// Parse from a json
  factory InputPollMediaDocument.fromJson(Map<String, dynamic> json) =>
      InputPollMediaDocument(
        document: InputDocument.fromJson(json['document']),
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
  /// * [document]: The document to be sent
  @override
  InputPollMediaDocument copyWith({
    InputDocument? document,
  }) =>
      InputPollMediaDocument(
        document: document ?? this.document,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaLink** *(inputPollMediaLink)* - child of InputPollMedia
///
/// A link.
///
/// * [url]: URL of the link.
final class InputPollMediaLink extends InputPollMedia {
  /// **InputPollMediaLink** *(inputPollMediaLink)* - child of InputPollMedia
  ///
  /// A link.
  ///
  /// * [url]: URL of the link.
  const InputPollMediaLink({
    required this.url,
  });

  /// URL of the link
  final String url;

  /// Parse from a json
  factory InputPollMediaLink.fromJson(Map<String, dynamic> json) =>
      InputPollMediaLink(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the link
  @override
  InputPollMediaLink copyWith({
    String? url,
  }) =>
      InputPollMediaLink(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaLocation** *(inputPollMediaLocation)* - child of InputPollMedia
///
/// A location.
///
/// * [location]: Location to be sent.
final class InputPollMediaLocation extends InputPollMedia {
  /// **InputPollMediaLocation** *(inputPollMediaLocation)* - child of InputPollMedia
  ///
  /// A location.
  ///
  /// * [location]: Location to be sent.
  const InputPollMediaLocation({
    required this.location,
  });

  /// Location to be sent
  final Location location;

  /// Parse from a json
  factory InputPollMediaLocation.fromJson(Map<String, dynamic> json) =>
      InputPollMediaLocation(
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
  InputPollMediaLocation copyWith({
    Location? location,
  }) =>
      InputPollMediaLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaPhoto** *(inputPollMediaPhoto)* - child of InputPollMedia
///
/// A photo.
///
/// * [photo]: Photo to be sent.
final class InputPollMediaPhoto extends InputPollMedia {
  /// **InputPollMediaPhoto** *(inputPollMediaPhoto)* - child of InputPollMedia
  ///
  /// A photo.
  ///
  /// * [photo]: Photo to be sent.
  const InputPollMediaPhoto({
    required this.photo,
  });

  /// Photo to be sent
  final InputPhoto photo;

  /// Parse from a json
  factory InputPollMediaPhoto.fromJson(Map<String, dynamic> json) =>
      InputPollMediaPhoto(
        photo: InputPhoto.fromJson(json['photo']),
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
  /// * [photo]: Photo to be sent
  @override
  InputPollMediaPhoto copyWith({
    InputPhoto? photo,
  }) =>
      InputPollMediaPhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaSticker** *(inputPollMediaSticker)* - child of InputPollMedia
///
/// A sticker.
///
/// * [sticker]: Sticker to be sent.
final class InputPollMediaSticker extends InputPollMedia {
  /// **InputPollMediaSticker** *(inputPollMediaSticker)* - child of InputPollMedia
  ///
  /// A sticker.
  ///
  /// * [sticker]: Sticker to be sent.
  const InputPollMediaSticker({
    required this.sticker,
  });

  /// Sticker to be sent
  final InputSticker sticker;

  /// Parse from a json
  factory InputPollMediaSticker.fromJson(Map<String, dynamic> json) =>
      InputPollMediaSticker(
        sticker: InputSticker.fromJson(json['sticker']),
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
  /// * [sticker]: Sticker to be sent
  @override
  InputPollMediaSticker copyWith({
    InputSticker? sticker,
  }) =>
      InputPollMediaSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaVenue** *(inputPollMediaVenue)* - child of InputPollMedia
///
/// A venue.
///
/// * [venue]: Venue to send.
final class InputPollMediaVenue extends InputPollMedia {
  /// **InputPollMediaVenue** *(inputPollMediaVenue)* - child of InputPollMedia
  ///
  /// A venue.
  ///
  /// * [venue]: Venue to send.
  const InputPollMediaVenue({
    required this.venue,
  });

  /// Venue to send
  final Venue venue;

  /// Parse from a json
  factory InputPollMediaVenue.fromJson(Map<String, dynamic> json) =>
      InputPollMediaVenue(
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
  InputPollMediaVenue copyWith({
    Venue? venue,
  }) =>
      InputPollMediaVenue(
        venue: venue ?? this.venue,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPollMediaVideo** *(inputPollMediaVideo)* - child of InputPollMedia
///
/// A video.
///
/// * [video]: The video to be sent.
final class InputPollMediaVideo extends InputPollMedia {
  /// **InputPollMediaVideo** *(inputPollMediaVideo)* - child of InputPollMedia
  ///
  /// A video.
  ///
  /// * [video]: The video to be sent.
  const InputPollMediaVideo({
    required this.video,
  });

  /// The video to be sent
  final InputVideo video;

  /// Parse from a json
  factory InputPollMediaVideo.fromJson(Map<String, dynamic> json) =>
      InputPollMediaVideo(
        video: InputVideo.fromJson(json['video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: The video to be sent
  @override
  InputPollMediaVideo copyWith({
    InputVideo? video,
  }) =>
      InputPollMediaVideo(
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPollMediaVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
