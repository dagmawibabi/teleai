part of '../tdapi.dart';

/// **UpgradedGiftBackdropColors** *(upgradedGiftBackdropColors)* - basic class
///
/// Describes colors of a backdrop of an upgraded gift.
///
/// * [centerColor]: A color in the center of the backdrop in the RGB format.
/// * [edgeColor]: A color on the edges of the backdrop in the RGB format.
/// * [symbolColor]: A color to be applied for the symbol in the RGB format.
/// * [textColor]: A color for the text on the backdrop in the RGB format.
final class UpgradedGiftBackdropColors extends TdObject {
  /// **UpgradedGiftBackdropColors** *(upgradedGiftBackdropColors)* - basic class
  ///
  /// Describes colors of a backdrop of an upgraded gift.
  ///
  /// * [centerColor]: A color in the center of the backdrop in the RGB format.
  /// * [edgeColor]: A color on the edges of the backdrop in the RGB format.
  /// * [symbolColor]: A color to be applied for the symbol in the RGB format.
  /// * [textColor]: A color for the text on the backdrop in the RGB format.
  const UpgradedGiftBackdropColors({
    required this.centerColor,
    required this.edgeColor,
    required this.symbolColor,
    required this.textColor,
  });

  /// A color in the center of the backdrop in the RGB format
  final int centerColor;

  /// A color on the edges of the backdrop in the RGB format
  final int edgeColor;

  /// A color to be applied for the symbol in the RGB format
  final int symbolColor;

  /// A color for the text on the backdrop in the RGB format
  final int textColor;

  /// Parse from a json
  factory UpgradedGiftBackdropColors.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftBackdropColors(
        centerColor: json['center_color'],
        edgeColor: json['edge_color'],
        symbolColor: json['symbol_color'],
        textColor: json['text_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "center_color": centerColor,
      "edge_color": edgeColor,
      "symbol_color": symbolColor,
      "text_color": textColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [center_color]: A color in the center of the backdrop in the RGB format
  /// * [edge_color]: A color on the edges of the backdrop in the RGB format
  /// * [symbol_color]: A color to be applied for the symbol in the RGB format
  /// * [text_color]: A color for the text on the backdrop in the RGB format
  UpgradedGiftBackdropColors copyWith({
    int? centerColor,
    int? edgeColor,
    int? symbolColor,
    int? textColor,
  }) =>
      UpgradedGiftBackdropColors(
        centerColor: centerColor ?? this.centerColor,
        edgeColor: edgeColor ?? this.edgeColor,
        symbolColor: symbolColor ?? this.symbolColor,
        textColor: textColor ?? this.textColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftBackdropColors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
