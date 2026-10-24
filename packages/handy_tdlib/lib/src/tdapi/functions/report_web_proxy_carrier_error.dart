part of '../tdapi.dart';

/// **ReportWebProxyCarrierError** *(reportWebProxyCarrierError)* - TDLib function
///
/// Reports that a web proxy carrier failed. TDLib closes the carrier and decides whether and when to request a new one. Can be called before authorization.
///
/// * [carrierId]: Identifier of the carrier.
/// * [error]: The error.
///
/// [Ok] is returned on completion.
final class ReportWebProxyCarrierError extends TdFunction {
  /// **ReportWebProxyCarrierError** *(reportWebProxyCarrierError)* - TDLib function
  ///
  /// Reports that a web proxy carrier failed. TDLib closes the carrier and decides whether and when to request a new one. Can be called before authorization.
  ///
  /// * [carrierId]: Identifier of the carrier.
  /// * [error]: The error.
  ///
  /// [Ok] is returned on completion.
  const ReportWebProxyCarrierError({
    required this.carrierId,
    required this.error,
  });

  /// Identifier of the carrier
  final int carrierId;

  /// The error
  final WebProxyCarrierError error;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "carrier_id": carrierId,
      "error": error.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [carrier_id]: Identifier of the carrier
  /// * [error]: The error
  ReportWebProxyCarrierError copyWith({
    int? carrierId,
    WebProxyCarrierError? error,
  }) =>
      ReportWebProxyCarrierError(
        carrierId: carrierId ?? this.carrierId,
        error: error ?? this.error,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportWebProxyCarrierError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
