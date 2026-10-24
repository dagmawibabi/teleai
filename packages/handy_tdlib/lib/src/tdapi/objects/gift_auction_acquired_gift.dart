part of '../tdapi.dart';

/// **GiftAuctionAcquiredGift** *(giftAuctionAcquiredGift)* - basic class
///
/// Represents a gift that was acquired by the current user on an auction.
///
/// * [receiverId]: Receiver of the gift.
/// * [date]: Point in time (Unix timestamp) when the gift was acquired.
/// * [starCount]: The number of Telegram Stars that were paid for the gift.
/// * [auctionRoundNumber]: Identifier of the auction round in which the gift was acquired.
/// * [auctionRoundPosition]: Position of the user in the round among all auction participants.
/// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
/// * [text]: Message added to the gift.
/// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
final class GiftAuctionAcquiredGift extends TdObject {
  /// **GiftAuctionAcquiredGift** *(giftAuctionAcquiredGift)* - basic class
  ///
  /// Represents a gift that was acquired by the current user on an auction.
  ///
  /// * [receiverId]: Receiver of the gift.
  /// * [date]: Point in time (Unix timestamp) when the gift was acquired.
  /// * [starCount]: The number of Telegram Stars that were paid for the gift.
  /// * [auctionRoundNumber]: Identifier of the auction round in which the gift was acquired.
  /// * [auctionRoundPosition]: Position of the user in the round among all auction participants.
  /// * [uniqueGiftNumber]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned.
  /// * [text]: Message added to the gift.
  /// * [isPrivate]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them.
  const GiftAuctionAcquiredGift({
    required this.receiverId,
    required this.date,
    required this.starCount,
    required this.auctionRoundNumber,
    required this.auctionRoundPosition,
    required this.uniqueGiftNumber,
    required this.text,
    required this.isPrivate,
  });

  /// Receiver of the gift
  final MessageSender receiverId;

  /// Point in time (Unix timestamp) when the gift was acquired
  final int date;

  /// The number of Telegram Stars that were paid for the gift
  final int starCount;

  /// Identifier of the auction round in which the gift was acquired
  final int auctionRoundNumber;

  /// Position of the user in the round among all auction participants
  final int auctionRoundPosition;

  /// Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  final int uniqueGiftNumber;

  /// Message added to the gift
  final FormattedText text;

  /// True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// Parse from a json
  factory GiftAuctionAcquiredGift.fromJson(Map<String, dynamic> json) =>
      GiftAuctionAcquiredGift(
        receiverId: MessageSender.fromJson(json['receiver_id']),
        date: json['date'],
        starCount: json['star_count'],
        auctionRoundNumber: json['auction_round_number'],
        auctionRoundPosition: json['auction_round_position'],
        uniqueGiftNumber: json['unique_gift_number'],
        text: FormattedText.fromJson(json['text']),
        isPrivate: json['is_private'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "receiver_id": receiverId.toJson(),
      "date": date,
      "star_count": starCount,
      "auction_round_number": auctionRoundNumber,
      "auction_round_position": auctionRoundPosition,
      "unique_gift_number": uniqueGiftNumber,
      "text": text.toJson(),
      "is_private": isPrivate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [receiver_id]: Receiver of the gift
  /// * [date]: Point in time (Unix timestamp) when the gift was acquired
  /// * [star_count]: The number of Telegram Stars that were paid for the gift
  /// * [auction_round_number]: Identifier of the auction round in which the gift was acquired
  /// * [auction_round_position]: Position of the user in the round among all auction participants
  /// * [unique_gift_number]: Unique number of the gift among gifts upgraded from the same gift after upgrade; 0 if yet unassigned
  /// * [text]: Message added to the gift
  /// * [is_private]: True, if the sender and gift text are shown only to the gift receiver; otherwise, everyone will be able to see them
  GiftAuctionAcquiredGift copyWith({
    MessageSender? receiverId,
    int? date,
    int? starCount,
    int? auctionRoundNumber,
    int? auctionRoundPosition,
    int? uniqueGiftNumber,
    FormattedText? text,
    bool? isPrivate,
  }) =>
      GiftAuctionAcquiredGift(
        receiverId: receiverId ?? this.receiverId,
        date: date ?? this.date,
        starCount: starCount ?? this.starCount,
        auctionRoundNumber: auctionRoundNumber ?? this.auctionRoundNumber,
        auctionRoundPosition: auctionRoundPosition ?? this.auctionRoundPosition,
        uniqueGiftNumber: uniqueGiftNumber ?? this.uniqueGiftNumber,
        text: text ?? this.text,
        isPrivate: isPrivate ?? this.isPrivate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftAuctionAcquiredGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
