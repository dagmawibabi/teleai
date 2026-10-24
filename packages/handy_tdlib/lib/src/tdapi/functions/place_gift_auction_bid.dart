part of '../tdapi.dart';

/// **PlaceGiftAuctionBid** *(placeGiftAuctionBid)* - TDLib function
///
/// Places a bid on an auction gift.
///
/// * [giftId]: Identifier of the gift to place the bid on.
/// * [starCount]: The number of Telegram Stars to place in the bid.
/// * [userId]: Identifier of the user who will receive the gift.
/// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages.
/// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
///
/// [Ok] is returned on completion.
final class PlaceGiftAuctionBid extends TdFunction {
  /// **PlaceGiftAuctionBid** *(placeGiftAuctionBid)* - TDLib function
  ///
  /// Places a bid on an auction gift.
  ///
  /// * [giftId]: Identifier of the gift to place the bid on.
  /// * [starCount]: The number of Telegram Stars to place in the bid.
  /// * [userId]: Identifier of the user who will receive the gift.
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages.
  /// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
  ///
  /// [Ok] is returned on completion.
  const PlaceGiftAuctionBid({
    required this.giftId,
    required this.starCount,
    required this.userId,
    required this.text,
    required this.isPrivate,
  });

  /// Identifier of the gift to place the bid on
  final int giftId;

  /// The number of Telegram Stars to place in the bid
  final int starCount;

  /// Identifier of the user who will receive the gift
  final int userId;

  /// Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages
  final FormattedText text;

  /// Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "star_count": starCount,
      "user_id": userId,
      "text": text.toJson(),
      "is_private": isPrivate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the gift to place the bid on
  /// * [star_count]: The number of Telegram Stars to place in the bid
  /// * [user_id]: Identifier of the user who will receive the gift
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages
  /// * [is_private]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  PlaceGiftAuctionBid copyWith({
    int? giftId,
    int? starCount,
    int? userId,
    FormattedText? text,
    bool? isPrivate,
  }) =>
      PlaceGiftAuctionBid(
        giftId: giftId ?? this.giftId,
        starCount: starCount ?? this.starCount,
        userId: userId ?? this.userId,
        text: text ?? this.text,
        isPrivate: isPrivate ?? this.isPrivate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'placeGiftAuctionBid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
