part of '../tdapi.dart';

/// **UpgradedGift** *(upgradedGift)* - basic class
///
/// Describes an upgraded gift that can be transferred to another owner or transferred to the TON blockchain as an NFT.
///
/// * [id]: Unique identifier of the gift.
/// * [regularGiftId]: Unique identifier of the regular gift from which the gift was upgraded; may be 0 for short period of time for old gifts from database.
/// * [publisherChatId]: Identifier of the chat that published the gift; 0 if none.
/// * [title]: The title of the upgraded gift.
/// * [name]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift or sendResoldGift.
/// * [number]: Unique number of the upgraded gift among gifts upgraded from the same gift.
/// * [totalUpgradedCount]: Total number of gifts that were upgraded from the same gift.
/// * [maxUpgradedCount]: The maximum number of gifts that can be upgraded from the same gift.
/// * [isBurned]: True, if the gift was used to craft another gift.
/// * [isCrafted]: True, if the gift was crafted from other gifts.
/// * [isPremium]: True, if the original gift could have been bought only by Telegram Premium subscribers.
/// * [isThemeAvailable]: True, if the gift can be used to set a theme in a chat.
/// * [usedThemeChatId]: Identifier of the chat for which the gift is used to set a theme; 0 if none or the gift isn't owned by the current user.
/// * [hostId]: Identifier of the user or the chat to which the upgraded gift was assigned from blockchain; may be null if none or unknown *(optional)*.
/// * [ownerId]: Identifier of the user or the chat that owns the upgraded gift; may be null if none or unknown *(optional)*.
/// * [ownerAddress]: Address of the gift NFT owner in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address.
/// * [ownerName]: Name of the owner for the case when owner identifier and address aren't known.
/// * [giftAddress]: Address of the gift NFT in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address.
/// * [canBeTonWalletCardBackground]: True, if the gift NFT can be used as background_nft_address in setTonWalletCardStickers.
/// * [model]: Model of the upgraded gift.
/// * [symbol]: Symbol of the upgraded gift.
/// * [backdrop]: Backdrop of the upgraded gift.
/// * [originalDetails]: Information about the originally sent gift; may be null if unknown *(optional)*.
/// * [colors]: Colors that can be set for user's name, background of empty chat photo, replies to messages and link previews; may be null if none or unknown *(optional)*.
/// * [resaleParameters]: Resale parameters of the gift; may be null if resale isn't possible *(optional)*.
/// * [canSendPurchaseOffer]: True, if an offer to purchase the gift can be sent using sendGiftPurchaseOffer.
/// * [craftProbabilityPerMille]: Probability that the gift adds to the chance of successful crafting of a new gift; 0 if the gift can't be used for crafting.
/// * [valueCurrency]: ISO 4217 currency code of the currency in which value of the gift is represented; may be empty if unavailable.
/// * [valueAmount]: Estimated value of the gift; in the smallest units of the currency; 0 if unavailable.
/// * [valueUsdAmount]: Estimated value of the gift in USD; in USD cents; 0 if unavailable.
final class UpgradedGift extends TdObject {
  /// **UpgradedGift** *(upgradedGift)* - basic class
  ///
  /// Describes an upgraded gift that can be transferred to another owner or transferred to the TON blockchain as an NFT.
  ///
  /// * [id]: Unique identifier of the gift.
  /// * [regularGiftId]: Unique identifier of the regular gift from which the gift was upgraded; may be 0 for short period of time for old gifts from database.
  /// * [publisherChatId]: Identifier of the chat that published the gift; 0 if none.
  /// * [title]: The title of the upgraded gift.
  /// * [name]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift or sendResoldGift.
  /// * [number]: Unique number of the upgraded gift among gifts upgraded from the same gift.
  /// * [totalUpgradedCount]: Total number of gifts that were upgraded from the same gift.
  /// * [maxUpgradedCount]: The maximum number of gifts that can be upgraded from the same gift.
  /// * [isBurned]: True, if the gift was used to craft another gift.
  /// * [isCrafted]: True, if the gift was crafted from other gifts.
  /// * [isPremium]: True, if the original gift could have been bought only by Telegram Premium subscribers.
  /// * [isThemeAvailable]: True, if the gift can be used to set a theme in a chat.
  /// * [usedThemeChatId]: Identifier of the chat for which the gift is used to set a theme; 0 if none or the gift isn't owned by the current user.
  /// * [hostId]: Identifier of the user or the chat to which the upgraded gift was assigned from blockchain; may be null if none or unknown *(optional)*.
  /// * [ownerId]: Identifier of the user or the chat that owns the upgraded gift; may be null if none or unknown *(optional)*.
  /// * [ownerAddress]: Address of the gift NFT owner in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address.
  /// * [ownerName]: Name of the owner for the case when owner identifier and address aren't known.
  /// * [giftAddress]: Address of the gift NFT in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address.
  /// * [canBeTonWalletCardBackground]: True, if the gift NFT can be used as background_nft_address in setTonWalletCardStickers.
  /// * [model]: Model of the upgraded gift.
  /// * [symbol]: Symbol of the upgraded gift.
  /// * [backdrop]: Backdrop of the upgraded gift.
  /// * [originalDetails]: Information about the originally sent gift; may be null if unknown *(optional)*.
  /// * [colors]: Colors that can be set for user's name, background of empty chat photo, replies to messages and link previews; may be null if none or unknown *(optional)*.
  /// * [resaleParameters]: Resale parameters of the gift; may be null if resale isn't possible *(optional)*.
  /// * [canSendPurchaseOffer]: True, if an offer to purchase the gift can be sent using sendGiftPurchaseOffer.
  /// * [craftProbabilityPerMille]: Probability that the gift adds to the chance of successful crafting of a new gift; 0 if the gift can't be used for crafting.
  /// * [valueCurrency]: ISO 4217 currency code of the currency in which value of the gift is represented; may be empty if unavailable.
  /// * [valueAmount]: Estimated value of the gift; in the smallest units of the currency; 0 if unavailable.
  /// * [valueUsdAmount]: Estimated value of the gift in USD; in USD cents; 0 if unavailable.
  const UpgradedGift({
    required this.id,
    required this.regularGiftId,
    required this.publisherChatId,
    required this.title,
    required this.name,
    required this.number,
    required this.totalUpgradedCount,
    required this.maxUpgradedCount,
    required this.isBurned,
    required this.isCrafted,
    required this.isPremium,
    required this.isThemeAvailable,
    required this.usedThemeChatId,
    this.hostId,
    this.ownerId,
    required this.ownerAddress,
    required this.ownerName,
    required this.giftAddress,
    required this.canBeTonWalletCardBackground,
    required this.model,
    required this.symbol,
    required this.backdrop,
    this.originalDetails,
    this.colors,
    this.resaleParameters,
    required this.canSendPurchaseOffer,
    required this.craftProbabilityPerMille,
    required this.valueCurrency,
    required this.valueAmount,
    required this.valueUsdAmount,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the gift
  final int id;

  /// Unique identifier of the regular gift from which the gift was upgraded; may be 0 for short period of time for old gifts from database
  final int regularGiftId;

  /// Identifier of the chat that published the gift; 0 if none
  final int publisherChatId;

  /// The title of the upgraded gift
  final String title;

  /// Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift or sendResoldGift
  final String name;

  /// Unique number of the upgraded gift among gifts upgraded from the same gift
  final int number;

  /// Total number of gifts that were upgraded from the same gift
  final int totalUpgradedCount;

  /// The maximum number of gifts that can be upgraded from the same gift
  final int maxUpgradedCount;

  /// True, if the gift was used to craft another gift
  final bool isBurned;

  /// True, if the gift was crafted from other gifts
  final bool isCrafted;

  /// True, if the original gift could have been bought only by Telegram Premium subscribers
  final bool isPremium;

  /// True, if the gift can be used to set a theme in a chat
  final bool isThemeAvailable;

  /// Identifier of the chat for which the gift is used to set a theme; 0 if none or the gift isn't owned by the current user
  final int usedThemeChatId;

  /// Identifier of the user or the chat to which the upgraded gift was assigned from blockchain; may be null if none or unknown
  final MessageSender? hostId;

  /// Identifier of the user or the chat that owns the upgraded gift; may be null if none or unknown
  final MessageSender? ownerId;

  /// Address of the gift NFT owner in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
  final String ownerAddress;

  /// Name of the owner for the case when owner identifier and address aren't known
  final String ownerName;

  /// Address of the gift NFT in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
  final String giftAddress;

  /// True, if the gift NFT can be used as background_nft_address in setTonWalletCardStickers
  final bool canBeTonWalletCardBackground;

  /// Model of the upgraded gift
  final UpgradedGiftModel model;

  /// Symbol of the upgraded gift
  final UpgradedGiftSymbol symbol;

  /// Backdrop of the upgraded gift
  final UpgradedGiftBackdrop backdrop;

  /// Information about the originally sent gift; may be null if unknown
  final UpgradedGiftOriginalDetails? originalDetails;

  /// Colors that can be set for user's name, background of empty chat photo, replies to messages and link previews; may be null if none or unknown
  final UpgradedGiftColors? colors;

  /// Resale parameters of the gift; may be null if resale isn't possible
  final GiftResaleParameters? resaleParameters;

  /// True, if an offer to purchase the gift can be sent using sendGiftPurchaseOffer
  final bool canSendPurchaseOffer;

  /// Probability that the gift adds to the chance of successful crafting of a new gift; 0 if the gift can't be used for crafting
  final int craftProbabilityPerMille;

  /// ISO 4217 currency code of the currency in which value of the gift is represented; may be empty if unavailable
  final String valueCurrency;

  /// Estimated value of the gift; in the smallest units of the currency; 0 if unavailable
  final int valueAmount;

  /// Estimated value of the gift in USD; in USD cents; 0 if unavailable
  final int valueUsdAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpgradedGift.fromJson(Map<String, dynamic> json) => UpgradedGift(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        regularGiftId: json['regular_gift_id'] is int
            ? json['regular_gift_id']
            : int.parse(json['regular_gift_id']),
        publisherChatId: json['publisher_chat_id'] ?? 0,
        title: json['title'],
        name: json['name'],
        number: json['number'],
        totalUpgradedCount: json['total_upgraded_count'],
        maxUpgradedCount: json['max_upgraded_count'],
        isBurned: json['is_burned'],
        isCrafted: json['is_crafted'],
        isPremium: json['is_premium'],
        isThemeAvailable: json['is_theme_available'],
        usedThemeChatId: json['used_theme_chat_id'] ?? 0,
        hostId: json['host_id'] == null
            ? null
            : MessageSender.fromJson(json['host_id']),
        ownerId: json['owner_id'] == null
            ? null
            : MessageSender.fromJson(json['owner_id']),
        ownerAddress: json['owner_address'],
        ownerName: json['owner_name'],
        giftAddress: json['gift_address'],
        canBeTonWalletCardBackground: json['can_be_ton_wallet_card_background'],
        model: UpgradedGiftModel.fromJson(json['model']),
        symbol: UpgradedGiftSymbol.fromJson(json['symbol']),
        backdrop: UpgradedGiftBackdrop.fromJson(json['backdrop']),
        originalDetails: json['original_details'] == null
            ? null
            : UpgradedGiftOriginalDetails.fromJson(json['original_details']),
        colors: json['colors'] == null
            ? null
            : UpgradedGiftColors.fromJson(json['colors']),
        resaleParameters: json['resale_parameters'] == null
            ? null
            : GiftResaleParameters.fromJson(json['resale_parameters']),
        canSendPurchaseOffer: json['can_send_purchase_offer'],
        craftProbabilityPerMille: json['craft_probability_per_mille'],
        valueCurrency: json['value_currency'],
        valueAmount: json['value_amount'],
        valueUsdAmount: json['value_usd_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "regular_gift_id": regularGiftId,
      "publisher_chat_id": publisherChatId,
      "title": title,
      "name": name,
      "number": number,
      "total_upgraded_count": totalUpgradedCount,
      "max_upgraded_count": maxUpgradedCount,
      "is_burned": isBurned,
      "is_crafted": isCrafted,
      "is_premium": isPremium,
      "is_theme_available": isThemeAvailable,
      "used_theme_chat_id": usedThemeChatId,
      "host_id": hostId?.toJson(),
      "owner_id": ownerId?.toJson(),
      "owner_address": ownerAddress,
      "owner_name": ownerName,
      "gift_address": giftAddress,
      "can_be_ton_wallet_card_background": canBeTonWalletCardBackground,
      "model": model.toJson(),
      "symbol": symbol.toJson(),
      "backdrop": backdrop.toJson(),
      "original_details": originalDetails?.toJson(),
      "colors": colors?.toJson(),
      "resale_parameters": resaleParameters?.toJson(),
      "can_send_purchase_offer": canSendPurchaseOffer,
      "craft_probability_per_mille": craftProbabilityPerMille,
      "value_currency": valueCurrency,
      "value_amount": valueAmount,
      "value_usd_amount": valueUsdAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the gift
  /// * [regular_gift_id]: Unique identifier of the regular gift from which the gift was upgraded; may be 0 for short period of time for old gifts from database
  /// * [publisher_chat_id]: Identifier of the chat that published the gift; 0 if none
  /// * [title]: The title of the upgraded gift
  /// * [name]: Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift or sendResoldGift
  /// * [number]: Unique number of the upgraded gift among gifts upgraded from the same gift
  /// * [total_upgraded_count]: Total number of gifts that were upgraded from the same gift
  /// * [max_upgraded_count]: The maximum number of gifts that can be upgraded from the same gift
  /// * [is_burned]: True, if the gift was used to craft another gift
  /// * [is_crafted]: True, if the gift was crafted from other gifts
  /// * [is_premium]: True, if the original gift could have been bought only by Telegram Premium subscribers
  /// * [is_theme_available]: True, if the gift can be used to set a theme in a chat
  /// * [used_theme_chat_id]: Identifier of the chat for which the gift is used to set a theme; 0 if none or the gift isn't owned by the current user
  /// * [host_id]: Identifier of the user or the chat to which the upgraded gift was assigned from blockchain; may be null if none or unknown
  /// * [owner_id]: Identifier of the user or the chat that owns the upgraded gift; may be null if none or unknown
  /// * [owner_address]: Address of the gift NFT owner in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
  /// * [owner_name]: Name of the owner for the case when owner identifier and address aren't known
  /// * [gift_address]: Address of the gift NFT in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
  /// * [can_be_ton_wallet_card_background]: True, if the gift NFT can be used as background_nft_address in setTonWalletCardStickers
  /// * [model]: Model of the upgraded gift
  /// * [symbol]: Symbol of the upgraded gift
  /// * [backdrop]: Backdrop of the upgraded gift
  /// * [original_details]: Information about the originally sent gift; may be null if unknown
  /// * [colors]: Colors that can be set for user's name, background of empty chat photo, replies to messages and link previews; may be null if none or unknown
  /// * [resale_parameters]: Resale parameters of the gift; may be null if resale isn't possible
  /// * [can_send_purchase_offer]: True, if an offer to purchase the gift can be sent using sendGiftPurchaseOffer
  /// * [craft_probability_per_mille]: Probability that the gift adds to the chance of successful crafting of a new gift; 0 if the gift can't be used for crafting
  /// * [value_currency]: ISO 4217 currency code of the currency in which value of the gift is represented; may be empty if unavailable
  /// * [value_amount]: Estimated value of the gift; in the smallest units of the currency; 0 if unavailable
  /// * [value_usd_amount]: Estimated value of the gift in USD; in USD cents; 0 if unavailable
  UpgradedGift copyWith({
    int? id,
    int? regularGiftId,
    int? publisherChatId,
    String? title,
    String? name,
    int? number,
    int? totalUpgradedCount,
    int? maxUpgradedCount,
    bool? isBurned,
    bool? isCrafted,
    bool? isPremium,
    bool? isThemeAvailable,
    int? usedThemeChatId,
    MessageSender? hostId,
    MessageSender? ownerId,
    String? ownerAddress,
    String? ownerName,
    String? giftAddress,
    bool? canBeTonWalletCardBackground,
    UpgradedGiftModel? model,
    UpgradedGiftSymbol? symbol,
    UpgradedGiftBackdrop? backdrop,
    UpgradedGiftOriginalDetails? originalDetails,
    UpgradedGiftColors? colors,
    GiftResaleParameters? resaleParameters,
    bool? canSendPurchaseOffer,
    int? craftProbabilityPerMille,
    String? valueCurrency,
    int? valueAmount,
    int? valueUsdAmount,
    dynamic extra,
    int? clientId,
  }) =>
      UpgradedGift(
        id: id ?? this.id,
        regularGiftId: regularGiftId ?? this.regularGiftId,
        publisherChatId: publisherChatId ?? this.publisherChatId,
        title: title ?? this.title,
        name: name ?? this.name,
        number: number ?? this.number,
        totalUpgradedCount: totalUpgradedCount ?? this.totalUpgradedCount,
        maxUpgradedCount: maxUpgradedCount ?? this.maxUpgradedCount,
        isBurned: isBurned ?? this.isBurned,
        isCrafted: isCrafted ?? this.isCrafted,
        isPremium: isPremium ?? this.isPremium,
        isThemeAvailable: isThemeAvailable ?? this.isThemeAvailable,
        usedThemeChatId: usedThemeChatId ?? this.usedThemeChatId,
        hostId: hostId ?? this.hostId,
        ownerId: ownerId ?? this.ownerId,
        ownerAddress: ownerAddress ?? this.ownerAddress,
        ownerName: ownerName ?? this.ownerName,
        giftAddress: giftAddress ?? this.giftAddress,
        canBeTonWalletCardBackground:
            canBeTonWalletCardBackground ?? this.canBeTonWalletCardBackground,
        model: model ?? this.model,
        symbol: symbol ?? this.symbol,
        backdrop: backdrop ?? this.backdrop,
        originalDetails: originalDetails ?? this.originalDetails,
        colors: colors ?? this.colors,
        resaleParameters: resaleParameters ?? this.resaleParameters,
        canSendPurchaseOffer: canSendPurchaseOffer ?? this.canSendPurchaseOffer,
        craftProbabilityPerMille:
            craftProbabilityPerMille ?? this.craftProbabilityPerMille,
        valueCurrency: valueCurrency ?? this.valueCurrency,
        valueAmount: valueAmount ?? this.valueAmount,
        valueUsdAmount: valueUsdAmount ?? this.valueUsdAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
