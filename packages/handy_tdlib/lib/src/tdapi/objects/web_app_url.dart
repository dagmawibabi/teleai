part of '../tdapi.dart';

/// **WebAppUrl** *(webAppUrl)* - basic class
///
/// Contains information about a Web App URL.
///
/// * [url]: The Web App URL to open in a web view.
/// * [requireSameOrigin]: True, if events from the Web App must be accepted only from the same origin as the URL.
final class WebAppUrl extends TdObject {
  /// **WebAppUrl** *(webAppUrl)* - basic class
  ///
  /// Contains information about a Web App URL.
  ///
  /// * [url]: The Web App URL to open in a web view.
  /// * [requireSameOrigin]: True, if events from the Web App must be accepted only from the same origin as the URL.
  const WebAppUrl({
    required this.url,
    required this.requireSameOrigin,
    this.extra,
    this.clientId,
  });

  /// The Web App URL to open in a web view
  final String url;

  /// True, if events from the Web App must be accepted only from the same origin as the URL
  final bool requireSameOrigin;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory WebAppUrl.fromJson(Map<String, dynamic> json) => WebAppUrl(
        url: json['url'],
        requireSameOrigin: json['require_same_origin'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "require_same_origin": requireSameOrigin,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The Web App URL to open in a web view
  /// * [require_same_origin]: True, if events from the Web App must be accepted only from the same origin as the URL
  WebAppUrl copyWith({
    String? url,
    bool? requireSameOrigin,
    dynamic extra,
    int? clientId,
  }) =>
      WebAppUrl(
        url: url ?? this.url,
        requireSameOrigin: requireSameOrigin ?? this.requireSameOrigin,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webAppUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
