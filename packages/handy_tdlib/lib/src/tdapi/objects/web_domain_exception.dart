part of '../tdapi.dart';

/// **WebDomainException** *(webDomainException)* - basic class
///
/// Describes an exception for built-in browser usage.
///
/// * [url]: URL for which the exception is done.
/// * [domain]: Domain of the URL. All URLs on the domain and subdomains of the domain are subject to the exception.
/// * [title]: Title of the website.
/// * [faviconCustomEmojiId]: Identifier of the custom emoji with favicon of the website; may be 0 if unknown, in which case the first letter of the domain must be used.
final class WebDomainException extends TdObject {
  /// **WebDomainException** *(webDomainException)* - basic class
  ///
  /// Describes an exception for built-in browser usage.
  ///
  /// * [url]: URL for which the exception is done.
  /// * [domain]: Domain of the URL. All URLs on the domain and subdomains of the domain are subject to the exception.
  /// * [title]: Title of the website.
  /// * [faviconCustomEmojiId]: Identifier of the custom emoji with favicon of the website; may be 0 if unknown, in which case the first letter of the domain must be used.
  const WebDomainException({
    required this.url,
    required this.domain,
    required this.title,
    required this.faviconCustomEmojiId,
  });

  /// URL for which the exception is done
  final String url;

  /// Domain of the URL. All URLs on the domain and subdomains of the domain are subject to the exception
  final String domain;

  /// Title of the website
  final String title;

  /// Identifier of the custom emoji with favicon of the website; may be 0 if unknown, in which case the first letter of the domain must be used
  final int faviconCustomEmojiId;

  /// Parse from a json
  factory WebDomainException.fromJson(Map<String, dynamic> json) =>
      WebDomainException(
        url: json['url'],
        domain: json['domain'],
        title: json['title'],
        faviconCustomEmojiId: json['favicon_custom_emoji_id'] is int
            ? json['favicon_custom_emoji_id']
            : int.parse(json['favicon_custom_emoji_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "domain": domain,
      "title": title,
      "favicon_custom_emoji_id": faviconCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL for which the exception is done
  /// * [domain]: Domain of the URL. All URLs on the domain and subdomains of the domain are subject to the exception
  /// * [title]: Title of the website
  /// * [favicon_custom_emoji_id]: Identifier of the custom emoji with favicon of the website; may be 0 if unknown, in which case the first letter of the domain must be used
  WebDomainException copyWith({
    String? url,
    String? domain,
    String? title,
    int? faviconCustomEmojiId,
  }) =>
      WebDomainException(
        url: url ?? this.url,
        domain: domain ?? this.domain,
        title: title ?? this.title,
        faviconCustomEmojiId: faviconCustomEmojiId ?? this.faviconCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webDomainException';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
