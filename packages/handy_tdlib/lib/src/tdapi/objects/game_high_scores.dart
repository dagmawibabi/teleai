part of '../tdapi.dart';

/// **GameHighScores** *(gameHighScores)* - basic class
///
/// Contains a list of game high scores.
///
/// * [scores]: A list of game high scores.
final class GameHighScores extends TdObject {
  /// **GameHighScores** *(gameHighScores)* - basic class
  ///
  /// Contains a list of game high scores.
  ///
  /// * [scores]: A list of game high scores.
  const GameHighScores({
    required this.scores,
    this.extra,
    this.clientId,
  });

  /// A list of game high scores
  final List<GameHighScore> scores;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GameHighScores.fromJson(Map<String, dynamic> json) => GameHighScores(
        scores: List<GameHighScore>.from((json['scores'] ?? [])
            .map((item) => GameHighScore.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "scores": scores.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scores]: A list of game high scores
  GameHighScores copyWith({
    List<GameHighScore>? scores,
    dynamic extra,
    int? clientId,
  }) =>
      GameHighScores(
        scores: scores ?? this.scores,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'gameHighScores';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
