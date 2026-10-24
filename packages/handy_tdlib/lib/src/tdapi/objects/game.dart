part of '../tdapi.dart';

/// **Game** *(game)* - basic class
///
/// Describes a game. Use getInternalLink with internalLinkTypeGame to share the game.
///
/// * [id]: Unique game identifier.
/// * [shortName]: Game short name.
/// * [title]: Game title.
/// * [text]: Game text, usually containing scoreboards for a game.
/// * [description]: Game description.
/// * [photo]: Game photo.
/// * [animation]: Game animation; may be null *(optional)*.
final class Game extends TdObject {
  /// **Game** *(game)* - basic class
  ///
  /// Describes a game. Use getInternalLink with internalLinkTypeGame to share the game.
  ///
  /// * [id]: Unique game identifier.
  /// * [shortName]: Game short name.
  /// * [title]: Game title.
  /// * [text]: Game text, usually containing scoreboards for a game.
  /// * [description]: Game description.
  /// * [photo]: Game photo.
  /// * [animation]: Game animation; may be null *(optional)*.
  const Game({
    required this.id,
    required this.shortName,
    required this.title,
    required this.text,
    required this.description,
    required this.photo,
    this.animation,
  });

  /// Unique game identifier
  final int id;

  /// Game short name
  final String shortName;

  /// Game title
  final String title;

  /// Game text, usually containing scoreboards for a game
  final FormattedText text;

  /// Game description
  final String description;

  /// Game photo
  final Photo photo;

  /// Game animation; may be null
  final Animation? animation;

  /// Parse from a json
  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        shortName: json['short_name'],
        title: json['title'],
        text: FormattedText.fromJson(json['text']),
        description: json['description'],
        photo: Photo.fromJson(json['photo']),
        animation: json['animation'] == null
            ? null
            : Animation.fromJson(json['animation']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "short_name": shortName,
      "title": title,
      "text": text.toJson(),
      "description": description,
      "photo": photo.toJson(),
      "animation": animation?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique game identifier
  /// * [short_name]: Game short name
  /// * [title]: Game title
  /// * [text]: Game text, usually containing scoreboards for a game
  /// * [description]: Game description
  /// * [photo]: Game photo
  /// * [animation]: Game animation; may be null
  Game copyWith({
    int? id,
    String? shortName,
    String? title,
    FormattedText? text,
    String? description,
    Photo? photo,
    Animation? animation,
  }) =>
      Game(
        id: id ?? this.id,
        shortName: shortName ?? this.shortName,
        title: title ?? this.title,
        text: text ?? this.text,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'game';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
