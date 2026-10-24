part of '../tdapi.dart';

/// **GetPremiumFeatures** *(getPremiumFeatures)* - TDLib function
///
/// Returns information about features, available to Premium users.
///
/// * [source]: Source of the request; pass null if the method is called from some non-standard source *(optional)*.
///
/// [PremiumFeatures] is returned on completion.
final class GetPremiumFeatures extends TdFunction {
  /// **GetPremiumFeatures** *(getPremiumFeatures)* - TDLib function
  ///
  /// Returns information about features, available to Premium users.
  ///
  /// * [source]: Source of the request; pass null if the method is called from some non-standard source *(optional)*.
  ///
  /// [PremiumFeatures] is returned on completion.
  const GetPremiumFeatures({
    this.source,
  });

  /// Source of the request; pass null if the method is called from some non-standard source
  final PremiumSource? source;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "source": source?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [source]: Source of the request; pass null if the method is called from some non-standard source
  GetPremiumFeatures copyWith({
    PremiumSource? source,
  }) =>
      GetPremiumFeatures(
        source: source ?? this.source,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
