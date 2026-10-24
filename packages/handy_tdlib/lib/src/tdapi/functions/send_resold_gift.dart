part of '../tdapi.dart';

/// **SendResoldGift** *(sendResoldGift)* - TDLib function
///
/// Sends an upgraded gift that is available for resale to another user or channel chat; gifts already owned by the current user. must be transferred using transferGift and can't be passed to the method.
///
/// * [giftName]: Name of the upgraded gift to send.
/// * [ownerId]: Identifier of the user or the channel chat that will receive the gift.
/// * [price]: The price that the user agreed to pay for the gift.
/// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages and the price of the gift is less than the price of a paid message to the user.
/// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
///
/// [GiftResaleResult] is returned on completion.
final class SendResoldGift extends TdFunction {
  /// **SendResoldGift** *(sendResoldGift)* - TDLib function
  ///
  /// Sends an upgraded gift that is available for resale to another user or channel chat; gifts already owned by the current user. must be transferred using transferGift and can't be passed to the method.
  ///
  /// * [giftName]: Name of the upgraded gift to send.
  /// * [ownerId]: Identifier of the user or the channel chat that will receive the gift.
  /// * [price]: The price that the user agreed to pay for the gift.
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages and the price of the gift is less than the price of a paid message to the user.
  /// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
  ///
  /// [GiftResaleResult] is returned on completion.
  const SendResoldGift({
    required this.giftName,
    required this.ownerId,
    required this.price,
    required this.text,
    required this.isPrivate,
  });

  /// Name of the upgraded gift to send
  final String giftName;

  /// Identifier of the user or the channel chat that will receive the gift
  final MessageSender ownerId;

  /// The price that the user agreed to pay for the gift
  final GiftResalePrice price;

  /// Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages and the price of the gift is less than the price of a paid message to the user
  final FormattedText text;

  /// Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_name": giftName,
      "owner_id": ownerId.toJson(),
      "price": price.toJson(),
      "text": text.toJson(),
      "is_private": isPrivate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_name]: Name of the upgraded gift to send
  /// * [owner_id]: Identifier of the user or the channel chat that will receive the gift
  /// * [price]: The price that the user agreed to pay for the gift
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages and the price of the gift is less than the price of a paid message to the user
  /// * [is_private]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  SendResoldGift copyWith({
    String? giftName,
    MessageSender? ownerId,
    GiftResalePrice? price,
    FormattedText? text,
    bool? isPrivate,
  }) =>
      SendResoldGift(
        giftName: giftName ?? this.giftName,
        ownerId: ownerId ?? this.ownerId,
        price: price ?? this.price,
        text: text ?? this.text,
        isPrivate: isPrivate ?? this.isPrivate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendResoldGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
