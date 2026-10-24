part of '../tdapi.dart';

/// **ChatBoost** *(chatBoost)* - basic class
///
/// Describes a boost applied to a chat.
///
/// * [id]: Unique identifier of the boost.
/// * [count]: The number of identical boosts applied.
/// * [source]: Source of the boost.
/// * [startDate]: Point in time (Unix timestamp) when the chat was boosted.
/// * [expirationDate]: Point in time (Unix timestamp) when the boost will expire.
final class ChatBoost extends TdObject {
  /// **ChatBoost** *(chatBoost)* - basic class
  ///
  /// Describes a boost applied to a chat.
  ///
  /// * [id]: Unique identifier of the boost.
  /// * [count]: The number of identical boosts applied.
  /// * [source]: Source of the boost.
  /// * [startDate]: Point in time (Unix timestamp) when the chat was boosted.
  /// * [expirationDate]: Point in time (Unix timestamp) when the boost will expire.
  const ChatBoost({
    required this.id,
    required this.count,
    required this.source,
    required this.startDate,
    required this.expirationDate,
  });

  /// Unique identifier of the boost
  final String id;

  /// The number of identical boosts applied
  final int count;

  /// Source of the boost
  final ChatBoostSource source;

  /// Point in time (Unix timestamp) when the chat was boosted
  final int startDate;

  /// Point in time (Unix timestamp) when the boost will expire
  final int expirationDate;

  /// Parse from a json
  factory ChatBoost.fromJson(Map<String, dynamic> json) => ChatBoost(
        id: json['id'],
        count: json['count'],
        source: ChatBoostSource.fromJson(json['source']),
        startDate: json['start_date'],
        expirationDate: json['expiration_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "count": count,
      "source": source.toJson(),
      "start_date": startDate,
      "expiration_date": expirationDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the boost
  /// * [count]: The number of identical boosts applied
  /// * [source]: Source of the boost
  /// * [start_date]: Point in time (Unix timestamp) when the chat was boosted
  /// * [expiration_date]: Point in time (Unix timestamp) when the boost will expire
  ChatBoost copyWith({
    String? id,
    int? count,
    ChatBoostSource? source,
    int? startDate,
    int? expirationDate,
  }) =>
      ChatBoost(
        id: id ?? this.id,
        count: count ?? this.count,
        source: source ?? this.source,
        startDate: startDate ?? this.startDate,
        expirationDate: expirationDate ?? this.expirationDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
