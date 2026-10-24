part of '../tdapi.dart';

/// **HttpUrl** *(httpUrl)* - basic class
///
/// Contains an HTTP URL.
///
/// * [url]: The URL.
final class HttpUrl extends TdObject {
  /// **HttpUrl** *(httpUrl)* - basic class
  ///
  /// Contains an HTTP URL.
  ///
  /// * [url]: The URL.
  const HttpUrl({
    required this.url,
    this.extra,
    this.clientId,
  });

  /// The URL
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory HttpUrl.fromJson(Map<String, dynamic> json) => HttpUrl(
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  /// * [url]: The URL
  HttpUrl copyWith({
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      HttpUrl(
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'httpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
