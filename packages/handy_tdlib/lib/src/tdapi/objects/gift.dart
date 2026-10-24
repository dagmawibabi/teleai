part of '../tdapi.dart';

/// **Gift** *(gift)* - basic class
///
/// Describes a gift that can be sent to another user or channel chat.
///
/// * [id]: Unique identifier of the gift.
/// * [publisherChatId]: Identifier of the chat that published the gift; 0 if none.
/// * [sticker]: The sticker representing the gift.
/// * [starCount]: Number of Telegram Stars that must be paid for the gift.
/// * [defaultSellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed.
/// * [upgradeStarCount]: Number of Telegram Stars that must be paid to upgrade the gift; 0 if upgrade isn't possible.
/// * [upgradeVariantCount]: Number of unique gift variants that are available for the upgraded gift; 0 if unknown.
/// * [hasColors]: True, if the gift can be used to customize the user's name, and backgrounds of profile photo, reply header, and link preview.
/// * [isForBirthday]: True, if the gift is a birthday gift.
/// * [isPremium]: True, if the gift can be bought only by Telegram Premium subscribers.
/// * [auctionInfo]: Information about the auction on which the gift can be purchased; may be null if the gift can be purchased directly *(optional)*.
/// * [nextSendDate]: Point in time (Unix timestamp) when the gift can be sent next time by the current user; may be 0 or a date in the past.. If the date is in the future, then call canSendGift to get the reason, why the gift can't be sent now.
/// * [userLimits]: Number of times the gift can be purchased by the current user; may be null if not limited *(optional)*.
/// * [overallLimits]: Number of times the gift can be purchased by all users; may be null if not limited *(optional)*.
/// * [background]: Background of the gift; may be null if the gift has no background *(optional)*.
/// * [firstSendDate]: Point in time (Unix timestamp) when the gift was sent for the first time; for sold out gifts only.
/// * [lastSendDate]: Point in time (Unix timestamp) when the gift was sent for the last time; for sold out gifts only.
final class Gift extends TdObject {
  /// **Gift** *(gift)* - basic class
  ///
  /// Describes a gift that can be sent to another user or channel chat.
  ///
  /// * [id]: Unique identifier of the gift.
  /// * [publisherChatId]: Identifier of the chat that published the gift; 0 if none.
  /// * [sticker]: The sticker representing the gift.
  /// * [starCount]: Number of Telegram Stars that must be paid for the gift.
  /// * [defaultSellStarCount]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed.
  /// * [upgradeStarCount]: Number of Telegram Stars that must be paid to upgrade the gift; 0 if upgrade isn't possible.
  /// * [upgradeVariantCount]: Number of unique gift variants that are available for the upgraded gift; 0 if unknown.
  /// * [hasColors]: True, if the gift can be used to customize the user's name, and backgrounds of profile photo, reply header, and link preview.
  /// * [isForBirthday]: True, if the gift is a birthday gift.
  /// * [isPremium]: True, if the gift can be bought only by Telegram Premium subscribers.
  /// * [auctionInfo]: Information about the auction on which the gift can be purchased; may be null if the gift can be purchased directly *(optional)*.
  /// * [nextSendDate]: Point in time (Unix timestamp) when the gift can be sent next time by the current user; may be 0 or a date in the past.. If the date is in the future, then call canSendGift to get the reason, why the gift can't be sent now.
  /// * [userLimits]: Number of times the gift can be purchased by the current user; may be null if not limited *(optional)*.
  /// * [overallLimits]: Number of times the gift can be purchased by all users; may be null if not limited *(optional)*.
  /// * [background]: Background of the gift; may be null if the gift has no background *(optional)*.
  /// * [firstSendDate]: Point in time (Unix timestamp) when the gift was sent for the first time; for sold out gifts only.
  /// * [lastSendDate]: Point in time (Unix timestamp) when the gift was sent for the last time; for sold out gifts only.
  const Gift({
    required this.id,
    required this.publisherChatId,
    required this.sticker,
    required this.starCount,
    required this.defaultSellStarCount,
    required this.upgradeStarCount,
    required this.upgradeVariantCount,
    required this.hasColors,
    required this.isForBirthday,
    required this.isPremium,
    this.auctionInfo,
    required this.nextSendDate,
    this.userLimits,
    this.overallLimits,
    this.background,
    required this.firstSendDate,
    required this.lastSendDate,
  });

  /// Unique identifier of the gift
  final int id;

  /// Identifier of the chat that published the gift; 0 if none
  final int publisherChatId;

  /// The sticker representing the gift
  final Sticker sticker;

  /// Number of Telegram Stars that must be paid for the gift
  final int starCount;

  /// Number of Telegram Stars that can be claimed by the receiver instead of the regular gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed
  final int defaultSellStarCount;

  /// Number of Telegram Stars that must be paid to upgrade the gift; 0 if upgrade isn't possible
  final int upgradeStarCount;

  /// Number of unique gift variants that are available for the upgraded gift; 0 if unknown
  final int upgradeVariantCount;

  /// True, if the gift can be used to customize the user's name, and backgrounds of profile photo, reply header, and link preview
  final bool hasColors;

  /// True, if the gift is a birthday gift
  final bool isForBirthday;

  /// True, if the gift can be bought only by Telegram Premium subscribers
  final bool isPremium;

  /// Information about the auction on which the gift can be purchased; may be null if the gift can be purchased directly
  final GiftAuction? auctionInfo;

  /// Point in time (Unix timestamp) when the gift can be sent next time by the current user; may be 0 or a date in the past.. If the date is in the future, then call canSendGift to get the reason, why the gift can't be sent now
  final int nextSendDate;

  /// Number of times the gift can be purchased by the current user; may be null if not limited
  final GiftPurchaseLimits? userLimits;

  /// Number of times the gift can be purchased by all users; may be null if not limited
  final GiftPurchaseLimits? overallLimits;

  /// Background of the gift; may be null if the gift has no background
  final GiftBackground? background;

  /// Point in time (Unix timestamp) when the gift was sent for the first time; for sold out gifts only
  final int firstSendDate;

  /// Point in time (Unix timestamp) when the gift was sent for the last time; for sold out gifts only
  final int lastSendDate;

  /// Parse from a json
  factory Gift.fromJson(Map<String, dynamic> json) => Gift(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        publisherChatId: json['publisher_chat_id'] ?? 0,
        sticker: Sticker.fromJson(json['sticker']),
        starCount: json['star_count'],
        defaultSellStarCount: json['default_sell_star_count'],
        upgradeStarCount: json['upgrade_star_count'],
        upgradeVariantCount: json['upgrade_variant_count'],
        hasColors: json['has_colors'],
        isForBirthday: json['is_for_birthday'],
        isPremium: json['is_premium'],
        auctionInfo: json['auction_info'] == null
            ? null
            : GiftAuction.fromJson(json['auction_info']),
        nextSendDate: json['next_send_date'],
        userLimits: json['user_limits'] == null
            ? null
            : GiftPurchaseLimits.fromJson(json['user_limits']),
        overallLimits: json['overall_limits'] == null
            ? null
            : GiftPurchaseLimits.fromJson(json['overall_limits']),
        background: json['background'] == null
            ? null
            : GiftBackground.fromJson(json['background']),
        firstSendDate: json['first_send_date'],
        lastSendDate: json['last_send_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "publisher_chat_id": publisherChatId,
      "sticker": sticker.toJson(),
      "star_count": starCount,
      "default_sell_star_count": defaultSellStarCount,
      "upgrade_star_count": upgradeStarCount,
      "upgrade_variant_count": upgradeVariantCount,
      "has_colors": hasColors,
      "is_for_birthday": isForBirthday,
      "is_premium": isPremium,
      "auction_info": auctionInfo?.toJson(),
      "next_send_date": nextSendDate,
      "user_limits": userLimits?.toJson(),
      "overall_limits": overallLimits?.toJson(),
      "background": background?.toJson(),
      "first_send_date": firstSendDate,
      "last_send_date": lastSendDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the gift
  /// * [publisher_chat_id]: Identifier of the chat that published the gift; 0 if none
  /// * [sticker]: The sticker representing the gift
  /// * [star_count]: Number of Telegram Stars that must be paid for the gift
  /// * [default_sell_star_count]: Number of Telegram Stars that can be claimed by the receiver instead of the regular gift by default. If the gift was paid with just bought Telegram Stars, then full value can be claimed
  /// * [upgrade_star_count]: Number of Telegram Stars that must be paid to upgrade the gift; 0 if upgrade isn't possible
  /// * [upgrade_variant_count]: Number of unique gift variants that are available for the upgraded gift; 0 if unknown
  /// * [has_colors]: True, if the gift can be used to customize the user's name, and backgrounds of profile photo, reply header, and link preview
  /// * [is_for_birthday]: True, if the gift is a birthday gift
  /// * [is_premium]: True, if the gift can be bought only by Telegram Premium subscribers
  /// * [auction_info]: Information about the auction on which the gift can be purchased; may be null if the gift can be purchased directly
  /// * [next_send_date]: Point in time (Unix timestamp) when the gift can be sent next time by the current user; may be 0 or a date in the past.. If the date is in the future, then call canSendGift to get the reason, why the gift can't be sent now
  /// * [user_limits]: Number of times the gift can be purchased by the current user; may be null if not limited
  /// * [overall_limits]: Number of times the gift can be purchased by all users; may be null if not limited
  /// * [background]: Background of the gift; may be null if the gift has no background
  /// * [first_send_date]: Point in time (Unix timestamp) when the gift was sent for the first time; for sold out gifts only
  /// * [last_send_date]: Point in time (Unix timestamp) when the gift was sent for the last time; for sold out gifts only
  Gift copyWith({
    int? id,
    int? publisherChatId,
    Sticker? sticker,
    int? starCount,
    int? defaultSellStarCount,
    int? upgradeStarCount,
    int? upgradeVariantCount,
    bool? hasColors,
    bool? isForBirthday,
    bool? isPremium,
    GiftAuction? auctionInfo,
    int? nextSendDate,
    GiftPurchaseLimits? userLimits,
    GiftPurchaseLimits? overallLimits,
    GiftBackground? background,
    int? firstSendDate,
    int? lastSendDate,
  }) =>
      Gift(
        id: id ?? this.id,
        publisherChatId: publisherChatId ?? this.publisherChatId,
        sticker: sticker ?? this.sticker,
        starCount: starCount ?? this.starCount,
        defaultSellStarCount: defaultSellStarCount ?? this.defaultSellStarCount,
        upgradeStarCount: upgradeStarCount ?? this.upgradeStarCount,
        upgradeVariantCount: upgradeVariantCount ?? this.upgradeVariantCount,
        hasColors: hasColors ?? this.hasColors,
        isForBirthday: isForBirthday ?? this.isForBirthday,
        isPremium: isPremium ?? this.isPremium,
        auctionInfo: auctionInfo ?? this.auctionInfo,
        nextSendDate: nextSendDate ?? this.nextSendDate,
        userLimits: userLimits ?? this.userLimits,
        overallLimits: overallLimits ?? this.overallLimits,
        background: background ?? this.background,
        firstSendDate: firstSendDate ?? this.firstSendDate,
        lastSendDate: lastSendDate ?? this.lastSendDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'gift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
