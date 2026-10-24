part of '../tdapi.dart';

/// **GetNetworkStatistics** *(getNetworkStatistics)* - TDLib function
///
/// Returns network data usage statistics. Can be called before authorization.
///
/// * [onlyCurrent]: Pass true to get statistics only for the current library launch.
///
/// [NetworkStatistics] is returned on completion.
final class GetNetworkStatistics extends TdFunction {
  /// **GetNetworkStatistics** *(getNetworkStatistics)* - TDLib function
  ///
  /// Returns network data usage statistics. Can be called before authorization.
  ///
  /// * [onlyCurrent]: Pass true to get statistics only for the current library launch.
  ///
  /// [NetworkStatistics] is returned on completion.
  const GetNetworkStatistics({
    required this.onlyCurrent,
  });

  /// Pass true to get statistics only for the current library launch
  final bool onlyCurrent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "only_current": onlyCurrent,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [only_current]: Pass true to get statistics only for the current library launch
  GetNetworkStatistics copyWith({
    bool? onlyCurrent,
  }) =>
      GetNetworkStatistics(
        onlyCurrent: onlyCurrent ?? this.onlyCurrent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getNetworkStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
