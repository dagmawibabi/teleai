part of '../tdapi.dart';

/// **StorePaymentPurpose** *(storePaymentPurpose)* - parent
///
/// Describes a purpose of an in-store payment.
sealed class StorePaymentPurpose extends TdObject {
  /// **StorePaymentPurpose** *(storePaymentPurpose)* - parent
  ///
  /// Describes a purpose of an in-store payment.
  const StorePaymentPurpose();

  /// a StorePaymentPurpose return type can be :
  /// * [StorePaymentPurposePremiumSubscription]
  /// * [StorePaymentPurposePremiumGift]
  /// * [StorePaymentPurposePremiumGiftCodes]
  /// * [StorePaymentPurposePremiumGiveaway]
  /// * [StorePaymentPurposeStarGiveaway]
  /// * [StorePaymentPurposeStars]
  /// * [StorePaymentPurposeGiftedStars]
  factory StorePaymentPurpose.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StorePaymentPurposePremiumSubscription.defaultObjectId:
        return StorePaymentPurposePremiumSubscription.fromJson(json);
      case StorePaymentPurposePremiumGift.defaultObjectId:
        return StorePaymentPurposePremiumGift.fromJson(json);
      case StorePaymentPurposePremiumGiftCodes.defaultObjectId:
        return StorePaymentPurposePremiumGiftCodes.fromJson(json);
      case StorePaymentPurposePremiumGiveaway.defaultObjectId:
        return StorePaymentPurposePremiumGiveaway.fromJson(json);
      case StorePaymentPurposeStarGiveaway.defaultObjectId:
        return StorePaymentPurposeStarGiveaway.fromJson(json);
      case StorePaymentPurposeStars.defaultObjectId:
        return StorePaymentPurposeStars.fromJson(json);
      case StorePaymentPurposeGiftedStars.defaultObjectId:
        return StorePaymentPurposeGiftedStars.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StorePaymentPurpose)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StorePaymentPurpose copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurpose';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposePremiumSubscription** *(storePaymentPurposePremiumSubscription)* - child of StorePaymentPurpose
///
/// The user subscribing to Telegram Premium.
///
/// * [isRestore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store.
/// * [isUpgrade]: Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store.
final class StorePaymentPurposePremiumSubscription extends StorePaymentPurpose {
  /// **StorePaymentPurposePremiumSubscription** *(storePaymentPurposePremiumSubscription)* - child of StorePaymentPurpose
  ///
  /// The user subscribing to Telegram Premium.
  ///
  /// * [isRestore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store.
  /// * [isUpgrade]: Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store.
  const StorePaymentPurposePremiumSubscription({
    required this.isRestore,
    required this.isUpgrade,
  });

  /// Pass true if this is a restore of a Telegram Premium purchase; only for App Store
  final bool isRestore;

  /// Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
  final bool isUpgrade;

  /// Parse from a json
  factory StorePaymentPurposePremiumSubscription.fromJson(
          Map<String, dynamic> json) =>
      StorePaymentPurposePremiumSubscription(
        isRestore: json['is_restore'],
        isUpgrade: json['is_upgrade'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_restore": isRestore,
      "is_upgrade": isUpgrade,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_restore]: Pass true if this is a restore of a Telegram Premium purchase; only for App Store
  /// * [is_upgrade]: Pass true if this is an upgrade from a monthly subscription to early subscription; only for App Store
  @override
  StorePaymentPurposePremiumSubscription copyWith({
    bool? isRestore,
    bool? isUpgrade,
  }) =>
      StorePaymentPurposePremiumSubscription(
        isRestore: isRestore ?? this.isRestore,
        isUpgrade: isUpgrade ?? this.isUpgrade,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'storePaymentPurposePremiumSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposePremiumGift** *(storePaymentPurposePremiumGift)* - child of StorePaymentPurpose
///
/// The user gifting Telegram Premium to another user.
///
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [userId]: Identifier of the user who will receive Telegram Premium.
/// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
final class StorePaymentPurposePremiumGift extends StorePaymentPurpose {
  /// **StorePaymentPurposePremiumGift** *(storePaymentPurposePremiumGift)* - child of StorePaymentPurpose
  ///
  /// The user gifting Telegram Premium to another user.
  ///
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [userId]: Identifier of the user who will receive Telegram Premium.
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  const StorePaymentPurposePremiumGift({
    required this.currency,
    required this.amount,
    required this.userId,
    required this.text,
  });

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Identifier of the user who will receive Telegram Premium
  final int userId;

  /// Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText text;

  /// Parse from a json
  factory StorePaymentPurposePremiumGift.fromJson(Map<String, dynamic> json) =>
      StorePaymentPurposePremiumGift(
        currency: json['currency'],
        amount: json['amount'],
        userId: json['user_id'],
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
      "text": text.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  /// * [user_id]: Identifier of the user who will receive Telegram Premium
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  @override
  StorePaymentPurposePremiumGift copyWith({
    String? currency,
    int? amount,
    int? userId,
    FormattedText? text,
  }) =>
      StorePaymentPurposePremiumGift(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposePremiumGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposePremiumGiftCodes** *(storePaymentPurposePremiumGiftCodes)* - child of StorePaymentPurpose
///
/// The user boosting a chat by creating Telegram Premium gift codes for other users.
///
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [userIds]: Identifiers of the users who can activate the gift codes.
/// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
final class StorePaymentPurposePremiumGiftCodes extends StorePaymentPurpose {
  /// **StorePaymentPurposePremiumGiftCodes** *(storePaymentPurposePremiumGiftCodes)* - child of StorePaymentPurpose
  ///
  /// The user boosting a chat by creating Telegram Premium gift codes for other users.
  ///
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the users for duration of the Premium subscription and which is administered by the user.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [userIds]: Identifiers of the users who can activate the gift codes.
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed.
  const StorePaymentPurposePremiumGiftCodes({
    required this.boostedChatId,
    required this.currency,
    required this.amount,
    required this.userIds,
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

  /// Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  final FormattedText text;

  /// Parse from a json
  factory StorePaymentPurposePremiumGiftCodes.fromJson(
          Map<String, dynamic> json) =>
      StorePaymentPurposePremiumGiftCodes(
        boostedChatId: json['boosted_chat_id'],
        currency: json['currency'],
        amount: json['amount'],
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
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
  /// * [text]: Text to show along with the gift codes; 0-getOption("gift_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed
  @override
  StorePaymentPurposePremiumGiftCodes copyWith({
    int? boostedChatId,
    String? currency,
    int? amount,
    List<int>? userIds,
    FormattedText? text,
  }) =>
      StorePaymentPurposePremiumGiftCodes(
        boostedChatId: boostedChatId ?? this.boostedChatId,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        userIds: userIds ?? this.userIds,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposePremiumGiftCodes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposePremiumGiveaway** *(storePaymentPurposePremiumGiveaway)* - child of StorePaymentPurpose
///
/// The user creating a Telegram Premium giveaway.
///
/// * [parameters]: Giveaway parameters.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
final class StorePaymentPurposePremiumGiveaway extends StorePaymentPurpose {
  /// **StorePaymentPurposePremiumGiveaway** *(storePaymentPurposePremiumGiveaway)* - child of StorePaymentPurpose
  ///
  /// The user creating a Telegram Premium giveaway.
  ///
  /// * [parameters]: Giveaway parameters.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  const StorePaymentPurposePremiumGiveaway({
    required this.parameters,
    required this.currency,
    required this.amount,
  });

  /// Giveaway parameters
  final GiveawayParameters parameters;

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Paid amount, in the smallest units of the currency
  final int amount;

  /// Parse from a json
  factory StorePaymentPurposePremiumGiveaway.fromJson(
          Map<String, dynamic> json) =>
      StorePaymentPurposePremiumGiveaway(
        parameters: GiveawayParameters.fromJson(json['parameters']),
        currency: json['currency'],
        amount: json['amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "parameters": parameters.toJson(),
      "currency": currency,
      "amount": amount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [parameters]: Giveaway parameters
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [amount]: Paid amount, in the smallest units of the currency
  @override
  StorePaymentPurposePremiumGiveaway copyWith({
    GiveawayParameters? parameters,
    String? currency,
    int? amount,
  }) =>
      StorePaymentPurposePremiumGiveaway(
        parameters: parameters ?? this.parameters,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposePremiumGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposeStarGiveaway** *(storePaymentPurposeStarGiveaway)* - child of StorePaymentPurpose
///
/// The user creating a Telegram Star giveaway.
///
/// * [parameters]: Giveaway parameters.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [winnerCount]: The number of users to receive Telegram Stars.
/// * [starCount]: The number of Telegram Stars to be distributed through the giveaway.
final class StorePaymentPurposeStarGiveaway extends StorePaymentPurpose {
  /// **StorePaymentPurposeStarGiveaway** *(storePaymentPurposeStarGiveaway)* - child of StorePaymentPurpose
  ///
  /// The user creating a Telegram Star giveaway.
  ///
  /// * [parameters]: Giveaway parameters.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [winnerCount]: The number of users to receive Telegram Stars.
  /// * [starCount]: The number of Telegram Stars to be distributed through the giveaway.
  const StorePaymentPurposeStarGiveaway({
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
  factory StorePaymentPurposeStarGiveaway.fromJson(Map<String, dynamic> json) =>
      StorePaymentPurposeStarGiveaway(
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
  StorePaymentPurposeStarGiveaway copyWith({
    GiveawayParameters? parameters,
    String? currency,
    int? amount,
    int? winnerCount,
    int? starCount,
  }) =>
      StorePaymentPurposeStarGiveaway(
        parameters: parameters ?? this.parameters,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        winnerCount: winnerCount ?? this.winnerCount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposeStarGiveaway';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposeStars** *(storePaymentPurposeStars)* - child of StorePaymentPurpose
///
/// The user buying Telegram Stars.
///
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [starCount]: Number of bought Telegram Stars.
/// * [chatId]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none.
final class StorePaymentPurposeStars extends StorePaymentPurpose {
  /// **StorePaymentPurposeStars** *(storePaymentPurposeStars)* - child of StorePaymentPurpose
  ///
  /// The user buying Telegram Stars.
  ///
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [starCount]: Number of bought Telegram Stars.
  /// * [chatId]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none.
  const StorePaymentPurposeStars({
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

  /// Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none
  final int chatId;

  /// Parse from a json
  factory StorePaymentPurposeStars.fromJson(Map<String, dynamic> json) =>
      StorePaymentPurposeStars(
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
  /// * [chat_id]: Identifier of the chat that is supposed to receive the Telegram Stars; pass 0 if none
  @override
  StorePaymentPurposeStars copyWith({
    String? currency,
    int? amount,
    int? starCount,
    int? chatId,
  }) =>
      StorePaymentPurposeStars(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StorePaymentPurposeGiftedStars** *(storePaymentPurposeGiftedStars)* - child of StorePaymentPurpose
///
/// The user buying Telegram Stars for other users.
///
/// * [userId]: Identifier of the user to which Telegram Stars are gifted.
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [amount]: Paid amount, in the smallest units of the currency.
/// * [starCount]: Number of bought Telegram Stars.
final class StorePaymentPurposeGiftedStars extends StorePaymentPurpose {
  /// **StorePaymentPurposeGiftedStars** *(storePaymentPurposeGiftedStars)* - child of StorePaymentPurpose
  ///
  /// The user buying Telegram Stars for other users.
  ///
  /// * [userId]: Identifier of the user to which Telegram Stars are gifted.
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [amount]: Paid amount, in the smallest units of the currency.
  /// * [starCount]: Number of bought Telegram Stars.
  const StorePaymentPurposeGiftedStars({
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
  factory StorePaymentPurposeGiftedStars.fromJson(Map<String, dynamic> json) =>
      StorePaymentPurposeGiftedStars(
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
  StorePaymentPurposeGiftedStars copyWith({
    int? userId,
    String? currency,
    int? amount,
    int? starCount,
  }) =>
      StorePaymentPurposeGiftedStars(
        userId: userId ?? this.userId,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storePaymentPurposeGiftedStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
