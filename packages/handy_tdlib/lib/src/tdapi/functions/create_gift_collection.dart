part of '../tdapi.dart';

/// **CreateGiftCollection** *(createGiftCollection)* - TDLib function
///
/// Creates a collection from gifts on the current user's or a channel's profile page; requires can_post_messages administrator right in the channel chat.. An owner can have up to getOption("gift_collection_count_max") gift collections. The new collection will be added to the end of the gift collection list of the owner. Returns the created collection.
///
/// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
/// * [name]: Name of the collection; 1-12 characters.
/// * [receivedGiftIds]: Identifier of the gifts to add to the collection; 0-getOption("gift_collection_size_max") identifiers.
///
/// [GiftCollection] is returned on completion.
final class CreateGiftCollection extends TdFunction {
  /// **CreateGiftCollection** *(createGiftCollection)* - TDLib function
  ///
  /// Creates a collection from gifts on the current user's or a channel's profile page; requires can_post_messages administrator right in the channel chat.. An owner can have up to getOption("gift_collection_count_max") gift collections. The new collection will be added to the end of the gift collection list of the owner. Returns the created collection.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that received the gifts.
  /// * [name]: Name of the collection; 1-12 characters.
  /// * [receivedGiftIds]: Identifier of the gifts to add to the collection; 0-getOption("gift_collection_size_max") identifiers.
  ///
  /// [GiftCollection] is returned on completion.
  const CreateGiftCollection({
    required this.ownerId,
    required this.name,
    required this.receivedGiftIds,
  });

  /// Identifier of the user or the channel chat that received the gifts
  final MessageSender ownerId;

  /// Name of the collection; 1-12 characters
  final String name;

  /// Identifier of the gifts to add to the collection; 0-getOption("gift_collection_size_max") identifiers
  final List<String> receivedGiftIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "name": name,
      "received_gift_ids": receivedGiftIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that received the gifts
  /// * [name]: Name of the collection; 1-12 characters
  /// * [received_gift_ids]: Identifier of the gifts to add to the collection; 0-getOption("gift_collection_size_max") identifiers
  CreateGiftCollection copyWith({
    MessageSender? ownerId,
    String? name,
    List<String>? receivedGiftIds,
  }) =>
      CreateGiftCollection(
        ownerId: ownerId ?? this.ownerId,
        name: name ?? this.name,
        receivedGiftIds: receivedGiftIds ?? this.receivedGiftIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createGiftCollection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
