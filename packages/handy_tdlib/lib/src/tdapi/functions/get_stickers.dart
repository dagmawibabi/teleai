part of '../tdapi.dart';

/// **GetStickers** *(getStickers)* - TDLib function
///
/// Returns stickers from the installed sticker sets that correspond to any of the given emoji or can be found by sticker-specific keywords. If the query is non-empty, then favorite, recently used or trending stickers may also be returned.
///
/// * [stickerType]: Type of the stickers to return.
/// * [query]: Search query; a space-separated list of emojis or a keyword prefix. If empty, returns all known installed stickers.
/// * [limit]: The maximum number of stickers to be returned.
/// * [chatId]: Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats.
///
/// [Stickers] is returned on completion.
final class GetStickers extends TdFunction {
  /// **GetStickers** *(getStickers)* - TDLib function
  ///
  /// Returns stickers from the installed sticker sets that correspond to any of the given emoji or can be found by sticker-specific keywords. If the query is non-empty, then favorite, recently used or trending stickers may also be returned.
  ///
  /// * [stickerType]: Type of the stickers to return.
  /// * [query]: Search query; a space-separated list of emojis or a keyword prefix. If empty, returns all known installed stickers.
  /// * [limit]: The maximum number of stickers to be returned.
  /// * [chatId]: Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats.
  ///
  /// [Stickers] is returned on completion.
  const GetStickers({
    required this.stickerType,
    required this.query,
    required this.limit,
    required this.chatId,
  });

  /// Type of the stickers to return
  final StickerType stickerType;

  /// Search query; a space-separated list of emojis or a keyword prefix. If empty, returns all known installed stickers
  final String query;

  /// The maximum number of stickers to be returned
  final int limit;

  /// Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "query": query,
      "limit": limit,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the stickers to return
  /// * [query]: Search query; a space-separated list of emojis or a keyword prefix. If empty, returns all known installed stickers
  /// * [limit]: The maximum number of stickers to be returned
  /// * [chat_id]: Chat identifier for which to return stickers. Available custom emoji stickers may be different for different chats
  GetStickers copyWith({
    StickerType? stickerType,
    String? query,
    int? limit,
    int? chatId,
  }) =>
      GetStickers(
        stickerType: stickerType ?? this.stickerType,
        query: query ?? this.query,
        limit: limit ?? this.limit,
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
