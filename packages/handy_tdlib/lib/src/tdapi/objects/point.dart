part of '../tdapi.dart';

/// **Point** *(point)* - basic class
///
/// A point on a Cartesian plane.
///
/// * [x]: The point's first coordinate.
/// * [y]: The point's second coordinate.
final class Point extends TdObject {
  /// **Point** *(point)* - basic class
  ///
  /// A point on a Cartesian plane.
  ///
  /// * [x]: The point's first coordinate.
  /// * [y]: The point's second coordinate.
  const Point({
    required this.x,
    required this.y,
  });

  /// The point's first coordinate
  final double x;

  /// The point's second coordinate
  final double y;

  /// Parse from a json
  factory Point.fromJson(Map<String, dynamic> json) => Point(
        x: json['x'],
        y: json['y'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "x": x,
      "y": y,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [x]: The point's first coordinate
  /// * [y]: The point's second coordinate
  Point copyWith({
    double? x,
    double? y,
  }) =>
      Point(
        x: x ?? this.x,
        y: y ?? this.y,
      );

  /// TDLib object type
  static const String defaultObjectId = 'point';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
