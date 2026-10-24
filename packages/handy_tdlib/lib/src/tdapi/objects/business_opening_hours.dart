part of '../tdapi.dart';

/// **BusinessOpeningHours** *(businessOpeningHours)* - basic class
///
/// Describes opening hours of a business.
///
/// * [timeZoneId]: Unique time zone identifier.
/// * [openingHours]: Intervals of the time when the business is open.
final class BusinessOpeningHours extends TdObject {
  /// **BusinessOpeningHours** *(businessOpeningHours)* - basic class
  ///
  /// Describes opening hours of a business.
  ///
  /// * [timeZoneId]: Unique time zone identifier.
  /// * [openingHours]: Intervals of the time when the business is open.
  const BusinessOpeningHours({
    required this.timeZoneId,
    required this.openingHours,
  });

  /// Unique time zone identifier
  final String timeZoneId;

  /// Intervals of the time when the business is open
  final List<BusinessOpeningHoursInterval> openingHours;

  /// Parse from a json
  factory BusinessOpeningHours.fromJson(Map<String, dynamic> json) =>
      BusinessOpeningHours(
        timeZoneId: json['time_zone_id'],
        openingHours: List<BusinessOpeningHoursInterval>.from(
            (json['opening_hours'] ?? [])
                .map((item) => BusinessOpeningHoursInterval.fromJson(item))
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "time_zone_id": timeZoneId,
      "opening_hours": openingHours.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [time_zone_id]: Unique time zone identifier
  /// * [opening_hours]: Intervals of the time when the business is open
  BusinessOpeningHours copyWith({
    String? timeZoneId,
    List<BusinessOpeningHoursInterval>? openingHours,
  }) =>
      BusinessOpeningHours(
        timeZoneId: timeZoneId ?? this.timeZoneId,
        openingHours: openingHours ?? this.openingHours,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessOpeningHours';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
