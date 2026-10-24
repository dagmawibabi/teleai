part of '../tdapi.dart';

/// **ClosedVectorPath** *(closedVectorPath)* - basic class
///
/// Represents a closed vector path. The path begins at the end point of the last command. The coordinate system origin is in the upper-left corner.
///
/// * [commands]: List of vector path commands.
final class ClosedVectorPath extends TdObject {
  /// **ClosedVectorPath** *(closedVectorPath)* - basic class
  ///
  /// Represents a closed vector path. The path begins at the end point of the last command. The coordinate system origin is in the upper-left corner.
  ///
  /// * [commands]: List of vector path commands.
  const ClosedVectorPath({
    required this.commands,
  });

  /// List of vector path commands
  final List<VectorPathCommand> commands;

  /// Parse from a json
  factory ClosedVectorPath.fromJson(Map<String, dynamic> json) =>
      ClosedVectorPath(
        commands: List<VectorPathCommand>.from((json['commands'] ?? [])
            .map((item) => VectorPathCommand.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "commands": commands.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [commands]: List of vector path commands
  ClosedVectorPath copyWith({
    List<VectorPathCommand>? commands,
  }) =>
      ClosedVectorPath(
        commands: commands ?? this.commands,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closedVectorPath';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
