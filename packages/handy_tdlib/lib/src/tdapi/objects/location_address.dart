part of '../tdapi.dart';

/// **LocationAddress** *(locationAddress)* - basic class
///
/// Describes an address of a location.
///
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
/// * [state]: State, if applicable; empty if unknown.
/// * [city]: City; empty if unknown.
/// * [street]: The address; empty if unknown.
final class LocationAddress extends TdObject {
  /// **LocationAddress** *(locationAddress)* - basic class
  ///
  /// Describes an address of a location.
  ///
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code.
  /// * [state]: State, if applicable; empty if unknown.
  /// * [city]: City; empty if unknown.
  /// * [street]: The address; empty if unknown.
  const LocationAddress({
    required this.countryCode,
    required this.state,
    required this.city,
    required this.street,
  });

  /// A two-letter ISO 3166-1 alpha-2 country code
  final String countryCode;

  /// State, if applicable; empty if unknown
  final String state;

  /// City; empty if unknown
  final String city;

  /// The address; empty if unknown
  final String street;

  /// Parse from a json
  factory LocationAddress.fromJson(Map<String, dynamic> json) =>
      LocationAddress(
        countryCode: json['country_code'],
        state: json['state'],
        city: json['city'],
        street: json['street'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "country_code": countryCode,
      "state": state,
      "city": city,
      "street": street,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [country_code]: A two-letter ISO 3166-1 alpha-2 country code
  /// * [state]: State, if applicable; empty if unknown
  /// * [city]: City; empty if unknown
  /// * [street]: The address; empty if unknown
  LocationAddress copyWith({
    String? countryCode,
    String? state,
    String? city,
    String? street,
  }) =>
      LocationAddress(
        countryCode: countryCode ?? this.countryCode,
        state: state ?? this.state,
        city: city ?? this.city,
        street: street ?? this.street,
      );

  /// TDLib object type
  static const String defaultObjectId = 'locationAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
