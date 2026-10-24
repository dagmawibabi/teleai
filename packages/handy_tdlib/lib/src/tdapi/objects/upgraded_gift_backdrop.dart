part of '../tdapi.dart';

/// **UpgradedGiftBackdrop** *(upgradedGiftBackdrop)* - basic class
///
/// Describes a backdrop of an upgraded gift.
///
/// * [id]: Unique identifier of the backdrop.
/// * [name]: Name of the backdrop.
/// * [colors]: Colors of the backdrop.
/// * [rarity]: The rarity of the backdrop.
final class UpgradedGiftBackdrop extends TdObject {
  /// **UpgradedGiftBackdrop** *(upgradedGiftBackdrop)* - basic class
  ///
  /// Describes a backdrop of an upgraded gift.
  ///
  /// * [id]: Unique identifier of the backdrop.
  /// * [name]: Name of the backdrop.
  /// * [colors]: Colors of the backdrop.
  /// * [rarity]: The rarity of the backdrop.
  const UpgradedGiftBackdrop({
    required this.id,
    required this.name,
    required this.colors,
    required this.rarity,
  });

  /// Unique identifier of the backdrop
  final int id;

  /// Name of the backdrop
  final String name;

  /// Colors of the backdrop
  final UpgradedGiftBackdropColors colors;

  /// The rarity of the backdrop
  final UpgradedGiftAttributeRarity rarity;

  /// Parse from a json
  factory UpgradedGiftBackdrop.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftBackdrop(
        id: json['id'],
        name: json['name'],
        colors: UpgradedGiftBackdropColors.fromJson(json['colors']),
        rarity: UpgradedGiftAttributeRarity.fromJson(json['rarity']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "colors": colors.toJson(),
      "rarity": rarity.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the backdrop
  /// * [name]: Name of the backdrop
  /// * [colors]: Colors of the backdrop
  /// * [rarity]: The rarity of the backdrop
  UpgradedGiftBackdrop copyWith({
    int? id,
    String? name,
    UpgradedGiftBackdropColors? colors,
    UpgradedGiftAttributeRarity? rarity,
  }) =>
      UpgradedGiftBackdrop(
        id: id ?? this.id,
        name: name ?? this.name,
        colors: colors ?? this.colors,
        rarity: rarity ?? this.rarity,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftBackdrop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
