part of '../tdapi.dart';

/// **LinkPreviewAlbumMedia** *(linkPreviewAlbumMedia)* - parent
///
/// Describes a media from a link preview album.
sealed class LinkPreviewAlbumMedia extends TdObject {
  /// **LinkPreviewAlbumMedia** *(linkPreviewAlbumMedia)* - parent
  ///
  /// Describes a media from a link preview album.
  const LinkPreviewAlbumMedia();

  /// a LinkPreviewAlbumMedia return type can be :
  /// * [LinkPreviewAlbumMediaPhoto]
  /// * [LinkPreviewAlbumMediaVideo]
  factory LinkPreviewAlbumMedia.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case LinkPreviewAlbumMediaPhoto.defaultObjectId:
        return LinkPreviewAlbumMediaPhoto.fromJson(json);
      case LinkPreviewAlbumMediaVideo.defaultObjectId:
        return LinkPreviewAlbumMediaVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of LinkPreviewAlbumMedia)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  LinkPreviewAlbumMedia copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewAlbumMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewAlbumMediaPhoto** *(linkPreviewAlbumMediaPhoto)* - child of LinkPreviewAlbumMedia
///
/// The media is a photo.
///
/// * [photo]: Photo description.
final class LinkPreviewAlbumMediaPhoto extends LinkPreviewAlbumMedia {
  /// **LinkPreviewAlbumMediaPhoto** *(linkPreviewAlbumMediaPhoto)* - child of LinkPreviewAlbumMedia
  ///
  /// The media is a photo.
  ///
  /// * [photo]: Photo description.
  const LinkPreviewAlbumMediaPhoto({
    required this.photo,
  });

  /// Photo description
  final Photo photo;

  /// Parse from a json
  factory LinkPreviewAlbumMediaPhoto.fromJson(Map<String, dynamic> json) =>
      LinkPreviewAlbumMediaPhoto(
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
  /// * [photo]: Photo description
  @override
  LinkPreviewAlbumMediaPhoto copyWith({
    Photo? photo,
  }) =>
      LinkPreviewAlbumMediaPhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewAlbumMediaPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **LinkPreviewAlbumMediaVideo** *(linkPreviewAlbumMediaVideo)* - child of LinkPreviewAlbumMedia
///
/// The media is a video.
///
/// * [video]: Video description.
final class LinkPreviewAlbumMediaVideo extends LinkPreviewAlbumMedia {
  /// **LinkPreviewAlbumMediaVideo** *(linkPreviewAlbumMediaVideo)* - child of LinkPreviewAlbumMedia
  ///
  /// The media is a video.
  ///
  /// * [video]: Video description.
  const LinkPreviewAlbumMediaVideo({
    required this.video,
  });

  /// Video description
  final Video video;

  /// Parse from a json
  factory LinkPreviewAlbumMediaVideo.fromJson(Map<String, dynamic> json) =>
      LinkPreviewAlbumMediaVideo(
        video: Video.fromJson(json['video']),
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
  /// * [video]: Video description
  @override
  LinkPreviewAlbumMediaVideo copyWith({
    Video? video,
  }) =>
      LinkPreviewAlbumMediaVideo(
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'linkPreviewAlbumMediaVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
