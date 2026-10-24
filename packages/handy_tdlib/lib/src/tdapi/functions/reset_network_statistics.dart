part of '../tdapi.dart';

/// **ResetNetworkStatistics** *(resetNetworkStatistics)* - TDLib function
///
/// Resets all network data usage statistics to zero. Can be called before authorization.
///
/// [Ok] is returned on completion.
final class ResetNetworkStatistics extends TdFunction {
  /// **ResetNetworkStatistics** *(resetNetworkStatistics)* - TDLib function
  ///
  /// Resets all network data usage statistics to zero. Can be called before authorization.
  ///
  /// [Ok] is returned on completion.
  const ResetNetworkStatistics();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResetNetworkStatistics copyWith() => const ResetNetworkStatistics();

  /// TDLib object type
  static const String defaultObjectId = 'resetNetworkStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
