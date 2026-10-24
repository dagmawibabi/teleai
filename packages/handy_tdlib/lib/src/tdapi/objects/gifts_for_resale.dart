part of '../tdapi.dart';

/// **GiftsForResale** *(giftsForResale)* - basic class
///
/// Describes gifts available for resale.
///
/// * [totalCount]: Total number of gifts found.
/// * [gifts]: The gifts.
/// * [models]: Available models; for searchGiftsForResale requests without offset and attributes only.
/// * [symbols]: Available symbols; for searchGiftsForResale requests without offset and attributes only.
/// * [backdrops]: Available backdrops; for searchGiftsForResale requests without offset and attributes only.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class GiftsForResale extends TdObject {
  /// **GiftsForResale** *(giftsForResale)* - basic class
  ///
  /// Describes gifts available for resale.
  ///
  /// * [totalCount]: Total number of gifts found.
  /// * [gifts]: The gifts.
  /// * [models]: Available models; for searchGiftsForResale requests without offset and attributes only.
  /// * [symbols]: Available symbols; for searchGiftsForResale requests without offset and attributes only.
  /// * [backdrops]: Available backdrops; for searchGiftsForResale requests without offset and attributes only.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const GiftsForResale({
    required this.totalCount,
    required this.gifts,
    required this.models,
    required this.symbols,
    required this.backdrops,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Total number of gifts found
  final int totalCount;

  /// The gifts
  final List<GiftForResale> gifts;

  /// Available models; for searchGiftsForResale requests without offset and attributes only
  final List<UpgradedGiftModelCount> models;

  /// Available symbols; for searchGiftsForResale requests without offset and attributes only
  final List<UpgradedGiftSymbolCount> symbols;

  /// Available backdrops; for searchGiftsForResale requests without offset and attributes only
  final List<UpgradedGiftBackdropCount> backdrops;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftsForResale.fromJson(Map<String, dynamic> json) => GiftsForResale(
        totalCount: json['total_count'],
        gifts: List<GiftForResale>.from((json['gifts'] ?? [])
            .map((item) => GiftForResale.fromJson(item))
            .toList()),
        models: List<UpgradedGiftModelCount>.from((json['models'] ?? [])
            .map((item) => UpgradedGiftModelCount.fromJson(item))
            .toList()),
        symbols: List<UpgradedGiftSymbolCount>.from((json['symbols'] ?? [])
            .map((item) => UpgradedGiftSymbolCount.fromJson(item))
            .toList()),
        backdrops: List<UpgradedGiftBackdropCount>.from(
            (json['backdrops'] ?? [])
                .map((item) => UpgradedGiftBackdropCount.fromJson(item))
                .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "gifts": gifts.map((i) => i.toJson()).toList(),
      "models": models.map((i) => i.toJson()).toList(),
      "symbols": symbols.map((i) => i.toJson()).toList(),
      "backdrops": backdrops.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of gifts found
  /// * [gifts]: The gifts
  /// * [models]: Available models; for searchGiftsForResale requests without offset and attributes only
  /// * [symbols]: Available symbols; for searchGiftsForResale requests without offset and attributes only
  /// * [backdrops]: Available backdrops; for searchGiftsForResale requests without offset and attributes only
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  GiftsForResale copyWith({
    int? totalCount,
    List<GiftForResale>? gifts,
    List<UpgradedGiftModelCount>? models,
    List<UpgradedGiftSymbolCount>? symbols,
    List<UpgradedGiftBackdropCount>? backdrops,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      GiftsForResale(
        totalCount: totalCount ?? this.totalCount,
        gifts: gifts ?? this.gifts,
        models: models ?? this.models,
        symbols: symbols ?? this.symbols,
        backdrops: backdrops ?? this.backdrops,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftsForResale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
