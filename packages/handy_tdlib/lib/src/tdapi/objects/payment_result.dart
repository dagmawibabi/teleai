part of '../tdapi.dart';

/// **PaymentResult** *(paymentResult)* - basic class
///
/// Contains the result of a payment request.
///
/// * [success]: True, if the payment request was successful; otherwise, the verification_url will be non-empty.
/// * [verificationUrl]: URL for additional payment credentials verification.
final class PaymentResult extends TdObject {
  /// **PaymentResult** *(paymentResult)* - basic class
  ///
  /// Contains the result of a payment request.
  ///
  /// * [success]: True, if the payment request was successful; otherwise, the verification_url will be non-empty.
  /// * [verificationUrl]: URL for additional payment credentials verification.
  const PaymentResult({
    required this.success,
    required this.verificationUrl,
    this.extra,
    this.clientId,
  });

  /// True, if the payment request was successful; otherwise, the verification_url will be non-empty
  final bool success;

  /// URL for additional payment credentials verification
  final String verificationUrl;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PaymentResult.fromJson(Map<String, dynamic> json) => PaymentResult(
        success: json['success'],
        verificationUrl: json['verification_url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "success": success,
      "verification_url": verificationUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [success]: True, if the payment request was successful; otherwise, the verification_url will be non-empty
  /// * [verification_url]: URL for additional payment credentials verification
  PaymentResult copyWith({
    bool? success,
    String? verificationUrl,
    dynamic extra,
    int? clientId,
  }) =>
      PaymentResult(
        success: success ?? this.success,
        verificationUrl: verificationUrl ?? this.verificationUrl,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
