part of '../tdapi.dart';

/// **TonConnectSession** *(tonConnectSession)* - basic class
///
/// Represents a TON Connect session. See https://github.com/ton-blockchain/ton-connect/tree/main/spec for full TON Connect protocol documentation.
///
/// * [id]: Unique identifier of the session.
/// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
/// * [walletClientId]: Hex-encoded public X25519 key of the current user's application; may be empty if none.
/// * [creationDate]: Point in time (Unix timestamp) when the session was created.
/// * [manifest]: Manifest of the dApp.
/// * [nonce]: Nonce used for the session.
/// * [state]: Session state.
final class TonConnectSession extends TdObject {
  /// **TonConnectSession** *(tonConnectSession)* - basic class
  ///
  /// Represents a TON Connect session. See https://github.com/ton-blockchain/ton-connect/tree/main/spec for full TON Connect protocol documentation.
  ///
  /// * [id]: Unique identifier of the session.
  /// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
  /// * [walletClientId]: Hex-encoded public X25519 key of the current user's application; may be empty if none.
  /// * [creationDate]: Point in time (Unix timestamp) when the session was created.
  /// * [manifest]: Manifest of the dApp.
  /// * [nonce]: Nonce used for the session.
  /// * [state]: Session state.
  const TonConnectSession({
    required this.id,
    required this.dappClientId,
    required this.walletClientId,
    required this.creationDate,
    required this.manifest,
    required this.nonce,
    required this.state,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the session
  final int id;

  /// Hex-encoded public X25519 key of the dApp
  final String dappClientId;

  /// Hex-encoded public X25519 key of the current user's application; may be empty if none
  final String walletClientId;

  /// Point in time (Unix timestamp) when the session was created
  final int creationDate;

  /// Manifest of the dApp
  final TonConnectManifest manifest;

  /// Nonce used for the session
  final String nonce;

  /// Session state
  final TonConnectSessionState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonConnectSession.fromJson(Map<String, dynamic> json) =>
      TonConnectSession(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        dappClientId: json['dapp_client_id'],
        walletClientId: json['wallet_client_id'],
        creationDate: json['creation_date'],
        manifest: TonConnectManifest.fromJson(json['manifest']),
        nonce: json['nonce'],
        state: TonConnectSessionState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "dapp_client_id": dappClientId,
      "wallet_client_id": walletClientId,
      "creation_date": creationDate,
      "manifest": manifest.toJson(),
      "nonce": nonce,
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the session
  /// * [dapp_client_id]: Hex-encoded public X25519 key of the dApp
  /// * [wallet_client_id]: Hex-encoded public X25519 key of the current user's application; may be empty if none
  /// * [creation_date]: Point in time (Unix timestamp) when the session was created
  /// * [manifest]: Manifest of the dApp
  /// * [nonce]: Nonce used for the session
  /// * [state]: Session state
  TonConnectSession copyWith({
    int? id,
    String? dappClientId,
    String? walletClientId,
    int? creationDate,
    TonConnectManifest? manifest,
    String? nonce,
    TonConnectSessionState? state,
    dynamic extra,
    int? clientId,
  }) =>
      TonConnectSession(
        id: id ?? this.id,
        dappClientId: dappClientId ?? this.dappClientId,
        walletClientId: walletClientId ?? this.walletClientId,
        creationDate: creationDate ?? this.creationDate,
        manifest: manifest ?? this.manifest,
        nonce: nonce ?? this.nonce,
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
