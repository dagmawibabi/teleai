part of '../tdapi.dart';

/// **EditProxy** *(editProxy)* - TDLib function
///
/// Edits an existing proxy server for network requests. Can be called before authorization.
///
/// * [proxyId]: Proxy identifier.
/// * [proxy]: The new information about the proxy.
/// * [enable]: Pass true to immediately enable the proxy.
/// * [comment]: New comment for the proxy.
///
/// [AddedProxy] is returned on completion.
final class EditProxy extends TdFunction {
  /// **EditProxy** *(editProxy)* - TDLib function
  ///
  /// Edits an existing proxy server for network requests. Can be called before authorization.
  ///
  /// * [proxyId]: Proxy identifier.
  /// * [proxy]: The new information about the proxy.
  /// * [enable]: Pass true to immediately enable the proxy.
  /// * [comment]: New comment for the proxy.
  ///
  /// [AddedProxy] is returned on completion.
  const EditProxy({
    required this.proxyId,
    required this.proxy,
    required this.enable,
    required this.comment,
  });

  /// Proxy identifier
  final int proxyId;

  /// The new information about the proxy
  final Proxy proxy;

  /// Pass true to immediately enable the proxy
  final bool enable;

  /// New comment for the proxy
  final String comment;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proxy_id": proxyId,
      "proxy": proxy.toJson(),
      "enable": enable,
      "comment": comment,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy_id]: Proxy identifier
  /// * [proxy]: The new information about the proxy
  /// * [enable]: Pass true to immediately enable the proxy
  /// * [comment]: New comment for the proxy
  EditProxy copyWith({
    int? proxyId,
    Proxy? proxy,
    bool? enable,
    String? comment,
  }) =>
      EditProxy(
        proxyId: proxyId ?? this.proxyId,
        proxy: proxy ?? this.proxy,
        enable: enable ?? this.enable,
        comment: comment ?? this.comment,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
