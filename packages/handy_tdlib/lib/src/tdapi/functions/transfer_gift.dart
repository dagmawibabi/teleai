part of '../tdapi.dart';

/// **TransferGift** *(transferGift)* - TDLib function
///
/// Sends an upgraded gift to another user or channel chat.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [receivedGiftId]: Identifier of the gift.
/// * [newOwnerId]: Identifier of the user or the channel chat that will receive the gift.
/// * [starCount]: The Telegram Star amount required to pay for the transfer.
///
/// [Ok] is returned on completion.
final class TransferGift extends TdFunction {
  /// **TransferGift** *(transferGift)* - TDLib function
  ///
  /// Sends an upgraded gift to another user or channel chat.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [receivedGiftId]: Identifier of the gift.
  /// * [newOwnerId]: Identifier of the user or the channel chat that will receive the gift.
  /// * [starCount]: The Telegram Star amount required to pay for the transfer.
  ///
  /// [Ok] is returned on completion.
  const TransferGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
    required this.newOwnerId,
    required this.starCount,
  });

  /// Unique identifier of business connection on behalf of which to send the request; for bots only
  final String businessConnectionId;

  /// Identifier of the gift
  final String receivedGiftId;

  /// Identifier of the user or the channel chat that will receive the gift
  final MessageSender newOwnerId;

  /// The Telegram Star amount required to pay for the transfer
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "received_gift_id": receivedGiftId,
      "new_owner_id": newOwnerId.toJson(),
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request; for bots only
  /// * [received_gift_id]: Identifier of the gift
  /// * [new_owner_id]: Identifier of the user or the channel chat that will receive the gift
  /// * [star_count]: The Telegram Star amount required to pay for the transfer
  TransferGift copyWith({
    String? businessConnectionId,
    String? receivedGiftId,
    MessageSender? newOwnerId,
    int? starCount,
  }) =>
      TransferGift(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        newOwnerId: newOwnerId ?? this.newOwnerId,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'transferGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
