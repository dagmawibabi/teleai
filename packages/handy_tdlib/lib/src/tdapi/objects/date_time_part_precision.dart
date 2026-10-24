part of '../tdapi.dart';

/// **DateTimePartPrecision** *(dateTimePartPrecision)* - parent
///
/// Describes precision with which to show a date or a time.
sealed class DateTimePartPrecision extends TdObject {
  /// **DateTimePartPrecision** *(dateTimePartPrecision)* - parent
  ///
  /// Describes precision with which to show a date or a time.
  const DateTimePartPrecision();

  /// a DateTimePartPrecision return type can be :
  /// * [DateTimePartPrecisionNone]
  /// * [DateTimePartPrecisionShort]
  /// * [DateTimePartPrecisionLong]
  factory DateTimePartPrecision.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case DateTimePartPrecisionNone.defaultObjectId:
        return DateTimePartPrecisionNone.fromJson(json);
      case DateTimePartPrecisionShort.defaultObjectId:
        return DateTimePartPrecisionShort.fromJson(json);
      case DateTimePartPrecisionLong.defaultObjectId:
        return DateTimePartPrecisionLong.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of DateTimePartPrecision)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  DateTimePartPrecision copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimePartPrecision';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DateTimePartPrecisionNone** *(dateTimePartPrecisionNone)* - child of DateTimePartPrecision
///
/// Don't show the date or time.
final class DateTimePartPrecisionNone extends DateTimePartPrecision {
  /// **DateTimePartPrecisionNone** *(dateTimePartPrecisionNone)* - child of DateTimePartPrecision
  ///
  /// Don't show the date or time.
  const DateTimePartPrecisionNone();

  /// Parse from a json
  factory DateTimePartPrecisionNone.fromJson(Map<String, dynamic> json) =>
      const DateTimePartPrecisionNone();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DateTimePartPrecisionNone copyWith() => const DateTimePartPrecisionNone();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimePartPrecisionNone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DateTimePartPrecisionShort** *(dateTimePartPrecisionShort)* - child of DateTimePartPrecision
///
/// Show the date or time in a short way (17.03.22 or 22:45).
final class DateTimePartPrecisionShort extends DateTimePartPrecision {
  /// **DateTimePartPrecisionShort** *(dateTimePartPrecisionShort)* - child of DateTimePartPrecision
  ///
  /// Show the date or time in a short way (17.03.22 or 22:45).
  const DateTimePartPrecisionShort();

  /// Parse from a json
  factory DateTimePartPrecisionShort.fromJson(Map<String, dynamic> json) =>
      const DateTimePartPrecisionShort();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DateTimePartPrecisionShort copyWith() => const DateTimePartPrecisionShort();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimePartPrecisionShort';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **DateTimePartPrecisionLong** *(dateTimePartPrecisionLong)* - child of DateTimePartPrecision
///
/// Show the date or time in a long way (March 17, 2022 or 22:45:00).
final class DateTimePartPrecisionLong extends DateTimePartPrecision {
  /// **DateTimePartPrecisionLong** *(dateTimePartPrecisionLong)* - child of DateTimePartPrecision
  ///
  /// Show the date or time in a long way (March 17, 2022 or 22:45:00).
  const DateTimePartPrecisionLong();

  /// Parse from a json
  factory DateTimePartPrecisionLong.fromJson(Map<String, dynamic> json) =>
      const DateTimePartPrecisionLong();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  DateTimePartPrecisionLong copyWith() => const DateTimePartPrecisionLong();

  /// TDLib object type
  static const String defaultObjectId = 'dateTimePartPrecisionLong';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
