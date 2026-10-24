part of '../tdapi.dart';

/// **TonConnectConnectRequest** *(tonConnectConnectRequest)* - basic class
///
/// Contains information about a request to connect the user's TON wallet to a dApp using TON Connect.
///
/// * [manifestUrl]: URL of the manifest of the dApp.
/// * [items]: Items requested from the wallet.
final class TonConnectConnectRequest extends TdObject {
  /// **TonConnectConnectRequest** *(tonConnectConnectRequest)* - basic class
  ///
  /// Contains information about a request to connect the user's TON wallet to a dApp using TON Connect.
  ///
  /// * [manifestUrl]: URL of the manifest of the dApp.
  /// * [items]: Items requested from the wallet.
  const TonConnectConnectRequest({
    required this.manifestUrl,
    required this.items,
  });

  /// URL of the manifest of the dApp
  final String manifestUrl;

  /// Items requested from the wallet
  final List<TonConnectConnectItem> items;

  /// Parse from a json
  factory TonConnectConnectRequest.fromJson(Map<String, dynamic> json) =>
      TonConnectConnectRequest(
        manifestUrl: json['manifest_url'],
        items: List<TonConnectConnectItem>.from((json['items'] ?? [])
            .map((item) => TonConnectConnectItem.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "manifest_url": manifestUrl,
      "items": items.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [manifest_url]: URL of the manifest of the dApp
  /// * [items]: Items requested from the wallet
  TonConnectConnectRequest copyWith({
    String? manifestUrl,
    List<TonConnectConnectItem>? items,
  }) =>
      TonConnectConnectRequest(
        manifestUrl: manifestUrl ?? this.manifestUrl,
        items: items ?? this.items,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
