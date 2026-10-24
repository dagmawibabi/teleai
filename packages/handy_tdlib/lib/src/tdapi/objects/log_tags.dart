part of '../tdapi.dart';

/// **LogTags** *(logTags)* - basic class
///
/// Contains a list of available TDLib internal log tags.
///
/// * [tags]: List of log tags.
final class LogTags extends TdObject {
  /// **LogTags** *(logTags)* - basic class
  ///
  /// Contains a list of available TDLib internal log tags.
  ///
  /// * [tags]: List of log tags.
  const LogTags({
    required this.tags,
    this.extra,
    this.clientId,
  });

  /// List of log tags
  final List<String> tags;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LogTags.fromJson(Map<String, dynamic> json) => LogTags(
        tags: List<String>.from(
            (json['tags'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "tags": tags.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tags]: List of log tags
  LogTags copyWith({
    List<String>? tags,
    dynamic extra,
    int? clientId,
  }) =>
      LogTags(
        tags: tags ?? this.tags,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'logTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
