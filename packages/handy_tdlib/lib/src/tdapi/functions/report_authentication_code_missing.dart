part of '../tdapi.dart';

/// **ReportAuthenticationCodeMissing** *(reportAuthenticationCodeMissing)* - TDLib function
///
/// Reports that authentication code wasn't delivered via SMS; for official mobile applications only. Works only when the current authorization state is authorizationStateWaitCode.
///
/// * [mobileNetworkCode]: Current mobile network code.
///
/// [Ok] is returned on completion.
final class ReportAuthenticationCodeMissing extends TdFunction {
  /// **ReportAuthenticationCodeMissing** *(reportAuthenticationCodeMissing)* - TDLib function
  ///
  /// Reports that authentication code wasn't delivered via SMS; for official mobile applications only. Works only when the current authorization state is authorizationStateWaitCode.
  ///
  /// * [mobileNetworkCode]: Current mobile network code.
  ///
  /// [Ok] is returned on completion.
  const ReportAuthenticationCodeMissing({
    required this.mobileNetworkCode,
  });

  /// Current mobile network code
  final String mobileNetworkCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "mobile_network_code": mobileNetworkCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [mobile_network_code]: Current mobile network code
  ReportAuthenticationCodeMissing copyWith({
    String? mobileNetworkCode,
  }) =>
      ReportAuthenticationCodeMissing(
        mobileNetworkCode: mobileNetworkCode ?? this.mobileNetworkCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportAuthenticationCodeMissing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
