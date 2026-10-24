part of '../tdapi.dart';

/// **UpgradedGiftValueInfo** *(upgradedGiftValueInfo)* - basic class
///
/// Contains information about value of an upgraded gift.
///
/// * [currency]: ISO 4217 currency code of the currency in which the prices are represented.
/// * [value]: Estimated value of the gift; in the smallest units of the currency.
/// * [isValueAverage]: True, if the value is calculated as average value of similar sold gifts. Otherwise, it is based on the sale price of the gift.
/// * [initialSaleDate]: Point in time (Unix timestamp) when the corresponding regular gift was originally purchased.
/// * [initialSaleStarCount]: The Telegram Star amount that was paid for the gift.
/// * [initialSalePrice]: Initial price of the gift; in the smallest units of the currency.
/// * [lastSaleDate]: Point in time (Unix timestamp) when the upgraded gift was purchased last time; 0 if never.
/// * [lastSalePrice]: Last purchase price of the gift; in the smallest units of the currency; 0 if the gift has never been resold.
/// * [isLastSaleOnFragment]: True, if the last sale was completed on Fragment.
/// * [minimumPrice]: The current minimum price of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there are no such gifts.
/// * [averageSalePrice]: The average sale price in the last month of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there were no such sales.
/// * [telegramListedGiftCount]: Number of gifts upgraded from the same gift being resold on Telegram.
/// * [fragmentListedGiftCount]: Number of gifts upgraded from the same gift being resold on Fragment.
/// * [fragmentUrl]: The HTTPS link to the Fragment for the gift; may be empty if there are no such gifts being sold on Fragment.
final class UpgradedGiftValueInfo extends TdObject {
  /// **UpgradedGiftValueInfo** *(upgradedGiftValueInfo)* - basic class
  ///
  /// Contains information about value of an upgraded gift.
  ///
  /// * [currency]: ISO 4217 currency code of the currency in which the prices are represented.
  /// * [value]: Estimated value of the gift; in the smallest units of the currency.
  /// * [isValueAverage]: True, if the value is calculated as average value of similar sold gifts. Otherwise, it is based on the sale price of the gift.
  /// * [initialSaleDate]: Point in time (Unix timestamp) when the corresponding regular gift was originally purchased.
  /// * [initialSaleStarCount]: The Telegram Star amount that was paid for the gift.
  /// * [initialSalePrice]: Initial price of the gift; in the smallest units of the currency.
  /// * [lastSaleDate]: Point in time (Unix timestamp) when the upgraded gift was purchased last time; 0 if never.
  /// * [lastSalePrice]: Last purchase price of the gift; in the smallest units of the currency; 0 if the gift has never been resold.
  /// * [isLastSaleOnFragment]: True, if the last sale was completed on Fragment.
  /// * [minimumPrice]: The current minimum price of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there are no such gifts.
  /// * [averageSalePrice]: The average sale price in the last month of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there were no such sales.
  /// * [telegramListedGiftCount]: Number of gifts upgraded from the same gift being resold on Telegram.
  /// * [fragmentListedGiftCount]: Number of gifts upgraded from the same gift being resold on Fragment.
  /// * [fragmentUrl]: The HTTPS link to the Fragment for the gift; may be empty if there are no such gifts being sold on Fragment.
  const UpgradedGiftValueInfo({
    required this.currency,
    required this.value,
    required this.isValueAverage,
    required this.initialSaleDate,
    required this.initialSaleStarCount,
    required this.initialSalePrice,
    required this.lastSaleDate,
    required this.lastSalePrice,
    required this.isLastSaleOnFragment,
    required this.minimumPrice,
    required this.averageSalePrice,
    required this.telegramListedGiftCount,
    required this.fragmentListedGiftCount,
    required this.fragmentUrl,
    this.extra,
    this.clientId,
  });

  /// ISO 4217 currency code of the currency in which the prices are represented
  final String currency;

  /// Estimated value of the gift; in the smallest units of the currency
  final int value;

  /// True, if the value is calculated as average value of similar sold gifts. Otherwise, it is based on the sale price of the gift
  final bool isValueAverage;

  /// Point in time (Unix timestamp) when the corresponding regular gift was originally purchased
  final int initialSaleDate;

  /// The Telegram Star amount that was paid for the gift
  final int initialSaleStarCount;

  /// Initial price of the gift; in the smallest units of the currency
  final int initialSalePrice;

  /// Point in time (Unix timestamp) when the upgraded gift was purchased last time; 0 if never
  final int lastSaleDate;

  /// Last purchase price of the gift; in the smallest units of the currency; 0 if the gift has never been resold
  final int lastSalePrice;

  /// True, if the last sale was completed on Fragment
  final bool isLastSaleOnFragment;

  /// The current minimum price of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there are no such gifts
  final int minimumPrice;

  /// The average sale price in the last month of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there were no such sales
  final int averageSalePrice;

  /// Number of gifts upgraded from the same gift being resold on Telegram
  final int telegramListedGiftCount;

  /// Number of gifts upgraded from the same gift being resold on Fragment
  final int fragmentListedGiftCount;

  /// The HTTPS link to the Fragment for the gift; may be empty if there are no such gifts being sold on Fragment
  final String fragmentUrl;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpgradedGiftValueInfo.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftValueInfo(
        currency: json['currency'],
        value: json['value'],
        isValueAverage: json['is_value_average'],
        initialSaleDate: json['initial_sale_date'],
        initialSaleStarCount: json['initial_sale_star_count'],
        initialSalePrice: json['initial_sale_price'],
        lastSaleDate: json['last_sale_date'],
        lastSalePrice: json['last_sale_price'],
        isLastSaleOnFragment: json['is_last_sale_on_fragment'],
        minimumPrice: json['minimum_price'],
        averageSalePrice: json['average_sale_price'],
        telegramListedGiftCount: json['telegram_listed_gift_count'],
        fragmentListedGiftCount: json['fragment_listed_gift_count'],
        fragmentUrl: json['fragment_url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "value": value,
      "is_value_average": isValueAverage,
      "initial_sale_date": initialSaleDate,
      "initial_sale_star_count": initialSaleStarCount,
      "initial_sale_price": initialSalePrice,
      "last_sale_date": lastSaleDate,
      "last_sale_price": lastSalePrice,
      "is_last_sale_on_fragment": isLastSaleOnFragment,
      "minimum_price": minimumPrice,
      "average_sale_price": averageSalePrice,
      "telegram_listed_gift_count": telegramListedGiftCount,
      "fragment_listed_gift_count": fragmentListedGiftCount,
      "fragment_url": fragmentUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code of the currency in which the prices are represented
  /// * [value]: Estimated value of the gift; in the smallest units of the currency
  /// * [is_value_average]: True, if the value is calculated as average value of similar sold gifts. Otherwise, it is based on the sale price of the gift
  /// * [initial_sale_date]: Point in time (Unix timestamp) when the corresponding regular gift was originally purchased
  /// * [initial_sale_star_count]: The Telegram Star amount that was paid for the gift
  /// * [initial_sale_price]: Initial price of the gift; in the smallest units of the currency
  /// * [last_sale_date]: Point in time (Unix timestamp) when the upgraded gift was purchased last time; 0 if never
  /// * [last_sale_price]: Last purchase price of the gift; in the smallest units of the currency; 0 if the gift has never been resold
  /// * [is_last_sale_on_fragment]: True, if the last sale was completed on Fragment
  /// * [minimum_price]: The current minimum price of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there are no such gifts
  /// * [average_sale_price]: The average sale price in the last month of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there were no such sales
  /// * [telegram_listed_gift_count]: Number of gifts upgraded from the same gift being resold on Telegram
  /// * [fragment_listed_gift_count]: Number of gifts upgraded from the same gift being resold on Fragment
  /// * [fragment_url]: The HTTPS link to the Fragment for the gift; may be empty if there are no such gifts being sold on Fragment
  UpgradedGiftValueInfo copyWith({
    String? currency,
    int? value,
    bool? isValueAverage,
    int? initialSaleDate,
    int? initialSaleStarCount,
    int? initialSalePrice,
    int? lastSaleDate,
    int? lastSalePrice,
    bool? isLastSaleOnFragment,
    int? minimumPrice,
    int? averageSalePrice,
    int? telegramListedGiftCount,
    int? fragmentListedGiftCount,
    String? fragmentUrl,
    dynamic extra,
    int? clientId,
  }) =>
      UpgradedGiftValueInfo(
        currency: currency ?? this.currency,
        value: value ?? this.value,
        isValueAverage: isValueAverage ?? this.isValueAverage,
        initialSaleDate: initialSaleDate ?? this.initialSaleDate,
        initialSaleStarCount: initialSaleStarCount ?? this.initialSaleStarCount,
        initialSalePrice: initialSalePrice ?? this.initialSalePrice,
        lastSaleDate: lastSaleDate ?? this.lastSaleDate,
        lastSalePrice: lastSalePrice ?? this.lastSalePrice,
        isLastSaleOnFragment: isLastSaleOnFragment ?? this.isLastSaleOnFragment,
        minimumPrice: minimumPrice ?? this.minimumPrice,
        averageSalePrice: averageSalePrice ?? this.averageSalePrice,
        telegramListedGiftCount:
            telegramListedGiftCount ?? this.telegramListedGiftCount,
        fragmentListedGiftCount:
            fragmentListedGiftCount ?? this.fragmentListedGiftCount,
        fragmentUrl: fragmentUrl ?? this.fragmentUrl,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftValueInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
