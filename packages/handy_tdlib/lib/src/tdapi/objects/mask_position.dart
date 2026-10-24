part of '../tdapi.dart';

/// **MaskPosition** *(maskPosition)* - basic class
///
/// Position on a photo where a mask is placed.
///
/// * [point]: Part of the face, relative to which the mask is placed.
/// * [xShift]: Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position).
/// * [yShift]: Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position).
/// * [scale]: Mask scaling coefficient. (For example, 2.0 means a doubled size).
final class MaskPosition extends TdObject {
  /// **MaskPosition** *(maskPosition)* - basic class
  ///
  /// Position on a photo where a mask is placed.
  ///
  /// * [point]: Part of the face, relative to which the mask is placed.
  /// * [xShift]: Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position).
  /// * [yShift]: Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position).
  /// * [scale]: Mask scaling coefficient. (For example, 2.0 means a doubled size).
  const MaskPosition({
    required this.point,
    required this.xShift,
    required this.yShift,
    required this.scale,
  });

  /// Part of the face, relative to which the mask is placed
  final MaskPoint point;

  /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
  final double xShift;

  /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
  final double yShift;

  /// Mask scaling coefficient. (For example, 2.0 means a doubled size)
  final double scale;

  /// Parse from a json
  factory MaskPosition.fromJson(Map<String, dynamic> json) => MaskPosition(
        point: MaskPoint.fromJson(json['point']),
        xShift: json['x_shift'],
        yShift: json['y_shift'],
        scale: json['scale'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "point": point.toJson(),
      "x_shift": xShift,
      "y_shift": yShift,
      "scale": scale,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [point]: Part of the face, relative to which the mask is placed
  /// * [x_shift]: Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
  /// * [y_shift]: Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
  /// * [scale]: Mask scaling coefficient. (For example, 2.0 means a doubled size)
  MaskPosition copyWith({
    MaskPoint? point,
    double? xShift,
    double? yShift,
    double? scale,
  }) =>
      MaskPosition(
        point: point ?? this.point,
        xShift: xShift ?? this.xShift,
        yShift: yShift ?? this.yShift,
        scale: scale ?? this.scale,
      );

  /// TDLib object type
  static const String defaultObjectId = 'maskPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
