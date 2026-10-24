part of '../tdapi.dart';

/// **SearchStickers** *(searchStickers)* - TDLib function
///
/// Searches for stickers from public sticker sets that correspond to any of the given emoji.
///
/// * [stickerType]: Type of the stickers to return.
/// * [emojis]: Space-separated list of emojis to search for.
/// * [query]: Query to search for; may be empty to search for emoji only.
/// * [inputLanguageCodes]: List of possible IETF language tags of the user's input language; may be empty if unknown.
/// * [offset]: The offset from which to return the stickers; must be non-negative.
/// * [limit]: The maximum number of stickers to be returned; 0-100.
///
/// [Stickers] is returned on completion.
final class SearchStickers extends TdFunction {
  /// **SearchStickers** *(searchStickers)* - TDLib function
  ///
  /// Searches for stickers from public sticker sets that correspond to any of the given emoji.
  ///
  /// * [stickerType]: Type of the stickers to return.
  /// * [emojis]: Space-separated list of emojis to search for.
  /// * [query]: Query to search for; may be empty to search for emoji only.
  /// * [inputLanguageCodes]: List of possible IETF language tags of the user's input language; may be empty if unknown.
  /// * [offset]: The offset from which to return the stickers; must be non-negative.
  /// * [limit]: The maximum number of stickers to be returned; 0-100.
  ///
  /// [Stickers] is returned on completion.
  const SearchStickers({
    required this.stickerType,
    required this.emojis,
    required this.query,
    required this.inputLanguageCodes,
    required this.offset,
    required this.limit,
  });

  /// Type of the stickers to return
  final StickerType stickerType;

  /// Space-separated list of emojis to search for
  final String emojis;

  /// Query to search for; may be empty to search for emoji only
  final String query;

  /// List of possible IETF language tags of the user's input language; may be empty if unknown
  final List<String> inputLanguageCodes;

  /// The offset from which to return the stickers; must be non-negative
  final int offset;

  /// The maximum number of stickers to be returned; 0-100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "emojis": emojis,
      "query": query,
      "input_language_codes": inputLanguageCodes.map((i) => i).toList(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the stickers to return
  /// * [emojis]: Space-separated list of emojis to search for
  /// * [query]: Query to search for; may be empty to search for emoji only
  /// * [input_language_codes]: List of possible IETF language tags of the user's input language; may be empty if unknown
  /// * [offset]: The offset from which to return the stickers; must be non-negative
  /// * [limit]: The maximum number of stickers to be returned; 0-100
  SearchStickers copyWith({
    StickerType? stickerType,
    String? emojis,
    String? query,
    List<String>? inputLanguageCodes,
    int? offset,
    int? limit,
  }) =>
      SearchStickers(
        stickerType: stickerType ?? this.stickerType,
        emojis: emojis ?? this.emojis,
        query: query ?? this.query,
        inputLanguageCodes: inputLanguageCodes ?? this.inputLanguageCodes,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
