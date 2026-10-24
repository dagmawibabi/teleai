part of '../tdapi.dart';

/// **Outline** *(outline)* - basic class
///
/// Represents outline of an image.
///
/// * [paths]: The list of closed vector paths.
final class Outline extends TdObject {
  /// **Outline** *(outline)* - basic class
  ///
  /// Represents outline of an image.
  ///
  /// * [paths]: The list of closed vector paths.
  const Outline({
    required this.paths,
    this.extra,
    this.clientId,
  });

  /// The list of closed vector paths
  final List<ClosedVectorPath> paths;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Outline.fromJson(Map<String, dynamic> json) => Outline(
        paths: List<ClosedVectorPath>.from((json['paths'] ?? [])
            .map((item) => ClosedVectorPath.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "paths": paths.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [paths]: The list of closed vector paths
  Outline copyWith({
    List<ClosedVectorPath>? paths,
    dynamic extra,
    int? clientId,
  }) =>
      Outline(
        paths: paths ?? this.paths,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'outline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
