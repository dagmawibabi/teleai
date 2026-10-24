part of '../tdapi.dart';

/// **ReorderGiftCollectionGifts** *(reorderGiftCollectionGifts)* - TDLib function
///
/// Changes order of gifts in a collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection.
///
/// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
/// * [collectionId]: Identifier of the gift collection.
/// * [receivedGiftIds]: Identifier of the gifts to move to the beginning of the collection. All other gifts are placed in the current order after the specified gifts.
///
/// [GiftCollection] is returned on completion.
final class ReorderGiftCollectionGifts extends TdFunction {
  /// **ReorderGiftCollectionGifts** *(reorderGiftCollectionGifts)* - TDLib function
  ///
  /// Changes order of gifts in a collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
  /// * [collectionId]: Identifier of the gift collection.
  /// * [receivedGiftIds]: Identifier of the gifts to move to the beginning of the collection. All other gifts are placed in the current order after the specified gifts.
  ///
  /// [GiftCollection] is returned on completion.
  const ReorderGiftCollectionGifts({
    required this.ownerId,
    required this.collectionId,
    required this.receivedGiftIds,
  });

  /// Identifier of the user or the channel chat that owns the collection
  final MessageSender ownerId;

  /// Identifier of the gift collection
  final int collectionId;

  /// Identifier of the gifts to move to the beginning of the collection. All other gifts are placed in the current order after the specified gifts
  final List<String> receivedGiftIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "collection_id": collectionId,
      "received_gift_ids": receivedGiftIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that owns the collection
  /// * [collection_id]: Identifier of the gift collection
  /// * [received_gift_ids]: Identifier of the gifts to move to the beginning of the collection. All other gifts are placed in the current order after the specified gifts
  ReorderGiftCollectionGifts copyWith({
    MessageSender? ownerId,
    int? collectionId,
    List<String>? receivedGiftIds,
  }) =>
      ReorderGiftCollectionGifts(
        ownerId: ownerId ?? this.ownerId,
        collectionId: collectionId ?? this.collectionId,
        receivedGiftIds: receivedGiftIds ?? this.receivedGiftIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderGiftCollectionGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
