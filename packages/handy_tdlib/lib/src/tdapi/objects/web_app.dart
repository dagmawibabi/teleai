part of '../tdapi.dart';

/// **WebApp** *(webApp)* - basic class
///
/// Describes a Web App. Use getInternalLink with internalLinkTypeWebApp to share the Web App.
///
/// * [shortName]: Web App short name.
/// * [title]: Web App title.
/// * [description]: Web App description.
/// * [photo]: Web App photo.
/// * [animation]: Web App animation; may be null *(optional)*.
final class WebApp extends TdObject {
  /// **WebApp** *(webApp)* - basic class
  ///
  /// Describes a Web App. Use getInternalLink with internalLinkTypeWebApp to share the Web App.
  ///
  /// * [shortName]: Web App short name.
  /// * [title]: Web App title.
  /// * [description]: Web App description.
  /// * [photo]: Web App photo.
  /// * [animation]: Web App animation; may be null *(optional)*.
  const WebApp({
    required this.shortName,
    required this.title,
    required this.description,
    required this.photo,
    this.animation,
  });

  /// Web App short name
  final String shortName;

  /// Web App title
  final String title;

  /// Web App description
  final String description;

  /// Web App photo
  final Photo photo;

  /// Web App animation; may be null
  final Animation? animation;

  /// Parse from a json
  factory WebApp.fromJson(Map<String, dynamic> json) => WebApp(
        shortName: json['short_name'],
        title: json['title'],
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
      "short_name": shortName,
      "title": title,
      "description": description,
      "photo": photo.toJson(),
      "animation": animation?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [short_name]: Web App short name
  /// * [title]: Web App title
  /// * [description]: Web App description
  /// * [photo]: Web App photo
  /// * [animation]: Web App animation; may be null
  WebApp copyWith({
    String? shortName,
    String? title,
    String? description,
    Photo? photo,
    Animation? animation,
  }) =>
      WebApp(
        shortName: shortName ?? this.shortName,
        title: title ?? this.title,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        animation: animation ?? this.animation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
