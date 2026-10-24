part of '../tdapi.dart';

/// **TonCenterStreamingApiUrl** *(tonCenterStreamingApiUrl)* - basic class
///
/// Contains an HTTP URL for TON Center Streaming API.
///
/// * [url]: The URL.
/// * [expiresIn]: Time after which the URL expires.
final class TonCenterStreamingApiUrl extends TdObject {
  /// **TonCenterStreamingApiUrl** *(tonCenterStreamingApiUrl)* - basic class
  ///
  /// Contains an HTTP URL for TON Center Streaming API.
  ///
  /// * [url]: The URL.
  /// * [expiresIn]: Time after which the URL expires.
  const TonCenterStreamingApiUrl({
    required this.url,
    required this.expiresIn,
    this.extra,
    this.clientId,
  });

  /// The URL
  final String url;

  /// Time after which the URL expires
  final int expiresIn;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonCenterStreamingApiUrl.fromJson(Map<String, dynamic> json) =>
      TonCenterStreamingApiUrl(
        url: json['url'],
        expiresIn: json['expires_in'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "expires_in": expiresIn,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The URL
  /// * [expires_in]: Time after which the URL expires
  TonCenterStreamingApiUrl copyWith({
    String? url,
    int? expiresIn,
    dynamic extra,
    int? clientId,
  }) =>
      TonCenterStreamingApiUrl(
        url: url ?? this.url,
        expiresIn: expiresIn ?? this.expiresIn,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonCenterStreamingApiUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
