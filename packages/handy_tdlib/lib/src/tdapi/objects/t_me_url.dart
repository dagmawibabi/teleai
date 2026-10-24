part of '../tdapi.dart';

/// **TMeUrl** *(tMeUrl)* - basic class
///
/// Represents a URL linking to an internal Telegram entity.
///
/// * [url]: URL.
/// * [type]: Type of the URL.
final class TMeUrl extends TdObject {
  /// **TMeUrl** *(tMeUrl)* - basic class
  ///
  /// Represents a URL linking to an internal Telegram entity.
  ///
  /// * [url]: URL.
  /// * [type]: Type of the URL.
  const TMeUrl({
    required this.url,
    required this.type,
  });

  /// URL
  final String url;

  /// Type of the URL
  final TMeUrlType type;

  /// Parse from a json
  factory TMeUrl.fromJson(Map<String, dynamic> json) => TMeUrl(
        url: json['url'],
        type: TMeUrlType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL
  /// * [type]: Type of the URL
  TMeUrl copyWith({
    String? url,
    TMeUrlType? type,
  }) =>
      TMeUrl(
        url: url ?? this.url,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tMeUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
