part of '../tdapi.dart';

/// **SetBusinessLocation** *(setBusinessLocation)* - TDLib function
///
/// Changes the business location of the current user. Requires Telegram Business subscription.
///
/// * [location]: The new location of the business; pass null to remove the location *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBusinessLocation extends TdFunction {
  /// **SetBusinessLocation** *(setBusinessLocation)* - TDLib function
  ///
  /// Changes the business location of the current user. Requires Telegram Business subscription.
  ///
  /// * [location]: The new location of the business; pass null to remove the location *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessLocation({
    this.location,
  });

  /// The new location of the business; pass null to remove the location
  final BusinessLocation? location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "location": location?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The new location of the business; pass null to remove the location
  SetBusinessLocation copyWith({
    BusinessLocation? location,
  }) =>
      SetBusinessLocation(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
