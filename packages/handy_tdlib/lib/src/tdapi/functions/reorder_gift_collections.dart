part of '../tdapi.dart';

/// **ReorderGiftCollections** *(reorderGiftCollections)* - TDLib function
///
/// Changes order of gift collections. If the collections are owned by a channel chat, then requires can_post_messages administrator right in the channel chat.
///
/// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
/// * [collectionIds]: New order of gift collections.
///
/// [Ok] is returned on completion.
final class ReorderGiftCollections extends TdFunction {
  /// **ReorderGiftCollections** *(reorderGiftCollections)* - TDLib function
  ///
  /// Changes order of gift collections. If the collections are owned by a channel chat, then requires can_post_messages administrator right in the channel chat.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
  /// * [collectionIds]: New order of gift collections.
  ///
  /// [Ok] is returned on completion.
  const ReorderGiftCollections({
    required this.ownerId,
    required this.collectionIds,
  });

  /// Identifier of the user or the channel chat that owns the collection
  final MessageSender ownerId;

  /// New order of gift collections
  final List<int> collectionIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "collection_ids": collectionIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that owns the collection
  /// * [collection_ids]: New order of gift collections
  ReorderGiftCollections copyWith({
    MessageSender? ownerId,
    List<int>? collectionIds,
  }) =>
      ReorderGiftCollections(
        ownerId: ownerId ?? this.ownerId,
        collectionIds: collectionIds ?? this.collectionIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderGiftCollections';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
