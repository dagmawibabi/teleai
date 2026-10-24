part of '../tdapi.dart';

/// **GetPremiumLimit** *(getPremiumLimit)* - TDLib function
///
/// Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown.
///
/// * [limitType]: Type of the limit.
///
/// [PremiumLimit] is returned on completion.
final class GetPremiumLimit extends TdFunction {
  /// **GetPremiumLimit** *(getPremiumLimit)* - TDLib function
  ///
  /// Returns information about a limit, increased for Premium users. Returns a 404 error if the limit is unknown.
  ///
  /// * [limitType]: Type of the limit.
  ///
  /// [PremiumLimit] is returned on completion.
  const GetPremiumLimit({
    required this.limitType,
  });

  /// Type of the limit
  final PremiumLimitType limitType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "limit_type": limitType.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [limit_type]: Type of the limit
  GetPremiumLimit copyWith({
    PremiumLimitType? limitType,
  }) =>
      GetPremiumLimit(
        limitType: limitType ?? this.limitType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumLimit';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
