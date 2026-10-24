part of '../tdapi.dart';

/// **ReportPhoneNumberCodeMissing** *(reportPhoneNumberCodeMissing)* - TDLib function
///
/// Reports that authentication code wasn't delivered via SMS to the specified phone number; for official mobile applications only.
///
/// * [mobileNetworkCode]: Current mobile network code.
///
/// [Ok] is returned on completion.
final class ReportPhoneNumberCodeMissing extends TdFunction {
  /// **ReportPhoneNumberCodeMissing** *(reportPhoneNumberCodeMissing)* - TDLib function
  ///
  /// Reports that authentication code wasn't delivered via SMS to the specified phone number; for official mobile applications only.
  ///
  /// * [mobileNetworkCode]: Current mobile network code.
  ///
  /// [Ok] is returned on completion.
  const ReportPhoneNumberCodeMissing({
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
  ReportPhoneNumberCodeMissing copyWith({
    String? mobileNetworkCode,
  }) =>
      ReportPhoneNumberCodeMissing(
        mobileNetworkCode: mobileNetworkCode ?? this.mobileNetworkCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportPhoneNumberCodeMissing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
