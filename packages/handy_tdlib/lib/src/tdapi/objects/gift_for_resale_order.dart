part of '../tdapi.dart';

/// **GiftForResaleOrder** *(giftForResaleOrder)* - parent
///
/// Describes order in which upgraded gifts for resale will be sorted.
sealed class GiftForResaleOrder extends TdObject {
  /// **GiftForResaleOrder** *(giftForResaleOrder)* - parent
  ///
  /// Describes order in which upgraded gifts for resale will be sorted.
  const GiftForResaleOrder();

  /// a GiftForResaleOrder return type can be :
  /// * [GiftForResaleOrderPrice]
  /// * [GiftForResaleOrderPriceChangeDate]
  /// * [GiftForResaleOrderNumber]
  factory GiftForResaleOrder.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiftForResaleOrderPrice.defaultObjectId:
        return GiftForResaleOrderPrice.fromJson(json);
      case GiftForResaleOrderPriceChangeDate.defaultObjectId:
        return GiftForResaleOrderPriceChangeDate.fromJson(json);
      case GiftForResaleOrderNumber.defaultObjectId:
        return GiftForResaleOrderNumber.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiftForResaleOrder)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiftForResaleOrder copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giftForResaleOrder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftForResaleOrderPrice** *(giftForResaleOrderPrice)* - child of GiftForResaleOrder
///
/// The gifts will be sorted by their price from the lowest to the highest.
final class GiftForResaleOrderPrice extends GiftForResaleOrder {
  /// **GiftForResaleOrderPrice** *(giftForResaleOrderPrice)* - child of GiftForResaleOrder
  ///
  /// The gifts will be sorted by their price from the lowest to the highest.
  const GiftForResaleOrderPrice();

  /// Parse from a json
  factory GiftForResaleOrderPrice.fromJson(Map<String, dynamic> json) =>
      const GiftForResaleOrderPrice();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftForResaleOrderPrice copyWith() => const GiftForResaleOrderPrice();

  /// TDLib object type
  static const String defaultObjectId = 'giftForResaleOrderPrice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftForResaleOrderPriceChangeDate** *(giftForResaleOrderPriceChangeDate)* - child of GiftForResaleOrder
///
/// The gifts will be sorted by the last date when their price was changed from the newest to the oldest.
final class GiftForResaleOrderPriceChangeDate extends GiftForResaleOrder {
  /// **GiftForResaleOrderPriceChangeDate** *(giftForResaleOrderPriceChangeDate)* - child of GiftForResaleOrder
  ///
  /// The gifts will be sorted by the last date when their price was changed from the newest to the oldest.
  const GiftForResaleOrderPriceChangeDate();

  /// Parse from a json
  factory GiftForResaleOrderPriceChangeDate.fromJson(
          Map<String, dynamic> json) =>
      const GiftForResaleOrderPriceChangeDate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftForResaleOrderPriceChangeDate copyWith() =>
      const GiftForResaleOrderPriceChangeDate();

  /// TDLib object type
  static const String defaultObjectId = 'giftForResaleOrderPriceChangeDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftForResaleOrderNumber** *(giftForResaleOrderNumber)* - child of GiftForResaleOrder
///
/// The gifts will be sorted by their number from the smallest to the largest.
final class GiftForResaleOrderNumber extends GiftForResaleOrder {
  /// **GiftForResaleOrderNumber** *(giftForResaleOrderNumber)* - child of GiftForResaleOrder
  ///
  /// The gifts will be sorted by their number from the smallest to the largest.
  const GiftForResaleOrderNumber();

  /// Parse from a json
  factory GiftForResaleOrderNumber.fromJson(Map<String, dynamic> json) =>
      const GiftForResaleOrderNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiftForResaleOrderNumber copyWith() => const GiftForResaleOrderNumber();

  /// TDLib object type
  static const String defaultObjectId = 'giftForResaleOrderNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
