part of '../tdapi.dart';

/// **SearchGiftsForResale** *(searchGiftsForResale)* - TDLib function
///
/// Returns upgraded gifts that can be bought from other owners using sendResoldGift.
///
/// * [giftId]: Identifier of the regular gift that was upgraded to a unique gift.
/// * [order]: Order in which the results will be sorted.
/// * [forCrafting]: Pass true to get only gifts suitable for crafting.
/// * [forStars]: Pass true to get only gifts that can be bought using Telegram Stars.
/// * [attributes]: Attributes used to filter received gifts. If multiple attributes of the same type are specified, then all of them are allowed.. If none attributes of specific type are specified, then all values for this attribute type are allowed.
/// * [offset]: Offset of the first entry to return as received from the previous request with the same order and attributes; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of gifts to return.
///
/// [GiftsForResale] is returned on completion.
final class SearchGiftsForResale extends TdFunction {
  /// **SearchGiftsForResale** *(searchGiftsForResale)* - TDLib function
  ///
  /// Returns upgraded gifts that can be bought from other owners using sendResoldGift.
  ///
  /// * [giftId]: Identifier of the regular gift that was upgraded to a unique gift.
  /// * [order]: Order in which the results will be sorted.
  /// * [forCrafting]: Pass true to get only gifts suitable for crafting.
  /// * [forStars]: Pass true to get only gifts that can be bought using Telegram Stars.
  /// * [attributes]: Attributes used to filter received gifts. If multiple attributes of the same type are specified, then all of them are allowed.. If none attributes of specific type are specified, then all values for this attribute type are allowed.
  /// * [offset]: Offset of the first entry to return as received from the previous request with the same order and attributes; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of gifts to return.
  ///
  /// [GiftsForResale] is returned on completion.
  const SearchGiftsForResale({
    required this.giftId,
    required this.order,
    required this.forCrafting,
    required this.forStars,
    required this.attributes,
    required this.offset,
    required this.limit,
  });

  /// Identifier of the regular gift that was upgraded to a unique gift
  final int giftId;

  /// Order in which the results will be sorted
  final GiftForResaleOrder order;

  /// Pass true to get only gifts suitable for crafting
  final bool forCrafting;

  /// Pass true to get only gifts that can be bought using Telegram Stars
  final bool forStars;

  /// Attributes used to filter received gifts. If multiple attributes of the same type are specified, then all of them are allowed.. If none attributes of specific type are specified, then all values for this attribute type are allowed
  final List<UpgradedGiftAttributeId> attributes;

  /// Offset of the first entry to return as received from the previous request with the same order and attributes; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of gifts to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "order": order.toJson(),
      "for_crafting": forCrafting,
      "for_stars": forStars,
      "attributes": attributes.map((i) => i.toJson()).toList(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the regular gift that was upgraded to a unique gift
  /// * [order]: Order in which the results will be sorted
  /// * [for_crafting]: Pass true to get only gifts suitable for crafting
  /// * [for_stars]: Pass true to get only gifts that can be bought using Telegram Stars
  /// * [attributes]: Attributes used to filter received gifts. If multiple attributes of the same type are specified, then all of them are allowed.. If none attributes of specific type are specified, then all values for this attribute type are allowed
  /// * [offset]: Offset of the first entry to return as received from the previous request with the same order and attributes; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of gifts to return
  SearchGiftsForResale copyWith({
    int? giftId,
    GiftForResaleOrder? order,
    bool? forCrafting,
    bool? forStars,
    List<UpgradedGiftAttributeId>? attributes,
    String? offset,
    int? limit,
  }) =>
      SearchGiftsForResale(
        giftId: giftId ?? this.giftId,
        order: order ?? this.order,
        forCrafting: forCrafting ?? this.forCrafting,
        forStars: forStars ?? this.forStars,
        attributes: attributes ?? this.attributes,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchGiftsForResale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
