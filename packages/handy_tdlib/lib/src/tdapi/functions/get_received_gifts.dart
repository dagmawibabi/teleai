part of '../tdapi.dart';

/// **GetReceivedGifts** *(getReceivedGifts)* - TDLib function
///
/// Returns gifts received by the given user or chat.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [ownerId]: Identifier of the gift receiver.
/// * [collectionId]: Pass collection identifier to get gifts only from the specified collection; pass 0 to get gifts regardless of collections.
/// * [excludeUnsaved]: Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right.
/// * [excludeSaved]: Pass true to exclude gifts that are saved to the chat's profile page. Always false for gifts received by other users and channel chats without can_post_messages administrator right.
/// * [excludeUnlimited]: Pass true to exclude gifts that can be purchased unlimited number of times.
/// * [excludeUpgradable]: Pass true to exclude gifts that can be purchased limited number of times and can be upgraded.
/// * [excludeNonUpgradable]: Pass true to exclude gifts that can be purchased limited number of times and can't be upgraded.
/// * [excludeUpgraded]: Pass true to exclude upgraded gifts.
/// * [excludeWithoutColors]: Pass true to exclude gifts that can't be used in setUpgradedGiftColors.
/// * [excludeHosted]: Pass true to exclude gifts that are just hosted and are not owned by the owner.
/// * [sortByPrice]: Pass true to sort results by gift price instead of send date.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
///
/// [ReceivedGifts] is returned on completion.
final class GetReceivedGifts extends TdFunction {
  /// **GetReceivedGifts** *(getReceivedGifts)* - TDLib function
  ///
  /// Returns gifts received by the given user or chat.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [ownerId]: Identifier of the gift receiver.
  /// * [collectionId]: Pass collection identifier to get gifts only from the specified collection; pass 0 to get gifts regardless of collections.
  /// * [excludeUnsaved]: Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right.
  /// * [excludeSaved]: Pass true to exclude gifts that are saved to the chat's profile page. Always false for gifts received by other users and channel chats without can_post_messages administrator right.
  /// * [excludeUnlimited]: Pass true to exclude gifts that can be purchased unlimited number of times.
  /// * [excludeUpgradable]: Pass true to exclude gifts that can be purchased limited number of times and can be upgraded.
  /// * [excludeNonUpgradable]: Pass true to exclude gifts that can be purchased limited number of times and can't be upgraded.
  /// * [excludeUpgraded]: Pass true to exclude upgraded gifts.
  /// * [excludeWithoutColors]: Pass true to exclude gifts that can't be used in setUpgradedGiftColors.
  /// * [excludeHosted]: Pass true to exclude gifts that are just hosted and are not owned by the owner.
  /// * [sortByPrice]: Pass true to sort results by gift price instead of send date.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [ReceivedGifts] is returned on completion.
  const GetReceivedGifts({
    required this.businessConnectionId,
    required this.ownerId,
    required this.collectionId,
    required this.excludeUnsaved,
    required this.excludeSaved,
    required this.excludeUnlimited,
    required this.excludeUpgradable,
    required this.excludeNonUpgradable,
    required this.excludeUpgraded,
    required this.excludeWithoutColors,
    required this.excludeHosted,
    required this.sortByPrice,
    required this.offset,
    required this.limit,
  });

  /// Unique identifier of business connection on behalf of which to send the request; for bots only
  final String businessConnectionId;

  /// Identifier of the gift receiver
  final MessageSender ownerId;

  /// Pass collection identifier to get gifts only from the specified collection; pass 0 to get gifts regardless of collections
  final int collectionId;

  /// Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right
  final bool excludeUnsaved;

  /// Pass true to exclude gifts that are saved to the chat's profile page. Always false for gifts received by other users and channel chats without can_post_messages administrator right
  final bool excludeSaved;

  /// Pass true to exclude gifts that can be purchased unlimited number of times
  final bool excludeUnlimited;

  /// Pass true to exclude gifts that can be purchased limited number of times and can be upgraded
  final bool excludeUpgradable;

  /// Pass true to exclude gifts that can be purchased limited number of times and can't be upgraded
  final bool excludeNonUpgradable;

  /// Pass true to exclude upgraded gifts
  final bool excludeUpgraded;

  /// Pass true to exclude gifts that can't be used in setUpgradedGiftColors
  final bool excludeWithoutColors;

  /// Pass true to exclude gifts that are just hosted and are not owned by the owner
  final bool excludeHosted;

  /// Pass true to sort results by gift price instead of send date
  final bool sortByPrice;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "owner_id": ownerId.toJson(),
      "collection_id": collectionId,
      "exclude_unsaved": excludeUnsaved,
      "exclude_saved": excludeSaved,
      "exclude_unlimited": excludeUnlimited,
      "exclude_upgradable": excludeUpgradable,
      "exclude_non_upgradable": excludeNonUpgradable,
      "exclude_upgraded": excludeUpgraded,
      "exclude_without_colors": excludeWithoutColors,
      "exclude_hosted": excludeHosted,
      "sort_by_price": sortByPrice,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request; for bots only
  /// * [owner_id]: Identifier of the gift receiver
  /// * [collection_id]: Pass collection identifier to get gifts only from the specified collection; pass 0 to get gifts regardless of collections
  /// * [exclude_unsaved]: Pass true to exclude gifts that aren't saved to the chat's profile page. Always true for gifts received by other users and channel chats without can_post_messages administrator right
  /// * [exclude_saved]: Pass true to exclude gifts that are saved to the chat's profile page. Always false for gifts received by other users and channel chats without can_post_messages administrator right
  /// * [exclude_unlimited]: Pass true to exclude gifts that can be purchased unlimited number of times
  /// * [exclude_upgradable]: Pass true to exclude gifts that can be purchased limited number of times and can be upgraded
  /// * [exclude_non_upgradable]: Pass true to exclude gifts that can be purchased limited number of times and can't be upgraded
  /// * [exclude_upgraded]: Pass true to exclude upgraded gifts
  /// * [exclude_without_colors]: Pass true to exclude gifts that can't be used in setUpgradedGiftColors
  /// * [exclude_hosted]: Pass true to exclude gifts that are just hosted and are not owned by the owner
  /// * [sort_by_price]: Pass true to sort results by gift price instead of send date
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  GetReceivedGifts copyWith({
    String? businessConnectionId,
    MessageSender? ownerId,
    int? collectionId,
    bool? excludeUnsaved,
    bool? excludeSaved,
    bool? excludeUnlimited,
    bool? excludeUpgradable,
    bool? excludeNonUpgradable,
    bool? excludeUpgraded,
    bool? excludeWithoutColors,
    bool? excludeHosted,
    bool? sortByPrice,
    String? offset,
    int? limit,
  }) =>
      GetReceivedGifts(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        ownerId: ownerId ?? this.ownerId,
        collectionId: collectionId ?? this.collectionId,
        excludeUnsaved: excludeUnsaved ?? this.excludeUnsaved,
        excludeSaved: excludeSaved ?? this.excludeSaved,
        excludeUnlimited: excludeUnlimited ?? this.excludeUnlimited,
        excludeUpgradable: excludeUpgradable ?? this.excludeUpgradable,
        excludeNonUpgradable: excludeNonUpgradable ?? this.excludeNonUpgradable,
        excludeUpgraded: excludeUpgraded ?? this.excludeUpgraded,
        excludeWithoutColors: excludeWithoutColors ?? this.excludeWithoutColors,
        excludeHosted: excludeHosted ?? this.excludeHosted,
        sortByPrice: sortByPrice ?? this.sortByPrice,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getReceivedGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
