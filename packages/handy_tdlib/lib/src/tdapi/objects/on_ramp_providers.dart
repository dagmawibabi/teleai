part of '../tdapi.dart';

/// **OnRampProviders** *(onRampProviders)* - basic class
///
/// Represents a list of on-ramp providers.
///
/// * [providers]: A list of providers.
final class OnRampProviders extends TdObject {
  /// **OnRampProviders** *(onRampProviders)* - basic class
  ///
  /// Represents a list of on-ramp providers.
  ///
  /// * [providers]: A list of providers.
  const OnRampProviders({
    required this.providers,
    this.extra,
    this.clientId,
  });

  /// A list of providers
  final List<OnRampProvider> providers;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OnRampProviders.fromJson(Map<String, dynamic> json) =>
      OnRampProviders(
        providers: List<OnRampProvider>.from((json['providers'] ?? [])
            .map((item) => OnRampProvider.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "providers": providers.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [providers]: A list of providers
  OnRampProviders copyWith({
    List<OnRampProvider>? providers,
    dynamic extra,
    int? clientId,
  }) =>
      OnRampProviders(
        providers: providers ?? this.providers,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampProviders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
