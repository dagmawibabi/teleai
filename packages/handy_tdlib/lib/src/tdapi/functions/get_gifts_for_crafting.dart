part of '../tdapi.dart';

/// **GetGiftsForCrafting** *(getGiftsForCrafting)* - TDLib function
///
/// Returns upgraded gifts of the current user, which can be used to craft other gifts.
///
/// * [regularGiftId]: Identifier of the regular gift that will be used for crafting.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
///
/// [GiftsForCrafting] is returned on completion.
final class GetGiftsForCrafting extends TdFunction {
  /// **GetGiftsForCrafting** *(getGiftsForCrafting)* - TDLib function
  ///
  /// Returns upgraded gifts of the current user, which can be used to craft other gifts.
  ///
  /// * [regularGiftId]: Identifier of the regular gift that will be used for crafting.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [GiftsForCrafting] is returned on completion.
  const GetGiftsForCrafting({
    required this.regularGiftId,
    required this.offset,
    required this.limit,
  });

  /// Identifier of the regular gift that will be used for crafting
  final int regularGiftId;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "regular_gift_id": regularGiftId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [regular_gift_id]: Identifier of the regular gift that will be used for crafting
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  GetGiftsForCrafting copyWith({
    int? regularGiftId,
    String? offset,
    int? limit,
  }) =>
      GetGiftsForCrafting(
        regularGiftId: regularGiftId ?? this.regularGiftId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGiftsForCrafting';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
