part of '../tdapi.dart';

/// **AreaPosition** *(areaPosition)* - basic class
///
/// Describes position of a rectangle area on a story media or a TON wallet card.
///
/// * [xPercentage]: The abscissa of the rectangle's center, as a percentage of the media or the card width.
/// * [yPercentage]: The ordinate of the rectangle's center, as a percentage of the media or the card height.
/// * [widthPercentage]: The width of the rectangle, as a percentage of the media or the card width.
/// * [heightPercentage]: The height of the rectangle, as a percentage of the media or the card height.
/// * [rotationAngle]: Clockwise rotation angle of the rectangle, in degrees; 0-360.
/// * [cornerRadiusPercentage]: The radius of the rectangle corner rounding, as a percentage of the media or the card width.
final class AreaPosition extends TdObject {
  /// **AreaPosition** *(areaPosition)* - basic class
  ///
  /// Describes position of a rectangle area on a story media or a TON wallet card.
  ///
  /// * [xPercentage]: The abscissa of the rectangle's center, as a percentage of the media or the card width.
  /// * [yPercentage]: The ordinate of the rectangle's center, as a percentage of the media or the card height.
  /// * [widthPercentage]: The width of the rectangle, as a percentage of the media or the card width.
  /// * [heightPercentage]: The height of the rectangle, as a percentage of the media or the card height.
  /// * [rotationAngle]: Clockwise rotation angle of the rectangle, in degrees; 0-360.
  /// * [cornerRadiusPercentage]: The radius of the rectangle corner rounding, as a percentage of the media or the card width.
  const AreaPosition({
    required this.xPercentage,
    required this.yPercentage,
    required this.widthPercentage,
    required this.heightPercentage,
    required this.rotationAngle,
    required this.cornerRadiusPercentage,
  });

  /// The abscissa of the rectangle's center, as a percentage of the media or the card width
  final double xPercentage;

  /// The ordinate of the rectangle's center, as a percentage of the media or the card height
  final double yPercentage;

  /// The width of the rectangle, as a percentage of the media or the card width
  final double widthPercentage;

  /// The height of the rectangle, as a percentage of the media or the card height
  final double heightPercentage;

  /// Clockwise rotation angle of the rectangle, in degrees; 0-360
  final double rotationAngle;

  /// The radius of the rectangle corner rounding, as a percentage of the media or the card width
  final double cornerRadiusPercentage;

  /// Parse from a json
  factory AreaPosition.fromJson(Map<String, dynamic> json) => AreaPosition(
        xPercentage: json['x_percentage'],
        yPercentage: json['y_percentage'],
        widthPercentage: json['width_percentage'],
        heightPercentage: json['height_percentage'],
        rotationAngle: json['rotation_angle'],
        cornerRadiusPercentage: json['corner_radius_percentage'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "x_percentage": xPercentage,
      "y_percentage": yPercentage,
      "width_percentage": widthPercentage,
      "height_percentage": heightPercentage,
      "rotation_angle": rotationAngle,
      "corner_radius_percentage": cornerRadiusPercentage,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [x_percentage]: The abscissa of the rectangle's center, as a percentage of the media or the card width
  /// * [y_percentage]: The ordinate of the rectangle's center, as a percentage of the media or the card height
  /// * [width_percentage]: The width of the rectangle, as a percentage of the media or the card width
  /// * [height_percentage]: The height of the rectangle, as a percentage of the media or the card height
  /// * [rotation_angle]: Clockwise rotation angle of the rectangle, in degrees; 0-360
  /// * [corner_radius_percentage]: The radius of the rectangle corner rounding, as a percentage of the media or the card width
  AreaPosition copyWith({
    double? xPercentage,
    double? yPercentage,
    double? widthPercentage,
    double? heightPercentage,
    double? rotationAngle,
    double? cornerRadiusPercentage,
  }) =>
      AreaPosition(
        xPercentage: xPercentage ?? this.xPercentage,
        yPercentage: yPercentage ?? this.yPercentage,
        widthPercentage: widthPercentage ?? this.widthPercentage,
        heightPercentage: heightPercentage ?? this.heightPercentage,
        rotationAngle: rotationAngle ?? this.rotationAngle,
        cornerRadiusPercentage:
            cornerRadiusPercentage ?? this.cornerRadiusPercentage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'areaPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
