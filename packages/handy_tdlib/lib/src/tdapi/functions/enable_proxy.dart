part of '../tdapi.dart';

/// **EnableProxy** *(enableProxy)* - TDLib function
///
/// Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization.
///
/// * [proxyId]: Proxy identifier.
///
/// [Ok] is returned on completion.
final class EnableProxy extends TdFunction {
  /// **EnableProxy** *(enableProxy)* - TDLib function
  ///
  /// Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization.
  ///
  /// * [proxyId]: Proxy identifier.
  ///
  /// [Ok] is returned on completion.
  const EnableProxy({
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
  EnableProxy copyWith({
    int? proxyId,
  }) =>
      EnableProxy(
        proxyId: proxyId ?? this.proxyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'enableProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
