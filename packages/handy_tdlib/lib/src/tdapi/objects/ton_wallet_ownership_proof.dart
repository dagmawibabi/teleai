part of '../tdapi.dart';

/// **TonWalletOwnershipProof** *(tonWalletOwnershipProof)* - basic class
///
/// Represents a proof of TON wallet ownership.
///
/// * [publicKey]: Public key of the wallet.
/// * [timestamp]: The current UNIX timestamp which was used to create the proof.
/// * [signature]: The signature proving the ownership.
final class TonWalletOwnershipProof extends TdObject {
  /// **TonWalletOwnershipProof** *(tonWalletOwnershipProof)* - basic class
  ///
  /// Represents a proof of TON wallet ownership.
  ///
  /// * [publicKey]: Public key of the wallet.
  /// * [timestamp]: The current UNIX timestamp which was used to create the proof.
  /// * [signature]: The signature proving the ownership.
  const TonWalletOwnershipProof({
    required this.publicKey,
    required this.timestamp,
    required this.signature,
  });

  /// Public key of the wallet
  final String publicKey;

  /// The current UNIX timestamp which was used to create the proof
  final int timestamp;

  /// The signature proving the ownership
  final String signature;

  /// Parse from a json
  factory TonWalletOwnershipProof.fromJson(Map<String, dynamic> json) =>
      TonWalletOwnershipProof(
        publicKey: json['public_key'],
        timestamp: json['timestamp'],
        signature: json['signature'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "public_key": publicKey,
      "timestamp": timestamp,
      "signature": signature,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [public_key]: Public key of the wallet
  /// * [timestamp]: The current UNIX timestamp which was used to create the proof
  /// * [signature]: The signature proving the ownership
  TonWalletOwnershipProof copyWith({
    String? publicKey,
    int? timestamp,
    String? signature,
  }) =>
      TonWalletOwnershipProof(
        publicKey: publicKey ?? this.publicKey,
        timestamp: timestamp ?? this.timestamp,
        signature: signature ?? this.signature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletOwnershipProof';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
