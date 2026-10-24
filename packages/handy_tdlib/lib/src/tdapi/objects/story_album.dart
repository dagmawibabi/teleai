part of '../tdapi.dart';

/// **StoryAlbum** *(storyAlbum)* - basic class
///
/// Describes album of stories.
///
/// * [id]: Unique identifier of the album.
/// * [name]: Name of the album.
/// * [photoIcon]: Icon of the album; may be null if none *(optional)*.
/// * [videoIcon]: Video icon of the album; may be null if none *(optional)*.
final class StoryAlbum extends TdObject {
  /// **StoryAlbum** *(storyAlbum)* - basic class
  ///
  /// Describes album of stories.
  ///
  /// * [id]: Unique identifier of the album.
  /// * [name]: Name of the album.
  /// * [photoIcon]: Icon of the album; may be null if none *(optional)*.
  /// * [videoIcon]: Video icon of the album; may be null if none *(optional)*.
  const StoryAlbum({
    required this.id,
    required this.name,
    this.photoIcon,
    this.videoIcon,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the album
  final int id;

  /// Name of the album
  final String name;

  /// Icon of the album; may be null if none
  final Photo? photoIcon;

  /// Video icon of the album; may be null if none
  final Video? videoIcon;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StoryAlbum.fromJson(Map<String, dynamic> json) => StoryAlbum(
        id: json['id'],
        name: json['name'],
        photoIcon: json['photo_icon'] == null
            ? null
            : Photo.fromJson(json['photo_icon']),
        videoIcon: json['video_icon'] == null
            ? null
            : Video.fromJson(json['video_icon']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "photo_icon": photoIcon?.toJson(),
      "video_icon": videoIcon?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the album
  /// * [name]: Name of the album
  /// * [photo_icon]: Icon of the album; may be null if none
  /// * [video_icon]: Video icon of the album; may be null if none
  StoryAlbum copyWith({
    int? id,
    String? name,
    Photo? photoIcon,
    Video? videoIcon,
    dynamic extra,
    int? clientId,
  }) =>
      StoryAlbum(
        id: id ?? this.id,
        name: name ?? this.name,
        photoIcon: photoIcon ?? this.photoIcon,
        videoIcon: videoIcon ?? this.videoIcon,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
