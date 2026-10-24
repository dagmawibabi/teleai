part of '../tdapi.dart';

/// **PublicForwards** *(publicForwards)* - basic class
///
/// Represents a list of public forwards and reposts as a story of a message or a story.
///
/// * [totalCount]: Approximate total number of messages and stories found.
/// * [forwards]: List of found public forwards and reposts.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class PublicForwards extends TdObject {
  /// **PublicForwards** *(publicForwards)* - basic class
  ///
  /// Represents a list of public forwards and reposts as a story of a message or a story.
  ///
  /// * [totalCount]: Approximate total number of messages and stories found.
  /// * [forwards]: List of found public forwards and reposts.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const PublicForwards({
    required this.totalCount,
    required this.forwards,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of messages and stories found
  final int totalCount;

  /// List of found public forwards and reposts
  final List<PublicForward> forwards;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PublicForwards.fromJson(Map<String, dynamic> json) => PublicForwards(
        totalCount: json['total_count'],
        forwards: List<PublicForward>.from((json['forwards'] ?? [])
            .map((item) => PublicForward.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "forwards": forwards.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of messages and stories found
  /// * [forwards]: List of found public forwards and reposts
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  PublicForwards copyWith({
    int? totalCount,
    List<PublicForward>? forwards,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      PublicForwards(
        totalCount: totalCount ?? this.totalCount,
        forwards: forwards ?? this.forwards,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'publicForwards';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
