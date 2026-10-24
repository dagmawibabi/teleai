part of '../tdapi.dart';

/// **LabeledPricePart** *(labeledPricePart)* - basic class
///
/// Portion of the price of a product (e.g., "delivery cost", "tax amount").
///
/// * [label]: Label for this portion of the product price.
/// * [amount]: Currency amount in the smallest units of the currency.
final class LabeledPricePart extends TdObject {
  /// **LabeledPricePart** *(labeledPricePart)* - basic class
  ///
  /// Portion of the price of a product (e.g., "delivery cost", "tax amount").
  ///
  /// * [label]: Label for this portion of the product price.
  /// * [amount]: Currency amount in the smallest units of the currency.
  const LabeledPricePart({
    required this.label,
    required this.amount,
  });

  /// Label for this portion of the product price
  final String label;

  /// Currency amount in the smallest units of the currency
  final int amount;

  /// Parse from a json
  factory LabeledPricePart.fromJson(Map<String, dynamic> json) =>
      LabeledPricePart(
        label: json['label'],
        amount: json['amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "label": label,
      "amount": amount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [label]: Label for this portion of the product price
  /// * [amount]: Currency amount in the smallest units of the currency
  LabeledPricePart copyWith({
    String? label,
    int? amount,
  }) =>
      LabeledPricePart(
        label: label ?? this.label,
        amount: amount ?? this.amount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'labeledPricePart';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
