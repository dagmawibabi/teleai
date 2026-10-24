part of '../tdapi.dart';

/// **SendCustomRequest** *(sendCustomRequest)* - TDLib function
///
/// Sends a custom request; for bots only.
///
/// * [method]: The method name.
/// * [parameters]: JSON-serialized method parameters.
///
/// [CustomRequestResult] is returned on completion.
final class SendCustomRequest extends TdFunction {
  /// **SendCustomRequest** *(sendCustomRequest)* - TDLib function
  ///
  /// Sends a custom request; for bots only.
  ///
  /// * [method]: The method name.
  /// * [parameters]: JSON-serialized method parameters.
  ///
  /// [CustomRequestResult] is returned on completion.
  const SendCustomRequest({
    required this.method,
    required this.parameters,
  });

  /// The method name
  final String method;

  /// JSON-serialized method parameters
  final String parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "method": method,
      "parameters": parameters,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [method]: The method name
  /// * [parameters]: JSON-serialized method parameters
  SendCustomRequest copyWith({
    String? method,
    String? parameters,
  }) =>
      SendCustomRequest(
        method: method ?? this.method,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendCustomRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
