part of '../tdapi.dart';

/// **WebAppInfo** *(webAppInfo)* - basic class
///
/// Contains information about a Web App.
///
/// * [launchId]: Unique identifier for the Web App launch.
/// * [url]: The Web App URL to open in a web view.
final class WebAppInfo extends TdObject {
  /// **WebAppInfo** *(webAppInfo)* - basic class
  ///
  /// Contains information about a Web App.
  ///
  /// * [launchId]: Unique identifier for the Web App launch.
  /// * [url]: The Web App URL to open in a web view.
  const WebAppInfo({
    required this.launchId,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the Web App launch
  final int launchId;

  /// The Web App URL to open in a web view
  final WebAppUrl url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory WebAppInfo.fromJson(Map<String, dynamic> json) => WebAppInfo(
        launchId: json['launch_id'] is int
            ? json['launch_id']
            : int.parse(json['launch_id']),
        url: WebAppUrl.fromJson(json['url']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "launch_id": launchId,
      "url": url.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [launch_id]: Unique identifier for the Web App launch
  /// * [url]: The Web App URL to open in a web view
  WebAppInfo copyWith({
    int? launchId,
    WebAppUrl? url,
    dynamic extra,
    int? clientId,
  }) =>
      WebAppInfo(
        launchId: launchId ?? this.launchId,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webAppInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
