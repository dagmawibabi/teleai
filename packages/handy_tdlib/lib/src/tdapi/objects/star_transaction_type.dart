part of '../tdapi.dart';

/// **StarTransactionType** *(starTransactionType)* - parent
///
/// Describes type of transaction with Telegram Stars.
sealed class StarTransactionType extends TdObject {
  /// **StarTransactionType** *(starTransactionType)* - parent
  ///
  /// Describes type of transaction with Telegram Stars.
  const StarTransactionType();

  /// a StarTransactionType return type can be :
  /// * [StarTransactionTypePremiumBotDeposit]
  /// * [StarTransactionTypeAppStoreDeposit]
  /// * [StarTransactionTypeGooglePlayDeposit]
  /// * [StarTransactionTypeFragmentDeposit]
  /// * [StarTransactionTypeUserDeposit]
  /// * [StarTransactionTypeGiveawayDeposit]
  /// * [StarTransactionTypeFragmentWithdrawal]
  /// * [StarTransactionTypeTelegramAdsWithdrawal]
  /// * [StarTransactionTypeTelegramApiUsage]
  /// * [StarTransactionTypeBotPaidMediaPurchase]
  /// * [StarTransactionTypeBotPaidMediaSale]
  /// * [StarTransactionTypeChannelPaidMediaPurchase]
  /// * [StarTransactionTypeChannelPaidMediaSale]
  /// * [StarTransactionTypeBotInvoicePurchase]
  /// * [StarTransactionTypeBotInvoiceSale]
  /// * [StarTransactionTypeBotSubscriptionPurchase]
  /// * [StarTransactionTypeBotSubscriptionSale]
  /// * [StarTransactionTypeChannelSubscriptionPurchase]
  /// * [StarTransactionTypeChannelSubscriptionSale]
  /// * [StarTransactionTypeGiftAuctionBid]
  /// * [StarTransactionTypeGiftPurchase]
  /// * [StarTransactionTypeGiftPurchaseOffer]
  /// * [StarTransactionTypeGiftTransfer]
  /// * [StarTransactionTypeGiftOriginalDetailsDrop]
  /// * [StarTransactionTypeGiftSale]
  /// * [StarTransactionTypeGiftUpgrade]
  /// * [StarTransactionTypeGiftUpgradePurchase]
  /// * [StarTransactionTypeUpgradedGiftPurchase]
  /// * [StarTransactionTypeUpgradedGiftSale]
  /// * [StarTransactionTypeChannelPaidReactionSend]
  /// * [StarTransactionTypeChannelPaidReactionReceive]
  /// * [StarTransactionTypeAffiliateProgramCommission]
  /// * [StarTransactionTypePaidMessageSend]
  /// * [StarTransactionTypePaidMessageReceive]
  /// * [StarTransactionTypePaidGroupCallMessageSend]
  /// * [StarTransactionTypePaidGroupCallMessageReceive]
  /// * [StarTransactionTypePaidGroupCallReactionSend]
  /// * [StarTransactionTypePaidGroupCallReactionReceive]
  /// * [StarTransactionTypeSuggestedPostPaymentSend]
  /// * [StarTransactionTypeSuggestedPostPaymentReceive]
  /// * [StarTransactionTypePremiumPurchase]
  /// * [StarTransactionTypeBusinessBotTransferSend]
  /// * [StarTransactionTypeBusinessBotTransferReceive]
  /// * [StarTransactionTypePublicPostSearch]
  /// * [StarTransactionTypeUnsupported]
  factory StarTransactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StarTransactionTypePremiumBotDeposit.defaultObjectId:
        return StarTransactionTypePremiumBotDeposit.fromJson(json);
      case StarTransactionTypeAppStoreDeposit.defaultObjectId:
        return StarTransactionTypeAppStoreDeposit.fromJson(json);
      case StarTransactionTypeGooglePlayDeposit.defaultObjectId:
        return StarTransactionTypeGooglePlayDeposit.fromJson(json);
      case StarTransactionTypeFragmentDeposit.defaultObjectId:
        return StarTransactionTypeFragmentDeposit.fromJson(json);
      case StarTransactionTypeUserDeposit.defaultObjectId:
        return StarTransactionTypeUserDeposit.fromJson(json);
      case StarTransactionTypeGiveawayDeposit.defaultObjectId:
        return StarTransactionTypeGiveawayDeposit.fromJson(json);
      case StarTransactionTypeFragmentWithdrawal.defaultObjectId:
        return StarTransactionTypeFragmentWithdrawal.fromJson(json);
      case StarTransactionTypeTelegramAdsWithdrawal.defaultObjectId:
        return StarTransactionTypeTelegramAdsWithdrawal.fromJson(json);
      case StarTransactionTypeTelegramApiUsage.defaultObjectId:
        return StarTransactionTypeTelegramApiUsage.fromJson(json);
      case StarTransactionTypeBotPaidMediaPurchase.defaultObjectId:
        return StarTransactionTypeBotPaidMediaPurchase.fromJson(json);
      case StarTransactionTypeBotPaidMediaSale.defaultObjectId:
        return StarTransactionTypeBotPaidMediaSale.fromJson(json);
      case StarTransactionTypeChannelPaidMediaPurchase.defaultObjectId:
        return StarTransactionTypeChannelPaidMediaPurchase.fromJson(json);
      case StarTransactionTypeChannelPaidMediaSale.defaultObjectId:
        return StarTransactionTypeChannelPaidMediaSale.fromJson(json);
      case StarTransactionTypeBotInvoicePurchase.defaultObjectId:
        return StarTransactionTypeBotInvoicePurchase.fromJson(json);
      case StarTransactionTypeBotInvoiceSale.defaultObjectId:
        return StarTransactionTypeBotInvoiceSale.fromJson(json);
      case StarTransactionTypeBotSubscriptionPurchase.defaultObjectId:
        return StarTransactionTypeBotSubscriptionPurchase.fromJson(json);
      case StarTransactionTypeBotSubscriptionSale.defaultObjectId:
        return StarTransactionTypeBotSubscriptionSale.fromJson(json);
      case StarTransactionTypeChannelSubscriptionPurchase.defaultObjectId:
        return StarTransactionTypeChannelSubscriptionPurchase.fromJson(json);
      case StarTransactionTypeChannelSubscriptionSale.defaultObjectId:
        return StarTransactionTypeChannelSubscriptionSale.fromJson(json);
      case StarTransactionTypeGiftAuctionBid.defaultObjectId:
        return StarTransactionTypeGiftAuctionBid.fromJson(json);
      case StarTransactionTypeGiftPurchase.defaultObjectId:
        return StarTransactionTypeGiftPurchase.fromJson(json);
      case StarTransactionTypeGiftPurchaseOffer.defaultObjectId:
        return StarTransactionTypeGiftPurchaseOffer.fromJson(json);
      case StarTransactionTypeGiftTransfer.defaultObjectId:
        return StarTransactionTypeGiftTransfer.fromJson(json);
      case StarTransactionTypeGiftOriginalDetailsDrop.defaultObjectId:
        return StarTransactionTypeGiftOriginalDetailsDrop.fromJson(json);
      case StarTransactionTypeGiftSale.defaultObjectId:
        return StarTransactionTypeGiftSale.fromJson(json);
      case StarTransactionTypeGiftUpgrade.defaultObjectId:
        return StarTransactionTypeGiftUpgrade.fromJson(json);
      case StarTransactionTypeGiftUpgradePurchase.defaultObjectId:
        return StarTransactionTypeGiftUpgradePurchase.fromJson(json);
      case StarTransactionTypeUpgradedGiftPurchase.defaultObjectId:
        return StarTransactionTypeUpgradedGiftPurchase.fromJson(json);
      case StarTransactionTypeUpgradedGiftSale.defaultObjectId:
        return StarTransactionTypeUpgradedGiftSale.fromJson(json);
      case StarTransactionTypeChannelPaidReactionSend.defaultObjectId:
        return StarTransactionTypeChannelPaidReactionSend.fromJson(json);
      case StarTransactionTypeChannelPaidReactionReceive.defaultObjectId:
        return StarTransactionTypeChannelPaidReactionReceive.fromJson(json);
      case StarTransactionTypeAffiliateProgramCommission.defaultObjectId:
        return StarTransactionTypeAffiliateProgramCommission.fromJson(json);
      case StarTransactionTypePaidMessageSend.defaultObjectId:
        return StarTransactionTypePaidMessageSend.fromJson(json);
      case StarTransactionTypePaidMessageReceive.defaultObjectId:
        return StarTransactionTypePaidMessageReceive.fromJson(json);
      case StarTransactionTypePaidGroupCallMessageSend.defaultObjectId:
        return StarTransactionTypePaidGroupCallMessageSend.fromJson(json);
      case StarTransactionTypePaidGroupCallMessageReceive.defaultObjectId:
        return StarTransactionTypePaidGroupCallMessageReceive.fromJson(json);
      case StarTransactionTypePaidGroupCallReactionSend.defaultObjectId:
        return StarTransactionTypePaidGroupCallReactionSend.fromJson(json);
      case StarTransactionTypePaidGroupCallReactionReceive.defaultObjectId:
        return StarTransactionTypePaidGroupCallReactionReceive.fromJson(json);
      case StarTransactionTypeSuggestedPostPaymentSend.defaultObjectId:
        return StarTransactionTypeSuggestedPostPaymentSend.fromJson(json);
      case StarTransactionTypeSuggestedPostPaymentReceive.defaultObjectId:
        return StarTransactionTypeSuggestedPostPaymentReceive.fromJson(json);
      case StarTransactionTypePremiumPurchase.defaultObjectId:
        return StarTransactionTypePremiumPurchase.fromJson(json);
      case StarTransactionTypeBusinessBotTransferSend.defaultObjectId:
        return StarTransactionTypeBusinessBotTransferSend.fromJson(json);
      case StarTransactionTypeBusinessBotTransferReceive.defaultObjectId:
        return StarTransactionTypeBusinessBotTransferReceive.fromJson(json);
      case StarTransactionTypePublicPostSearch.defaultObjectId:
        return StarTransactionTypePublicPostSearch.fromJson(json);
      case StarTransactionTypeUnsupported.defaultObjectId:
        return StarTransactionTypeUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StarTransactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StarTransactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePremiumBotDeposit** *(starTransactionTypePremiumBotDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars from the Premium bot; relevant for regular users only.
final class StarTransactionTypePremiumBotDeposit extends StarTransactionType {
  /// **StarTransactionTypePremiumBotDeposit** *(starTransactionTypePremiumBotDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars from the Premium bot; relevant for regular users only.
  const StarTransactionTypePremiumBotDeposit();

  /// Parse from a json
  factory StarTransactionTypePremiumBotDeposit.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypePremiumBotDeposit();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypePremiumBotDeposit copyWith() =>
      const StarTransactionTypePremiumBotDeposit();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypePremiumBotDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeAppStoreDeposit** *(starTransactionTypeAppStoreDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars from App Store; relevant for regular users only.
final class StarTransactionTypeAppStoreDeposit extends StarTransactionType {
  /// **StarTransactionTypeAppStoreDeposit** *(starTransactionTypeAppStoreDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars from App Store; relevant for regular users only.
  const StarTransactionTypeAppStoreDeposit();

  /// Parse from a json
  factory StarTransactionTypeAppStoreDeposit.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypeAppStoreDeposit();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypeAppStoreDeposit copyWith() =>
      const StarTransactionTypeAppStoreDeposit();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeAppStoreDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGooglePlayDeposit** *(starTransactionTypeGooglePlayDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars from Google Play; relevant for regular users only.
final class StarTransactionTypeGooglePlayDeposit extends StarTransactionType {
  /// **StarTransactionTypeGooglePlayDeposit** *(starTransactionTypeGooglePlayDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars from Google Play; relevant for regular users only.
  const StarTransactionTypeGooglePlayDeposit();

  /// Parse from a json
  factory StarTransactionTypeGooglePlayDeposit.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypeGooglePlayDeposit();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypeGooglePlayDeposit copyWith() =>
      const StarTransactionTypeGooglePlayDeposit();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGooglePlayDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeFragmentDeposit** *(starTransactionTypeFragmentDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars from Fragment; relevant for regular users and bots only.
final class StarTransactionTypeFragmentDeposit extends StarTransactionType {
  /// **StarTransactionTypeFragmentDeposit** *(starTransactionTypeFragmentDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars from Fragment; relevant for regular users and bots only.
  const StarTransactionTypeFragmentDeposit();

  /// Parse from a json
  factory StarTransactionTypeFragmentDeposit.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypeFragmentDeposit();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypeFragmentDeposit copyWith() =>
      const StarTransactionTypeFragmentDeposit();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeFragmentDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeUserDeposit** *(starTransactionTypeUserDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars by another user; relevant for regular users only.
///
/// * [userId]: Identifier of the user who gifted Telegram Stars; 0 if the user was anonymous.
/// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown *(optional)*.
final class StarTransactionTypeUserDeposit extends StarTransactionType {
  /// **StarTransactionTypeUserDeposit** *(starTransactionTypeUserDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars by another user; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the user who gifted Telegram Stars; 0 if the user was anonymous.
  /// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown *(optional)*.
  const StarTransactionTypeUserDeposit({
    required this.userId,
    this.sticker,
  });

  /// Identifier of the user who gifted Telegram Stars; 0 if the user was anonymous
  final int userId;

  /// The sticker to be shown in the transaction information; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory StarTransactionTypeUserDeposit.fromJson(Map<String, dynamic> json) =>
      StarTransactionTypeUserDeposit(
        userId: json['user_id'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who gifted Telegram Stars; 0 if the user was anonymous
  /// * [sticker]: The sticker to be shown in the transaction information; may be null if unknown
  @override
  StarTransactionTypeUserDeposit copyWith({
    int? userId,
    Sticker? sticker,
  }) =>
      StarTransactionTypeUserDeposit(
        userId: userId ?? this.userId,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeUserDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiveawayDeposit** *(starTransactionTypeGiveawayDeposit)* - child of StarTransactionType
///
/// The transaction is a deposit of Telegram Stars from a giveaway; relevant for regular users only.
///
/// * [chatId]: Identifier of a supergroup or a channel chat that created the giveaway.
/// * [giveawayMessageId]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message.
final class StarTransactionTypeGiveawayDeposit extends StarTransactionType {
  /// **StarTransactionTypeGiveawayDeposit** *(starTransactionTypeGiveawayDeposit)* - child of StarTransactionType
  ///
  /// The transaction is a deposit of Telegram Stars from a giveaway; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of a supergroup or a channel chat that created the giveaway.
  /// * [giveawayMessageId]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message.
  const StarTransactionTypeGiveawayDeposit({
    required this.chatId,
    required this.giveawayMessageId,
  });

  /// Identifier of a supergroup or a channel chat that created the giveaway
  final int chatId;

  /// Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message
  final int giveawayMessageId;

  /// Parse from a json
  factory StarTransactionTypeGiveawayDeposit.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeGiveawayDeposit(
        chatId: json['chat_id'],
        giveawayMessageId: json['giveaway_message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "giveaway_message_id": giveawayMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of a supergroup or a channel chat that created the giveaway
  /// * [giveaway_message_id]: Identifier of the message with the giveaway; may be 0 or an identifier of a deleted message
  @override
  StarTransactionTypeGiveawayDeposit copyWith({
    int? chatId,
    int? giveawayMessageId,
  }) =>
      StarTransactionTypeGiveawayDeposit(
        chatId: chatId ?? this.chatId,
        giveawayMessageId: giveawayMessageId ?? this.giveawayMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiveawayDeposit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeFragmentWithdrawal** *(starTransactionTypeFragmentWithdrawal)* - child of StarTransactionType
///
/// The transaction is a withdrawal of earned Telegram Stars to Fragment; relevant for regular users, bots, supergroup and channel chats only.
///
/// * [withdrawalState]: State of the withdrawal; may be null for refunds from Fragment *(optional)*.
final class StarTransactionTypeFragmentWithdrawal extends StarTransactionType {
  /// **StarTransactionTypeFragmentWithdrawal** *(starTransactionTypeFragmentWithdrawal)* - child of StarTransactionType
  ///
  /// The transaction is a withdrawal of earned Telegram Stars to Fragment; relevant for regular users, bots, supergroup and channel chats only.
  ///
  /// * [withdrawalState]: State of the withdrawal; may be null for refunds from Fragment *(optional)*.
  const StarTransactionTypeFragmentWithdrawal({
    this.withdrawalState,
  });

  /// State of the withdrawal; may be null for refunds from Fragment
  final RevenueWithdrawalState? withdrawalState;

  /// Parse from a json
  factory StarTransactionTypeFragmentWithdrawal.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeFragmentWithdrawal(
        withdrawalState: json['withdrawal_state'] == null
            ? null
            : RevenueWithdrawalState.fromJson(json['withdrawal_state']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "withdrawal_state": withdrawalState?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [withdrawal_state]: State of the withdrawal; may be null for refunds from Fragment
  @override
  StarTransactionTypeFragmentWithdrawal copyWith({
    RevenueWithdrawalState? withdrawalState,
  }) =>
      StarTransactionTypeFragmentWithdrawal(
        withdrawalState: withdrawalState ?? this.withdrawalState,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeFragmentWithdrawal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeTelegramAdsWithdrawal** *(starTransactionTypeTelegramAdsWithdrawal)* - child of StarTransactionType
///
/// The transaction is a withdrawal of earned Telegram Stars to Telegram Ad platform; relevant for bots and channel chats only.
final class StarTransactionTypeTelegramAdsWithdrawal
    extends StarTransactionType {
  /// **StarTransactionTypeTelegramAdsWithdrawal** *(starTransactionTypeTelegramAdsWithdrawal)* - child of StarTransactionType
  ///
  /// The transaction is a withdrawal of earned Telegram Stars to Telegram Ad platform; relevant for bots and channel chats only.
  const StarTransactionTypeTelegramAdsWithdrawal();

  /// Parse from a json
  factory StarTransactionTypeTelegramAdsWithdrawal.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypeTelegramAdsWithdrawal();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypeTelegramAdsWithdrawal copyWith() =>
      const StarTransactionTypeTelegramAdsWithdrawal();

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeTelegramAdsWithdrawal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeTelegramApiUsage** *(starTransactionTypeTelegramApiUsage)* - child of StarTransactionType
///
/// The transaction is a payment for Telegram API usage; relevant for bots only.
///
/// * [requestCount]: The number of billed requests.
final class StarTransactionTypeTelegramApiUsage extends StarTransactionType {
  /// **StarTransactionTypeTelegramApiUsage** *(starTransactionTypeTelegramApiUsage)* - child of StarTransactionType
  ///
  /// The transaction is a payment for Telegram API usage; relevant for bots only.
  ///
  /// * [requestCount]: The number of billed requests.
  const StarTransactionTypeTelegramApiUsage({
    required this.requestCount,
  });

  /// The number of billed requests
  final int requestCount;

  /// Parse from a json
  factory StarTransactionTypeTelegramApiUsage.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeTelegramApiUsage(
        requestCount: json['request_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "request_count": requestCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [request_count]: The number of billed requests
  @override
  StarTransactionTypeTelegramApiUsage copyWith({
    int? requestCount,
  }) =>
      StarTransactionTypeTelegramApiUsage(
        requestCount: requestCount ?? this.requestCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeTelegramApiUsage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotPaidMediaPurchase** *(starTransactionTypeBotPaidMediaPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of paid media from a bot or a business account by the current user; relevant for regular users only.
///
/// * [userId]: Identifier of the bot or the business account user who sent the paid media.
/// * [media]: The bought media if the transaction wasn't refunded.
final class StarTransactionTypeBotPaidMediaPurchase
    extends StarTransactionType {
  /// **StarTransactionTypeBotPaidMediaPurchase** *(starTransactionTypeBotPaidMediaPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of paid media from a bot or a business account by the current user; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the bot or the business account user who sent the paid media.
  /// * [media]: The bought media if the transaction wasn't refunded.
  const StarTransactionTypeBotPaidMediaPurchase({
    required this.userId,
    required this.media,
  });

  /// Identifier of the bot or the business account user who sent the paid media
  final int userId;

  /// The bought media if the transaction wasn't refunded
  final List<PaidMedia> media;

  /// Parse from a json
  factory StarTransactionTypeBotPaidMediaPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotPaidMediaPurchase(
        userId: json['user_id'],
        media: List<PaidMedia>.from((json['media'] ?? [])
            .map((item) => PaidMedia.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "media": media.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the bot or the business account user who sent the paid media
  /// * [media]: The bought media if the transaction wasn't refunded
  @override
  StarTransactionTypeBotPaidMediaPurchase copyWith({
    int? userId,
    List<PaidMedia>? media,
  }) =>
      StarTransactionTypeBotPaidMediaPurchase(
        userId: userId ?? this.userId,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeBotPaidMediaPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotPaidMediaSale** *(starTransactionTypeBotPaidMediaSale)* - child of StarTransactionType
///
/// The transaction is a sale of paid media by the bot or a business account managed by the bot; relevant for bots only.
///
/// * [userId]: Identifier of the user who bought the media.
/// * [media]: The bought media.
/// * [payload]: Bot-provided payload.
/// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
final class StarTransactionTypeBotPaidMediaSale extends StarTransactionType {
  /// **StarTransactionTypeBotPaidMediaSale** *(starTransactionTypeBotPaidMediaSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of paid media by the bot or a business account managed by the bot; relevant for bots only.
  ///
  /// * [userId]: Identifier of the user who bought the media.
  /// * [media]: The bought media.
  /// * [payload]: Bot-provided payload.
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
  const StarTransactionTypeBotPaidMediaSale({
    required this.userId,
    required this.media,
    required this.payload,
    this.affiliate,
  });

  /// Identifier of the user who bought the media
  final int userId;

  /// The bought media
  final List<PaidMedia> media;

  /// Bot-provided payload
  final String payload;

  /// Information about the affiliate which received commission from the transaction; may be null if none
  final AffiliateInfo? affiliate;

  /// Parse from a json
  factory StarTransactionTypeBotPaidMediaSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotPaidMediaSale(
        userId: json['user_id'],
        media: List<PaidMedia>.from((json['media'] ?? [])
            .map((item) => PaidMedia.fromJson(item))
            .toList()),
        payload: json['payload'],
        affiliate: json['affiliate'] == null
            ? null
            : AffiliateInfo.fromJson(json['affiliate']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "media": media.map((i) => i.toJson()).toList(),
      "payload": payload,
      "affiliate": affiliate?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the media
  /// * [media]: The bought media
  /// * [payload]: Bot-provided payload
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none
  @override
  StarTransactionTypeBotPaidMediaSale copyWith({
    int? userId,
    List<PaidMedia>? media,
    String? payload,
    AffiliateInfo? affiliate,
  }) =>
      StarTransactionTypeBotPaidMediaSale(
        userId: userId ?? this.userId,
        media: media ?? this.media,
        payload: payload ?? this.payload,
        affiliate: affiliate ?? this.affiliate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeBotPaidMediaSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelPaidMediaPurchase** *(starTransactionTypeChannelPaidMediaPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of paid media from a channel by the current user; relevant for regular users only.
///
/// * [chatId]: Identifier of the channel chat that sent the paid media.
/// * [messageId]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message.
/// * [media]: The bought media if the transaction wasn't refunded.
final class StarTransactionTypeChannelPaidMediaPurchase
    extends StarTransactionType {
  /// **StarTransactionTypeChannelPaidMediaPurchase** *(starTransactionTypeChannelPaidMediaPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of paid media from a channel by the current user; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the channel chat that sent the paid media.
  /// * [messageId]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message.
  /// * [media]: The bought media if the transaction wasn't refunded.
  const StarTransactionTypeChannelPaidMediaPurchase({
    required this.chatId,
    required this.messageId,
    required this.media,
  });

  /// Identifier of the channel chat that sent the paid media
  final int chatId;

  /// Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message
  final int messageId;

  /// The bought media if the transaction wasn't refunded
  final List<PaidMedia> media;

  /// Parse from a json
  factory StarTransactionTypeChannelPaidMediaPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelPaidMediaPurchase(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        media: List<PaidMedia>.from((json['media'] ?? [])
            .map((item) => PaidMedia.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "media": media.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat that sent the paid media
  /// * [message_id]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message
  /// * [media]: The bought media if the transaction wasn't refunded
  @override
  StarTransactionTypeChannelPaidMediaPurchase copyWith({
    int? chatId,
    int? messageId,
    List<PaidMedia>? media,
  }) =>
      StarTransactionTypeChannelPaidMediaPurchase(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelPaidMediaPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelPaidMediaSale** *(starTransactionTypeChannelPaidMediaSale)* - child of StarTransactionType
///
/// The transaction is a sale of paid media by the channel chat; relevant for channel chats only.
///
/// * [userId]: Identifier of the user who bought the media.
/// * [messageId]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message.
/// * [media]: The bought media.
final class StarTransactionTypeChannelPaidMediaSale
    extends StarTransactionType {
  /// **StarTransactionTypeChannelPaidMediaSale** *(starTransactionTypeChannelPaidMediaSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of paid media by the channel chat; relevant for channel chats only.
  ///
  /// * [userId]: Identifier of the user who bought the media.
  /// * [messageId]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message.
  /// * [media]: The bought media.
  const StarTransactionTypeChannelPaidMediaSale({
    required this.userId,
    required this.messageId,
    required this.media,
  });

  /// Identifier of the user who bought the media
  final int userId;

  /// Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message
  final int messageId;

  /// The bought media
  final List<PaidMedia> media;

  /// Parse from a json
  factory StarTransactionTypeChannelPaidMediaSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelPaidMediaSale(
        userId: json['user_id'],
        messageId: json['message_id'],
        media: List<PaidMedia>.from((json['media'] ?? [])
            .map((item) => PaidMedia.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "message_id": messageId,
      "media": media.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the media
  /// * [message_id]: Identifier of the corresponding message with paid media; may be 0 or an identifier of a deleted message
  /// * [media]: The bought media
  @override
  StarTransactionTypeChannelPaidMediaSale copyWith({
    int? userId,
    int? messageId,
    List<PaidMedia>? media,
  }) =>
      StarTransactionTypeChannelPaidMediaSale(
        userId: userId ?? this.userId,
        messageId: messageId ?? this.messageId,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelPaidMediaSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotInvoicePurchase** *(starTransactionTypeBotInvoicePurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of a product from a bot or a business account by the current user; relevant for regular users only.
///
/// * [userId]: Identifier of the bot or the business account user who created the invoice.
/// * [productInfo]: Information about the bought product.
final class StarTransactionTypeBotInvoicePurchase extends StarTransactionType {
  /// **StarTransactionTypeBotInvoicePurchase** *(starTransactionTypeBotInvoicePurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of a product from a bot or a business account by the current user; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the bot or the business account user who created the invoice.
  /// * [productInfo]: Information about the bought product.
  const StarTransactionTypeBotInvoicePurchase({
    required this.userId,
    required this.productInfo,
  });

  /// Identifier of the bot or the business account user who created the invoice
  final int userId;

  /// Information about the bought product
  final ProductInfo productInfo;

  /// Parse from a json
  factory StarTransactionTypeBotInvoicePurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotInvoicePurchase(
        userId: json['user_id'],
        productInfo: ProductInfo.fromJson(json['product_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "product_info": productInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the bot or the business account user who created the invoice
  /// * [product_info]: Information about the bought product
  @override
  StarTransactionTypeBotInvoicePurchase copyWith({
    int? userId,
    ProductInfo? productInfo,
  }) =>
      StarTransactionTypeBotInvoicePurchase(
        userId: userId ?? this.userId,
        productInfo: productInfo ?? this.productInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeBotInvoicePurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotInvoiceSale** *(starTransactionTypeBotInvoiceSale)* - child of StarTransactionType
///
/// The transaction is a sale of a product by the bot; relevant for bots only.
///
/// * [userId]: Identifier of the user who bought the product.
/// * [productInfo]: Information about the bought product.
/// * [invoicePayload]: Invoice payload.
/// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
final class StarTransactionTypeBotInvoiceSale extends StarTransactionType {
  /// **StarTransactionTypeBotInvoiceSale** *(starTransactionTypeBotInvoiceSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of a product by the bot; relevant for bots only.
  ///
  /// * [userId]: Identifier of the user who bought the product.
  /// * [productInfo]: Information about the bought product.
  /// * [invoicePayload]: Invoice payload.
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
  const StarTransactionTypeBotInvoiceSale({
    required this.userId,
    required this.productInfo,
    required this.invoicePayload,
    this.affiliate,
  });

  /// Identifier of the user who bought the product
  final int userId;

  /// Information about the bought product
  final ProductInfo productInfo;

  /// Invoice payload
  final String invoicePayload;

  /// Information about the affiliate which received commission from the transaction; may be null if none
  final AffiliateInfo? affiliate;

  /// Parse from a json
  factory StarTransactionTypeBotInvoiceSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotInvoiceSale(
        userId: json['user_id'],
        productInfo: ProductInfo.fromJson(json['product_info']),
        invoicePayload: json['invoice_payload'],
        affiliate: json['affiliate'] == null
            ? null
            : AffiliateInfo.fromJson(json['affiliate']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "product_info": productInfo.toJson(),
      "invoice_payload": invoicePayload,
      "affiliate": affiliate?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the product
  /// * [product_info]: Information about the bought product
  /// * [invoice_payload]: Invoice payload
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none
  @override
  StarTransactionTypeBotInvoiceSale copyWith({
    int? userId,
    ProductInfo? productInfo,
    String? invoicePayload,
    AffiliateInfo? affiliate,
  }) =>
      StarTransactionTypeBotInvoiceSale(
        userId: userId ?? this.userId,
        productInfo: productInfo ?? this.productInfo,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        affiliate: affiliate ?? this.affiliate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeBotInvoiceSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotSubscriptionPurchase** *(starTransactionTypeBotSubscriptionPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of a subscription from a bot or a business account by the current user; relevant for regular users only.
///
/// * [userId]: Identifier of the bot or the business account user who created the subscription link.
/// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
/// * [productInfo]: Information about the bought subscription; may be null if no information about the subscription is available *(optional)*.
final class StarTransactionTypeBotSubscriptionPurchase
    extends StarTransactionType {
  /// **StarTransactionTypeBotSubscriptionPurchase** *(starTransactionTypeBotSubscriptionPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of a subscription from a bot or a business account by the current user; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the bot or the business account user who created the subscription link.
  /// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
  /// * [productInfo]: Information about the bought subscription; may be null if no information about the subscription is available *(optional)*.
  const StarTransactionTypeBotSubscriptionPurchase({
    required this.userId,
    required this.subscriptionPeriod,
    this.productInfo,
  });

  /// Identifier of the bot or the business account user who created the subscription link
  final int userId;

  /// The number of seconds between consecutive Telegram Star debitings
  final int subscriptionPeriod;

  /// Information about the bought subscription; may be null if no information about the subscription is available
  final ProductInfo? productInfo;

  /// Parse from a json
  factory StarTransactionTypeBotSubscriptionPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotSubscriptionPurchase(
        userId: json['user_id'],
        subscriptionPeriod: json['subscription_period'],
        productInfo: json['product_info'] == null
            ? null
            : ProductInfo.fromJson(json['product_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "subscription_period": subscriptionPeriod,
      "product_info": productInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the bot or the business account user who created the subscription link
  /// * [subscription_period]: The number of seconds between consecutive Telegram Star debitings
  /// * [product_info]: Information about the bought subscription; may be null if no information about the subscription is available
  @override
  StarTransactionTypeBotSubscriptionPurchase copyWith({
    int? userId,
    int? subscriptionPeriod,
    ProductInfo? productInfo,
  }) =>
      StarTransactionTypeBotSubscriptionPurchase(
        userId: userId ?? this.userId,
        subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
        productInfo: productInfo ?? this.productInfo,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeBotSubscriptionPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBotSubscriptionSale** *(starTransactionTypeBotSubscriptionSale)* - child of StarTransactionType
///
/// The transaction is a sale of a subscription by the bot; relevant for bots only.
///
/// * [userId]: Identifier of the user who bought the subscription.
/// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
/// * [productInfo]: Information about the bought subscription; may be null if no information about the subscription is available *(optional)*.
/// * [invoicePayload]: Invoice payload.
/// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
final class StarTransactionTypeBotSubscriptionSale extends StarTransactionType {
  /// **StarTransactionTypeBotSubscriptionSale** *(starTransactionTypeBotSubscriptionSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of a subscription by the bot; relevant for bots only.
  ///
  /// * [userId]: Identifier of the user who bought the subscription.
  /// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
  /// * [productInfo]: Information about the bought subscription; may be null if no information about the subscription is available *(optional)*.
  /// * [invoicePayload]: Invoice payload.
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none *(optional)*.
  const StarTransactionTypeBotSubscriptionSale({
    required this.userId,
    required this.subscriptionPeriod,
    this.productInfo,
    required this.invoicePayload,
    this.affiliate,
  });

  /// Identifier of the user who bought the subscription
  final int userId;

  /// The number of seconds between consecutive Telegram Star debitings
  final int subscriptionPeriod;

  /// Information about the bought subscription; may be null if no information about the subscription is available
  final ProductInfo? productInfo;

  /// Invoice payload
  final String invoicePayload;

  /// Information about the affiliate which received commission from the transaction; may be null if none
  final AffiliateInfo? affiliate;

  /// Parse from a json
  factory StarTransactionTypeBotSubscriptionSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBotSubscriptionSale(
        userId: json['user_id'],
        subscriptionPeriod: json['subscription_period'],
        productInfo: json['product_info'] == null
            ? null
            : ProductInfo.fromJson(json['product_info']),
        invoicePayload: json['invoice_payload'],
        affiliate: json['affiliate'] == null
            ? null
            : AffiliateInfo.fromJson(json['affiliate']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "subscription_period": subscriptionPeriod,
      "product_info": productInfo?.toJson(),
      "invoice_payload": invoicePayload,
      "affiliate": affiliate?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the subscription
  /// * [subscription_period]: The number of seconds between consecutive Telegram Star debitings
  /// * [product_info]: Information about the bought subscription; may be null if no information about the subscription is available
  /// * [invoice_payload]: Invoice payload
  /// * [affiliate]: Information about the affiliate which received commission from the transaction; may be null if none
  @override
  StarTransactionTypeBotSubscriptionSale copyWith({
    int? userId,
    int? subscriptionPeriod,
    ProductInfo? productInfo,
    String? invoicePayload,
    AffiliateInfo? affiliate,
  }) =>
      StarTransactionTypeBotSubscriptionSale(
        userId: userId ?? this.userId,
        subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
        productInfo: productInfo ?? this.productInfo,
        invoicePayload: invoicePayload ?? this.invoicePayload,
        affiliate: affiliate ?? this.affiliate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeBotSubscriptionSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelSubscriptionPurchase** *(starTransactionTypeChannelSubscriptionPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of a subscription to a channel chat by the current user; relevant for regular users only.
///
/// * [chatId]: Identifier of the channel chat that created the subscription.
/// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
final class StarTransactionTypeChannelSubscriptionPurchase
    extends StarTransactionType {
  /// **StarTransactionTypeChannelSubscriptionPurchase** *(starTransactionTypeChannelSubscriptionPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of a subscription to a channel chat by the current user; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the channel chat that created the subscription.
  /// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
  const StarTransactionTypeChannelSubscriptionPurchase({
    required this.chatId,
    required this.subscriptionPeriod,
  });

  /// Identifier of the channel chat that created the subscription
  final int chatId;

  /// The number of seconds between consecutive Telegram Star debitings
  final int subscriptionPeriod;

  /// Parse from a json
  factory StarTransactionTypeChannelSubscriptionPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelSubscriptionPurchase(
        chatId: json['chat_id'],
        subscriptionPeriod: json['subscription_period'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "subscription_period": subscriptionPeriod,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat that created the subscription
  /// * [subscription_period]: The number of seconds between consecutive Telegram Star debitings
  @override
  StarTransactionTypeChannelSubscriptionPurchase copyWith({
    int? chatId,
    int? subscriptionPeriod,
  }) =>
      StarTransactionTypeChannelSubscriptionPurchase(
        chatId: chatId ?? this.chatId,
        subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelSubscriptionPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelSubscriptionSale** *(starTransactionTypeChannelSubscriptionSale)* - child of StarTransactionType
///
/// The transaction is a sale of a subscription by the channel chat; relevant for channel chats only.
///
/// * [userId]: Identifier of the user who bought the subscription.
/// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
final class StarTransactionTypeChannelSubscriptionSale
    extends StarTransactionType {
  /// **StarTransactionTypeChannelSubscriptionSale** *(starTransactionTypeChannelSubscriptionSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of a subscription by the channel chat; relevant for channel chats only.
  ///
  /// * [userId]: Identifier of the user who bought the subscription.
  /// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debitings.
  const StarTransactionTypeChannelSubscriptionSale({
    required this.userId,
    required this.subscriptionPeriod,
  });

  /// Identifier of the user who bought the subscription
  final int userId;

  /// The number of seconds between consecutive Telegram Star debitings
  final int subscriptionPeriod;

  /// Parse from a json
  factory StarTransactionTypeChannelSubscriptionSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelSubscriptionSale(
        userId: json['user_id'],
        subscriptionPeriod: json['subscription_period'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "subscription_period": subscriptionPeriod,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the subscription
  /// * [subscription_period]: The number of seconds between consecutive Telegram Star debitings
  @override
  StarTransactionTypeChannelSubscriptionSale copyWith({
    int? userId,
    int? subscriptionPeriod,
  }) =>
      StarTransactionTypeChannelSubscriptionSale(
        userId: userId ?? this.userId,
        subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelSubscriptionSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftAuctionBid** *(starTransactionTypeGiftAuctionBid)* - child of StarTransactionType
///
/// The transaction is a bid on a gift auction; relevant for regular users only.
///
/// * [ownerId]: Identifier of the user who will receive the gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftAuctionBid extends StarTransactionType {
  /// **StarTransactionTypeGiftAuctionBid** *(starTransactionTypeGiftAuctionBid)* - child of StarTransactionType
  ///
  /// The transaction is a bid on a gift auction; relevant for regular users only.
  ///
  /// * [ownerId]: Identifier of the user who will receive the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftAuctionBid({
    required this.ownerId,
    required this.gift,
  });

  /// Identifier of the user who will receive the gift
  final MessageSender ownerId;

  /// The gift
  final Gift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftAuctionBid.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeGiftAuctionBid(
        ownerId: MessageSender.fromJson(json['owner_id']),
        gift: Gift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user who will receive the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftAuctionBid copyWith({
    MessageSender? ownerId,
    Gift? gift,
  }) =>
      StarTransactionTypeGiftAuctionBid(
        ownerId: ownerId ?? this.ownerId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftAuctionBid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftPurchase** *(starTransactionTypeGiftPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of a regular gift; relevant for regular users and bots only.
///
/// * [ownerId]: Identifier of the user or the channel that received the gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftPurchase extends StarTransactionType {
  /// **StarTransactionTypeGiftPurchase** *(starTransactionTypeGiftPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of a regular gift; relevant for regular users and bots only.
  ///
  /// * [ownerId]: Identifier of the user or the channel that received the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftPurchase({
    required this.ownerId,
    required this.gift,
  });

  /// Identifier of the user or the channel that received the gift
  final MessageSender ownerId;

  /// The gift
  final Gift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftPurchase.fromJson(Map<String, dynamic> json) =>
      StarTransactionTypeGiftPurchase(
        ownerId: MessageSender.fromJson(json['owner_id']),
        gift: Gift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel that received the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftPurchase copyWith({
    MessageSender? ownerId,
    Gift? gift,
  }) =>
      StarTransactionTypeGiftPurchase(
        ownerId: ownerId ?? this.ownerId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftPurchaseOffer** *(starTransactionTypeGiftPurchaseOffer)* - child of StarTransactionType
///
/// The transaction is an offer of gift purchase; relevant for regular users only.
///
/// * [gift]: The gift.
final class StarTransactionTypeGiftPurchaseOffer extends StarTransactionType {
  /// **StarTransactionTypeGiftPurchaseOffer** *(starTransactionTypeGiftPurchaseOffer)* - child of StarTransactionType
  ///
  /// The transaction is an offer of gift purchase; relevant for regular users only.
  ///
  /// * [gift]: The gift.
  const StarTransactionTypeGiftPurchaseOffer({
    required this.gift,
  });

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftPurchaseOffer.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeGiftPurchaseOffer(
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftPurchaseOffer copyWith({
    UpgradedGift? gift,
  }) =>
      StarTransactionTypeGiftPurchaseOffer(
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftPurchaseOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftTransfer** *(starTransactionTypeGiftTransfer)* - child of StarTransactionType
///
/// The transaction is a transfer of an upgraded gift; relevant for regular users only.
///
/// * [ownerId]: Identifier of the user or the channel that received the gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftTransfer extends StarTransactionType {
  /// **StarTransactionTypeGiftTransfer** *(starTransactionTypeGiftTransfer)* - child of StarTransactionType
  ///
  /// The transaction is a transfer of an upgraded gift; relevant for regular users only.
  ///
  /// * [ownerId]: Identifier of the user or the channel that received the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftTransfer({
    required this.ownerId,
    required this.gift,
  });

  /// Identifier of the user or the channel that received the gift
  final MessageSender ownerId;

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftTransfer.fromJson(Map<String, dynamic> json) =>
      StarTransactionTypeGiftTransfer(
        ownerId: MessageSender.fromJson(json['owner_id']),
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel that received the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftTransfer copyWith({
    MessageSender? ownerId,
    UpgradedGift? gift,
  }) =>
      StarTransactionTypeGiftTransfer(
        ownerId: ownerId ?? this.ownerId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftOriginalDetailsDrop** *(starTransactionTypeGiftOriginalDetailsDrop)* - child of StarTransactionType
///
/// The transaction is a drop of original details of an upgraded gift; relevant for regular users only.
///
/// * [ownerId]: Identifier of the user or the channel that owns the gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftOriginalDetailsDrop
    extends StarTransactionType {
  /// **StarTransactionTypeGiftOriginalDetailsDrop** *(starTransactionTypeGiftOriginalDetailsDrop)* - child of StarTransactionType
  ///
  /// The transaction is a drop of original details of an upgraded gift; relevant for regular users only.
  ///
  /// * [ownerId]: Identifier of the user or the channel that owns the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftOriginalDetailsDrop({
    required this.ownerId,
    required this.gift,
  });

  /// Identifier of the user or the channel that owns the gift
  final MessageSender ownerId;

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftOriginalDetailsDrop.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeGiftOriginalDetailsDrop(
        ownerId: MessageSender.fromJson(json['owner_id']),
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel that owns the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftOriginalDetailsDrop copyWith({
    MessageSender? ownerId,
    UpgradedGift? gift,
  }) =>
      StarTransactionTypeGiftOriginalDetailsDrop(
        ownerId: ownerId ?? this.ownerId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeGiftOriginalDetailsDrop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftSale** *(starTransactionTypeGiftSale)* - child of StarTransactionType
///
/// The transaction is a sale of a received gift; relevant for regular users and channel chats only.
///
/// * [userId]: Identifier of the user who sent the gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftSale extends StarTransactionType {
  /// **StarTransactionTypeGiftSale** *(starTransactionTypeGiftSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of a received gift; relevant for regular users and channel chats only.
  ///
  /// * [userId]: Identifier of the user who sent the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftSale({
    required this.userId,
    required this.gift,
  });

  /// Identifier of the user who sent the gift
  final int userId;

  /// The gift
  final Gift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftSale.fromJson(Map<String, dynamic> json) =>
      StarTransactionTypeGiftSale(
        userId: json['user_id'],
        gift: Gift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who sent the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftSale copyWith({
    int? userId,
    Gift? gift,
  }) =>
      StarTransactionTypeGiftSale(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftUpgrade** *(starTransactionTypeGiftUpgrade)* - child of StarTransactionType
///
/// The transaction is an upgrade of a gift; relevant for regular users only.
///
/// * [userId]: Identifier of the user who initially sent the gift.
/// * [gift]: The upgraded gift.
final class StarTransactionTypeGiftUpgrade extends StarTransactionType {
  /// **StarTransactionTypeGiftUpgrade** *(starTransactionTypeGiftUpgrade)* - child of StarTransactionType
  ///
  /// The transaction is an upgrade of a gift; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the user who initially sent the gift.
  /// * [gift]: The upgraded gift.
  const StarTransactionTypeGiftUpgrade({
    required this.userId,
    required this.gift,
  });

  /// Identifier of the user who initially sent the gift
  final int userId;

  /// The upgraded gift
  final UpgradedGift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftUpgrade.fromJson(Map<String, dynamic> json) =>
      StarTransactionTypeGiftUpgrade(
        userId: json['user_id'],
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who initially sent the gift
  /// * [gift]: The upgraded gift
  @override
  StarTransactionTypeGiftUpgrade copyWith({
    int? userId,
    UpgradedGift? gift,
  }) =>
      StarTransactionTypeGiftUpgrade(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeGiftUpgrade';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeGiftUpgradePurchase** *(starTransactionTypeGiftUpgradePurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of an upgrade of a gift owned by another user or channel; relevant for regular users only.
///
/// * [ownerId]: Owner of the upgraded gift.
/// * [gift]: The gift.
final class StarTransactionTypeGiftUpgradePurchase extends StarTransactionType {
  /// **StarTransactionTypeGiftUpgradePurchase** *(starTransactionTypeGiftUpgradePurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of an upgrade of a gift owned by another user or channel; relevant for regular users only.
  ///
  /// * [ownerId]: Owner of the upgraded gift.
  /// * [gift]: The gift.
  const StarTransactionTypeGiftUpgradePurchase({
    required this.ownerId,
    required this.gift,
  });

  /// Owner of the upgraded gift
  final MessageSender ownerId;

  /// The gift
  final Gift gift;

  /// Parse from a json
  factory StarTransactionTypeGiftUpgradePurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeGiftUpgradePurchase(
        ownerId: MessageSender.fromJson(json['owner_id']),
        gift: Gift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Owner of the upgraded gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeGiftUpgradePurchase copyWith({
    MessageSender? ownerId,
    Gift? gift,
  }) =>
      StarTransactionTypeGiftUpgradePurchase(
        ownerId: ownerId ?? this.ownerId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeGiftUpgradePurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeUpgradedGiftPurchase** *(starTransactionTypeUpgradedGiftPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of an upgraded gift for some user or channel; relevant for regular users only.
///
/// * [userId]: Identifier of the user who sold the gift.
/// * [gift]: The gift.
final class StarTransactionTypeUpgradedGiftPurchase
    extends StarTransactionType {
  /// **StarTransactionTypeUpgradedGiftPurchase** *(starTransactionTypeUpgradedGiftPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of an upgraded gift for some user or channel; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the user who sold the gift.
  /// * [gift]: The gift.
  const StarTransactionTypeUpgradedGiftPurchase({
    required this.userId,
    required this.gift,
  });

  /// Identifier of the user who sold the gift
  final int userId;

  /// The gift
  final UpgradedGift gift;

  /// Parse from a json
  factory StarTransactionTypeUpgradedGiftPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeUpgradedGiftPurchase(
        userId: json['user_id'],
        gift: UpgradedGift.fromJson(json['gift']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who sold the gift
  /// * [gift]: The gift
  @override
  StarTransactionTypeUpgradedGiftPurchase copyWith({
    int? userId,
    UpgradedGift? gift,
  }) =>
      StarTransactionTypeUpgradedGiftPurchase(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeUpgradedGiftPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeUpgradedGiftSale** *(starTransactionTypeUpgradedGiftSale)* - child of StarTransactionType
///
/// The transaction is a sale of an upgraded gift; relevant for regular users only.
///
/// * [userId]: Identifier of the user who bought the gift.
/// * [gift]: The gift.
/// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars received by the seller of the gift.
/// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
/// * [viaOffer]: True, if the gift was sold through a purchase offer.
final class StarTransactionTypeUpgradedGiftSale extends StarTransactionType {
  /// **StarTransactionTypeUpgradedGiftSale** *(starTransactionTypeUpgradedGiftSale)* - child of StarTransactionType
  ///
  /// The transaction is a sale of an upgraded gift; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the user who bought the gift.
  /// * [gift]: The gift.
  /// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars received by the seller of the gift.
  /// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
  /// * [viaOffer]: True, if the gift was sold through a purchase offer.
  const StarTransactionTypeUpgradedGiftSale({
    required this.userId,
    required this.gift,
    required this.commissionPerMille,
    required this.commissionStarAmount,
    required this.viaOffer,
  });

  /// Identifier of the user who bought the gift
  final int userId;

  /// The gift
  final UpgradedGift gift;

  /// The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars received by the seller of the gift
  final int commissionPerMille;

  /// The Telegram Star amount that was received by Telegram; can be negative for refunds
  final StarAmount commissionStarAmount;

  /// True, if the gift was sold through a purchase offer
  final bool viaOffer;

  /// Parse from a json
  factory StarTransactionTypeUpgradedGiftSale.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeUpgradedGiftSale(
        userId: json['user_id'],
        gift: UpgradedGift.fromJson(json['gift']),
        commissionPerMille: json['commission_per_mille'],
        commissionStarAmount:
            StarAmount.fromJson(json['commission_star_amount']),
        viaOffer: json['via_offer'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "gift": gift.toJson(),
      "commission_per_mille": commissionPerMille,
      "commission_star_amount": commissionStarAmount.toJson(),
      "via_offer": viaOffer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who bought the gift
  /// * [gift]: The gift
  /// * [commission_per_mille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars received by the seller of the gift
  /// * [commission_star_amount]: The Telegram Star amount that was received by Telegram; can be negative for refunds
  /// * [via_offer]: True, if the gift was sold through a purchase offer
  @override
  StarTransactionTypeUpgradedGiftSale copyWith({
    int? userId,
    UpgradedGift? gift,
    int? commissionPerMille,
    StarAmount? commissionStarAmount,
    bool? viaOffer,
  }) =>
      StarTransactionTypeUpgradedGiftSale(
        userId: userId ?? this.userId,
        gift: gift ?? this.gift,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        commissionStarAmount: commissionStarAmount ?? this.commissionStarAmount,
        viaOffer: viaOffer ?? this.viaOffer,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeUpgradedGiftSale';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelPaidReactionSend** *(starTransactionTypeChannelPaidReactionSend)* - child of StarTransactionType
///
/// The transaction is a sending of a paid reaction to a message in a channel chat by the current user; relevant for regular users only.
///
/// * [chatId]: Identifier of the channel chat.
/// * [messageId]: Identifier of the reacted message; may be 0 or an identifier of a deleted message.
final class StarTransactionTypeChannelPaidReactionSend
    extends StarTransactionType {
  /// **StarTransactionTypeChannelPaidReactionSend** *(starTransactionTypeChannelPaidReactionSend)* - child of StarTransactionType
  ///
  /// The transaction is a sending of a paid reaction to a message in a channel chat by the current user; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the channel chat.
  /// * [messageId]: Identifier of the reacted message; may be 0 or an identifier of a deleted message.
  const StarTransactionTypeChannelPaidReactionSend({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the channel chat
  final int chatId;

  /// Identifier of the reacted message; may be 0 or an identifier of a deleted message
  final int messageId;

  /// Parse from a json
  factory StarTransactionTypeChannelPaidReactionSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelPaidReactionSend(
        chatId: json['chat_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat
  /// * [message_id]: Identifier of the reacted message; may be 0 or an identifier of a deleted message
  @override
  StarTransactionTypeChannelPaidReactionSend copyWith({
    int? chatId,
    int? messageId,
  }) =>
      StarTransactionTypeChannelPaidReactionSend(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelPaidReactionSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeChannelPaidReactionReceive** *(starTransactionTypeChannelPaidReactionReceive)* - child of StarTransactionType
///
/// The transaction is a receiving of a paid reaction to a message by the channel chat; relevant for channel chats only.
///
/// * [userId]: Identifier of the user who added the paid reaction.
/// * [messageId]: Identifier of the reacted message; may be 0 or an identifier of a deleted message.
final class StarTransactionTypeChannelPaidReactionReceive
    extends StarTransactionType {
  /// **StarTransactionTypeChannelPaidReactionReceive** *(starTransactionTypeChannelPaidReactionReceive)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a paid reaction to a message by the channel chat; relevant for channel chats only.
  ///
  /// * [userId]: Identifier of the user who added the paid reaction.
  /// * [messageId]: Identifier of the reacted message; may be 0 or an identifier of a deleted message.
  const StarTransactionTypeChannelPaidReactionReceive({
    required this.userId,
    required this.messageId,
  });

  /// Identifier of the user who added the paid reaction
  final int userId;

  /// Identifier of the reacted message; may be 0 or an identifier of a deleted message
  final int messageId;

  /// Parse from a json
  factory StarTransactionTypeChannelPaidReactionReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeChannelPaidReactionReceive(
        userId: json['user_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who added the paid reaction
  /// * [message_id]: Identifier of the reacted message; may be 0 or an identifier of a deleted message
  @override
  StarTransactionTypeChannelPaidReactionReceive copyWith({
    int? userId,
    int? messageId,
  }) =>
      StarTransactionTypeChannelPaidReactionReceive(
        userId: userId ?? this.userId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeChannelPaidReactionReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeAffiliateProgramCommission** *(starTransactionTypeAffiliateProgramCommission)* - child of StarTransactionType
///
/// The transaction is a receiving of a commission from an affiliate program; relevant for regular users, bots and channel chats only.
///
/// * [chatId]: Identifier of the chat that created the affiliate program.
/// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner.
final class StarTransactionTypeAffiliateProgramCommission
    extends StarTransactionType {
  /// **StarTransactionTypeAffiliateProgramCommission** *(starTransactionTypeAffiliateProgramCommission)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a commission from an affiliate program; relevant for regular users, bots and channel chats only.
  ///
  /// * [chatId]: Identifier of the chat that created the affiliate program.
  /// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner.
  const StarTransactionTypeAffiliateProgramCommission({
    required this.chatId,
    required this.commissionPerMille,
  });

  /// Identifier of the chat that created the affiliate program
  final int chatId;

  /// The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
  final int commissionPerMille;

  /// Parse from a json
  factory StarTransactionTypeAffiliateProgramCommission.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeAffiliateProgramCommission(
        chatId: json['chat_id'],
        commissionPerMille: json['commission_per_mille'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "commission_per_mille": commissionPerMille,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that created the affiliate program
  /// * [commission_per_mille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
  @override
  StarTransactionTypeAffiliateProgramCommission copyWith({
    int? chatId,
    int? commissionPerMille,
  }) =>
      StarTransactionTypeAffiliateProgramCommission(
        chatId: chatId ?? this.chatId,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeAffiliateProgramCommission';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidMessageSend** *(starTransactionTypePaidMessageSend)* - child of StarTransactionType
///
/// The transaction is a sending of a paid message; relevant for regular users only.
///
/// * [chatId]: Identifier of the chat that received the payment.
/// * [messageCount]: Number of sent paid messages.
final class StarTransactionTypePaidMessageSend extends StarTransactionType {
  /// **StarTransactionTypePaidMessageSend** *(starTransactionTypePaidMessageSend)* - child of StarTransactionType
  ///
  /// The transaction is a sending of a paid message; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the chat that received the payment.
  /// * [messageCount]: Number of sent paid messages.
  const StarTransactionTypePaidMessageSend({
    required this.chatId,
    required this.messageCount,
  });

  /// Identifier of the chat that received the payment
  final int chatId;

  /// Number of sent paid messages
  final int messageCount;

  /// Parse from a json
  factory StarTransactionTypePaidMessageSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidMessageSend(
        chatId: json['chat_id'],
        messageCount: json['message_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_count": messageCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that received the payment
  /// * [message_count]: Number of sent paid messages
  @override
  StarTransactionTypePaidMessageSend copyWith({
    int? chatId,
    int? messageCount,
  }) =>
      StarTransactionTypePaidMessageSend(
        chatId: chatId ?? this.chatId,
        messageCount: messageCount ?? this.messageCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypePaidMessageSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidMessageReceive** *(starTransactionTypePaidMessageReceive)* - child of StarTransactionType
///
/// The transaction is a receiving of a paid message; relevant for regular users, supergroup and channel chats only.
///
/// * [senderId]: Identifier of the sender of the message.
/// * [messageCount]: Number of received paid messages.
/// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending.
/// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
final class StarTransactionTypePaidMessageReceive extends StarTransactionType {
  /// **StarTransactionTypePaidMessageReceive** *(starTransactionTypePaidMessageReceive)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a paid message; relevant for regular users, supergroup and channel chats only.
  ///
  /// * [senderId]: Identifier of the sender of the message.
  /// * [messageCount]: Number of received paid messages.
  /// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending.
  /// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
  const StarTransactionTypePaidMessageReceive({
    required this.senderId,
    required this.messageCount,
    required this.commissionPerMille,
    required this.commissionStarAmount,
  });

  /// Identifier of the sender of the message
  final MessageSender senderId;

  /// Number of received paid messages
  final int messageCount;

  /// The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending
  final int commissionPerMille;

  /// The Telegram Star amount that was received by Telegram; can be negative for refunds
  final StarAmount commissionStarAmount;

  /// Parse from a json
  factory StarTransactionTypePaidMessageReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidMessageReceive(
        senderId: MessageSender.fromJson(json['sender_id']),
        messageCount: json['message_count'],
        commissionPerMille: json['commission_per_mille'],
        commissionStarAmount:
            StarAmount.fromJson(json['commission_star_amount']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId.toJson(),
      "message_count": messageCount,
      "commission_per_mille": commissionPerMille,
      "commission_star_amount": commissionStarAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of the sender of the message
  /// * [message_count]: Number of received paid messages
  /// * [commission_per_mille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending
  /// * [commission_star_amount]: The Telegram Star amount that was received by Telegram; can be negative for refunds
  @override
  StarTransactionTypePaidMessageReceive copyWith({
    MessageSender? senderId,
    int? messageCount,
    int? commissionPerMille,
    StarAmount? commissionStarAmount,
  }) =>
      StarTransactionTypePaidMessageReceive(
        senderId: senderId ?? this.senderId,
        messageCount: messageCount ?? this.messageCount,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        commissionStarAmount: commissionStarAmount ?? this.commissionStarAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypePaidMessageReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidGroupCallMessageSend** *(starTransactionTypePaidGroupCallMessageSend)* - child of StarTransactionType
///
/// The transaction is a sending of a paid group call message; relevant for regular users only.
///
/// * [chatId]: Identifier of the chat that received the payment.
final class StarTransactionTypePaidGroupCallMessageSend
    extends StarTransactionType {
  /// **StarTransactionTypePaidGroupCallMessageSend** *(starTransactionTypePaidGroupCallMessageSend)* - child of StarTransactionType
  ///
  /// The transaction is a sending of a paid group call message; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the chat that received the payment.
  const StarTransactionTypePaidGroupCallMessageSend({
    required this.chatId,
  });

  /// Identifier of the chat that received the payment
  final int chatId;

  /// Parse from a json
  factory StarTransactionTypePaidGroupCallMessageSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidGroupCallMessageSend(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that received the payment
  @override
  StarTransactionTypePaidGroupCallMessageSend copyWith({
    int? chatId,
  }) =>
      StarTransactionTypePaidGroupCallMessageSend(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypePaidGroupCallMessageSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidGroupCallMessageReceive** *(starTransactionTypePaidGroupCallMessageReceive)* - child of StarTransactionType
///
/// The transaction is a receiving of a paid group call message; relevant for regular users and channel chats only.
///
/// * [senderId]: Identifier of the sender of the message.
/// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending.
/// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
final class StarTransactionTypePaidGroupCallMessageReceive
    extends StarTransactionType {
  /// **StarTransactionTypePaidGroupCallMessageReceive** *(starTransactionTypePaidGroupCallMessageReceive)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a paid group call message; relevant for regular users and channel chats only.
  ///
  /// * [senderId]: Identifier of the sender of the message.
  /// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending.
  /// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
  const StarTransactionTypePaidGroupCallMessageReceive({
    required this.senderId,
    required this.commissionPerMille,
    required this.commissionStarAmount,
  });

  /// Identifier of the sender of the message
  final MessageSender senderId;

  /// The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending
  final int commissionPerMille;

  /// The Telegram Star amount that was received by Telegram; can be negative for refunds
  final StarAmount commissionStarAmount;

  /// Parse from a json
  factory StarTransactionTypePaidGroupCallMessageReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidGroupCallMessageReceive(
        senderId: MessageSender.fromJson(json['sender_id']),
        commissionPerMille: json['commission_per_mille'],
        commissionStarAmount:
            StarAmount.fromJson(json['commission_star_amount']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId.toJson(),
      "commission_per_mille": commissionPerMille,
      "commission_star_amount": commissionStarAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of the sender of the message
  /// * [commission_per_mille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for message sending
  /// * [commission_star_amount]: The Telegram Star amount that was received by Telegram; can be negative for refunds
  @override
  StarTransactionTypePaidGroupCallMessageReceive copyWith({
    MessageSender? senderId,
    int? commissionPerMille,
    StarAmount? commissionStarAmount,
  }) =>
      StarTransactionTypePaidGroupCallMessageReceive(
        senderId: senderId ?? this.senderId,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        commissionStarAmount: commissionStarAmount ?? this.commissionStarAmount,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypePaidGroupCallMessageReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidGroupCallReactionSend** *(starTransactionTypePaidGroupCallReactionSend)* - child of StarTransactionType
///
/// The transaction is a sending of a paid group call reaction; relevant for regular users only.
///
/// * [chatId]: Identifier of the chat that received the payment.
final class StarTransactionTypePaidGroupCallReactionSend
    extends StarTransactionType {
  /// **StarTransactionTypePaidGroupCallReactionSend** *(starTransactionTypePaidGroupCallReactionSend)* - child of StarTransactionType
  ///
  /// The transaction is a sending of a paid group call reaction; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the chat that received the payment.
  const StarTransactionTypePaidGroupCallReactionSend({
    required this.chatId,
  });

  /// Identifier of the chat that received the payment
  final int chatId;

  /// Parse from a json
  factory StarTransactionTypePaidGroupCallReactionSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidGroupCallReactionSend(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that received the payment
  @override
  StarTransactionTypePaidGroupCallReactionSend copyWith({
    int? chatId,
  }) =>
      StarTransactionTypePaidGroupCallReactionSend(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypePaidGroupCallReactionSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePaidGroupCallReactionReceive** *(starTransactionTypePaidGroupCallReactionReceive)* - child of StarTransactionType
///
/// The transaction is a receiving of a paid group call reaction; relevant for regular users and channel chats only.
///
/// * [senderId]: Identifier of the sender of the reaction.
/// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for reaction sending.
/// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
final class StarTransactionTypePaidGroupCallReactionReceive
    extends StarTransactionType {
  /// **StarTransactionTypePaidGroupCallReactionReceive** *(starTransactionTypePaidGroupCallReactionReceive)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a paid group call reaction; relevant for regular users and channel chats only.
  ///
  /// * [senderId]: Identifier of the sender of the reaction.
  /// * [commissionPerMille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for reaction sending.
  /// * [commissionStarAmount]: The Telegram Star amount that was received by Telegram; can be negative for refunds.
  const StarTransactionTypePaidGroupCallReactionReceive({
    required this.senderId,
    required this.commissionPerMille,
    required this.commissionStarAmount,
  });

  /// Identifier of the sender of the reaction
  final MessageSender senderId;

  /// The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for reaction sending
  final int commissionPerMille;

  /// The Telegram Star amount that was received by Telegram; can be negative for refunds
  final StarAmount commissionStarAmount;

  /// Parse from a json
  factory StarTransactionTypePaidGroupCallReactionReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePaidGroupCallReactionReceive(
        senderId: MessageSender.fromJson(json['sender_id']),
        commissionPerMille: json['commission_per_mille'],
        commissionStarAmount:
            StarAmount.fromJson(json['commission_star_amount']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId.toJson(),
      "commission_per_mille": commissionPerMille,
      "commission_star_amount": commissionStarAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of the sender of the reaction
  /// * [commission_per_mille]: The number of Telegram Stars received by the Telegram for each 1000 Telegram Stars paid for reaction sending
  /// * [commission_star_amount]: The Telegram Star amount that was received by Telegram; can be negative for refunds
  @override
  StarTransactionTypePaidGroupCallReactionReceive copyWith({
    MessageSender? senderId,
    int? commissionPerMille,
    StarAmount? commissionStarAmount,
  }) =>
      StarTransactionTypePaidGroupCallReactionReceive(
        senderId: senderId ?? this.senderId,
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        commissionStarAmount: commissionStarAmount ?? this.commissionStarAmount,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypePaidGroupCallReactionReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeSuggestedPostPaymentSend** *(starTransactionTypeSuggestedPostPaymentSend)* - child of StarTransactionType
///
/// The transaction is a payment for a suggested post; relevant for regular users only.
///
/// * [chatId]: Identifier of the channel chat that posted the post.
final class StarTransactionTypeSuggestedPostPaymentSend
    extends StarTransactionType {
  /// **StarTransactionTypeSuggestedPostPaymentSend** *(starTransactionTypeSuggestedPostPaymentSend)* - child of StarTransactionType
  ///
  /// The transaction is a payment for a suggested post; relevant for regular users only.
  ///
  /// * [chatId]: Identifier of the channel chat that posted the post.
  const StarTransactionTypeSuggestedPostPaymentSend({
    required this.chatId,
  });

  /// Identifier of the channel chat that posted the post
  final int chatId;

  /// Parse from a json
  factory StarTransactionTypeSuggestedPostPaymentSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeSuggestedPostPaymentSend(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat that posted the post
  @override
  StarTransactionTypeSuggestedPostPaymentSend copyWith({
    int? chatId,
  }) =>
      StarTransactionTypeSuggestedPostPaymentSend(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeSuggestedPostPaymentSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeSuggestedPostPaymentReceive** *(starTransactionTypeSuggestedPostPaymentReceive)* - child of StarTransactionType
///
/// The transaction is a receiving of a payment for a suggested post by the channel chat; relevant for channel chats only.
///
/// * [userId]: Identifier of the user who paid for the suggested post.
final class StarTransactionTypeSuggestedPostPaymentReceive
    extends StarTransactionType {
  /// **StarTransactionTypeSuggestedPostPaymentReceive** *(starTransactionTypeSuggestedPostPaymentReceive)* - child of StarTransactionType
  ///
  /// The transaction is a receiving of a payment for a suggested post by the channel chat; relevant for channel chats only.
  ///
  /// * [userId]: Identifier of the user who paid for the suggested post.
  const StarTransactionTypeSuggestedPostPaymentReceive({
    required this.userId,
  });

  /// Identifier of the user who paid for the suggested post
  final int userId;

  /// Parse from a json
  factory StarTransactionTypeSuggestedPostPaymentReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeSuggestedPostPaymentReceive(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who paid for the suggested post
  @override
  StarTransactionTypeSuggestedPostPaymentReceive copyWith({
    int? userId,
  }) =>
      StarTransactionTypeSuggestedPostPaymentReceive(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeSuggestedPostPaymentReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePremiumPurchase** *(starTransactionTypePremiumPurchase)* - child of StarTransactionType
///
/// The transaction is a purchase of Telegram Premium subscription; relevant for regular users and bots only.
///
/// * [userId]: Identifier of the user who received the Telegram Premium subscription.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active.
/// * [sticker]: A sticker to be shown in the transaction information; may be null if unknown *(optional)*.
final class StarTransactionTypePremiumPurchase extends StarTransactionType {
  /// **StarTransactionTypePremiumPurchase** *(starTransactionTypePremiumPurchase)* - child of StarTransactionType
  ///
  /// The transaction is a purchase of Telegram Premium subscription; relevant for regular users and bots only.
  ///
  /// * [userId]: Identifier of the user who received the Telegram Premium subscription.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active.
  /// * [sticker]: A sticker to be shown in the transaction information; may be null if unknown *(optional)*.
  const StarTransactionTypePremiumPurchase({
    required this.userId,
    required this.monthCount,
    this.sticker,
  });

  /// Identifier of the user who received the Telegram Premium subscription
  final int userId;

  /// Number of months the Telegram Premium subscription will be active
  final int monthCount;

  /// A sticker to be shown in the transaction information; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory StarTransactionTypePremiumPurchase.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypePremiumPurchase(
        userId: json['user_id'],
        monthCount: json['month_count'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "month_count": monthCount,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who received the Telegram Premium subscription
  /// * [month_count]: Number of months the Telegram Premium subscription will be active
  /// * [sticker]: A sticker to be shown in the transaction information; may be null if unknown
  @override
  StarTransactionTypePremiumPurchase copyWith({
    int? userId,
    int? monthCount,
    Sticker? sticker,
  }) =>
      StarTransactionTypePremiumPurchase(
        userId: userId ?? this.userId,
        monthCount: monthCount ?? this.monthCount,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypePremiumPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBusinessBotTransferSend** *(starTransactionTypeBusinessBotTransferSend)* - child of StarTransactionType
///
/// The transaction is a transfer of Telegram Stars to a business bot; relevant for regular users only.
///
/// * [userId]: Identifier of the bot that received Telegram Stars.
final class StarTransactionTypeBusinessBotTransferSend
    extends StarTransactionType {
  /// **StarTransactionTypeBusinessBotTransferSend** *(starTransactionTypeBusinessBotTransferSend)* - child of StarTransactionType
  ///
  /// The transaction is a transfer of Telegram Stars to a business bot; relevant for regular users only.
  ///
  /// * [userId]: Identifier of the bot that received Telegram Stars.
  const StarTransactionTypeBusinessBotTransferSend({
    required this.userId,
  });

  /// Identifier of the bot that received Telegram Stars
  final int userId;

  /// Parse from a json
  factory StarTransactionTypeBusinessBotTransferSend.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBusinessBotTransferSend(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the bot that received Telegram Stars
  @override
  StarTransactionTypeBusinessBotTransferSend copyWith({
    int? userId,
  }) =>
      StarTransactionTypeBusinessBotTransferSend(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeBusinessBotTransferSend';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeBusinessBotTransferReceive** *(starTransactionTypeBusinessBotTransferReceive)* - child of StarTransactionType
///
/// The transaction is a transfer of Telegram Stars from a business account; relevant for bots only.
///
/// * [userId]: Identifier of the user who sent Telegram Stars.
final class StarTransactionTypeBusinessBotTransferReceive
    extends StarTransactionType {
  /// **StarTransactionTypeBusinessBotTransferReceive** *(starTransactionTypeBusinessBotTransferReceive)* - child of StarTransactionType
  ///
  /// The transaction is a transfer of Telegram Stars from a business account; relevant for bots only.
  ///
  /// * [userId]: Identifier of the user who sent Telegram Stars.
  const StarTransactionTypeBusinessBotTransferReceive({
    required this.userId,
  });

  /// Identifier of the user who sent Telegram Stars
  final int userId;

  /// Parse from a json
  factory StarTransactionTypeBusinessBotTransferReceive.fromJson(
          Map<String, dynamic> json) =>
      StarTransactionTypeBusinessBotTransferReceive(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user who sent Telegram Stars
  @override
  StarTransactionTypeBusinessBotTransferReceive copyWith({
    int? userId,
  }) =>
      StarTransactionTypeBusinessBotTransferReceive(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'starTransactionTypeBusinessBotTransferReceive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypePublicPostSearch** *(starTransactionTypePublicPostSearch)* - child of StarTransactionType
///
/// The transaction is a payment for search of posts in public Telegram channels; relevant for regular users only.
final class StarTransactionTypePublicPostSearch extends StarTransactionType {
  /// **StarTransactionTypePublicPostSearch** *(starTransactionTypePublicPostSearch)* - child of StarTransactionType
  ///
  /// The transaction is a payment for search of posts in public Telegram channels; relevant for regular users only.
  const StarTransactionTypePublicPostSearch();

  /// Parse from a json
  factory StarTransactionTypePublicPostSearch.fromJson(
          Map<String, dynamic> json) =>
      const StarTransactionTypePublicPostSearch();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypePublicPostSearch copyWith() =>
      const StarTransactionTypePublicPostSearch();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypePublicPostSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarTransactionTypeUnsupported** *(starTransactionTypeUnsupported)* - child of StarTransactionType
///
/// The transaction is a transaction of an unsupported type.
final class StarTransactionTypeUnsupported extends StarTransactionType {
  /// **StarTransactionTypeUnsupported** *(starTransactionTypeUnsupported)* - child of StarTransactionType
  ///
  /// The transaction is a transaction of an unsupported type.
  const StarTransactionTypeUnsupported();

  /// Parse from a json
  factory StarTransactionTypeUnsupported.fromJson(Map<String, dynamic> json) =>
      const StarTransactionTypeUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StarTransactionTypeUnsupported copyWith() =>
      const StarTransactionTypeUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'starTransactionTypeUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
