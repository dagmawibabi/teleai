part of '../tdapi.dart';

/// **ViewVideoMessageAdvertisement** *(viewVideoMessageAdvertisement)* - TDLib function
///
/// Informs TDLib that the user viewed a video message advertisement.
///
/// * [advertisementUniqueId]: Unique identifier of the advertisement.
///
/// [Ok] is returned on completion.
final class ViewVideoMessageAdvertisement extends TdFunction {
  /// **ViewVideoMessageAdvertisement** *(viewVideoMessageAdvertisement)* - TDLib function
  ///
  /// Informs TDLib that the user viewed a video message advertisement.
  ///
  /// * [advertisementUniqueId]: Unique identifier of the advertisement.
  ///
  /// [Ok] is returned on completion.
  const ViewVideoMessageAdvertisement({
    required this.advertisementUniqueId,
  });

  /// Unique identifier of the advertisement
  final int advertisementUniqueId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "advertisement_unique_id": advertisementUniqueId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [advertisement_unique_id]: Unique identifier of the advertisement
  ViewVideoMessageAdvertisement copyWith({
    int? advertisementUniqueId,
  }) =>
      ViewVideoMessageAdvertisement(
        advertisementUniqueId:
            advertisementUniqueId ?? this.advertisementUniqueId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'viewVideoMessageAdvertisement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
