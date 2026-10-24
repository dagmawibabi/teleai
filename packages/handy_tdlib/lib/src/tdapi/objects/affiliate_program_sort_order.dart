part of '../tdapi.dart';

/// **AffiliateProgramSortOrder** *(affiliateProgramSortOrder)* - parent
///
/// Describes the order of the found affiliate programs.
sealed class AffiliateProgramSortOrder extends TdObject {
  /// **AffiliateProgramSortOrder** *(affiliateProgramSortOrder)* - parent
  ///
  /// Describes the order of the found affiliate programs.
  const AffiliateProgramSortOrder();

  /// a AffiliateProgramSortOrder return type can be :
  /// * [AffiliateProgramSortOrderProfitability]
  /// * [AffiliateProgramSortOrderCreationDate]
  /// * [AffiliateProgramSortOrderRevenue]
  factory AffiliateProgramSortOrder.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case AffiliateProgramSortOrderProfitability.defaultObjectId:
        return AffiliateProgramSortOrderProfitability.fromJson(json);
      case AffiliateProgramSortOrderCreationDate.defaultObjectId:
        return AffiliateProgramSortOrderCreationDate.fromJson(json);
      case AffiliateProgramSortOrderRevenue.defaultObjectId:
        return AffiliateProgramSortOrderRevenue.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of AffiliateProgramSortOrder)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  AffiliateProgramSortOrder copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'affiliateProgramSortOrder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateProgramSortOrderProfitability** *(affiliateProgramSortOrderProfitability)* - child of AffiliateProgramSortOrder
///
/// The affiliate programs must be sorted by the profitability.
final class AffiliateProgramSortOrderProfitability
    extends AffiliateProgramSortOrder {
  /// **AffiliateProgramSortOrderProfitability** *(affiliateProgramSortOrderProfitability)* - child of AffiliateProgramSortOrder
  ///
  /// The affiliate programs must be sorted by the profitability.
  const AffiliateProgramSortOrderProfitability();

  /// Parse from a json
  factory AffiliateProgramSortOrderProfitability.fromJson(
          Map<String, dynamic> json) =>
      const AffiliateProgramSortOrderProfitability();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  AffiliateProgramSortOrderProfitability copyWith() =>
      const AffiliateProgramSortOrderProfitability();

  /// TDLib object type
  static const String defaultObjectId =
      'affiliateProgramSortOrderProfitability';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateProgramSortOrderCreationDate** *(affiliateProgramSortOrderCreationDate)* - child of AffiliateProgramSortOrder
///
/// The affiliate programs must be sorted by creation date.
final class AffiliateProgramSortOrderCreationDate
    extends AffiliateProgramSortOrder {
  /// **AffiliateProgramSortOrderCreationDate** *(affiliateProgramSortOrderCreationDate)* - child of AffiliateProgramSortOrder
  ///
  /// The affiliate programs must be sorted by creation date.
  const AffiliateProgramSortOrderCreationDate();

  /// Parse from a json
  factory AffiliateProgramSortOrderCreationDate.fromJson(
          Map<String, dynamic> json) =>
      const AffiliateProgramSortOrderCreationDate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  AffiliateProgramSortOrderCreationDate copyWith() =>
      const AffiliateProgramSortOrderCreationDate();

  /// TDLib object type
  static const String defaultObjectId = 'affiliateProgramSortOrderCreationDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **AffiliateProgramSortOrderRevenue** *(affiliateProgramSortOrderRevenue)* - child of AffiliateProgramSortOrder
///
/// The affiliate programs must be sorted by the expected revenue.
final class AffiliateProgramSortOrderRevenue extends AffiliateProgramSortOrder {
  /// **AffiliateProgramSortOrderRevenue** *(affiliateProgramSortOrderRevenue)* - child of AffiliateProgramSortOrder
  ///
  /// The affiliate programs must be sorted by the expected revenue.
  const AffiliateProgramSortOrderRevenue();

  /// Parse from a json
  factory AffiliateProgramSortOrderRevenue.fromJson(
          Map<String, dynamic> json) =>
      const AffiliateProgramSortOrderRevenue();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  AffiliateProgramSortOrderRevenue copyWith() =>
      const AffiliateProgramSortOrderRevenue();

  /// TDLib object type
  static const String defaultObjectId = 'affiliateProgramSortOrderRevenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
