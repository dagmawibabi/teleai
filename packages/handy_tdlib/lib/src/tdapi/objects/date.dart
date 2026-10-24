part of '../tdapi.dart';

/// **Date** *(date)* - basic class
///
/// Represents a date according to the Gregorian calendar.
///
/// * [day]: Day of the month; 1-31.
/// * [month]: Month; 1-12.
/// * [year]: Year; 1-9999.
final class Date extends TdObject {
  /// **Date** *(date)* - basic class
  ///
  /// Represents a date according to the Gregorian calendar.
  ///
  /// * [day]: Day of the month; 1-31.
  /// * [month]: Month; 1-12.
  /// * [year]: Year; 1-9999.
  const Date({
    required this.day,
    required this.month,
    required this.year,
  });

  /// Day of the month; 1-31
  final int day;

  /// Month; 1-12
  final int month;

  /// Year; 1-9999
  final int year;

  /// Parse from a json
  factory Date.fromJson(Map<String, dynamic> json) => Date(
        day: json['day'],
        month: json['month'],
        year: json['year'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "day": day,
      "month": month,
      "year": year,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [day]: Day of the month; 1-31
  /// * [month]: Month; 1-12
  /// * [year]: Year; 1-9999
  Date copyWith({
    int? day,
    int? month,
    int? year,
  }) =>
      Date(
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
      );

  /// TDLib object type
  static const String defaultObjectId = 'date';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
