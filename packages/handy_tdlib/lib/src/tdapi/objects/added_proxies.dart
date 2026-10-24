part of '../tdapi.dart';

/// **AddedProxies** *(addedProxies)* - basic class
///
/// Represents a list of added proxy servers.
///
/// * [proxies]: List of proxy servers.
final class AddedProxies extends TdObject {
  /// **AddedProxies** *(addedProxies)* - basic class
  ///
  /// Represents a list of added proxy servers.
  ///
  /// * [proxies]: List of proxy servers.
  const AddedProxies({
    required this.proxies,
    this.extra,
    this.clientId,
  });

  /// List of proxy servers
  final List<AddedProxy> proxies;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AddedProxies.fromJson(Map<String, dynamic> json) => AddedProxies(
        proxies: List<AddedProxy>.from((json['proxies'] ?? [])
            .map((item) => AddedProxy.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "proxies": proxies.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxies]: List of proxy servers
  AddedProxies copyWith({
    List<AddedProxy>? proxies,
    dynamic extra,
    int? clientId,
  }) =>
      AddedProxies(
        proxies: proxies ?? this.proxies,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addedProxies';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
