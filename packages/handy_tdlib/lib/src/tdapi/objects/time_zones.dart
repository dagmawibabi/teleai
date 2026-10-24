part of '../tdapi.dart';

/// **TimeZones** *(timeZones)* - basic class
///
/// Contains a list of time zones.
///
/// * [timeZones]: A list of time zones.
final class TimeZones extends TdObject {
  /// **TimeZones** *(timeZones)* - basic class
  ///
  /// Contains a list of time zones.
  ///
  /// * [timeZones]: A list of time zones.
  const TimeZones({
    required this.timeZones,
    this.extra,
    this.clientId,
  });

  /// A list of time zones
  final List<TimeZone> timeZones;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TimeZones.fromJson(Map<String, dynamic> json) => TimeZones(
        timeZones: List<TimeZone>.from((json['time_zones'] ?? [])
            .map((item) => TimeZone.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "time_zones": timeZones.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [time_zones]: A list of time zones
  TimeZones copyWith({
    List<TimeZone>? timeZones,
    dynamic extra,
    int? clientId,
  }) =>
      TimeZones(
        timeZones: timeZones ?? this.timeZones,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'timeZones';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
