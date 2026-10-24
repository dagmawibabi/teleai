part of '../tdapi.dart';

/// **SendGiftPurchaseOffer** *(sendGiftPurchaseOffer)* - TDLib function
///
/// Sends an offer to purchase an upgraded gift.
///
/// * [ownerId]: Identifier of the user or the channel chat that currently owns the gift and will receive the offer.
/// * [giftName]: Name of the upgraded gift.
/// * [price]: The price that the user agreed to pay for the gift.
/// * [duration]: Duration of the offer, in seconds; must be one of 21600, 43200, 86400, 129600, 172800, or 259200. Can also be 120 if Telegram test environment is used.
/// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay additionally for sending of the offer message to the current gift owner; pass userFullInfo.outgoing_paid_message_star_count for users and 0 otherwise.
///
/// [Ok] is returned on completion.
final class SendGiftPurchaseOffer extends TdFunction {
  /// **SendGiftPurchaseOffer** *(sendGiftPurchaseOffer)* - TDLib function
  ///
  /// Sends an offer to purchase an upgraded gift.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that currently owns the gift and will receive the offer.
  /// * [giftName]: Name of the upgraded gift.
  /// * [price]: The price that the user agreed to pay for the gift.
  /// * [duration]: Duration of the offer, in seconds; must be one of 21600, 43200, 86400, 129600, 172800, or 259200. Can also be 120 if Telegram test environment is used.
  /// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay additionally for sending of the offer message to the current gift owner; pass userFullInfo.outgoing_paid_message_star_count for users and 0 otherwise.
  ///
  /// [Ok] is returned on completion.
  const SendGiftPurchaseOffer({
    required this.ownerId,
    required this.giftName,
    required this.price,
    required this.duration,
    required this.paidMessageStarCount,
  });

  /// Identifier of the user or the channel chat that currently owns the gift and will receive the offer
  final MessageSender ownerId;

  /// Name of the upgraded gift
  final String giftName;

  /// The price that the user agreed to pay for the gift
  final GiftResalePrice price;

  /// Duration of the offer, in seconds; must be one of 21600, 43200, 86400, 129600, 172800, or 259200. Can also be 120 if Telegram test environment is used
  final int duration;

  /// The number of Telegram Stars the user agreed to pay additionally for sending of the offer message to the current gift owner; pass userFullInfo.outgoing_paid_message_star_count for users and 0 otherwise
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift_name": giftName,
      "price": price.toJson(),
      "duration": duration,
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that currently owns the gift and will receive the offer
  /// * [gift_name]: Name of the upgraded gift
  /// * [price]: The price that the user agreed to pay for the gift
  /// * [duration]: Duration of the offer, in seconds; must be one of 21600, 43200, 86400, 129600, 172800, or 259200. Can also be 120 if Telegram test environment is used
  /// * [paid_message_star_count]: The number of Telegram Stars the user agreed to pay additionally for sending of the offer message to the current gift owner; pass userFullInfo.outgoing_paid_message_star_count for users and 0 otherwise
  SendGiftPurchaseOffer copyWith({
    MessageSender? ownerId,
    String? giftName,
    GiftResalePrice? price,
    int? duration,
    int? paidMessageStarCount,
  }) =>
      SendGiftPurchaseOffer(
        ownerId: ownerId ?? this.ownerId,
        giftName: giftName ?? this.giftName,
        price: price ?? this.price,
        duration: duration ?? this.duration,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendGiftPurchaseOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
