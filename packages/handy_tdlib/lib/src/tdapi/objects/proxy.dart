part of '../tdapi.dart';

/// **Proxy** *(proxy)* - basic class
///
/// Describes a proxy server.
///
/// * [server]: Proxy server domain or IP address.
/// * [port]: Proxy server port.
/// * [type]: Type of the proxy.
final class Proxy extends TdObject {
  /// **Proxy** *(proxy)* - basic class
  ///
  /// Describes a proxy server.
  ///
  /// * [server]: Proxy server domain or IP address.
  /// * [port]: Proxy server port.
  /// * [type]: Type of the proxy.
  const Proxy({
    required this.server,
    required this.port,
    required this.type,
  });

  /// Proxy server domain or IP address
  final String server;

  /// Proxy server port
  final int port;

  /// Type of the proxy
  final ProxyType type;

  /// Parse from a json
  factory Proxy.fromJson(Map<String, dynamic> json) => Proxy(
        server: json['server'],
        port: json['port'],
        type: ProxyType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "server": server,
      "port": port,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [server]: Proxy server domain or IP address
  /// * [port]: Proxy server port
  /// * [type]: Type of the proxy
  Proxy copyWith({
    String? server,
    int? port,
    ProxyType? type,
  }) =>
      Proxy(
        server: server ?? this.server,
        port: port ?? this.port,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'proxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
