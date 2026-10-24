part of '../tdapi.dart';

/// **ReceivedGift** *(receivedGift)* - basic class
///
/// Represents a gift received by a user or a chat.
///
/// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
/// * [senderId]: Identifier of a user or a chat that sent the gift; may be null if unknown *(optional)*.
/// * [text]: Message added to the gift.
/// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
/// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone is able to see them.
/// * [isSaved]: True, if the gift is displayed on the chat's profile page; only for the receiver of the gift.
/// * [isPinned]: True, if the gift is pinned to the top of the chat's profile page.
/// * [canBeUpgraded]: True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift.
/// * [canBeTransferred]: True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift.
/// * [canBeDeleted]: True, if the gift is a regular gift that can be deleted using deleteGift; only for the receiver of the gift.
/// * [wasRefunded]: True, if the gift was refunded and isn't available anymore.
/// * [date]: Point in time (Unix timestamp) when the gift was sent.
/// * [gift]: The gift.
/// * [collectionIds]: Identifiers of collections to which the gift is added; only for the receiver of the gift.
/// * [sellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user.
/// * [prepaidUpgradeStarCount]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift.
/// * [isUpgradeSeparate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost.
/// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift.
/// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift.
/// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift.
/// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
/// * [exportDate]: Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift.
/// * [prepaidUpgradeHash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade.
/// * [craftDate]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift.
final class ReceivedGift extends TdObject {
  /// **ReceivedGift** *(receivedGift)* - basic class
  ///
  /// Represents a gift received by a user or a chat.
  ///
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the receiver of the gift.
  /// * [senderId]: Identifier of a user or a chat that sent the gift; may be null if unknown *(optional)*.
  /// * [text]: Message added to the gift.
  /// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
  /// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone is able to see them.
  /// * [isSaved]: True, if the gift is displayed on the chat's profile page; only for the receiver of the gift.
  /// * [isPinned]: True, if the gift is pinned to the top of the chat's profile page.
  /// * [canBeUpgraded]: True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift.
  /// * [canBeTransferred]: True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift.
  /// * [canBeDeleted]: True, if the gift is a regular gift that can be deleted using deleteGift; only for the receiver of the gift.
  /// * [wasRefunded]: True, if the gift was refunded and isn't available anymore.
  /// * [date]: Point in time (Unix timestamp) when the gift was sent.
  /// * [gift]: The gift.
  /// * [collectionIds]: Identifiers of collections to which the gift is added; only for the receiver of the gift.
  /// * [sellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user.
  /// * [prepaidUpgradeStarCount]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift.
  /// * [isUpgradeSeparate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost.
  /// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift.
  /// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift.
  /// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift.
  /// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
  /// * [exportDate]: Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift.
  /// * [prepaidUpgradeHash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade.
  /// * [craftDate]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift.
  const ReceivedGift({
    required this.receivedGiftId,
    this.senderId,
    required this.text,
    required this.uniqueGiftNumber,
    required this.isPrivate,
    required this.isSaved,
    required this.isPinned,
    required this.canBeUpgraded,
    required this.canBeTransferred,
    required this.canBeDeleted,
    required this.wasRefunded,
    required this.date,
    required this.gift,
    required this.collectionIds,
    required this.sellStarCount,
    required this.prepaidUpgradeStarCount,
    required this.isUpgradeSeparate,
    required this.transferStarCount,
    required this.dropOriginalDetailsStarCount,
    required this.nextTransferDate,
    required this.nextResaleDate,
    required this.exportDate,
    required this.prepaidUpgradeHash,
    required this.craftDate,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the received gift for the current user; only for the receiver of the gift
  final String receivedGiftId;

  /// Identifier of a user or a chat that sent the gift; may be null if unknown
  final MessageSender? senderId;

  /// Message added to the gift
  final FormattedText text;

  /// Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  final int uniqueGiftNumber;

  /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone is able to see them
  final bool isPrivate;

  /// True, if the gift is displayed on the chat's profile page; only for the receiver of the gift
  final bool isSaved;

  /// True, if the gift is pinned to the top of the chat's profile page
  final bool isPinned;

  /// True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift
  final bool canBeUpgraded;

  /// True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift
  final bool canBeTransferred;

  /// True, if the gift is a regular gift that can be deleted using deleteGift; only for the receiver of the gift
  final bool canBeDeleted;

  /// True, if the gift was refunded and isn't available anymore
  final bool wasRefunded;

  /// Point in time (Unix timestamp) when the gift was sent
  final int date;

  /// The gift
  final SentGift gift;

  /// Identifiers of collections to which the gift is added; only for the receiver of the gift
  final List<int> collectionIds;

  /// Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user
  final int sellStarCount;

  /// Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
  final int prepaidUpgradeStarCount;

  /// True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost
  final bool isUpgradeSeparate;

  /// Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
  final int transferStarCount;

  /// Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift
  final int dropOriginalDetailsStarCount;

  /// Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift
  final int nextTransferDate;

  /// Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  final int nextResaleDate;

  /// Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift
  final int exportDate;

  /// If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade
  final String prepaidUpgradeHash;

  /// Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift
  final int craftDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ReceivedGift.fromJson(Map<String, dynamic> json) => ReceivedGift(
        receivedGiftId: json['received_gift_id'],
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        text: FormattedText.fromJson(json['text']),
        uniqueGiftNumber: json['unique_gift_number'],
        isPrivate: json['is_private'],
        isSaved: json['is_saved'],
        isPinned: json['is_pinned'],
        canBeUpgraded: json['can_be_upgraded'],
        canBeTransferred: json['can_be_transferred'],
        canBeDeleted: json['can_be_deleted'],
        wasRefunded: json['was_refunded'],
        date: json['date'],
        gift: SentGift.fromJson(json['gift']),
        collectionIds: List<int>.from(
            (json['collection_ids'] ?? []).map((item) => item).toList()),
        sellStarCount: json['sell_star_count'],
        prepaidUpgradeStarCount: json['prepaid_upgrade_star_count'],
        isUpgradeSeparate: json['is_upgrade_separate'],
        transferStarCount: json['transfer_star_count'],
        dropOriginalDetailsStarCount: json['drop_original_details_star_count'],
        nextTransferDate: json['next_transfer_date'],
        nextResaleDate: json['next_resale_date'],
        exportDate: json['export_date'],
        prepaidUpgradeHash: json['prepaid_upgrade_hash'],
        craftDate: json['craft_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "sender_id": senderId?.toJson(),
      "text": text.toJson(),
      "unique_gift_number": uniqueGiftNumber,
      "is_private": isPrivate,
      "is_saved": isSaved,
      "is_pinned": isPinned,
      "can_be_upgraded": canBeUpgraded,
      "can_be_transferred": canBeTransferred,
      "can_be_deleted": canBeDeleted,
      "was_refunded": wasRefunded,
      "date": date,
      "gift": gift.toJson(),
      "collection_ids": collectionIds.map((i) => i).toList(),
      "sell_star_count": sellStarCount,
      "prepaid_upgrade_star_count": prepaidUpgradeStarCount,
      "is_upgrade_separate": isUpgradeSeparate,
      "transfer_star_count": transferStarCount,
      "drop_original_details_star_count": dropOriginalDetailsStarCount,
      "next_transfer_date": nextTransferDate,
      "next_resale_date": nextResaleDate,
      "export_date": exportDate,
      "prepaid_upgrade_hash": prepaidUpgradeHash,
      "craft_date": craftDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Unique identifier of the received gift for the current user; only for the receiver of the gift
  /// * [sender_id]: Identifier of a user or a chat that sent the gift; may be null if unknown
  /// * [text]: Message added to the gift
  /// * [unique_gift_number]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  /// * [is_private]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone is able to see them
  /// * [is_saved]: True, if the gift is displayed on the chat's profile page; only for the receiver of the gift
  /// * [is_pinned]: True, if the gift is pinned to the top of the chat's profile page
  /// * [can_be_upgraded]: True, if the gift is a regular gift that can be upgraded to a unique gift; only for the receiver of the gift
  /// * [can_be_transferred]: True, if the gift is an upgraded gift that can be transferred to another owner; only for the receiver of the gift
  /// * [can_be_deleted]: True, if the gift is a regular gift that can be deleted using deleteGift; only for the receiver of the gift
  /// * [was_refunded]: True, if the gift was refunded and isn't available anymore
  /// * [date]: Point in time (Unix timestamp) when the gift was sent
  /// * [gift]: The gift
  /// * [collection_ids]: Identifiers of collections to which the gift is added; only for the receiver of the gift
  /// * [sell_star_count]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift; 0 if the gift can't be sold by the current user
  /// * [prepaid_upgrade_star_count]: Number of Telegram Stars that were paid by the sender for the ability to upgrade the gift
  /// * [is_upgrade_separate]: True, if the upgrade was bought after the gift was sent. In this case, prepaid upgrade cost must not be added to the gift cost
  /// * [transfer_star_count]: Number of Telegram Stars that must be paid to transfer the upgraded gift; only for the receiver of the gift
  /// * [drop_original_details_star_count]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available; only for the receiver of the gift
  /// * [next_transfer_date]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible; only for the receiver of the gift
  /// * [next_resale_date]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  /// * [export_date]: Point in time (Unix timestamp) when the upgraded gift can be transferred to the TON blockchain as an NFT; can be in the past; 0 if NFT export isn't possible; only for the receiver of the gift
  /// * [prepaid_upgrade_hash]: If non-empty, then the user can pay for an upgrade of the gift using buyGiftUpgrade
  /// * [craft_date]: Point in time (Unix timestamp) when the gift can be used to craft another gift; can be in the past; only for the receiver of the gift
  ReceivedGift copyWith({
    String? receivedGiftId,
    MessageSender? senderId,
    FormattedText? text,
    int? uniqueGiftNumber,
    bool? isPrivate,
    bool? isSaved,
    bool? isPinned,
    bool? canBeUpgraded,
    bool? canBeTransferred,
    bool? canBeDeleted,
    bool? wasRefunded,
    int? date,
    SentGift? gift,
    List<int>? collectionIds,
    int? sellStarCount,
    int? prepaidUpgradeStarCount,
    bool? isUpgradeSeparate,
    int? transferStarCount,
    int? dropOriginalDetailsStarCount,
    int? nextTransferDate,
    int? nextResaleDate,
    int? exportDate,
    String? prepaidUpgradeHash,
    int? craftDate,
    dynamic extra,
    int? clientId,
  }) =>
      ReceivedGift(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        senderId: senderId ?? this.senderId,
        text: text ?? this.text,
        uniqueGiftNumber: uniqueGiftNumber ?? this.uniqueGiftNumber,
        isPrivate: isPrivate ?? this.isPrivate,
        isSaved: isSaved ?? this.isSaved,
        isPinned: isPinned ?? this.isPinned,
        canBeUpgraded: canBeUpgraded ?? this.canBeUpgraded,
        canBeTransferred: canBeTransferred ?? this.canBeTransferred,
        canBeDeleted: canBeDeleted ?? this.canBeDeleted,
        wasRefunded: wasRefunded ?? this.wasRefunded,
        date: date ?? this.date,
        gift: gift ?? this.gift,
        collectionIds: collectionIds ?? this.collectionIds,
        sellStarCount: sellStarCount ?? this.sellStarCount,
        prepaidUpgradeStarCount:
            prepaidUpgradeStarCount ?? this.prepaidUpgradeStarCount,
        isUpgradeSeparate: isUpgradeSeparate ?? this.isUpgradeSeparate,
        transferStarCount: transferStarCount ?? this.transferStarCount,
        dropOriginalDetailsStarCount:
            dropOriginalDetailsStarCount ?? this.dropOriginalDetailsStarCount,
        nextTransferDate: nextTransferDate ?? this.nextTransferDate,
        nextResaleDate: nextResaleDate ?? this.nextResaleDate,
        exportDate: exportDate ?? this.exportDate,
        prepaidUpgradeHash: prepaidUpgradeHash ?? this.prepaidUpgradeHash,
        craftDate: craftDate ?? this.craftDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'receivedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
