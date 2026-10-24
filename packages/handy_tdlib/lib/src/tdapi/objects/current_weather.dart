part of '../tdapi.dart';

/// **CurrentWeather** *(currentWeather)* - basic class
///
/// Describes the current weather.
///
/// * [temperature]: Temperature, in degree Celsius.
/// * [emoji]: Emoji representing the weather.
final class CurrentWeather extends TdObject {
  /// **CurrentWeather** *(currentWeather)* - basic class
  ///
  /// Describes the current weather.
  ///
  /// * [temperature]: Temperature, in degree Celsius.
  /// * [emoji]: Emoji representing the weather.
  const CurrentWeather({
    required this.temperature,
    required this.emoji,
    this.extra,
    this.clientId,
  });

  /// Temperature, in degree Celsius
  final double temperature;

  /// Emoji representing the weather
  final String emoji;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json['temperature'],
        emoji: json['emoji'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "temperature": temperature,
      "emoji": emoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [temperature]: Temperature, in degree Celsius
  /// * [emoji]: Emoji representing the weather
  CurrentWeather copyWith({
    double? temperature,
    String? emoji,
    dynamic extra,
    int? clientId,
  }) =>
      CurrentWeather(
        temperature: temperature ?? this.temperature,
        emoji: emoji ?? this.emoji,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'currentWeather';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
