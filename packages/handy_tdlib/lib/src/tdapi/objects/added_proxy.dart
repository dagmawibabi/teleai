part of '../tdapi.dart';

/// **AddedProxy** *(addedProxy)* - basic class
///
/// Contains information about a proxy server added to the list of proxies.
///
/// * [id]: Unique identifier of the proxy.
/// * [lastUsedDate]: Point in time (Unix timestamp) when the proxy was last used; 0 if never.
/// * [isEnabled]: True, if the proxy is enabled now.
/// * [comment]: Comment for the proxy added by the user.
/// * [proxy]: The proxy.
final class AddedProxy extends TdObject {
  /// **AddedProxy** *(addedProxy)* - basic class
  ///
  /// Contains information about a proxy server added to the list of proxies.
  ///
  /// * [id]: Unique identifier of the proxy.
  /// * [lastUsedDate]: Point in time (Unix timestamp) when the proxy was last used; 0 if never.
  /// * [isEnabled]: True, if the proxy is enabled now.
  /// * [comment]: Comment for the proxy added by the user.
  /// * [proxy]: The proxy.
  const AddedProxy({
    required this.id,
    required this.lastUsedDate,
    required this.isEnabled,
    required this.comment,
    required this.proxy,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the proxy
  final int id;

  /// Point in time (Unix timestamp) when the proxy was last used; 0 if never
  final int lastUsedDate;

  /// True, if the proxy is enabled now
  final bool isEnabled;

  /// Comment for the proxy added by the user
  final String comment;

  /// The proxy
  final Proxy proxy;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AddedProxy.fromJson(Map<String, dynamic> json) => AddedProxy(
        id: json['id'],
        lastUsedDate: json['last_used_date'],
        isEnabled: json['is_enabled'],
        comment: json['comment'],
        proxy: Proxy.fromJson(json['proxy']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "last_used_date": lastUsedDate,
      "is_enabled": isEnabled,
      "comment": comment,
      "proxy": proxy.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the proxy
  /// * [last_used_date]: Point in time (Unix timestamp) when the proxy was last used; 0 if never
  /// * [is_enabled]: True, if the proxy is enabled now
  /// * [comment]: Comment for the proxy added by the user
  /// * [proxy]: The proxy
  AddedProxy copyWith({
    int? id,
    int? lastUsedDate,
    bool? isEnabled,
    String? comment,
    Proxy? proxy,
    dynamic extra,
    int? clientId,
  }) =>
      AddedProxy(
        id: id ?? this.id,
        lastUsedDate: lastUsedDate ?? this.lastUsedDate,
        isEnabled: isEnabled ?? this.isEnabled,
        comment: comment ?? this.comment,
        proxy: proxy ?? this.proxy,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addedProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
