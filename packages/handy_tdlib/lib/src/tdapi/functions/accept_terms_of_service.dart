part of '../tdapi.dart';

/// **AcceptTermsOfService** *(acceptTermsOfService)* - TDLib function
///
/// Accepts Telegram terms of service.
///
/// * [termsOfServiceId]: Terms of service identifier.
///
/// [Ok] is returned on completion.
final class AcceptTermsOfService extends TdFunction {
  /// **AcceptTermsOfService** *(acceptTermsOfService)* - TDLib function
  ///
  /// Accepts Telegram terms of service.
  ///
  /// * [termsOfServiceId]: Terms of service identifier.
  ///
  /// [Ok] is returned on completion.
  const AcceptTermsOfService({
    required this.termsOfServiceId,
  });

  /// Terms of service identifier
  final String termsOfServiceId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "terms_of_service_id": termsOfServiceId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [terms_of_service_id]: Terms of service identifier
  AcceptTermsOfService copyWith({
    String? termsOfServiceId,
  }) =>
      AcceptTermsOfService(
        termsOfServiceId: termsOfServiceId ?? this.termsOfServiceId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'acceptTermsOfService';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
