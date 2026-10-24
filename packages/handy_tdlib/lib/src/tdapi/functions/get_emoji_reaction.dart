part of '../tdapi.dart';

/// **GetEmojiReaction** *(getEmojiReaction)* - TDLib function
///
/// Returns information about an emoji reaction. Returns a 404 error if the reaction is not found.
///
/// * [emoji]: Text representation of the reaction.
///
/// [EmojiReaction] is returned on completion.
final class GetEmojiReaction extends TdFunction {
  /// **GetEmojiReaction** *(getEmojiReaction)* - TDLib function
  ///
  /// Returns information about an emoji reaction. Returns a 404 error if the reaction is not found.
  ///
  /// * [emoji]: Text representation of the reaction.
  ///
  /// [EmojiReaction] is returned on completion.
  const GetEmojiReaction({
    required this.emoji,
  });

  /// Text representation of the reaction
  final String emoji;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "emoji": emoji,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji]: Text representation of the reaction
  GetEmojiReaction copyWith({
    String? emoji,
  }) =>
      GetEmojiReaction(
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getEmojiReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
