part of '../tdapi.dart';

/// **GetOwnedStickerSets** *(getOwnedStickerSets)* - TDLib function
///
/// Returns sticker sets owned by the current user.
///
/// * [offsetStickerSetId]: Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning.
/// * [limit]: The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
///
/// [StickerSets] is returned on completion.
final class GetOwnedStickerSets extends TdFunction {
  /// **GetOwnedStickerSets** *(getOwnedStickerSets)* - TDLib function
  ///
  /// Returns sticker sets owned by the current user.
  ///
  /// * [offsetStickerSetId]: Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning.
  /// * [limit]: The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [StickerSets] is returned on completion.
  const GetOwnedStickerSets({
    required this.offsetStickerSetId,
    required this.limit,
  });

  /// Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning
  final int offsetStickerSetId;

  /// The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "offset_sticker_set_id": offsetStickerSetId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [offset_sticker_set_id]: Identifier of the sticker set from which to return owned sticker sets; use 0 to get results from the beginning
  /// * [limit]: The maximum number of sticker sets to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  GetOwnedStickerSets copyWith({
    int? offsetStickerSetId,
    int? limit,
  }) =>
      GetOwnedStickerSets(
        offsetStickerSetId: offsetStickerSetId ?? this.offsetStickerSetId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOwnedStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
