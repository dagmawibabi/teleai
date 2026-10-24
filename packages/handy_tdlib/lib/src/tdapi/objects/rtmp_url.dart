part of '../tdapi.dart';

/// **RtmpUrl** *(rtmpUrl)* - basic class
///
/// Represents an RTMP URL.
///
/// * [url]: The URL.
/// * [streamKey]: Stream key.
final class RtmpUrl extends TdObject {
  /// **RtmpUrl** *(rtmpUrl)* - basic class
  ///
  /// Represents an RTMP URL.
  ///
  /// * [url]: The URL.
  /// * [streamKey]: Stream key.
  const RtmpUrl({
    required this.url,
    required this.streamKey,
    this.extra,
    this.clientId,
  });

  /// The URL
  final String url;

  /// Stream key
  final String streamKey;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory RtmpUrl.fromJson(Map<String, dynamic> json) => RtmpUrl(
        url: json['url'],
        streamKey: json['stream_key'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "stream_key": streamKey,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The URL
  /// * [stream_key]: Stream key
  RtmpUrl copyWith({
    String? url,
    String? streamKey,
    dynamic extra,
    int? clientId,
  }) =>
      RtmpUrl(
        url: url ?? this.url,
        streamKey: streamKey ?? this.streamKey,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'rtmpUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
