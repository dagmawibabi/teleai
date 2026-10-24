part of '../tdapi.dart';

/// **InlineQueryResult** *(inlineQueryResult)* - parent
///
/// Represents a single result of an inline query.
sealed class InlineQueryResult extends TdObject {
  /// **InlineQueryResult** *(inlineQueryResult)* - parent
  ///
  /// Represents a single result of an inline query.
  const InlineQueryResult();

  /// a InlineQueryResult return type can be :
  /// * [InlineQueryResultArticle]
  /// * [InlineQueryResultContact]
  /// * [InlineQueryResultLocation]
  /// * [InlineQueryResultVenue]
  /// * [InlineQueryResultGame]
  /// * [InlineQueryResultAnimation]
  /// * [InlineQueryResultAudio]
  /// * [InlineQueryResultDocument]
  /// * [InlineQueryResultPhoto]
  /// * [InlineQueryResultSticker]
  /// * [InlineQueryResultVideo]
  /// * [InlineQueryResultVoiceNote]
  factory InlineQueryResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InlineQueryResultArticle.defaultObjectId:
        return InlineQueryResultArticle.fromJson(json);
      case InlineQueryResultContact.defaultObjectId:
        return InlineQueryResultContact.fromJson(json);
      case InlineQueryResultLocation.defaultObjectId:
        return InlineQueryResultLocation.fromJson(json);
      case InlineQueryResultVenue.defaultObjectId:
        return InlineQueryResultVenue.fromJson(json);
      case InlineQueryResultGame.defaultObjectId:
        return InlineQueryResultGame.fromJson(json);
      case InlineQueryResultAnimation.defaultObjectId:
        return InlineQueryResultAnimation.fromJson(json);
      case InlineQueryResultAudio.defaultObjectId:
        return InlineQueryResultAudio.fromJson(json);
      case InlineQueryResultDocument.defaultObjectId:
        return InlineQueryResultDocument.fromJson(json);
      case InlineQueryResultPhoto.defaultObjectId:
        return InlineQueryResultPhoto.fromJson(json);
      case InlineQueryResultSticker.defaultObjectId:
        return InlineQueryResultSticker.fromJson(json);
      case InlineQueryResultVideo.defaultObjectId:
        return InlineQueryResultVideo.fromJson(json);
      case InlineQueryResultVoiceNote.defaultObjectId:
        return InlineQueryResultVoiceNote.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InlineQueryResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InlineQueryResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultArticle** *(inlineQueryResultArticle)* - child of InlineQueryResult
///
/// Represents a link to an article or web page.
///
/// * [id]: Unique identifier of the query result.
/// * [url]: URL of the result, if it exists.
/// * [title]: Title of the result.
/// * [description]: A short description of the result.
/// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
final class InlineQueryResultArticle extends InlineQueryResult {
  /// **InlineQueryResultArticle** *(inlineQueryResultArticle)* - child of InlineQueryResult
  ///
  /// Represents a link to an article or web page.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [url]: URL of the result, if it exists.
  /// * [title]: Title of the result.
  /// * [description]: A short description of the result.
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
  const InlineQueryResultArticle({
    required this.id,
    required this.url,
    required this.title,
    required this.description,
    this.thumbnail,
  });

  /// Unique identifier of the query result
  final String id;

  /// URL of the result, if it exists
  final String url;

  /// Title of the result
  final String title;

  /// A short description of the result
  final String description;

  /// Result thumbnail in JPEG format; may be null
  final Thumbnail? thumbnail;

  /// Parse from a json
  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultArticle(
        id: json['id'],
        url: json['url'],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "url": url,
      "title": title,
      "description": description,
      "thumbnail": thumbnail?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [url]: URL of the result, if it exists
  /// * [title]: Title of the result
  /// * [description]: A short description of the result
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null
  @override
  InlineQueryResultArticle copyWith({
    String? id,
    String? url,
    String? title,
    String? description,
    Thumbnail? thumbnail,
  }) =>
      InlineQueryResultArticle(
        id: id ?? this.id,
        url: url ?? this.url,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultArticle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultContact** *(inlineQueryResultContact)* - child of InlineQueryResult
///
/// Represents a user contact.
///
/// * [id]: Unique identifier of the query result.
/// * [contact]: A user contact.
/// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
final class InlineQueryResultContact extends InlineQueryResult {
  /// **InlineQueryResultContact** *(inlineQueryResultContact)* - child of InlineQueryResult
  ///
  /// Represents a user contact.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [contact]: A user contact.
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
  const InlineQueryResultContact({
    required this.id,
    required this.contact,
    this.thumbnail,
  });

  /// Unique identifier of the query result
  final String id;

  /// A user contact
  final Contact contact;

  /// Result thumbnail in JPEG format; may be null
  final Thumbnail? thumbnail;

  /// Parse from a json
  factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultContact(
        id: json['id'],
        contact: Contact.fromJson(json['contact']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "contact": contact.toJson(),
      "thumbnail": thumbnail?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [contact]: A user contact
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null
  @override
  InlineQueryResultContact copyWith({
    String? id,
    Contact? contact,
    Thumbnail? thumbnail,
  }) =>
      InlineQueryResultContact(
        id: id ?? this.id,
        contact: contact ?? this.contact,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultLocation** *(inlineQueryResultLocation)* - child of InlineQueryResult
///
/// Represents a point on the map.
///
/// * [id]: Unique identifier of the query result.
/// * [location]: Location result.
/// * [title]: Title of the result.
/// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
final class InlineQueryResultLocation extends InlineQueryResult {
  /// **InlineQueryResultLocation** *(inlineQueryResultLocation)* - child of InlineQueryResult
  ///
  /// Represents a point on the map.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [location]: Location result.
  /// * [title]: Title of the result.
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
  const InlineQueryResultLocation({
    required this.id,
    required this.location,
    required this.title,
    this.thumbnail,
  });

  /// Unique identifier of the query result
  final String id;

  /// Location result
  final Location location;

  /// Title of the result
  final String title;

  /// Result thumbnail in JPEG format; may be null
  final Thumbnail? thumbnail;

  /// Parse from a json
  factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultLocation(
        id: json['id'],
        location: Location.fromJson(json['location']),
        title: json['title'],
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "location": location.toJson(),
      "title": title,
      "thumbnail": thumbnail?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [location]: Location result
  /// * [title]: Title of the result
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null
  @override
  InlineQueryResultLocation copyWith({
    String? id,
    Location? location,
    String? title,
    Thumbnail? thumbnail,
  }) =>
      InlineQueryResultLocation(
        id: id ?? this.id,
        location: location ?? this.location,
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultVenue** *(inlineQueryResultVenue)* - child of InlineQueryResult
///
/// Represents information about a venue.
///
/// * [id]: Unique identifier of the query result.
/// * [venue]: Venue result.
/// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
final class InlineQueryResultVenue extends InlineQueryResult {
  /// **InlineQueryResultVenue** *(inlineQueryResultVenue)* - child of InlineQueryResult
  ///
  /// Represents information about a venue.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [venue]: Venue result.
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null *(optional)*.
  const InlineQueryResultVenue({
    required this.id,
    required this.venue,
    this.thumbnail,
  });

  /// Unique identifier of the query result
  final String id;

  /// Venue result
  final Venue venue;

  /// Result thumbnail in JPEG format; may be null
  final Thumbnail? thumbnail;

  /// Parse from a json
  factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultVenue(
        id: json['id'],
        venue: Venue.fromJson(json['venue']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "venue": venue.toJson(),
      "thumbnail": thumbnail?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [venue]: Venue result
  /// * [thumbnail]: Result thumbnail in JPEG format; may be null
  @override
  InlineQueryResultVenue copyWith({
    String? id,
    Venue? venue,
    Thumbnail? thumbnail,
  }) =>
      InlineQueryResultVenue(
        id: id ?? this.id,
        venue: venue ?? this.venue,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultGame** *(inlineQueryResultGame)* - child of InlineQueryResult
///
/// Represents information about a game.
///
/// * [id]: Unique identifier of the query result.
/// * [game]: Game result.
final class InlineQueryResultGame extends InlineQueryResult {
  /// **InlineQueryResultGame** *(inlineQueryResultGame)* - child of InlineQueryResult
  ///
  /// Represents information about a game.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [game]: Game result.
  const InlineQueryResultGame({
    required this.id,
    required this.game,
  });

  /// Unique identifier of the query result
  final String id;

  /// Game result
  final Game game;

  /// Parse from a json
  factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultGame(
        id: json['id'],
        game: Game.fromJson(json['game']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "game": game.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [game]: Game result
  @override
  InlineQueryResultGame copyWith({
    String? id,
    Game? game,
  }) =>
      InlineQueryResultGame(
        id: id ?? this.id,
        game: game ?? this.game,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultAnimation** *(inlineQueryResultAnimation)* - child of InlineQueryResult
///
/// Represents an animation file.
///
/// * [id]: Unique identifier of the query result.
/// * [animation]: Animation file.
/// * [title]: Animation title.
final class InlineQueryResultAnimation extends InlineQueryResult {
  /// **InlineQueryResultAnimation** *(inlineQueryResultAnimation)* - child of InlineQueryResult
  ///
  /// Represents an animation file.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [animation]: Animation file.
  /// * [title]: Animation title.
  const InlineQueryResultAnimation({
    required this.id,
    required this.animation,
    required this.title,
  });

  /// Unique identifier of the query result
  final String id;

  /// Animation file
  final Animation animation;

  /// Animation title
  final String title;

  /// Parse from a json
  factory InlineQueryResultAnimation.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultAnimation(
        id: json['id'],
        animation: Animation.fromJson(json['animation']),
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "animation": animation.toJson(),
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [animation]: Animation file
  /// * [title]: Animation title
  @override
  InlineQueryResultAnimation copyWith({
    String? id,
    Animation? animation,
    String? title,
  }) =>
      InlineQueryResultAnimation(
        id: id ?? this.id,
        animation: animation ?? this.animation,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultAudio** *(inlineQueryResultAudio)* - child of InlineQueryResult
///
/// Represents an audio file.
///
/// * [id]: Unique identifier of the query result.
/// * [audio]: Audio file.
final class InlineQueryResultAudio extends InlineQueryResult {
  /// **InlineQueryResultAudio** *(inlineQueryResultAudio)* - child of InlineQueryResult
  ///
  /// Represents an audio file.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [audio]: Audio file.
  const InlineQueryResultAudio({
    required this.id,
    required this.audio,
  });

  /// Unique identifier of the query result
  final String id;

  /// Audio file
  final Audio audio;

  /// Parse from a json
  factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultAudio(
        id: json['id'],
        audio: Audio.fromJson(json['audio']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "audio": audio.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [audio]: Audio file
  @override
  InlineQueryResultAudio copyWith({
    String? id,
    Audio? audio,
  }) =>
      InlineQueryResultAudio(
        id: id ?? this.id,
        audio: audio ?? this.audio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultDocument** *(inlineQueryResultDocument)* - child of InlineQueryResult
///
/// Represents a document.
///
/// * [id]: Unique identifier of the query result.
/// * [document]: Document.
/// * [title]: Document title.
/// * [description]: Document description.
final class InlineQueryResultDocument extends InlineQueryResult {
  /// **InlineQueryResultDocument** *(inlineQueryResultDocument)* - child of InlineQueryResult
  ///
  /// Represents a document.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [document]: Document.
  /// * [title]: Document title.
  /// * [description]: Document description.
  const InlineQueryResultDocument({
    required this.id,
    required this.document,
    required this.title,
    required this.description,
  });

  /// Unique identifier of the query result
  final String id;

  /// Document
  final Document document;

  /// Document title
  final String title;

  /// Document description
  final String description;

  /// Parse from a json
  factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultDocument(
        id: json['id'],
        document: Document.fromJson(json['document']),
        title: json['title'],
        description: json['description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "document": document.toJson(),
      "title": title,
      "description": description,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [document]: Document
  /// * [title]: Document title
  /// * [description]: Document description
  @override
  InlineQueryResultDocument copyWith({
    String? id,
    Document? document,
    String? title,
    String? description,
  }) =>
      InlineQueryResultDocument(
        id: id ?? this.id,
        document: document ?? this.document,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultPhoto** *(inlineQueryResultPhoto)* - child of InlineQueryResult
///
/// Represents a photo.
///
/// * [id]: Unique identifier of the query result.
/// * [photo]: Photo.
/// * [title]: Title of the result, if known.
/// * [description]: A short description of the result, if known.
final class InlineQueryResultPhoto extends InlineQueryResult {
  /// **InlineQueryResultPhoto** *(inlineQueryResultPhoto)* - child of InlineQueryResult
  ///
  /// Represents a photo.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [photo]: Photo.
  /// * [title]: Title of the result, if known.
  /// * [description]: A short description of the result, if known.
  const InlineQueryResultPhoto({
    required this.id,
    required this.photo,
    required this.title,
    required this.description,
  });

  /// Unique identifier of the query result
  final String id;

  /// Photo
  final Photo photo;

  /// Title of the result, if known
  final String title;

  /// A short description of the result, if known
  final String description;

  /// Parse from a json
  factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultPhoto(
        id: json['id'],
        photo: Photo.fromJson(json['photo']),
        title: json['title'],
        description: json['description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "photo": photo.toJson(),
      "title": title,
      "description": description,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [photo]: Photo
  /// * [title]: Title of the result, if known
  /// * [description]: A short description of the result, if known
  @override
  InlineQueryResultPhoto copyWith({
    String? id,
    Photo? photo,
    String? title,
    String? description,
  }) =>
      InlineQueryResultPhoto(
        id: id ?? this.id,
        photo: photo ?? this.photo,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultSticker** *(inlineQueryResultSticker)* - child of InlineQueryResult
///
/// Represents a sticker.
///
/// * [id]: Unique identifier of the query result.
/// * [sticker]: Sticker.
final class InlineQueryResultSticker extends InlineQueryResult {
  /// **InlineQueryResultSticker** *(inlineQueryResultSticker)* - child of InlineQueryResult
  ///
  /// Represents a sticker.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [sticker]: Sticker.
  const InlineQueryResultSticker({
    required this.id,
    required this.sticker,
  });

  /// Unique identifier of the query result
  final String id;

  /// Sticker
  final Sticker sticker;

  /// Parse from a json
  factory InlineQueryResultSticker.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultSticker(
        id: json['id'],
        sticker: Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [sticker]: Sticker
  @override
  InlineQueryResultSticker copyWith({
    String? id,
    Sticker? sticker,
  }) =>
      InlineQueryResultSticker(
        id: id ?? this.id,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultVideo** *(inlineQueryResultVideo)* - child of InlineQueryResult
///
/// Represents a video.
///
/// * [id]: Unique identifier of the query result.
/// * [video]: Video.
/// * [title]: Title of the video.
/// * [description]: Description of the video.
final class InlineQueryResultVideo extends InlineQueryResult {
  /// **InlineQueryResultVideo** *(inlineQueryResultVideo)* - child of InlineQueryResult
  ///
  /// Represents a video.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [video]: Video.
  /// * [title]: Title of the video.
  /// * [description]: Description of the video.
  const InlineQueryResultVideo({
    required this.id,
    required this.video,
    required this.title,
    required this.description,
  });

  /// Unique identifier of the query result
  final String id;

  /// Video
  final Video video;

  /// Title of the video
  final String title;

  /// Description of the video
  final String description;

  /// Parse from a json
  factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultVideo(
        id: json['id'],
        video: Video.fromJson(json['video']),
        title: json['title'],
        description: json['description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "video": video.toJson(),
      "title": title,
      "description": description,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [video]: Video
  /// * [title]: Title of the video
  /// * [description]: Description of the video
  @override
  InlineQueryResultVideo copyWith({
    String? id,
    Video? video,
    String? title,
    String? description,
  }) =>
      InlineQueryResultVideo(
        id: id ?? this.id,
        video: video ?? this.video,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InlineQueryResultVoiceNote** *(inlineQueryResultVoiceNote)* - child of InlineQueryResult
///
/// Represents a voice note.
///
/// * [id]: Unique identifier of the query result.
/// * [voiceNote]: Voice note.
/// * [title]: Title of the voice note.
final class InlineQueryResultVoiceNote extends InlineQueryResult {
  /// **InlineQueryResultVoiceNote** *(inlineQueryResultVoiceNote)* - child of InlineQueryResult
  ///
  /// Represents a voice note.
  ///
  /// * [id]: Unique identifier of the query result.
  /// * [voiceNote]: Voice note.
  /// * [title]: Title of the voice note.
  const InlineQueryResultVoiceNote({
    required this.id,
    required this.voiceNote,
    required this.title,
  });

  /// Unique identifier of the query result
  final String id;

  /// Voice note
  final VoiceNote voiceNote;

  /// Title of the voice note
  final String title;

  /// Parse from a json
  factory InlineQueryResultVoiceNote.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultVoiceNote(
        id: json['id'],
        voiceNote: VoiceNote.fromJson(json['voice_note']),
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "voice_note": voiceNote.toJson(),
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the query result
  /// * [voice_note]: Voice note
  /// * [title]: Title of the voice note
  @override
  InlineQueryResultVoiceNote copyWith({
    String? id,
    VoiceNote? voiceNote,
    String? title,
  }) =>
      InlineQueryResultVoiceNote(
        id: id ?? this.id,
        voiceNote: voiceNote ?? this.voiceNote,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
