part of '../tdapi.dart';

/// **CallServer** *(callServer)* - basic class
///
/// Describes a server for relaying call data.
///
/// * [id]: Server identifier.
/// * [ipAddress]: Server IPv4 address.
/// * [ipv6Address]: Server IPv6 address.
/// * [port]: Server port number.
/// * [type]: Server type.
final class CallServer extends TdObject {
  /// **CallServer** *(callServer)* - basic class
  ///
  /// Describes a server for relaying call data.
  ///
  /// * [id]: Server identifier.
  /// * [ipAddress]: Server IPv4 address.
  /// * [ipv6Address]: Server IPv6 address.
  /// * [port]: Server port number.
  /// * [type]: Server type.
  const CallServer({
    required this.id,
    required this.ipAddress,
    required this.ipv6Address,
    required this.port,
    required this.type,
  });

  /// Server identifier
  final int id;

  /// Server IPv4 address
  final String ipAddress;

  /// Server IPv6 address
  final String ipv6Address;

  /// Server port number
  final int port;

  /// Server type
  final CallServerType type;

  /// Parse from a json
  factory CallServer.fromJson(Map<String, dynamic> json) => CallServer(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        ipAddress: json['ip_address'],
        ipv6Address: json['ipv6_address'],
        port: json['port'],
        type: CallServerType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "ip_address": ipAddress,
      "ipv6_address": ipv6Address,
      "port": port,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Server identifier
  /// * [ip_address]: Server IPv4 address
  /// * [ipv6_address]: Server IPv6 address
  /// * [port]: Server port number
  /// * [type]: Server type
  CallServer copyWith({
    int? id,
    String? ipAddress,
    String? ipv6Address,
    int? port,
    CallServerType? type,
  }) =>
      CallServer(
        id: id ?? this.id,
        ipAddress: ipAddress ?? this.ipAddress,
        ipv6Address: ipv6Address ?? this.ipv6Address,
        port: port ?? this.port,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callServer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
