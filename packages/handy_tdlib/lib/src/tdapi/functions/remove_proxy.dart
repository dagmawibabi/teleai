part of '../tdapi.dart';

/// **RemoveProxy** *(removeProxy)* - TDLib function
///
/// Removes a proxy server. Can be called before authorization.
///
/// * [proxyId]: Proxy identifier.
///
/// [Ok] is returned on completion.
final class RemoveProxy extends TdFunction {
  /// **RemoveProxy** *(removeProxy)* - TDLib function
  ///
  /// Removes a proxy server. Can be called before authorization.
  ///
  /// * [proxyId]: Proxy identifier.
  ///
  /// [Ok] is returned on completion.
  const RemoveProxy({
    required this.proxyId,
  });

  /// Proxy identifier
  final int proxyId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proxy_id": proxyId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy_id]: Proxy identifier
  RemoveProxy copyWith({
    int? proxyId,
  }) =>
      RemoveProxy(
        proxyId: proxyId ?? this.proxyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
