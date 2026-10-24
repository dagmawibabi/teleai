part of '../tdapi.dart';

/// **DateTimeFormattingType** *(dateTimeFormattingType)* - parent
///
/// Describes date and time formatting.
sealed class DateTimeFormattingType extends TdObject {
  /// **DateTimeFormattingType** *(dateTimeFormattingType)* - parent
  ///
  /// Describes date and time formatting.
  const DateTimeFormattingType();

  /// a DateTimeFormattingType return type can be :
  /// * [DateTimeFormattingTypeRelative]
  /// * [DateTimeFormattingTypeAbsolute]
  factory DateTimeFormattingType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case DateTimeFormattingTypeRelative.defaultObjectId:
        return DateTimeFormattingTypeRelative.fromJson(json);
      case DateTimeFormattingTypeAbsolute.defaultObjectId:
        return DateTimeFormattingTypeAbsolute.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of DateTimeFormattingType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  DateTimeFormattingType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimeFormattingType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DateTimeFormattingTypeRelative** *(dateTimeFormattingTypeRelative)* - child of DateTimeFormattingType
///
/// The time must be shown relative to the current time (.
final class DateTimeFormattingTypeRelative extends DateTimeFormattingType {
  /// **DateTimeFormattingTypeRelative** *(dateTimeFormattingTypeRelative)* - child of DateTimeFormattingType
  ///
  /// The time must be shown relative to the current time (.
  const DateTimeFormattingTypeRelative();

  /// Parse from a json
  factory DateTimeFormattingTypeRelative.fromJson(Map<String, dynamic> json) =>
      const DateTimeFormattingTypeRelative();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DateTimeFormattingTypeRelative copyWith() =>
      const DateTimeFormattingTypeRelative();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimeFormattingTypeRelative';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DateTimeFormattingTypeAbsolute** *(dateTimeFormattingTypeAbsolute)* - child of DateTimeFormattingType
///
/// The date and time must be shown as absolute timestamps.
///
/// * [timePrecision]: The precision with which hours, minutes and seconds are shown.
/// * [datePrecision]: The precision with which the date is shown.
/// * [showDayOfWeek]: True, if the day of week must be shown.
final class DateTimeFormattingTypeAbsolute extends DateTimeFormattingType {
  /// **DateTimeFormattingTypeAbsolute** *(dateTimeFormattingTypeAbsolute)* - child of DateTimeFormattingType
  ///
  /// The date and time must be shown as absolute timestamps.
  ///
  /// * [timePrecision]: The precision with which hours, minutes and seconds are shown.
  /// * [datePrecision]: The precision with which the date is shown.
  /// * [showDayOfWeek]: True, if the day of week must be shown.
  const DateTimeFormattingTypeAbsolute({
    required this.timePrecision,
    required this.datePrecision,
    required this.showDayOfWeek,
  });

  /// The precision with which hours, minutes and seconds are shown
  final DateTimePartPrecision timePrecision;

  /// The precision with which the date is shown
  final DateTimePartPrecision datePrecision;

  /// True, if the day of week must be shown
  final bool showDayOfWeek;

  /// Parse from a json
  factory DateTimeFormattingTypeAbsolute.fromJson(Map<String, dynamic> json) =>
      DateTimeFormattingTypeAbsolute(
        timePrecision: DateTimePartPrecision.fromJson(json['time_precision']),
        datePrecision: DateTimePartPrecision.fromJson(json['date_precision']),
        showDayOfWeek: json['show_day_of_week'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "time_precision": timePrecision.toJson(),
      "date_precision": datePrecision.toJson(),
      "show_day_of_week": showDayOfWeek,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [time_precision]: The precision with which hours, minutes and seconds are shown
  /// * [date_precision]: The precision with which the date is shown
  /// * [show_day_of_week]: True, if the day of week must be shown
  @override
  DateTimeFormattingTypeAbsolute copyWith({
    DateTimePartPrecision? timePrecision,
    DateTimePartPrecision? datePrecision,
    bool? showDayOfWeek,
  }) =>
      DateTimeFormattingTypeAbsolute(
        timePrecision: timePrecision ?? this.timePrecision,
        datePrecision: datePrecision ?? this.datePrecision,
        showDayOfWeek: showDayOfWeek ?? this.showDayOfWeek,
      );

  /// TDLib object type
  static const String defaultObjectId = 'dateTimeFormattingTypeAbsolute';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
