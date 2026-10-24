part of '../tdapi.dart';

/// **MainWebApp** *(mainWebApp)* - basic class
///
/// Contains information about the main Web App of a bot.
///
/// * [url]: URL of the Web App to open.
/// * [mode]: The mode in which the Web App must be opened.
final class MainWebApp extends TdObject {
  /// **MainWebApp** *(mainWebApp)* - basic class
  ///
  /// Contains information about the main Web App of a bot.
  ///
  /// * [url]: URL of the Web App to open.
  /// * [mode]: The mode in which the Web App must be opened.
  const MainWebApp({
    required this.url,
    required this.mode,
    this.extra,
    this.clientId,
  });

  /// URL of the Web App to open
  final WebAppUrl url;

  /// The mode in which the Web App must be opened
  final WebAppOpenMode mode;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory MainWebApp.fromJson(Map<String, dynamic> json) => MainWebApp(
        url: WebAppUrl.fromJson(json['url']),
        mode: WebAppOpenMode.fromJson(json['mode']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url.toJson(),
      "mode": mode.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the Web App to open
  /// * [mode]: The mode in which the Web App must be opened
  MainWebApp copyWith({
    WebAppUrl? url,
    WebAppOpenMode? mode,
    dynamic extra,
    int? clientId,
  }) =>
      MainWebApp(
        url: url ?? this.url,
        mode: mode ?? this.mode,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'mainWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
