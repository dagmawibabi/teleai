part of '../tdapi.dart';

/// **TelegramPaymentPurpose** *(telegramPaymentPurpose)* - parent
///
/// Describes a purpose of a payment toward Telegram.
sealed class TelegramPaymentPurpose extends TdObject {
  /// **TelegramPaymentPurpose** *(telegramPaymentPurpose)* - parent
  ///
  /// Describes a purpose of a payment toward Telegram.
  const TelegramPaymentPurpose();

  /// a TelegramPaymentPurpose return type can be :
  /// * [TelegramPaymentPurposePremiumGift]
  /// * [TelegramPaymentPurposePremiumGiftCodes]
  /// * [TelegramPaymentPurposePremiumGiveaway]
  /// * [TelegramPaymentPurposeStars]
  /// * [TelegramPaymentPurposeGiftedStars]
  /// * [TelegramPaymentPurposeStarGiveaway]
  /// * [TelegramPaymentPurposeJoinChat]
  factory TelegramPaymentPurpose.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TelegramPaymentPurposePremiumGift.defaultObjectId:
        return TelegramPaymentPurposePremiumGift.fromJson(json);
      case TelegramPaymentPurposePremiumGiftCodes.defaultObjectId:
        return TelegramPaymentPurposePremiumGiftCodes.fromJson(json);
      case TelegramPaymentPurposePremiumGiveaway.defaultObjectId:
        return TelegramPaymentPurposePremiumGiveaway.fromJson(json);
      case TelegramPaymentPurposeStars.defaultObjectId:
        return TelegramPaymentPurposeStars.fromJson(json);
      case TelegramPaymentPurposeGiftedStars.defaultObjectId:
        return TelegramPaymentPurposeGiftedStars.fromJson(json);
      case TelegramPaymentPurposeStarGiveaway.defaultObjectId:
        return TelegramPaymentPurposeStarGiveaway.fromJson(json);
      case TelegramPaymentPurposeJoinChat.defaultObjectId:
        return TelegramPaymentPurposeJoinChat.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TelegramPaymentPurpose)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TelegramPaymentPurpose copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurpose';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposePremiumGift** *(telegramPaymentPurposePremiumGift)* - child of TelegramPaymentPurpose
///
/// The user gifting Telegram Premium to another user.
///
/// * [currency]: ISO 4217 currency code of the payment currency, or "XTR" for payments in Telegram Stars.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [userId]: Identifier of the user who will receive Telegram Premium.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active for the user.
/// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
final class TelegramPaymentPurposePremiumGift extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposePremiumGift** *(telegramPaymentPurposePremiumGift)* - child of TelegramPaymentPurpose
  ///
  /// The user gifting Telegram Premium to another user.
  ///
  /// * [currency]: ISO 4217 currency code of the payment currency, or "XTR" for payments in Telegram Stars.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [userId]: Identifier of the user who will receive Telegram Premium.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active for the user.
  /// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  const TelegramPaymentPurposePremiumGift({
    required this.currency,
    required this.amount,
    required this.userId,
    required this.monthCount,
    required this.text,
  });

  /// ISO 4217 currency code of the payment currency, or "XTR" for payments in Telegram Stars
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Identifier of the user who will receive Telegram Premium
  final int userId;

  /// Number of months the Telegram Premium subscription will be active for the user
  final int monthCount;

  /// Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText text;

  /// Parse from a json
  factory TelegramPaymentPurposePremiumGift.fromJson(
          Map<String, dynamic> json) =>
      TelegramPaymentPurposePremiumGift(
        currency: json['currency'],
        amount: json['amount'],
        userId: json['user_id'],
        monthCount: json['month_count'],
        text: FormattedText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "user_id": userId,
      "month_count": monthCount,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code of the payment currency, or "XTR" for payments in Telegram Stars
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [user_id]: Identifier of the user who will receive Telegram Premium
  /// * [month_count]: Number of months the Telegram Premium subscription will be active for the user
  /// * [text]: Text to show to the user receiving Telegram Premium; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  @override
  TelegramPaymentPurposePremiumGift copyWith({
    String? currency,
    int? amount,
    int? userId,
    int? monthCount,
    FormattedText? text,
  }) =>
      TelegramPaymentPurposePremiumGift(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
        monthCount: monthCount ?? this.monthCount,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposePremiumGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposePremiumGiftCodes** *(telegramPaymentPurposePremiumGiftCodes)* - child of TelegramPaymentPurpose
///
/// The user boosting a chat by creating Telegram Premium gift codes for other users.
///
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [userIds]: Identifiers of the users who can activate the gift codes.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active for the users.
/// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
final class TelegramPaymentPurposePremiumGiftCodes
    extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposePremiumGiftCodes** *(telegramPaymentPurposePremiumGiftCodes)* - child of TelegramPaymentPurpose
  ///
  /// The user boosting a chat by creating Telegram Premium gift codes for other users.
  ///
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [userIds]: Identifiers of the users who can activate the gift codes.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active for the users.
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  const TelegramPaymentPurposePremiumGiftCodes({
    required this.boostedChatId,
    required this.currency,
    required this.amount,
    required this.userIds,
    required this.monthCount,
    required this.text,
  });

  /// Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user
  final int boostedChatId;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Identifiers of the users who can activate the gift codes
  final List<int> userIds;

  /// Number of months the Telegram Premium subscription will be active for the users
  final int monthCount;

  /// Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText text;

  /// Parse from a json
  factory TelegramPaymentPurposePremiumGiftCodes.fromJson(
          Map<String, dynamic> json) =>
      TelegramPaymentPurposePremiumGiftCodes(
        boostedChatId: json['boosted_chat_id'],
        currency: json['currency'],
        amount: json['amount'],
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
        monthCount: json['month_count'],
        text: FormattedText.fromJson(json['text']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "boosted_chat_id": boostedChatId,
      "currency": currency,
      "amount": amount,
      "user_ids": userIds.map((i) => i).toList(),
      "month_count": monthCount,
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boosted_chat_id]: Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [user_ids]: Identifiers of the users who can activate the gift codes
  /// * [month_count]: Number of months the Telegram Premium subscription will be active for the users
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  @override
  TelegramPaymentPurposePremiumGiftCodes copyWith({
    int? boostedChatId,
    String? currency,
    int? amount,
    List<int>? userIds,
    int? monthCount,
    FormattedText? text,
  }) =>
      TelegramPaymentPurposePremiumGiftCodes(
        boostedChatId: boostedChatId ?? this.boostedChatId,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        userIds: userIds ?? this.userIds,
        monthCount: monthCount ?? this.monthCount,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'telegramPaymentPurposePremiumGiftCodes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposePremiumGiveaway** *(telegramPaymentPurposePremiumGiveaway)* - child of TelegramPaymentPurpose
///
/// The user creating a Telegram Premium giveaway.
///
/// * [parameters]: Giveaway parameters.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [winnerCount]: Number of users who will be able to activate the gift codes.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active for the users.
final class TelegramPaymentPurposePremiumGiveaway
    extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposePremiumGiveaway** *(telegramPaymentPurposePremiumGiveaway)* - child of TelegramPaymentPurpose
  ///
  /// The user creating a Telegram Premium giveaway.
  ///
  /// * [parameters]: Giveaway parameters.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [winnerCount]: Number of users who will be able to activate the gift codes.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active for the users.
  const TelegramPaymentPurposePremiumGiveaway({
    required this.parameters,
    required this.currency,
    required this.amount,
    required this.winnerCount,
    required this.monthCount,
  });

  /// Giveaway parameters
  final GiveawayParameters parameters;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Number of users who will be able to activate the gift codes
  final int winnerCount;

  /// Number of months the Telegram Premium subscription will be active for the users
  final int monthCount;

  /// Parse from a json
  factory TelegramPaymentPurposePremiumGiveaway.fromJson(
          Map<String, dynamic> json) =>
      TelegramPaymentPurposePremiumGiveaway(
        parameters: GiveawayParameters.fromJson(json['parameters']),
        currency: json['currency'],
        amount: json['amount'],
        winnerCount: json['winner_count'],
        monthCount: json['month_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters.toJson(),
      "currency": currency,
      "amount": amount,
      "winner_count": winnerCount,
      "month_count": monthCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Giveaway parameters
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [winner_count]: Number of users who will be able to activate the gift codes
  /// * [month_count]: Number of months the Telegram Premium subscription will be active for the users
  @override
  TelegramPaymentPurposePremiumGiveaway copyWith({
    GiveawayParameters? parameters,
    String? currency,
    int? amount,
    int? winnerCount,
    int? monthCount,
  }) =>
      TelegramPaymentPurposePremiumGiveaway(
        parameters: parameters ?? this.parameters,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        winnerCount: winnerCount ?? this.winnerCount,
        monthCount: monthCount ?? this.monthCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposePremiumGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposeStars** *(telegramPaymentPurposeStars)* - child of TelegramPaymentPurpose
///
/// The user buying Telegram Stars.
///
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [starCount]: Number of bought Telegram Stars.
/// * [chatId]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none. If non-zero and getOption("star_top_up_disabled"),. then the payment isn't allowed and the user can't buy Telegram Stars in this place.
final class TelegramPaymentPurposeStars extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposeStars** *(telegramPaymentPurposeStars)* - child of TelegramPaymentPurpose
  ///
  /// The user buying Telegram Stars.
  ///
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [starCount]: Number of bought Telegram Stars.
  /// * [chatId]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none. If non-zero and getOption("star_top_up_disabled"),. then the payment isn't allowed and the user can't buy Telegram Stars in this place.
  const TelegramPaymentPurposeStars({
    required this.currency,
    required this.amount,
    required this.starCount,
    required this.chatId,
  });

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Number of bought Telegram Stars
  final int starCount;

  /// Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none. If non-zero and getOption("star_top_up_disabled"),. then the payment isn't allowed and the user can't buy Telegram Stars in this place
  final int chatId;

  /// Parse from a json
  factory TelegramPaymentPurposeStars.fromJson(Map<String, dynamic> json) =>
      TelegramPaymentPurposeStars(
        currency: json['currency'],
        amount: json['amount'],
        starCount: json['star_count'],
        chatId: json['chat_id'] ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "star_count": starCount,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [star_count]: Number of bought Telegram Stars
  /// * [chat_id]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none. If non-zero and getOption("star_top_up_disabled"),. then the payment isn't allowed and the user can't buy Telegram Stars in this place
  @override
  TelegramPaymentPurposeStars copyWith({
    String? currency,
    int? amount,
    int? starCount,
    int? chatId,
  }) =>
      TelegramPaymentPurposeStars(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposeGiftedStars** *(telegramPaymentPurposeGiftedStars)* - child of TelegramPaymentPurpose
///
/// The user buying Telegram Stars for other users.
///
/// * [userId]: Identifier of the user to which Telegram Stars are gifted.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [starCount]: Number of bought Telegram Stars.
final class TelegramPaymentPurposeGiftedStars extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposeGiftedStars** *(telegramPaymentPurposeGiftedStars)* - child of TelegramPaymentPurpose
  ///
  /// The user buying Telegram Stars for other users.
  ///
  /// * [userId]: Identifier of the user to which Telegram Stars are gifted.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [starCount]: Number of bought Telegram Stars.
  const TelegramPaymentPurposeGiftedStars({
    required this.userId,
    required this.currency,
    required this.amount,
    required this.starCount,
  });

  /// Identifier of the user to which Telegram Stars are gifted
  final int userId;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Number of bought Telegram Stars
  final int starCount;

  /// Parse from a json
  factory TelegramPaymentPurposeGiftedStars.fromJson(
          Map<String, dynamic> json) =>
      TelegramPaymentPurposeGiftedStars(
        userId: json['user_id'],
        currency: json['currency'],
        amount: json['amount'],
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "currency": currency,
      "amount": amount,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user to which Telegram Stars are gifted
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [star_count]: Number of bought Telegram Stars
  @override
  TelegramPaymentPurposeGiftedStars copyWith({
    int? userId,
    String? currency,
    int? amount,
    int? starCount,
  }) =>
      TelegramPaymentPurposeGiftedStars(
        userId: userId ?? this.userId,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposeGiftedStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposeStarGiveaway** *(telegramPaymentPurposeStarGiveaway)* - child of TelegramPaymentPurpose
///
/// The user creating a Telegram Star giveaway.
///
/// * [parameters]: Giveaway parameters.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [winnerCount]: The number of users to receive Telegram Stars.
/// * [starCount]: The number of Telegram Stars to be distributed through the giveaway.
final class TelegramPaymentPurposeStarGiveaway extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposeStarGiveaway** *(telegramPaymentPurposeStarGiveaway)* - child of TelegramPaymentPurpose
  ///
  /// The user creating a Telegram Star giveaway.
  ///
  /// * [parameters]: Giveaway parameters.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [winnerCount]: The number of users to receive Telegram Stars.
  /// * [starCount]: The number of Telegram Stars to be distributed through the giveaway.
  const TelegramPaymentPurposeStarGiveaway({
    required this.parameters,
    required this.currency,
    required this.amount,
    required this.winnerCount,
    required this.starCount,
  });

  /// Giveaway parameters
  final GiveawayParameters parameters;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// The number of users to receive Telegram Stars
  final int winnerCount;

  /// The number of Telegram Stars to be distributed through the giveaway
  final int starCount;

  /// Parse from a json
  factory TelegramPaymentPurposeStarGiveaway.fromJson(
          Map<String, dynamic> json) =>
      TelegramPaymentPurposeStarGiveaway(
        parameters: GiveawayParameters.fromJson(json['parameters']),
        currency: json['currency'],
        amount: json['amount'],
        winnerCount: json['winner_count'],
        starCount: json['star_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters.toJson(),
      "currency": currency,
      "amount": amount,
      "winner_count": winnerCount,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Giveaway parameters
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [winner_count]: The number of users to receive Telegram Stars
  /// * [star_count]: The number of Telegram Stars to be distributed through the giveaway
  @override
  TelegramPaymentPurposeStarGiveaway copyWith({
    GiveawayParameters? parameters,
    String? currency,
    int? amount,
    int? winnerCount,
    int? starCount,
  }) =>
      TelegramPaymentPurposeStarGiveaway(
        parameters: parameters ?? this.parameters,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        winnerCount: winnerCount ?? this.winnerCount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposeStarGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TelegramPaymentPurposeJoinChat** *(telegramPaymentPurposeJoinChat)* - child of TelegramPaymentPurpose
///
/// The user joins a chat and subscribes to regular payments in Telegram Stars.
///
/// * [inviteLink]: Invite link to use.
final class TelegramPaymentPurposeJoinChat extends TelegramPaymentPurpose {
  /// **TelegramPaymentPurposeJoinChat** *(telegramPaymentPurposeJoinChat)* - child of TelegramPaymentPurpose
  ///
  /// The user joins a chat and subscribes to regular payments in Telegram Stars.
  ///
  /// * [inviteLink]: Invite link to use.
  const TelegramPaymentPurposeJoinChat({
    required this.inviteLink,
  });

  /// Invite link to use
  final String inviteLink;

  /// Parse from a json
  factory TelegramPaymentPurposeJoinChat.fromJson(Map<String, dynamic> json) =>
      TelegramPaymentPurposeJoinChat(
        inviteLink: json['invite_link'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Invite link to use
  @override
  TelegramPaymentPurposeJoinChat copyWith({
    String? inviteLink,
  }) =>
      TelegramPaymentPurposeJoinChat(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'telegramPaymentPurposeJoinChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
