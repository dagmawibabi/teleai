part of '../tdapi.dart';

/// **GiftForResale** *(giftForResale)* - basic class
///
/// Describes a gift available for resale.
///
/// * [gift]: The gift.
/// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the gifts owned by the current user.
final class GiftForResale extends TdObject {
  /// **GiftForResale** *(giftForResale)* - basic class
  ///
  /// Describes a gift available for resale.
  ///
  /// * [gift]: The gift.
  /// * [receivedGiftId]: Unique identifier of the received gift for the current user; only for the gifts owned by the current user.
  const GiftForResale({
    required this.gift,
    required this.receivedGiftId,
  });

  /// The gift
  final UpgradedGift gift;

  /// Unique identifier of the received gift for the current user; only for the gifts owned by the current user
  final String receivedGiftId;

  /// Parse from a json
  factory GiftForResale.fromJson(Map<String, dynamic> json) => GiftForResale(
        gift: UpgradedGift.fromJson(json['gift']),
        receivedGiftId: json['received_gift_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "received_gift_id": receivedGiftId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [received_gift_id]: Unique identifier of the received gift for the current user; only for the gifts owned by the current user
  GiftForResale copyWith({
    UpgradedGift? gift,
    String? receivedGiftId,
  }) =>
      GiftForResale(
        gift: gift ?? this.gift,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftForResale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
