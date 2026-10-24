part of '../tdapi.dart';

/// **StoryArea** *(storyArea)* - basic class
///
/// Describes a clickable rectangle area on a story media.
///
/// * [position]: Position of the area.
/// * [type]: Type of the area.
final class StoryArea extends TdObject {
  /// **StoryArea** *(storyArea)* - basic class
  ///
  /// Describes a clickable rectangle area on a story media.
  ///
  /// * [position]: Position of the area.
  /// * [type]: Type of the area.
  const StoryArea({
    required this.position,
    required this.type,
  });

  /// Position of the area
  final AreaPosition position;

  /// Type of the area
  final StoryAreaType type;

  /// Parse from a json
  factory StoryArea.fromJson(Map<String, dynamic> json) => StoryArea(
        position: AreaPosition.fromJson(json['position']),
        type: StoryAreaType.fromJson(json['type']),
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
  StoryArea copyWith({
    AreaPosition? position,
    StoryAreaType? type,
  }) =>
      StoryArea(
        position: position ?? this.position,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyArea';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
