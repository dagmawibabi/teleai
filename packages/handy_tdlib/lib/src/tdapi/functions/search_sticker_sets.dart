part of '../tdapi.dart';

/// **SearchStickerSets** *(searchStickerSets)* - TDLib function
///
/// Searches for sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results.
///
/// * [stickerType]: Type of the sticker sets to return.
/// * [query]: Query to search for.
///
/// [StickerSets] is returned on completion.
final class SearchStickerSets extends TdFunction {
  /// **SearchStickerSets** *(searchStickerSets)* - TDLib function
  ///
  /// Searches for sticker sets by looking for specified query in their title and name. Excludes installed sticker sets from the results.
  ///
  /// * [stickerType]: Type of the sticker sets to return.
  /// * [query]: Query to search for.
  ///
  /// [StickerSets] is returned on completion.
  const SearchStickerSets({
    required this.stickerType,
    required this.query,
  });

  /// Type of the sticker sets to return
  final StickerType stickerType;

  /// Query to search for
  final String query;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "query": query,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the sticker sets to return
  /// * [query]: Query to search for
  SearchStickerSets copyWith({
    StickerType? stickerType,
    String? query,
  }) =>
      SearchStickerSets(
        stickerType: stickerType ?? this.stickerType,
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
