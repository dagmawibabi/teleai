part of '../tdapi.dart';

/// **VectorPathCommand** *(vectorPathCommand)* - parent
///
/// Represents a vector path command.
sealed class VectorPathCommand extends TdObject {
  /// **VectorPathCommand** *(vectorPathCommand)* - parent
  ///
  /// Represents a vector path command.
  const VectorPathCommand();

  /// a VectorPathCommand return type can be :
  /// * [VectorPathCommandLine]
  /// * [VectorPathCommandCubicBezierCurve]
  factory VectorPathCommand.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case VectorPathCommandLine.defaultObjectId:
        return VectorPathCommandLine.fromJson(json);
      case VectorPathCommandCubicBezierCurve.defaultObjectId:
        return VectorPathCommandCubicBezierCurve.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of VectorPathCommand)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  VectorPathCommand copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'vectorPathCommand';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **VectorPathCommandLine** *(vectorPathCommandLine)* - child of VectorPathCommand
///
/// A straight line to a given point.
///
/// * [endPoint]: The end point of the straight line.
final class VectorPathCommandLine extends VectorPathCommand {
  /// **VectorPathCommandLine** *(vectorPathCommandLine)* - child of VectorPathCommand
  ///
  /// A straight line to a given point.
  ///
  /// * [endPoint]: The end point of the straight line.
  const VectorPathCommandLine({
    required this.endPoint,
  });

  /// The end point of the straight line
  final Point endPoint;

  /// Parse from a json
  factory VectorPathCommandLine.fromJson(Map<String, dynamic> json) =>
      VectorPathCommandLine(
        endPoint: Point.fromJson(json['end_point']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "end_point": endPoint.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [end_point]: The end point of the straight line
  @override
  VectorPathCommandLine copyWith({
    Point? endPoint,
  }) =>
      VectorPathCommandLine(
        endPoint: endPoint ?? this.endPoint,
      );

  /// TDLib object type
  static const String defaultObjectId = 'vectorPathCommandLine';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **VectorPathCommandCubicBezierCurve** *(vectorPathCommandCubicBezierCurve)* - child of VectorPathCommand
///
/// A cubic B.
///
/// * [startControlPoint]: The start control point of the curve.
/// * [endControlPoint]: The end control point of the curve.
/// * [endPoint]: The end point of the curve.
final class VectorPathCommandCubicBezierCurve extends VectorPathCommand {
  /// **VectorPathCommandCubicBezierCurve** *(vectorPathCommandCubicBezierCurve)* - child of VectorPathCommand
  ///
  /// A cubic B.
  ///
  /// * [startControlPoint]: The start control point of the curve.
  /// * [endControlPoint]: The end control point of the curve.
  /// * [endPoint]: The end point of the curve.
  const VectorPathCommandCubicBezierCurve({
    required this.startControlPoint,
    required this.endControlPoint,
    required this.endPoint,
  });

  /// The start control point of the curve
  final Point startControlPoint;

  /// The end control point of the curve
  final Point endControlPoint;

  /// The end point of the curve
  final Point endPoint;

  /// Parse from a json
  factory VectorPathCommandCubicBezierCurve.fromJson(
          Map<String, dynamic> json) =>
      VectorPathCommandCubicBezierCurve(
        startControlPoint: Point.fromJson(json['start_control_point']),
        endControlPoint: Point.fromJson(json['end_control_point']),
        endPoint: Point.fromJson(json['end_point']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "start_control_point": startControlPoint.toJson(),
      "end_control_point": endControlPoint.toJson(),
      "end_point": endPoint.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_control_point]: The start control point of the curve
  /// * [end_control_point]: The end control point of the curve
  /// * [end_point]: The end point of the curve
  @override
  VectorPathCommandCubicBezierCurve copyWith({
    Point? startControlPoint,
    Point? endControlPoint,
    Point? endPoint,
  }) =>
      VectorPathCommandCubicBezierCurve(
        startControlPoint: startControlPoint ?? this.startControlPoint,
        endControlPoint: endControlPoint ?? this.endControlPoint,
        endPoint: endPoint ?? this.endPoint,
      );

  /// TDLib object type
  static const String defaultObjectId = 'vectorPathCommandCubicBezierCurve';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
