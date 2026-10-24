part of '../tdapi.dart';

/// **TimeZone** *(timeZone)* - basic class
///
/// Describes a time zone.
///
/// * [id]: Unique time zone identifier.
/// * [name]: Time zone name.
/// * [utcTimeOffset]: Current UTC time offset for the time zone.
final class TimeZone extends TdObject {
  /// **TimeZone** *(timeZone)* - basic class
  ///
  /// Describes a time zone.
  ///
  /// * [id]: Unique time zone identifier.
  /// * [name]: Time zone name.
  /// * [utcTimeOffset]: Current UTC time offset for the time zone.
  const TimeZone({
    required this.id,
    required this.name,
    required this.utcTimeOffset,
  });

  /// Unique time zone identifier
  final String id;

  /// Time zone name
  final String name;

  /// Current UTC time offset for the time zone
  final int utcTimeOffset;

  /// Parse from a json
  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
        id: json['id'],
        name: json['name'],
        utcTimeOffset: json['utc_time_offset'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "utc_time_offset": utcTimeOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique time zone identifier
  /// * [name]: Time zone name
  /// * [utc_time_offset]: Current UTC time offset for the time zone
  TimeZone copyWith({
    String? id,
    String? name,
    int? utcTimeOffset,
  }) =>
      TimeZone(
        id: id ?? this.id,
        name: name ?? this.name,
        utcTimeOffset: utcTimeOffset ?? this.utcTimeOffset,
      );

  /// TDLib object type
  static const String defaultObjectId = 'timeZone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
