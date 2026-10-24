part of '../tdapi.dart';

/// **GameHighScore** *(gameHighScore)* - basic class
///
/// Contains one row of the game high score table.
///
/// * [position]: Position in the high score table.
/// * [userId]: User identifier.
/// * [score]: User score.
final class GameHighScore extends TdObject {
  /// **GameHighScore** *(gameHighScore)* - basic class
  ///
  /// Contains one row of the game high score table.
  ///
  /// * [position]: Position in the high score table.
  /// * [userId]: User identifier.
  /// * [score]: User score.
  const GameHighScore({
    required this.position,
    required this.userId,
    required this.score,
  });

  /// Position in the high score table
  final int position;

  /// User identifier
  final int userId;

  /// User score
  final int score;

  /// Parse from a json
  factory GameHighScore.fromJson(Map<String, dynamic> json) => GameHighScore(
        position: json['position'],
        userId: json['user_id'],
        score: json['score'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "position": position,
      "user_id": userId,
      "score": score,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [position]: Position in the high score table
  /// * [user_id]: User identifier
  /// * [score]: User score
  GameHighScore copyWith({
    int? position,
    int? userId,
    int? score,
  }) =>
      GameHighScore(
        position: position ?? this.position,
        userId: userId ?? this.userId,
        score: score ?? this.score,
      );

  /// TDLib object type
  static const String defaultObjectId = 'gameHighScore';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
