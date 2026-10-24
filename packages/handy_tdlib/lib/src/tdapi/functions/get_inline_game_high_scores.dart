part of '../tdapi.dart';

/// **GetInlineGameHighScores** *(getInlineGameHighScores)* - TDLib function
///
/// Returns game high scores and some part of the high score table in the range of the specified user; for bots only.
///
/// * [inlineMessageId]: Inline message identifier.
/// * [userId]: User identifier.
///
/// [GameHighScores] is returned on completion.
final class GetInlineGameHighScores extends TdFunction {
  /// **GetInlineGameHighScores** *(getInlineGameHighScores)* - TDLib function
  ///
  /// Returns game high scores and some part of the high score table in the range of the specified user; for bots only.
  ///
  /// * [inlineMessageId]: Inline message identifier.
  /// * [userId]: User identifier.
  ///
  /// [GameHighScores] is returned on completion.
  const GetInlineGameHighScores({
    required this.inlineMessageId,
    required this.userId,
  });

  /// Inline message identifier
  final String inlineMessageId;

  /// User identifier
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inline_message_id": inlineMessageId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_message_id]: Inline message identifier
  /// * [user_id]: User identifier
  GetInlineGameHighScores copyWith({
    String? inlineMessageId,
    int? userId,
  }) =>
      GetInlineGameHighScores(
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getInlineGameHighScores';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
