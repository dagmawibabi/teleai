part of '../tdapi.dart';

/// **GiftAuctionAcquiredGifts** *(giftAuctionAcquiredGifts)* - basic class
///
/// Represents a list of gifts that were acquired by the current user on an auction.
///
/// * [gifts]: The list of acquired gifts.
final class GiftAuctionAcquiredGifts extends TdObject {
  /// **GiftAuctionAcquiredGifts** *(giftAuctionAcquiredGifts)* - basic class
  ///
  /// Represents a list of gifts that were acquired by the current user on an auction.
  ///
  /// * [gifts]: The list of acquired gifts.
  const GiftAuctionAcquiredGifts({
    required this.gifts,
    this.extra,
    this.clientId,
  });

  /// The list of acquired gifts
  final List<GiftAuctionAcquiredGift> gifts;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftAuctionAcquiredGifts.fromJson(Map<String, dynamic> json) =>
      GiftAuctionAcquiredGifts(
        gifts: List<GiftAuctionAcquiredGift>.from((json['gifts'] ?? [])
            .map((item) => GiftAuctionAcquiredGift.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gifts": gifts.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gifts]: The list of acquired gifts
  GiftAuctionAcquiredGifts copyWith({
    List<GiftAuctionAcquiredGift>? gifts,
    dynamic extra,
    int? clientId,
  }) =>
      GiftAuctionAcquiredGifts(
        gifts: gifts ?? this.gifts,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftAuctionAcquiredGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
