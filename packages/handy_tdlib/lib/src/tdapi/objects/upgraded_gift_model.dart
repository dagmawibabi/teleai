part of '../tdapi.dart';

/// **UpgradedGiftModel** *(upgradedGiftModel)* - basic class
///
/// Describes a model of an upgraded gift.
///
/// * [name]: Name of the model.
/// * [sticker]: The sticker representing the upgraded gift.
/// * [rarity]: The rarity of the model.
/// * [isCrafted]: True, if the model can be obtained only through gift crafting.
final class UpgradedGiftModel extends TdObject {
  /// **UpgradedGiftModel** *(upgradedGiftModel)* - basic class
  ///
  /// Describes a model of an upgraded gift.
  ///
  /// * [name]: Name of the model.
  /// * [sticker]: The sticker representing the upgraded gift.
  /// * [rarity]: The rarity of the model.
  /// * [isCrafted]: True, if the model can be obtained only through gift crafting.
  const UpgradedGiftModel({
    required this.name,
    required this.sticker,
    required this.rarity,
    required this.isCrafted,
  });

  /// Name of the model
  final String name;

  /// The sticker representing the upgraded gift
  final Sticker sticker;

  /// The rarity of the model
  final UpgradedGiftAttributeRarity rarity;

  /// True, if the model can be obtained only through gift crafting
  final bool isCrafted;

  /// Parse from a json
  factory UpgradedGiftModel.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftModel(
        name: json['name'],
        sticker: Sticker.fromJson(json['sticker']),
        rarity: UpgradedGiftAttributeRarity.fromJson(json['rarity']),
        isCrafted: json['is_crafted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
      "sticker": sticker.toJson(),
      "rarity": rarity.toJson(),
      "is_crafted": isCrafted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the model
  /// * [sticker]: The sticker representing the upgraded gift
  /// * [rarity]: The rarity of the model
  /// * [is_crafted]: True, if the model can be obtained only through gift crafting
  UpgradedGiftModel copyWith({
    String? name,
    Sticker? sticker,
    UpgradedGiftAttributeRarity? rarity,
    bool? isCrafted,
  }) =>
      UpgradedGiftModel(
        name: name ?? this.name,
        sticker: sticker ?? this.sticker,
        rarity: rarity ?? this.rarity,
        isCrafted: isCrafted ?? this.isCrafted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftModel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
