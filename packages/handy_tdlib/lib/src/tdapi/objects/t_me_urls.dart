part of '../tdapi.dart';

/// **TMeUrls** *(tMeUrls)* - basic class
///
/// Contains a list of t.me URLs.
///
/// * [urls]: List of URLs.
final class TMeUrls extends TdObject {
  /// **TMeUrls** *(tMeUrls)* - basic class
  ///
  /// Contains a list of t.me URLs.
  ///
  /// * [urls]: List of URLs.
  const TMeUrls({
    required this.urls,
    this.extra,
    this.clientId,
  });

  /// List of URLs
  final List<TMeUrl> urls;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TMeUrls.fromJson(Map<String, dynamic> json) => TMeUrls(
        urls: List<TMeUrl>.from(
            (json['urls'] ?? []).map((item) => TMeUrl.fromJson(item)).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "urls": urls.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [urls]: List of URLs
  TMeUrls copyWith({
    List<TMeUrl>? urls,
    dynamic extra,
    int? clientId,
  }) =>
      TMeUrls(
        urls: urls ?? this.urls,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tMeUrls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
