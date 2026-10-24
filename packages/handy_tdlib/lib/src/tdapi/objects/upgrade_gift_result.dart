part of '../tdapi.dart';

/// **UpgradeGiftResult** *(upgradeGiftResult)* - basic class
///
/// Contains result of gift upgrading.
///
/// * [gift]: The upgraded gift.
/// * [receivedGiftId]: Unique identifier of the received gift for the current user.
/// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page.
/// * [canBeTransferred]: True, if the gift can be transferred to another owner.
/// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift.
/// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available.
/// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible.
/// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
/// * [exportDate]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past.
final class UpgradeGiftResult extends TdObject {
  /// **UpgradeGiftResult** *(upgradeGiftResult)* - basic class
  ///
  /// Contains result of gift upgrading.
  ///
  /// * [gift]: The upgraded gift.
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user.
  /// * [isSaved]: True, if the gift is displayed on the user's or the channel's profile page.
  /// * [canBeTransferred]: True, if the gift can be transferred to another owner.
  /// * [transferStarCount]: Number of Telegram Stars that must be paid to transfer the upgraded gift.
  /// * [dropOriginalDetailsStarCount]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available.
  /// * [nextTransferDate]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible.
  /// * [nextResaleDate]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift.
  /// * [exportDate]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past.
  const UpgradeGiftResult({
    required this.gift,
    required this.receivedGiftId,
    required this.isSaved,
    required this.canBeTransferred,
    required this.transferStarCount,
    required this.dropOriginalDetailsStarCount,
    required this.nextTransferDate,
    required this.nextResaleDate,
    required this.exportDate,
    this.extra,
    this.clientId,
  });

  /// The upgraded gift
  final UpgradedGift gift;

  /// Unique identifier of the received gift for the current user
  final String receivedGiftId;

  /// True, if the gift is displayed on the user's or the channel's profile page
  final bool isSaved;

  /// True, if the gift can be transferred to another owner
  final bool canBeTransferred;

  /// Number of Telegram Stars that must be paid to transfer the upgraded gift
  final int transferStarCount;

  /// Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available
  final int dropOriginalDetailsStarCount;

  /// Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible
  final int nextTransferDate;

  /// Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  final int nextResaleDate;

  /// Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past
  final int exportDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpgradeGiftResult.fromJson(Map<String, dynamic> json) =>
      UpgradeGiftResult(
        gift: UpgradedGift.fromJson(json['gift']),
        receivedGiftId: json['received_gift_id'],
        isSaved: json['is_saved'],
        canBeTransferred: json['can_be_transferred'],
        transferStarCount: json['transfer_star_count'],
        dropOriginalDetailsStarCount: json['drop_original_details_star_count'],
        nextTransferDate: json['next_transfer_date'],
        nextResaleDate: json['next_resale_date'],
        exportDate: json['export_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "received_gift_id": receivedGiftId,
      "is_saved": isSaved,
      "can_be_transferred": canBeTransferred,
      "transfer_star_count": transferStarCount,
      "drop_original_details_star_count": dropOriginalDetailsStarCount,
      "next_transfer_date": nextTransferDate,
      "next_resale_date": nextResaleDate,
      "export_date": exportDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The upgraded gift
  /// * [received_gift_id]: Unique identifier of the received gift for the current user
  /// * [is_saved]: True, if the gift is displayed on the user's or the channel's profile page
  /// * [can_be_transferred]: True, if the gift can be transferred to another owner
  /// * [transfer_star_count]: Number of Telegram Stars that must be paid to transfer the upgraded gift
  /// * [drop_original_details_star_count]: Number of Telegram Stars that must be paid to drop original details of the upgraded gift; 0 if not available
  /// * [next_transfer_date]: Point in time (Unix timestamp) when the gift can be transferred to another owner; can be in the past; 0 if the gift can be transferred immediately or transfer isn't possible
  /// * [next_resale_date]: Point in time (Unix timestamp) when the gift can be resold to another user; can be in the past; 0 if the gift can't be resold; only for the receiver of the gift
  /// * [export_date]: Point in time (Unix timestamp) when the gift can be transferred to the TON blockchain as an NFT; can be in the past
  UpgradeGiftResult copyWith({
    UpgradedGift? gift,
    String? receivedGiftId,
    bool? isSaved,
    bool? canBeTransferred,
    int? transferStarCount,
    int? dropOriginalDetailsStarCount,
    int? nextTransferDate,
    int? nextResaleDate,
    int? exportDate,
    dynamic extra,
    int? clientId,
  }) =>
      UpgradeGiftResult(
        gift: gift ?? this.gift,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        isSaved: isSaved ?? this.isSaved,
        canBeTransferred: canBeTransferred ?? this.canBeTransferred,
        transferStarCount: transferStarCount ?? this.transferStarCount,
        dropOriginalDetailsStarCount:
            dropOriginalDetailsStarCount ?? this.dropOriginalDetailsStarCount,
        nextTransferDate: nextTransferDate ?? this.nextTransferDate,
        nextResaleDate: nextResaleDate ?? this.nextResaleDate,
        exportDate: exportDate ?? this.exportDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradeGiftResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
