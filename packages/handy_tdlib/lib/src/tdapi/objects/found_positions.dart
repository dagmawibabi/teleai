part of '../tdapi.dart';

/// **FoundPositions** *(foundPositions)* - basic class
///
/// Contains 0-based positions of matched objects.
///
/// * [totalCount]: Total number of matched objects.
/// * [positions]: The positions of the matched objects.
final class FoundPositions extends TdObject {
  /// **FoundPositions** *(foundPositions)* - basic class
  ///
  /// Contains 0-based positions of matched objects.
  ///
  /// * [totalCount]: Total number of matched objects.
  /// * [positions]: The positions of the matched objects.
  const FoundPositions({
    required this.totalCount,
    required this.positions,
    this.extra,
    this.clientId,
  });

  /// Total number of matched objects
  final int totalCount;

  /// The positions of the matched objects
  final List<int> positions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundPositions.fromJson(Map<String, dynamic> json) => FoundPositions(
        totalCount: json['total_count'],
        positions: List<int>.from(
            (json['positions'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "positions": positions.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of matched objects
  /// * [positions]: The positions of the matched objects
  FoundPositions copyWith({
    int? totalCount,
    List<int>? positions,
    dynamic extra,
    int? clientId,
  }) =>
      FoundPositions(
        totalCount: totalCount ?? this.totalCount,
        positions: positions ?? this.positions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundPositions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
