part of '../tdapi.dart';

/// **SetGiftResalePrice** *(setGiftResalePrice)* - TDLib function
///
/// Changes resale price of a unique gift owned by the current user.
///
/// * [receivedGiftId]: Identifier of the unique gift.
/// * [price]: The new price for the unique gift; pass null to disallow gift resale. The current user will receive. getOption("gift_resale_star_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift if the gift price is in Telegram Stars or. getOption("gift_resale_gram_earnings_per_mille") TON Grams for each 1000 Grams paid for the gift if the gift price is in Grams *(optional)*.
///
/// [Ok] is returned on completion.
final class SetGiftResalePrice extends TdFunction {
  /// **SetGiftResalePrice** *(setGiftResalePrice)* - TDLib function
  ///
  /// Changes resale price of a unique gift owned by the current user.
  ///
  /// * [receivedGiftId]: Identifier of the unique gift.
  /// * [price]: The new price for the unique gift; pass null to disallow gift resale. The current user will receive. getOption("gift_resale_star_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift if the gift price is in Telegram Stars or. getOption("gift_resale_gram_earnings_per_mille") TON Grams for each 1000 Grams paid for the gift if the gift price is in Grams *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetGiftResalePrice({
    required this.receivedGiftId,
    this.price,
  });

  /// Identifier of the unique gift
  final String receivedGiftId;

  /// The new price for the unique gift; pass null to disallow gift resale. The current user will receive. getOption("gift_resale_star_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift if the gift price is in Telegram Stars or. getOption("gift_resale_gram_earnings_per_mille") TON Grams for each 1000 Grams paid for the gift if the gift price is in Grams
  final GiftResalePrice? price;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "price": price?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the unique gift
  /// * [price]: The new price for the unique gift; pass null to disallow gift resale. The current user will receive. getOption("gift_resale_star_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for the gift if the gift price is in Telegram Stars or. getOption("gift_resale_gram_earnings_per_mille") TON Grams for each 1000 Grams paid for the gift if the gift price is in Grams
  SetGiftResalePrice copyWith({
    String? receivedGiftId,
    GiftResalePrice? price,
  }) =>
      SetGiftResalePrice(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        price: price ?? this.price,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGiftResalePrice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
