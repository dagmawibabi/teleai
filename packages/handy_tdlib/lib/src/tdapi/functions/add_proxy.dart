part of '../tdapi.dart';

/// **AddProxy** *(addProxy)* - TDLib function
///
/// Adds a proxy server for network requests. Can be called before authorization.
///
/// * [proxy]: The proxy to add.
/// * [enable]: Pass true to immediately enable the proxy.
/// * [comment]: Comment to set for the proxy.
///
/// [AddedProxy] is returned on completion.
final class AddProxy extends TdFunction {
  /// **AddProxy** *(addProxy)* - TDLib function
  ///
  /// Adds a proxy server for network requests. Can be called before authorization.
  ///
  /// * [proxy]: The proxy to add.
  /// * [enable]: Pass true to immediately enable the proxy.
  /// * [comment]: Comment to set for the proxy.
  ///
  /// [AddedProxy] is returned on completion.
  const AddProxy({
    required this.proxy,
    required this.enable,
    required this.comment,
  });

  /// The proxy to add
  final Proxy proxy;

  /// Pass true to immediately enable the proxy
  final bool enable;

  /// Comment to set for the proxy
  final String comment;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proxy": proxy.toJson(),
      "enable": enable,
      "comment": comment,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy]: The proxy to add
  /// * [enable]: Pass true to immediately enable the proxy
  /// * [comment]: Comment to set for the proxy
  AddProxy copyWith({
    Proxy? proxy,
    bool? enable,
    String? comment,
  }) =>
      AddProxy(
        proxy: proxy ?? this.proxy,
        enable: enable ?? this.enable,
        comment: comment ?? this.comment,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
