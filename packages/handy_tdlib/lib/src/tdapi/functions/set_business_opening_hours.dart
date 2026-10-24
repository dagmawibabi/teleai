part of '../tdapi.dart';

/// **SetBusinessOpeningHours** *(setBusinessOpeningHours)* - TDLib function
///
/// Changes the business opening hours of the current user. Requires Telegram Business subscription.
///
/// * [openingHours]: The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBusinessOpeningHours extends TdFunction {
  /// **SetBusinessOpeningHours** *(setBusinessOpeningHours)* - TDLib function
  ///
  /// Changes the business opening hours of the current user. Requires Telegram Business subscription.
  ///
  /// * [openingHours]: The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessOpeningHours({
    this.openingHours,
  });

  /// The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified
  final BusinessOpeningHours? openingHours;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "opening_hours": openingHours?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [opening_hours]: The new opening hours of the business; pass null to remove the opening hours; up to 28 time intervals can be specified
  SetBusinessOpeningHours copyWith({
    BusinessOpeningHours? openingHours,
  }) =>
      SetBusinessOpeningHours(
        openingHours: openingHours ?? this.openingHours,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessOpeningHours';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
