part of '../tdapi.dart';

/// **DatabaseStatistics** *(databaseStatistics)* - basic class
///
/// Contains database statistics.
///
/// * [statistics]: Database statistics in an unspecified human-readable format.
final class DatabaseStatistics extends TdObject {
  /// **DatabaseStatistics** *(databaseStatistics)* - basic class
  ///
  /// Contains database statistics.
  ///
  /// * [statistics]: Database statistics in an unspecified human-readable format.
  const DatabaseStatistics({
    required this.statistics,
    this.extra,
    this.clientId,
  });

  /// Database statistics in an unspecified human-readable format
  final String statistics;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory DatabaseStatistics.fromJson(Map<String, dynamic> json) =>
      DatabaseStatistics(
        statistics: json['statistics'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "statistics": statistics,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [statistics]: Database statistics in an unspecified human-readable format
  DatabaseStatistics copyWith({
    String? statistics,
    dynamic extra,
    int? clientId,
  }) =>
      DatabaseStatistics(
        statistics: statistics ?? this.statistics,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'databaseStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
