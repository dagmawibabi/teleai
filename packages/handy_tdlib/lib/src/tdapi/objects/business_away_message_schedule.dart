part of '../tdapi.dart';

/// **BusinessAwayMessageSchedule** *(businessAwayMessageSchedule)* - parent
///
/// Describes conditions for sending of away messages by a Telegram Business account.
sealed class BusinessAwayMessageSchedule extends TdObject {
  /// **BusinessAwayMessageSchedule** *(businessAwayMessageSchedule)* - parent
  ///
  /// Describes conditions for sending of away messages by a Telegram Business account.
  const BusinessAwayMessageSchedule();

  /// a BusinessAwayMessageSchedule return type can be :
  /// * [BusinessAwayMessageScheduleAlways]
  /// * [BusinessAwayMessageScheduleOutsideOfOpeningHours]
  /// * [BusinessAwayMessageScheduleCustom]
  factory BusinessAwayMessageSchedule.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BusinessAwayMessageScheduleAlways.defaultObjectId:
        return BusinessAwayMessageScheduleAlways.fromJson(json);
      case BusinessAwayMessageScheduleOutsideOfOpeningHours.defaultObjectId:
        return BusinessAwayMessageScheduleOutsideOfOpeningHours.fromJson(json);
      case BusinessAwayMessageScheduleCustom.defaultObjectId:
        return BusinessAwayMessageScheduleCustom.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BusinessAwayMessageSchedule)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BusinessAwayMessageSchedule copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'businessAwayMessageSchedule';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessAwayMessageScheduleAlways** *(businessAwayMessageScheduleAlways)* - child of BusinessAwayMessageSchedule
///
/// Send away messages always.
final class BusinessAwayMessageScheduleAlways
    extends BusinessAwayMessageSchedule {
  /// **BusinessAwayMessageScheduleAlways** *(businessAwayMessageScheduleAlways)* - child of BusinessAwayMessageSchedule
  ///
  /// Send away messages always.
  const BusinessAwayMessageScheduleAlways();

  /// Parse from a json
  factory BusinessAwayMessageScheduleAlways.fromJson(
          Map<String, dynamic> json) =>
      const BusinessAwayMessageScheduleAlways();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessAwayMessageScheduleAlways copyWith() =>
      const BusinessAwayMessageScheduleAlways();

  /// TDLib object type
  static const String defaultObjectId = 'businessAwayMessageScheduleAlways';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessAwayMessageScheduleOutsideOfOpeningHours** *(businessAwayMessageScheduleOutsideOfOpeningHours)* - child of BusinessAwayMessageSchedule
///
/// Send away messages outside of the business opening hours.
final class BusinessAwayMessageScheduleOutsideOfOpeningHours
    extends BusinessAwayMessageSchedule {
  /// **BusinessAwayMessageScheduleOutsideOfOpeningHours** *(businessAwayMessageScheduleOutsideOfOpeningHours)* - child of BusinessAwayMessageSchedule
  ///
  /// Send away messages outside of the business opening hours.
  const BusinessAwayMessageScheduleOutsideOfOpeningHours();

  /// Parse from a json
  factory BusinessAwayMessageScheduleOutsideOfOpeningHours.fromJson(
          Map<String, dynamic> json) =>
      const BusinessAwayMessageScheduleOutsideOfOpeningHours();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessAwayMessageScheduleOutsideOfOpeningHours copyWith() =>
      const BusinessAwayMessageScheduleOutsideOfOpeningHours();

  /// TDLib object type
  static const String defaultObjectId =
      'businessAwayMessageScheduleOutsideOfOpeningHours';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessAwayMessageScheduleCustom** *(businessAwayMessageScheduleCustom)* - child of BusinessAwayMessageSchedule
///
/// Send away messages only in the specified time span.
///
/// * [startDate]: Point in time (Unix timestamp) when the away messages will start to be sent.
/// * [endDate]: Point in time (Unix timestamp) when the away messages will stop to be sent.
final class BusinessAwayMessageScheduleCustom
    extends BusinessAwayMessageSchedule {
  /// **BusinessAwayMessageScheduleCustom** *(businessAwayMessageScheduleCustom)* - child of BusinessAwayMessageSchedule
  ///
  /// Send away messages only in the specified time span.
  ///
  /// * [startDate]: Point in time (Unix timestamp) when the away messages will start to be sent.
  /// * [endDate]: Point in time (Unix timestamp) when the away messages will stop to be sent.
  const BusinessAwayMessageScheduleCustom({
    required this.startDate,
    required this.endDate,
  });

  /// Point in time (Unix timestamp) when the away messages will start to be sent
  final int startDate;

  /// Point in time (Unix timestamp) when the away messages will stop to be sent
  final int endDate;

  /// Parse from a json
  factory BusinessAwayMessageScheduleCustom.fromJson(
          Map<String, dynamic> json) =>
      BusinessAwayMessageScheduleCustom(
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
  /// * [start_date]: Point in time (Unix timestamp) when the away messages will start to be sent
  /// * [end_date]: Point in time (Unix timestamp) when the away messages will stop to be sent
  @override
  BusinessAwayMessageScheduleCustom copyWith({
    int? startDate,
    int? endDate,
  }) =>
      BusinessAwayMessageScheduleCustom(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessAwayMessageScheduleCustom';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
