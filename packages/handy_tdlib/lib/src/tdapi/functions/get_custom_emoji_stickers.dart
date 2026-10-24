part of '../tdapi.dart';

/// **GetCustomEmojiStickers** *(getCustomEmojiStickers)* - TDLib function
///
/// Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned.
///
/// * [customEmojiIds]: Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously.
///
/// [Stickers] is returned on completion.
final class GetCustomEmojiStickers extends TdFunction {
  /// **GetCustomEmojiStickers** *(getCustomEmojiStickers)* - TDLib function
  ///
  /// Returns the list of custom emoji stickers by their identifiers. Stickers are returned in arbitrary order. Only found stickers are returned.
  ///
  /// * [customEmojiIds]: Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously.
  ///
  /// [Stickers] is returned on completion.
  const GetCustomEmojiStickers({
    required this.customEmojiIds,
  });

  /// Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
  final List<int> customEmojiIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "custom_emoji_ids": customEmojiIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_ids]: Identifiers of custom emoji stickers. At most 200 custom emoji stickers can be received simultaneously
  GetCustomEmojiStickers copyWith({
    List<int>? customEmojiIds,
  }) =>
      GetCustomEmojiStickers(
        customEmojiIds: customEmojiIds ?? this.customEmojiIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCustomEmojiStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
