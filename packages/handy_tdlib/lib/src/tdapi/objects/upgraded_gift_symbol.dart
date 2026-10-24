part of '../tdapi.dart';

/// **UpgradedGiftSymbol** *(upgradedGiftSymbol)* - basic class
///
/// Describes a symbol shown on the pattern of an upgraded gift.
///
/// * [name]: Name of the symbol.
/// * [sticker]: The sticker representing the symbol.
/// * [rarity]: The rarity of the symbol.
final class UpgradedGiftSymbol extends TdObject {
  /// **UpgradedGiftSymbol** *(upgradedGiftSymbol)* - basic class
  ///
  /// Describes a symbol shown on the pattern of an upgraded gift.
  ///
  /// * [name]: Name of the symbol.
  /// * [sticker]: The sticker representing the symbol.
  /// * [rarity]: The rarity of the symbol.
  const UpgradedGiftSymbol({
    required this.name,
    required this.sticker,
    required this.rarity,
  });

  /// Name of the symbol
  final String name;

  /// The sticker representing the symbol
  final Sticker sticker;

  /// The rarity of the symbol
  final UpgradedGiftAttributeRarity rarity;

  /// Parse from a json
  factory UpgradedGiftSymbol.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftSymbol(
        name: json['name'],
        sticker: Sticker.fromJson(json['sticker']),
        rarity: UpgradedGiftAttributeRarity.fromJson(json['rarity']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "sticker": sticker.toJson(),
      "rarity": rarity.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the symbol
  /// * [sticker]: The sticker representing the symbol
  /// * [rarity]: The rarity of the symbol
  UpgradedGiftSymbol copyWith({
    String? name,
    Sticker? sticker,
    UpgradedGiftAttributeRarity? rarity,
  }) =>
      UpgradedGiftSymbol(
        name: name ?? this.name,
        sticker: sticker ?? this.sticker,
        rarity: rarity ?? this.rarity,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftSymbol';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
