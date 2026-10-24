part of '../tdapi.dart';

/// **SendGift** *(sendGift)* - TDLib function
///
/// Sends a gift to another user or channel chat. May return an error with a message "STARGIFT_USAGE_LIMITED" if the gift was sold out.
///
/// * [giftId]: Identifier of the gift to send.
/// * [ownerId]: Identifier of the user or the channel chat that will receive the gift; limited gifts can't be sent to channel chats.
/// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages.
/// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
/// * [payForUpgrade]: Pass true to additionally pay for the gift upgrade and allow the receiver to upgrade it for free.
///
/// [Ok] is returned on completion.
final class SendGift extends TdFunction {
  /// **SendGift** *(sendGift)* - TDLib function
  ///
  /// Sends a gift to another user or channel chat. May return an error with a message "STARGIFT_USAGE_LIMITED" if the gift was sold out.
  ///
  /// * [giftId]: Identifier of the gift to send.
  /// * [ownerId]: Identifier of the user or the channel chat that will receive the gift; limited gifts can't be sent to channel chats.
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages.
  /// * [isPrivate]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them.
  /// * [payForUpgrade]: Pass true to additionally pay for the gift upgrade and allow the receiver to upgrade it for free.
  ///
  /// [Ok] is returned on completion.
  const SendGift({
    required this.giftId,
    required this.ownerId,
    required this.text,
    required this.isPrivate,
    required this.payForUpgrade,
  });

  /// Identifier of the gift to send
  final int giftId;

  /// Identifier of the user or the channel chat that will receive the gift; limited gifts can't be sent to channel chats
  final MessageSender ownerId;

  /// Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages
  final FormattedText text;

  /// Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  final bool isPrivate;

  /// Pass true to additionally pay for the gift upgrade and allow the receiver to upgrade it for free
  final bool payForUpgrade;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "owner_id": ownerId.toJson(),
      "text": text.toJson(),
      "is_private": isPrivate,
      "pay_for_upgrade": payForUpgrade,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the gift to send
  /// * [owner_id]: Identifier of the user or the channel chat that will receive the gift; limited gifts can't be sent to channel chats
  /// * [text]: Text to show along with the gift; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.. Must be empty if the receiver enabled paid messages
  /// * [is_private]: Pass true to show gift text and sender only to the gift receiver; otherwise, everyone will be able to see them
  /// * [pay_for_upgrade]: Pass true to additionally pay for the gift upgrade and allow the receiver to upgrade it for free
  SendGift copyWith({
    int? giftId,
    MessageSender? ownerId,
    FormattedText? text,
    bool? isPrivate,
    bool? payForUpgrade,
  }) =>
      SendGift(
        giftId: giftId ?? this.giftId,
        ownerId: ownerId ?? this.ownerId,
        text: text ?? this.text,
        isPrivate: isPrivate ?? this.isPrivate,
        payForUpgrade: payForUpgrade ?? this.payForUpgrade,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
