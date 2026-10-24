part of '../tdapi.dart';

/// **FoundChatBoosts** *(foundChatBoosts)* - basic class
///
/// Contains a list of boosts applied to a chat.
///
/// * [totalCount]: Total number of boosts applied to the chat.
/// * [boosts]: List of boosts.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class FoundChatBoosts extends TdObject {
  /// **FoundChatBoosts** *(foundChatBoosts)* - basic class
  ///
  /// Contains a list of boosts applied to a chat.
  ///
  /// * [totalCount]: Total number of boosts applied to the chat.
  /// * [boosts]: List of boosts.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const FoundChatBoosts({
    required this.totalCount,
    required this.boosts,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Total number of boosts applied to the chat
  final int totalCount;

  /// List of boosts
  final List<ChatBoost> boosts;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundChatBoosts.fromJson(Map<String, dynamic> json) =>
      FoundChatBoosts(
        totalCount: json['total_count'],
        boosts: List<ChatBoost>.from((json['boosts'] ?? [])
            .map((item) => ChatBoost.fromJson(item))
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
      "boosts": boosts.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of boosts applied to the chat
  /// * [boosts]: List of boosts
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  FoundChatBoosts copyWith({
    int? totalCount,
    List<ChatBoost>? boosts,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      FoundChatBoosts(
        totalCount: totalCount ?? this.totalCount,
        boosts: boosts ?? this.boosts,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundChatBoosts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
