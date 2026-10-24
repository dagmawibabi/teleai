part of '../tdapi.dart';

/// **DateRange** *(dateRange)* - basic class
///
/// Represents a date range.
///
/// * [startDate]: Point in time (Unix timestamp) at which the date range begins.
/// * [endDate]: Point in time (Unix timestamp) at which the date range ends.
final class DateRange extends TdObject {
  /// **DateRange** *(dateRange)* - basic class
  ///
  /// Represents a date range.
  ///
  /// * [startDate]: Point in time (Unix timestamp) at which the date range begins.
  /// * [endDate]: Point in time (Unix timestamp) at which the date range ends.
  const DateRange({
    required this.startDate,
    required this.endDate,
  });

  /// Point in time (Unix timestamp) at which the date range begins
  final int startDate;

  /// Point in time (Unix timestamp) at which the date range ends
  final int endDate;

  /// Parse from a json
  factory DateRange.fromJson(Map<String, dynamic> json) => DateRange(
        startDate: json['start_date'],
        endDate: json['end_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "start_date": startDate,
      "end_date": endDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [start_date]: Point in time (Unix timestamp) at which the date range begins
  /// * [end_date]: Point in time (Unix timestamp) at which the date range ends
  DateRange copyWith({
    int? startDate,
    int? endDate,
  }) =>
      DateRange(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'dateRange';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
