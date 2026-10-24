part of '../tdapi.dart';

/// **GetAllStickerEmojis** *(getAllStickerEmojis)* - TDLib function
///
/// Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query, 1000000, chat_id).
///
/// * [stickerType]: Type of the stickers to search for.
/// * [query]: Search query.
/// * [chatId]: Chat identifier for which to find stickers.
/// * [returnOnlyMainEmoji]: Pass true if only main emoji for each found sticker must be included in the result.
///
/// [Emojis] is returned on completion.
final class GetAllStickerEmojis extends TdFunction {
  /// **GetAllStickerEmojis** *(getAllStickerEmojis)* - TDLib function
  ///
  /// Returns unique emoji that correspond to stickers to be found by the getStickers(sticker_type, query, 1000000, chat_id).
  ///
  /// * [stickerType]: Type of the stickers to search for.
  /// * [query]: Search query.
  /// * [chatId]: Chat identifier for which to find stickers.
  /// * [returnOnlyMainEmoji]: Pass true if only main emoji for each found sticker must be included in the result.
  ///
  /// [Emojis] is returned on completion.
  const GetAllStickerEmojis({
    required this.stickerType,
    required this.query,
    required this.chatId,
    required this.returnOnlyMainEmoji,
  });

  /// Type of the stickers to search for
  final StickerType stickerType;

  /// Search query
  final String query;

  /// Chat identifier for which to find stickers
  final int chatId;

  /// Pass true if only main emoji for each found sticker must be included in the result
  final bool returnOnlyMainEmoji;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "query": query,
      "chat_id": chatId,
      "return_only_main_emoji": returnOnlyMainEmoji,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the stickers to search for
  /// * [query]: Search query
  /// * [chat_id]: Chat identifier for which to find stickers
  /// * [return_only_main_emoji]: Pass true if only main emoji for each found sticker must be included in the result
  GetAllStickerEmojis copyWith({
    StickerType? stickerType,
    String? query,
    int? chatId,
    bool? returnOnlyMainEmoji,
  }) =>
      GetAllStickerEmojis(
        stickerType: stickerType ?? this.stickerType,
        query: query ?? this.query,
        chatId: chatId ?? this.chatId,
        returnOnlyMainEmoji: returnOnlyMainEmoji ?? this.returnOnlyMainEmoji,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAllStickerEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
