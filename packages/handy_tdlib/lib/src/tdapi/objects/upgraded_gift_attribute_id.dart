part of '../tdapi.dart';

/// **UpgradedGiftAttributeId** *(upgradedGiftAttributeId)* - parent
///
/// Contains identifier of an upgraded gift attribute to search for.
sealed class UpgradedGiftAttributeId extends TdObject {
  /// **UpgradedGiftAttributeId** *(upgradedGiftAttributeId)* - parent
  ///
  /// Contains identifier of an upgraded gift attribute to search for.
  const UpgradedGiftAttributeId();

  /// a UpgradedGiftAttributeId return type can be :
  /// * [UpgradedGiftAttributeIdModel]
  /// * [UpgradedGiftAttributeIdSymbol]
  /// * [UpgradedGiftAttributeIdBackdrop]
  factory UpgradedGiftAttributeId.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UpgradedGiftAttributeIdModel.defaultObjectId:
        return UpgradedGiftAttributeIdModel.fromJson(json);
      case UpgradedGiftAttributeIdSymbol.defaultObjectId:
        return UpgradedGiftAttributeIdSymbol.fromJson(json);
      case UpgradedGiftAttributeIdBackdrop.defaultObjectId:
        return UpgradedGiftAttributeIdBackdrop.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UpgradedGiftAttributeId)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UpgradedGiftAttributeId copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeIdModel** *(upgradedGiftAttributeIdModel)* - child of UpgradedGiftAttributeId
///
/// Identifier of a gift model.
///
/// * [stickerId]: Identifier of the sticker representing the model.
final class UpgradedGiftAttributeIdModel extends UpgradedGiftAttributeId {
  /// **UpgradedGiftAttributeIdModel** *(upgradedGiftAttributeIdModel)* - child of UpgradedGiftAttributeId
  ///
  /// Identifier of a gift model.
  ///
  /// * [stickerId]: Identifier of the sticker representing the model.
  const UpgradedGiftAttributeIdModel({
    required this.stickerId,
  });

  /// Identifier of the sticker representing the model
  final int stickerId;

  /// Parse from a json
  factory UpgradedGiftAttributeIdModel.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftAttributeIdModel(
        stickerId: json['sticker_id'] is int
            ? json['sticker_id']
            : int.parse(json['sticker_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_id": stickerId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_id]: Identifier of the sticker representing the model
  @override
  UpgradedGiftAttributeIdModel copyWith({
    int? stickerId,
  }) =>
      UpgradedGiftAttributeIdModel(
        stickerId: stickerId ?? this.stickerId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeIdModel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeIdSymbol** *(upgradedGiftAttributeIdSymbol)* - child of UpgradedGiftAttributeId
///
/// Identifier of a gift symbol.
///
/// * [stickerId]: Identifier of the sticker representing the symbol.
final class UpgradedGiftAttributeIdSymbol extends UpgradedGiftAttributeId {
  /// **UpgradedGiftAttributeIdSymbol** *(upgradedGiftAttributeIdSymbol)* - child of UpgradedGiftAttributeId
  ///
  /// Identifier of a gift symbol.
  ///
  /// * [stickerId]: Identifier of the sticker representing the symbol.
  const UpgradedGiftAttributeIdSymbol({
    required this.stickerId,
  });

  /// Identifier of the sticker representing the symbol
  final int stickerId;

  /// Parse from a json
  factory UpgradedGiftAttributeIdSymbol.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftAttributeIdSymbol(
        stickerId: json['sticker_id'] is int
            ? json['sticker_id']
            : int.parse(json['sticker_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_id": stickerId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_id]: Identifier of the sticker representing the symbol
  @override
  UpgradedGiftAttributeIdSymbol copyWith({
    int? stickerId,
  }) =>
      UpgradedGiftAttributeIdSymbol(
        stickerId: stickerId ?? this.stickerId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeIdSymbol';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UpgradedGiftAttributeIdBackdrop** *(upgradedGiftAttributeIdBackdrop)* - child of UpgradedGiftAttributeId
///
/// Identifier of a gift backdrop.
///
/// * [backdropId]: Identifier of the backdrop.
final class UpgradedGiftAttributeIdBackdrop extends UpgradedGiftAttributeId {
  /// **UpgradedGiftAttributeIdBackdrop** *(upgradedGiftAttributeIdBackdrop)* - child of UpgradedGiftAttributeId
  ///
  /// Identifier of a gift backdrop.
  ///
  /// * [backdropId]: Identifier of the backdrop.
  const UpgradedGiftAttributeIdBackdrop({
    required this.backdropId,
  });

  /// Identifier of the backdrop
  final int backdropId;

  /// Parse from a json
  factory UpgradedGiftAttributeIdBackdrop.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftAttributeIdBackdrop(
        backdropId: json['backdrop_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "backdrop_id": backdropId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [backdrop_id]: Identifier of the backdrop
  @override
  UpgradedGiftAttributeIdBackdrop copyWith({
    int? backdropId,
  }) =>
      UpgradedGiftAttributeIdBackdrop(
        backdropId: backdropId ?? this.backdropId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftAttributeIdBackdrop';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
