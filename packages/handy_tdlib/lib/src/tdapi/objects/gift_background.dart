part of '../tdapi.dart';

/// **GiftBackground** *(giftBackground)* - basic class
///
/// Describes background of a gift.
///
/// * [centerColor]: Center color in RGB format.
/// * [edgeColor]: Edge color in RGB format.
/// * [textColor]: Text color in RGB format.
final class GiftBackground extends TdObject {
  /// **GiftBackground** *(giftBackground)* - basic class
  ///
  /// Describes background of a gift.
  ///
  /// * [centerColor]: Center color in RGB format.
  /// * [edgeColor]: Edge color in RGB format.
  /// * [textColor]: Text color in RGB format.
  const GiftBackground({
    required this.centerColor,
    required this.edgeColor,
    required this.textColor,
  });

  /// Center color in RGB format
  final int centerColor;

  /// Edge color in RGB format
  final int edgeColor;

  /// Text color in RGB format
  final int textColor;

  /// Parse from a json
  factory GiftBackground.fromJson(Map<String, dynamic> json) => GiftBackground(
        centerColor: json['center_color'],
        edgeColor: json['edge_color'],
        textColor: json['text_color'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "center_color": centerColor,
      "edge_color": edgeColor,
      "text_color": textColor,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [center_color]: Center color in RGB format
  /// * [edge_color]: Edge color in RGB format
  /// * [text_color]: Text color in RGB format
  GiftBackground copyWith({
    int? centerColor,
    int? edgeColor,
    int? textColor,
  }) =>
      GiftBackground(
        centerColor: centerColor ?? this.centerColor,
        edgeColor: edgeColor ?? this.edgeColor,
        textColor: textColor ?? this.textColor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
