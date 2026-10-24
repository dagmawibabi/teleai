part of '../tdapi.dart';

/// **ReportVideoMessageAdvertisement** *(reportVideoMessageAdvertisement)* - TDLib function
///
/// Reports a video message advertisement to Telegram moderators.
///
/// * [advertisementUniqueId]: Unique identifier of the advertisement.
/// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
///
/// [ReportSponsoredResult] is returned on completion.
final class ReportVideoMessageAdvertisement extends TdFunction {
  /// **ReportVideoMessageAdvertisement** *(reportVideoMessageAdvertisement)* - TDLib function
  ///
  /// Reports a video message advertisement to Telegram moderators.
  ///
  /// * [advertisementUniqueId]: Unique identifier of the advertisement.
  /// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
  ///
  /// [ReportSponsoredResult] is returned on completion.
  const ReportVideoMessageAdvertisement({
    required this.advertisementUniqueId,
    required this.optionId,
  });

  /// Unique identifier of the advertisement
  final int advertisementUniqueId;

  /// Option identifier chosen by the user; leave empty for the initial request
  final String optionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "advertisement_unique_id": advertisementUniqueId,
      "option_id": optionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [advertisement_unique_id]: Unique identifier of the advertisement
  /// * [option_id]: Option identifier chosen by the user; leave empty for the initial request
  ReportVideoMessageAdvertisement copyWith({
    int? advertisementUniqueId,
    String? optionId,
  }) =>
      ReportVideoMessageAdvertisement(
        advertisementUniqueId:
            advertisementUniqueId ?? this.advertisementUniqueId,
        optionId: optionId ?? this.optionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportVideoMessageAdvertisement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
