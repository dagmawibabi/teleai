part of '../tdapi.dart';

/// **Countries** *(countries)* - basic class
///
/// Contains information about countries.
///
/// * [countries]: The list of countries.
final class Countries extends TdObject {
  /// **Countries** *(countries)* - basic class
  ///
  /// Contains information about countries.
  ///
  /// * [countries]: The list of countries.
  const Countries({
    required this.countries,
    this.extra,
    this.clientId,
  });

  /// The list of countries
  final List<CountryInfo> countries;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        countries: List<CountryInfo>.from((json['countries'] ?? [])
            .map((item) => CountryInfo.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "countries": countries.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [countries]: The list of countries
  Countries copyWith({
    List<CountryInfo>? countries,
    dynamic extra,
    int? clientId,
  }) =>
      Countries(
        countries: countries ?? this.countries,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'countries';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
