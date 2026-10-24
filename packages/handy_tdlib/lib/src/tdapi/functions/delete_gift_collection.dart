part of '../tdapi.dart';

/// **DeleteGiftCollection** *(deleteGiftCollection)* - TDLib function
///
/// Deletes a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat.
///
/// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
/// * [collectionId]: Identifier of the gift collection.
///
/// [Ok] is returned on completion.
final class DeleteGiftCollection extends TdFunction {
  /// **DeleteGiftCollection** *(deleteGiftCollection)* - TDLib function
  ///
  /// Deletes a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
  /// * [collectionId]: Identifier of the gift collection.
  ///
  /// [Ok] is returned on completion.
  const DeleteGiftCollection({
    required this.ownerId,
    required this.collectionId,
  });

  /// Identifier of the user or the channel chat that owns the collection
  final MessageSender ownerId;

  /// Identifier of the gift collection
  final int collectionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "collection_id": collectionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that owns the collection
  /// * [collection_id]: Identifier of the gift collection
  DeleteGiftCollection copyWith({
    MessageSender? ownerId,
    int? collectionId,
  }) =>
      DeleteGiftCollection(
        ownerId: ownerId ?? this.ownerId,
        collectionId: collectionId ?? this.collectionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteGiftCollection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
