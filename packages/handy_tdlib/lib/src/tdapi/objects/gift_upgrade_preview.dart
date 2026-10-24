part of '../tdapi.dart';

/// **GiftUpgradePreview** *(giftUpgradePreview)* - basic class
///
/// Contains examples of possible upgraded gifts for the given regular gift.
///
/// * [models]: Examples of possible models that can be chosen for the gift after upgrade.
/// * [symbols]: Examples of possible symbols that can be chosen for the gift after upgrade.
/// * [backdrops]: Examples of possible backdrops that can be chosen for the gift after upgrade.
/// * [prices]: Examples of price for gift upgrade from the maximum price to the minimum price.
/// * [nextPrices]: Next changes for the price for gift upgrade with more granularity than in prices.
final class GiftUpgradePreview extends TdObject {
  /// **GiftUpgradePreview** *(giftUpgradePreview)* - basic class
  ///
  /// Contains examples of possible upgraded gifts for the given regular gift.
  ///
  /// * [models]: Examples of possible models that can be chosen for the gift after upgrade.
  /// * [symbols]: Examples of possible symbols that can be chosen for the gift after upgrade.
  /// * [backdrops]: Examples of possible backdrops that can be chosen for the gift after upgrade.
  /// * [prices]: Examples of price for gift upgrade from the maximum price to the minimum price.
  /// * [nextPrices]: Next changes for the price for gift upgrade with more granularity than in prices.
  const GiftUpgradePreview({
    required this.models,
    required this.symbols,
    required this.backdrops,
    required this.prices,
    required this.nextPrices,
    this.extra,
    this.clientId,
  });

  /// Examples of possible models that can be chosen for the gift after upgrade
  final List<UpgradedGiftModel> models;

  /// Examples of possible symbols that can be chosen for the gift after upgrade
  final List<UpgradedGiftSymbol> symbols;

  /// Examples of possible backdrops that can be chosen for the gift after upgrade
  final List<UpgradedGiftBackdrop> backdrops;

  /// Examples of price for gift upgrade from the maximum price to the minimum price
  final List<GiftUpgradePrice> prices;

  /// Next changes for the price for gift upgrade with more granularity than in prices
  final List<GiftUpgradePrice> nextPrices;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftUpgradePreview.fromJson(Map<String, dynamic> json) =>
      GiftUpgradePreview(
        models: List<UpgradedGiftModel>.from((json['models'] ?? [])
            .map((item) => UpgradedGiftModel.fromJson(item))
            .toList()),
        symbols: List<UpgradedGiftSymbol>.from((json['symbols'] ?? [])
            .map((item) => UpgradedGiftSymbol.fromJson(item))
            .toList()),
        backdrops: List<UpgradedGiftBackdrop>.from((json['backdrops'] ?? [])
            .map((item) => UpgradedGiftBackdrop.fromJson(item))
            .toList()),
        prices: List<GiftUpgradePrice>.from((json['prices'] ?? [])
            .map((item) => GiftUpgradePrice.fromJson(item))
            .toList()),
        nextPrices: List<GiftUpgradePrice>.from((json['next_prices'] ?? [])
            .map((item) => GiftUpgradePrice.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "models": models.map((i) => i.toJson()).toList(),
      "symbols": symbols.map((i) => i.toJson()).toList(),
      "backdrops": backdrops.map((i) => i.toJson()).toList(),
      "prices": prices.map((i) => i.toJson()).toList(),
      "next_prices": nextPrices.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [models]: Examples of possible models that can be chosen for the gift after upgrade
  /// * [symbols]: Examples of possible symbols that can be chosen for the gift after upgrade
  /// * [backdrops]: Examples of possible backdrops that can be chosen for the gift after upgrade
  /// * [prices]: Examples of price for gift upgrade from the maximum price to the minimum price
  /// * [next_prices]: Next changes for the price for gift upgrade with more granularity than in prices
  GiftUpgradePreview copyWith({
    List<UpgradedGiftModel>? models,
    List<UpgradedGiftSymbol>? symbols,
    List<UpgradedGiftBackdrop>? backdrops,
    List<GiftUpgradePrice>? prices,
    List<GiftUpgradePrice>? nextPrices,
    dynamic extra,
    int? clientId,
  }) =>
      GiftUpgradePreview(
        models: models ?? this.models,
        symbols: symbols ?? this.symbols,
        backdrops: backdrops ?? this.backdrops,
        prices: prices ?? this.prices,
        nextPrices: nextPrices ?? this.nextPrices,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftUpgradePreview';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
