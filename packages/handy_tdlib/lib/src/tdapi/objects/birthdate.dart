part of '../tdapi.dart';

/// **Birthdate** *(birthdate)* - basic class
///
/// Represents a birthdate of a user.
///
/// * [day]: Day of the month; 1-31.
/// * [month]: Month of the year; 1-12.
/// * [year]: Birth year; 0 if unknown.
final class Birthdate extends TdObject {
  /// **Birthdate** *(birthdate)* - basic class
  ///
  /// Represents a birthdate of a user.
  ///
  /// * [day]: Day of the month; 1-31.
  /// * [month]: Month of the year; 1-12.
  /// * [year]: Birth year; 0 if unknown.
  const Birthdate({
    required this.day,
    required this.month,
    required this.year,
  });

  /// Day of the month; 1-31
  final int day;

  /// Month of the year; 1-12
  final int month;

  /// Birth year; 0 if unknown
  final int year;

  /// Parse from a json
  factory Birthdate.fromJson(Map<String, dynamic> json) => Birthdate(
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
  /// * [month]: Month of the year; 1-12
  /// * [year]: Birth year; 0 if unknown
  Birthdate copyWith({
    int? day,
    int? month,
    int? year,
  }) =>
      Birthdate(
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
      );

  /// TDLib object type
  static const String defaultObjectId = 'birthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
