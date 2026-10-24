part of '../tdapi.dart';

/// **Currencies** *(currencies)* - basic class
///
/// Represents a list of currencies.
///
/// * [currencies]: A list of ISO 4217 currency codes.
final class Currencies extends TdObject {
  /// **Currencies** *(currencies)* - basic class
  ///
  /// Represents a list of currencies.
  ///
  /// * [currencies]: A list of ISO 4217 currency codes.
  const Currencies({
    required this.currencies,
    this.extra,
    this.clientId,
  });

  /// A list of ISO 4217 currency codes
  final List<String> currencies;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        currencies: List<String>.from(
            (json['currencies'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currencies": currencies.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currencies]: A list of ISO 4217 currency codes
  Currencies copyWith({
    List<String>? currencies,
    dynamic extra,
    int? clientId,
  }) =>
      Currencies(
        currencies: currencies ?? this.currencies,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'currencies';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
