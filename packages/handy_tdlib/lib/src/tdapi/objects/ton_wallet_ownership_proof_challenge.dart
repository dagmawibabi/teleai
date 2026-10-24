part of '../tdapi.dart';

/// **TonWalletOwnershipProofChallenge** *(tonWalletOwnershipProofChallenge)* - basic class
///
/// Represents a challenge for TON wallet ownership proof.
///
/// * [payload]: Payload of the challenge.
/// * [domain]: Domain of the proof requester.
final class TonWalletOwnershipProofChallenge extends TdObject {
  /// **TonWalletOwnershipProofChallenge** *(tonWalletOwnershipProofChallenge)* - basic class
  ///
  /// Represents a challenge for TON wallet ownership proof.
  ///
  /// * [payload]: Payload of the challenge.
  /// * [domain]: Domain of the proof requester.
  const TonWalletOwnershipProofChallenge({
    required this.payload,
    required this.domain,
    this.extra,
    this.clientId,
  });

  /// Payload of the challenge
  final String payload;

  /// Domain of the proof requester
  final String domain;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletOwnershipProofChallenge.fromJson(
          Map<String, dynamic> json) =>
      TonWalletOwnershipProofChallenge(
        payload: json['payload'],
        domain: json['domain'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payload": payload,
      "domain": domain,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payload]: Payload of the challenge
  /// * [domain]: Domain of the proof requester
  TonWalletOwnershipProofChallenge copyWith({
    String? payload,
    String? domain,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletOwnershipProofChallenge(
        payload: payload ?? this.payload,
        domain: domain ?? this.domain,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletOwnershipProofChallenge';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
