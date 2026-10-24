part of '../tdapi.dart';

/// **Hashtags** *(hashtags)* - basic class
///
/// Contains a list of hashtags.
///
/// * [hashtags]: A list of hashtags.
final class Hashtags extends TdObject {
  /// **Hashtags** *(hashtags)* - basic class
  ///
  /// Contains a list of hashtags.
  ///
  /// * [hashtags]: A list of hashtags.
  const Hashtags({
    required this.hashtags,
    this.extra,
    this.clientId,
  });

  /// A list of hashtags
  final List<String> hashtags;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Hashtags.fromJson(Map<String, dynamic> json) => Hashtags(
        hashtags: List<String>.from(
            (json['hashtags'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "hashtags": hashtags.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [hashtags]: A list of hashtags
  Hashtags copyWith({
    List<String>? hashtags,
    dynamic extra,
    int? clientId,
  }) =>
      Hashtags(
        hashtags: hashtags ?? this.hashtags,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'hashtags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
