part of '../tdapi.dart';

/// **GetAnimatedEmoji** *(getAnimatedEmoji)* - TDLib function
///
/// Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji.
///
/// * [emoji]: The emoji.
///
/// [AnimatedEmoji] is returned on completion.
final class GetAnimatedEmoji extends TdFunction {
  /// **GetAnimatedEmoji** *(getAnimatedEmoji)* - TDLib function
  ///
  /// Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji.
  ///
  /// * [emoji]: The emoji.
  ///
  /// [AnimatedEmoji] is returned on completion.
  const GetAnimatedEmoji({
    required this.emoji,
  });

  /// The emoji
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
  /// * [emoji]: The emoji
  GetAnimatedEmoji copyWith({
    String? emoji,
  }) =>
      GetAnimatedEmoji(
        emoji: emoji ?? this.emoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAnimatedEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
