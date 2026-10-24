part of '../tdapi.dart';

/// **OnRampPaymentAvailability** *(onRampPaymentAvailability)* - basic class
///
/// Describes availability of cryptocurrency purchase through an on-ramp provider.
///
/// * [isAllowed]: True, if the current user can use the provider.
/// * [isPurchaseAllowed]: True, if the current user can purchase through the provider.
/// * [methods]: The list of available payment methods.
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code of the current user's country.
/// * [state]: Code of the state of the current user; may be empty if unknown.
final class OnRampPaymentAvailability extends TdObject {
  /// **OnRampPaymentAvailability** *(onRampPaymentAvailability)* - basic class
  ///
  /// Describes availability of cryptocurrency purchase through an on-ramp provider.
  ///
  /// * [isAllowed]: True, if the current user can use the provider.
  /// * [isPurchaseAllowed]: True, if the current user can purchase through the provider.
  /// * [methods]: The list of available payment methods.
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code of the current user's country.
  /// * [state]: Code of the state of the current user; may be empty if unknown.
  const OnRampPaymentAvailability({
    required this.isAllowed,
    required this.isPurchaseAllowed,
    required this.methods,
    required this.countryCode,
    required this.state,
    this.extra,
    this.clientId,
  });

  /// True, if the current user can use the provider
  final bool isAllowed;

  /// True, if the current user can purchase through the provider
  final bool isPurchaseAllowed;

  /// The list of available payment methods
  final List<OnRampPaymentMethod> methods;

  /// A two-letter ISO 3166-1 alpha-2 country code of the current user's country
  final String countryCode;

  /// Code of the state of the current user; may be empty if unknown
  final String state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OnRampPaymentAvailability.fromJson(Map<String, dynamic> json) =>
      OnRampPaymentAvailability(
        isAllowed: json['is_allowed'],
        isPurchaseAllowed: json['is_purchase_allowed'],
        methods: List<OnRampPaymentMethod>.from((json['methods'] ?? [])
            .map((item) => OnRampPaymentMethod.fromJson(item))
            .toList()),
        countryCode: json['country_code'],
        state: json['state'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_allowed": isAllowed,
      "is_purchase_allowed": isPurchaseAllowed,
      "methods": methods.map((i) => i.toJson()).toList(),
      "country_code": countryCode,
      "state": state,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_allowed]: True, if the current user can use the provider
  /// * [is_purchase_allowed]: True, if the current user can purchase through the provider
  /// * [methods]: The list of available payment methods
  /// * [country_code]: A two-letter ISO 3166-1 alpha-2 country code of the current user's country
  /// * [state]: Code of the state of the current user; may be empty if unknown
  OnRampPaymentAvailability copyWith({
    bool? isAllowed,
    bool? isPurchaseAllowed,
    List<OnRampPaymentMethod>? methods,
    String? countryCode,
    String? state,
    dynamic extra,
    int? clientId,
  }) =>
      OnRampPaymentAvailability(
        isAllowed: isAllowed ?? this.isAllowed,
        isPurchaseAllowed: isPurchaseAllowed ?? this.isPurchaseAllowed,
        methods: methods ?? this.methods,
        countryCode: countryCode ?? this.countryCode,
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampPaymentAvailability';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
