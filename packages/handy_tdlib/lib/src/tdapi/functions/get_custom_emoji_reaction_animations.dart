part of '../tdapi.dart';

/// **GetCustomEmojiReactionAnimations** *(getCustomEmojiReactionAnimations)* - TDLib function
///
/// Returns TGS stickers with generic animations for custom emoji reactions.
///
/// [Stickers] is returned on completion.
final class GetCustomEmojiReactionAnimations extends TdFunction {
  /// **GetCustomEmojiReactionAnimations** *(getCustomEmojiReactionAnimations)* - TDLib function
  ///
  /// Returns TGS stickers with generic animations for custom emoji reactions.
  ///
  /// [Stickers] is returned on completion.
  const GetCustomEmojiReactionAnimations();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetCustomEmojiReactionAnimations copyWith() =>
      const GetCustomEmojiReactionAnimations();

  /// TDLib object type
  static const String defaultObjectId = 'getCustomEmojiReactionAnimations';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
