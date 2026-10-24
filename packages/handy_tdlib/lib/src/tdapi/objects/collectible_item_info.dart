part of '../tdapi.dart';

/// **CollectibleItemInfo** *(collectibleItemInfo)* - basic class
///
/// Contains information about a collectible item and its last purchase.
///
/// * [purchaseDate]: Point in time (Unix timestamp) when the item was purchased.
/// * [currency]: Currency for the paid amount.
/// * [amount]: The paid amount, in the smallest units of the currency.
/// * [cryptocurrency]: Cryptocurrency used to pay for the item.
/// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency.
/// * [url]: Individual URL for the item on https://fragment.com.
final class CollectibleItemInfo extends TdObject {
  /// **CollectibleItemInfo** *(collectibleItemInfo)* - basic class
  ///
  /// Contains information about a collectible item and its last purchase.
  ///
  /// * [purchaseDate]: Point in time (Unix timestamp) when the item was purchased.
  /// * [currency]: Currency for the paid amount.
  /// * [amount]: The paid amount, in the smallest units of the currency.
  /// * [cryptocurrency]: Cryptocurrency used to pay for the item.
  /// * [cryptocurrencyAmount]: The paid amount, in the smallest units of the cryptocurrency.
  /// * [url]: Individual URL for the item on https://fragment.com.
  const CollectibleItemInfo({
    required this.purchaseDate,
    required this.currency,
    required this.amount,
    required this.cryptocurrency,
    required this.cryptocurrencyAmount,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// Point in time (Unix timestamp) when the item was purchased
  final int purchaseDate;

  /// Currency for the paid amount
  final String currency;

  /// The paid amount, in the smallest units of the currency
  final int amount;

  /// Cryptocurrency used to pay for the item
  final String cryptocurrency;

  /// The paid amount, in the smallest units of the cryptocurrency
  final int cryptocurrencyAmount;

  /// Individual URL for the item on https://fragment.com
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CollectibleItemInfo.fromJson(Map<String, dynamic> json) =>
      CollectibleItemInfo(
        purchaseDate: json['purchase_date'],
        currency: json['currency'],
        amount: json['amount'],
        cryptocurrency: json['cryptocurrency'],
        cryptocurrencyAmount: json['cryptocurrency_amount'] is int
            ? json['cryptocurrency_amount']
            : int.parse(json['cryptocurrency_amount']),
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "purchase_date": purchaseDate,
      "currency": currency,
      "amount": amount,
      "cryptocurrency": cryptocurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [purchase_date]: Point in time (Unix timestamp) when the item was purchased
  /// * [currency]: Currency for the paid amount
  /// * [amount]: The paid amount, in the smallest units of the currency
  /// * [cryptocurrency]: Cryptocurrency used to pay for the item
  /// * [cryptocurrency_amount]: The paid amount, in the smallest units of the cryptocurrency
  /// * [url]: Individual URL for the item on https://fragment.com
  CollectibleItemInfo copyWith({
    int? purchaseDate,
    String? currency,
    int? amount,
    String? cryptocurrency,
    int? cryptocurrencyAmount,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      CollectibleItemInfo(
        purchaseDate: purchaseDate ?? this.purchaseDate,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'collectibleItemInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
