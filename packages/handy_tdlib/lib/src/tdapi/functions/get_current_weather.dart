part of '../tdapi.dart';

/// **GetCurrentWeather** *(getCurrentWeather)* - TDLib function
///
/// Returns the current weather in the given location.
///
/// * [location]: The location.
///
/// [CurrentWeather] is returned on completion.
final class GetCurrentWeather extends TdFunction {
  /// **GetCurrentWeather** *(getCurrentWeather)* - TDLib function
  ///
  /// Returns the current weather in the given location.
  ///
  /// * [location]: The location.
  ///
  /// [CurrentWeather] is returned on completion.
  const GetCurrentWeather({
    required this.location,
  });

  /// The location
  final Location location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "location": location.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [location]: The location
  GetCurrentWeather copyWith({
    Location? location,
  }) =>
      GetCurrentWeather(
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCurrentWeather';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
