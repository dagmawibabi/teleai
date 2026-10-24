part of '../tdapi.dart';

/// **StoryAlbums** *(storyAlbums)* - basic class
///
/// Represents a list of story albums.
///
/// * [albums]: List of story albums.
final class StoryAlbums extends TdObject {
  /// **StoryAlbums** *(storyAlbums)* - basic class
  ///
  /// Represents a list of story albums.
  ///
  /// * [albums]: List of story albums.
  const StoryAlbums({
    required this.albums,
    this.extra,
    this.clientId,
  });

  /// List of story albums
  final List<StoryAlbum> albums;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StoryAlbums.fromJson(Map<String, dynamic> json) => StoryAlbums(
        albums: List<StoryAlbum>.from((json['albums'] ?? [])
            .map((item) => StoryAlbum.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "albums": albums.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [albums]: List of story albums
  StoryAlbums copyWith({
    List<StoryAlbum>? albums,
    dynamic extra,
    int? clientId,
  }) =>
      StoryAlbums(
        albums: albums ?? this.albums,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyAlbums';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
