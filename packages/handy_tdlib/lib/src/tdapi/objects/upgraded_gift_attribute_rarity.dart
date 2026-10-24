part of '../tdapi.dart';

/// **UpgradedGiftAttributeRarity** *(upgradedGiftAttributeRarity)* - parent
///
/// Describes rarity of an upgraded gift attribute.
sealed class UpgradedGiftAttributeRarity extends TdObject {
  /// **UpgradedGiftAttributeRarity** *(upgradedGiftAttributeRarity)* - parent
  ///
  /// Describes rarity of an upgraded gift attribute.
  const UpgradedGiftAttributeRarity();

  /// a UpgradedGiftAttributeRarity return type can be :
  /// * [UpgradedGiftAttributeRarityPerMille]
  /// * [UpgradedGiftAttributeRarityUncommon]
  /// * [UpgradedGiftAttributeRarityRare]
  /// * [UpgradedGiftAttributeRarityEpic]
  /// * [UpgradedGiftAttributeRarityLegendary]
  factory UpgradedGiftAttributeRarity.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UpgradedGiftAttributeRarityPerMille.defaultObjectId:
        return UpgradedGiftAttributeRarityPerMille.fromJson(json);
      case UpgradedGiftAttributeRarityUncommon.defaultObjectId:
        return UpgradedGiftAttributeRarityUncommon.fromJson(json);
      case UpgradedGiftAttributeRarityRare.defaultObjectId:
        return UpgradedGiftAttributeRarityRare.fromJson(json);
      case UpgradedGiftAttributeRarityEpic.defaultObjectId:
        return UpgradedGiftAttributeRarityEpic.fromJson(json);
      case UpgradedGiftAttributeRarityLegendary.defaultObjectId:
        return UpgradedGiftAttributeRarityLegendary.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UpgradedGiftAttributeRarity)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UpgradedGiftAttributeRarity copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeRarityPerMille** *(upgradedGiftAttributeRarityPerMille)* - child of UpgradedGiftAttributeRarity
///
/// The rarity is represented as the numeric frequency of the model.
///
/// * [perMille]: The number of upgraded gifts that receive this attribute for each 1000 gifts upgraded; if 0, then it can be shown as ".
final class UpgradedGiftAttributeRarityPerMille
    extends UpgradedGiftAttributeRarity {
  /// **UpgradedGiftAttributeRarityPerMille** *(upgradedGiftAttributeRarityPerMille)* - child of UpgradedGiftAttributeRarity
  ///
  /// The rarity is represented as the numeric frequency of the model.
  ///
  /// * [perMille]: The number of upgraded gifts that receive this attribute for each 1000 gifts upgraded; if 0, then it can be shown as ".
  const UpgradedGiftAttributeRarityPerMille({
    required this.perMille,
  });

  /// The number of upgraded gifts that receive this attribute for each 1000 gifts upgraded; if 0, then it can be shown as "
  final int perMille;

  /// Parse from a json
  factory UpgradedGiftAttributeRarityPerMille.fromJson(
          Map<String, dynamic> json) =>
      UpgradedGiftAttributeRarityPerMille(
        perMille: json['per_mille'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "per_mille": perMille,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [per_mille]: The number of upgraded gifts that receive this attribute for each 1000 gifts upgraded; if 0, then it can be shown as "
  @override
  UpgradedGiftAttributeRarityPerMille copyWith({
    int? perMille,
  }) =>
      UpgradedGiftAttributeRarityPerMille(
        perMille: perMille ?? this.perMille,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarityPerMille';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeRarityUncommon** *(upgradedGiftAttributeRarityUncommon)* - child of UpgradedGiftAttributeRarity
///
/// The attribute is uncommon.
final class UpgradedGiftAttributeRarityUncommon
    extends UpgradedGiftAttributeRarity {
  /// **UpgradedGiftAttributeRarityUncommon** *(upgradedGiftAttributeRarityUncommon)* - child of UpgradedGiftAttributeRarity
  ///
  /// The attribute is uncommon.
  const UpgradedGiftAttributeRarityUncommon();

  /// Parse from a json
  factory UpgradedGiftAttributeRarityUncommon.fromJson(
          Map<String, dynamic> json) =>
      const UpgradedGiftAttributeRarityUncommon();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftAttributeRarityUncommon copyWith() =>
      const UpgradedGiftAttributeRarityUncommon();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarityUncommon';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeRarityRare** *(upgradedGiftAttributeRarityRare)* - child of UpgradedGiftAttributeRarity
///
/// The attribute is rare.
final class UpgradedGiftAttributeRarityRare
    extends UpgradedGiftAttributeRarity {
  /// **UpgradedGiftAttributeRarityRare** *(upgradedGiftAttributeRarityRare)* - child of UpgradedGiftAttributeRarity
  ///
  /// The attribute is rare.
  const UpgradedGiftAttributeRarityRare();

  /// Parse from a json
  factory UpgradedGiftAttributeRarityRare.fromJson(Map<String, dynamic> json) =>
      const UpgradedGiftAttributeRarityRare();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftAttributeRarityRare copyWith() =>
      const UpgradedGiftAttributeRarityRare();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarityRare';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeRarityEpic** *(upgradedGiftAttributeRarityEpic)* - child of UpgradedGiftAttributeRarity
///
/// The attribute is epic.
final class UpgradedGiftAttributeRarityEpic
    extends UpgradedGiftAttributeRarity {
  /// **UpgradedGiftAttributeRarityEpic** *(upgradedGiftAttributeRarityEpic)* - child of UpgradedGiftAttributeRarity
  ///
  /// The attribute is epic.
  const UpgradedGiftAttributeRarityEpic();

  /// Parse from a json
  factory UpgradedGiftAttributeRarityEpic.fromJson(Map<String, dynamic> json) =>
      const UpgradedGiftAttributeRarityEpic();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftAttributeRarityEpic copyWith() =>
      const UpgradedGiftAttributeRarityEpic();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarityEpic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeRarityLegendary** *(upgradedGiftAttributeRarityLegendary)* - child of UpgradedGiftAttributeRarity
///
/// The attribute is legendary.
final class UpgradedGiftAttributeRarityLegendary
    extends UpgradedGiftAttributeRarity {
  /// **UpgradedGiftAttributeRarityLegendary** *(upgradedGiftAttributeRarityLegendary)* - child of UpgradedGiftAttributeRarity
  ///
  /// The attribute is legendary.
  const UpgradedGiftAttributeRarityLegendary();

  /// Parse from a json
  factory UpgradedGiftAttributeRarityLegendary.fromJson(
          Map<String, dynamic> json) =>
      const UpgradedGiftAttributeRarityLegendary();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UpgradedGiftAttributeRarityLegendary copyWith() =>
      const UpgradedGiftAttributeRarityLegendary();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeRarityLegendary';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
