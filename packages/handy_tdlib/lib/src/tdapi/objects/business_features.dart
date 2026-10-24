part of '../tdapi.dart';

/// **BusinessFeatures** *(businessFeatures)* - basic class
///
/// Contains information about features, available to Business user accounts.
///
/// * [features]: The list of available business features.
final class BusinessFeatures extends TdObject {
  /// **BusinessFeatures** *(businessFeatures)* - basic class
  ///
  /// Contains information about features, available to Business user accounts.
  ///
  /// * [features]: The list of available business features.
  const BusinessFeatures({
    required this.features,
    this.extra,
    this.clientId,
  });

  /// The list of available business features
  final List<BusinessFeature> features;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessFeatures.fromJson(Map<String, dynamic> json) =>
      BusinessFeatures(
        features: List<BusinessFeature>.from((json['features'] ?? [])
            .map((item) => BusinessFeature.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "features": features.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [features]: The list of available business features
  BusinessFeatures copyWith({
    List<BusinessFeature>? features,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessFeatures(
        features: features ?? this.features,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
