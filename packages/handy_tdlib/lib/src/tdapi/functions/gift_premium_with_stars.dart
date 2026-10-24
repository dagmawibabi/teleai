part of '../tdapi.dart';

/// **GiftPremiumWithStars** *(giftPremiumWithStars)* - TDLib function
///
/// Allows to buy a Telegram Premium subscription for another user with payment in Telegram Stars; for bots only.
///
/// * [userId]: Identifier of the user who will receive Telegram Premium.
/// * [starCount]: The number of Telegram Stars to pay for subscription.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active for the user.
/// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
///
/// [Ok] is returned on completion.
final class GiftPremiumWithStars extends TdFunction {
  /// **GiftPremiumWithStars** *(giftPremiumWithStars)* - TDLib function
  ///
  /// Allows to buy a Telegram Premium subscription for another user with payment in Telegram Stars; for bots only.
  ///
  /// * [userId]: Identifier of the user who will receive Telegram Premium.
  /// * [starCount]: The number of Telegram Stars to pay for subscription.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active for the user.
  /// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  ///
  /// [Ok] is returned on completion.
  const GiftPremiumWithStars({
    required this.userId,
    required this.starCount,
    required this.monthCount,
    required this.text,
  });

  /// Identifier of the user who will receive Telegram Premium
  final int userId;

  /// The number of Telegram Stars to pay for subscription
  final int starCount;

  /// Number of months the Telegram Premium subscription will be active for the user
  final int monthCount;

  /// Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "star_count": starCount,
      "month_count": monthCount,
      "text": text.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who will receive Telegram Premium
  /// * [star_count]: The number of Telegram Stars to pay for subscription
  /// * [month_count]: Number of months the Telegram Premium subscription will be active for the user
  /// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  GiftPremiumWithStars copyWith({
    int? userId,
    int? starCount,
    int? monthCount,
    FormattedText? text,
  }) =>
      GiftPremiumWithStars(
        userId: userId ?? this.userId,
        starCount: starCount ?? this.starCount,
        monthCount: monthCount ?? this.monthCount,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftPremiumWithStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
