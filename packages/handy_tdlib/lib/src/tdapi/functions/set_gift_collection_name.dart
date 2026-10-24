part of '../tdapi.dart';

/// **SetGiftCollectionName** *(setGiftCollectionName)* - TDLib function
///
/// Changes name of a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection.
///
/// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
/// * [collectionId]: Identifier of the gift collection.
/// * [name]: New name of the collection; 1-12 characters.
///
/// [GiftCollection] is returned on completion.
final class SetGiftCollectionName extends TdFunction {
  /// **SetGiftCollectionName** *(setGiftCollectionName)* - TDLib function
  ///
  /// Changes name of a gift collection. If the collection is owned by a channel chat, then requires can_post_messages administrator right in the channel chat. Returns the changed collection.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that owns the collection.
  /// * [collectionId]: Identifier of the gift collection.
  /// * [name]: New name of the collection; 1-12 characters.
  ///
  /// [GiftCollection] is returned on completion.
  const SetGiftCollectionName({
    required this.ownerId,
    required this.collectionId,
    required this.name,
  });

  /// Identifier of the user or the channel chat that owns the collection
  final MessageSender ownerId;

  /// Identifier of the gift collection
  final int collectionId;

  /// New name of the collection; 1-12 characters
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "collection_id": collectionId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that owns the collection
  /// * [collection_id]: Identifier of the gift collection
  /// * [name]: New name of the collection; 1-12 characters
  SetGiftCollectionName copyWith({
    MessageSender? ownerId,
    int? collectionId,
    String? name,
  }) =>
      SetGiftCollectionName(
        ownerId: ownerId ?? this.ownerId,
        collectionId: collectionId ?? this.collectionId,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGiftCollectionName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
