part of '../tdapi.dart';

/// **TestProxy** *(testProxy)* - TDLib function
///
/// Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization.
///
/// * [proxy]: The proxy to test.
/// * [dcId]: Identifier of a datacenter with which to test connection.
/// * [timeout]: The maximum overall timeout for the request.
///
/// [Ok] is returned on completion.
final class TestProxy extends TdFunction {
  /// **TestProxy** *(testProxy)* - TDLib function
  ///
  /// Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization.
  ///
  /// * [proxy]: The proxy to test.
  /// * [dcId]: Identifier of a datacenter with which to test connection.
  /// * [timeout]: The maximum overall timeout for the request.
  ///
  /// [Ok] is returned on completion.
  const TestProxy({
    required this.proxy,
    required this.dcId,
    required this.timeout,
  });

  /// The proxy to test
  final Proxy proxy;

  /// Identifier of a datacenter with which to test connection
  final int dcId;

  /// The maximum overall timeout for the request
  final double timeout;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proxy": proxy.toJson(),
      "dc_id": dcId,
      "timeout": timeout,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy]: The proxy to test
  /// * [dc_id]: Identifier of a datacenter with which to test connection
  /// * [timeout]: The maximum overall timeout for the request
  TestProxy copyWith({
    Proxy? proxy,
    int? dcId,
    double? timeout,
  }) =>
      TestProxy(
        proxy: proxy ?? this.proxy,
        dcId: dcId ?? this.dcId,
        timeout: timeout ?? this.timeout,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
