part of '../tdapi.dart';

/// **SearchStickerSet** *(searchStickerSet)* - TDLib function
///
/// Searches for a sticker set by its name.
///
/// * [name]: Name of the sticker set.
/// * [ignoreCache]: Pass true to ignore local cache of sticker sets and always send a network request.
///
/// [StickerSet] is returned on completion.
final class SearchStickerSet extends TdFunction {
  /// **SearchStickerSet** *(searchStickerSet)* - TDLib function
  ///
  /// Searches for a sticker set by its name.
  ///
  /// * [name]: Name of the sticker set.
  /// * [ignoreCache]: Pass true to ignore local cache of sticker sets and always send a network request.
  ///
  /// [StickerSet] is returned on completion.
  const SearchStickerSet({
    required this.name,
    required this.ignoreCache,
  });

  /// Name of the sticker set
  final String name;

  /// Pass true to ignore local cache of sticker sets and always send a network request
  final bool ignoreCache;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "ignore_cache": ignoreCache,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the sticker set
  /// * [ignore_cache]: Pass true to ignore local cache of sticker sets and always send a network request
  SearchStickerSet copyWith({
    String? name,
    bool? ignoreCache,
  }) =>
      SearchStickerSet(
        name: name ?? this.name,
        ignoreCache: ignoreCache ?? this.ignoreCache,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
