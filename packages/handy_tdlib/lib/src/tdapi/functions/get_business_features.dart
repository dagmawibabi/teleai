part of '../tdapi.dart';

/// **GetBusinessFeatures** *(getBusinessFeatures)* - TDLib function
///
/// Returns information about features, available to Business users.
///
/// * [source]: Source of the request; pass null if the method is called from settings or some non-standard source *(optional)*.
///
/// [BusinessFeatures] is returned on completion.
final class GetBusinessFeatures extends TdFunction {
  /// **GetBusinessFeatures** *(getBusinessFeatures)* - TDLib function
  ///
  /// Returns information about features, available to Business users.
  ///
  /// * [source]: Source of the request; pass null if the method is called from settings or some non-standard source *(optional)*.
  ///
  /// [BusinessFeatures] is returned on completion.
  const GetBusinessFeatures({
    this.source,
  });

  /// Source of the request; pass null if the method is called from settings or some non-standard source
  final BusinessFeature? source;

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
  /// * [source]: Source of the request; pass null if the method is called from settings or some non-standard source
  GetBusinessFeatures copyWith({
    BusinessFeature? source,
  }) =>
      GetBusinessFeatures(
        source: source ?? this.source,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
