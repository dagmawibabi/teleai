part of '../tdapi.dart';

/// **InputStoryArea** *(inputStoryArea)* - basic class
///
/// Describes a clickable rectangle area on a story media to be added.
///
/// * [position]: Position of the area.
/// * [type]: Type of the area.
final class InputStoryArea extends TdObject {
  /// **InputStoryArea** *(inputStoryArea)* - basic class
  ///
  /// Describes a clickable rectangle area on a story media to be added.
  ///
  /// * [position]: Position of the area.
  /// * [type]: Type of the area.
  const InputStoryArea({
    required this.position,
    required this.type,
  });

  /// Position of the area
  final AreaPosition position;

  /// Type of the area
  final InputStoryAreaType type;

  /// Parse from a json
  factory InputStoryArea.fromJson(Map<String, dynamic> json) => InputStoryArea(
        position: AreaPosition.fromJson(json['position']),
        type: InputStoryAreaType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "position": position.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [position]: Position of the area
  /// * [type]: Type of the area
  InputStoryArea copyWith({
    AreaPosition? position,
    InputStoryAreaType? type,
  }) =>
      InputStoryArea(
        position: position ?? this.position,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputStoryArea';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
