part of '../tdapi.dart';

/// **PingProxy** *(pingProxy)* - TDLib function
///
/// Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization.
///
/// * [proxy]: The proxy to test; pass null to ping a Telegram server without a proxy *(optional)*.
///
/// [Seconds] is returned on completion.
final class PingProxy extends TdFunction {
  /// **PingProxy** *(pingProxy)* - TDLib function
  ///
  /// Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization.
  ///
  /// * [proxy]: The proxy to test; pass null to ping a Telegram server without a proxy *(optional)*.
  ///
  /// [Seconds] is returned on completion.
  const PingProxy({
    this.proxy,
  });

  /// The proxy to test; pass null to ping a Telegram server without a proxy
  final Proxy? proxy;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proxy": proxy?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy]: The proxy to test; pass null to ping a Telegram server without a proxy
  PingProxy copyWith({
    Proxy? proxy,
  }) =>
      PingProxy(
        proxy: proxy ?? this.proxy,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pingProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
