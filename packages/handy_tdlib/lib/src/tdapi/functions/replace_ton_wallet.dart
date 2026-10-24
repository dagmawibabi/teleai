part of '../tdapi.dart';

/// **ReplaceTonWallet** *(replaceTonWallet)* - TDLib function
///
/// Replaces the current TON wallet with another existing v6r2 wallet or changes private key of the current TON wallet; can be used only if getOption("can_use_ton_wallet").
///
/// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
/// * [anchorPublicKey]: Original public key of the new TON wallet.
/// * [proof]: Proof of ownership of the new private key of the TON wallet; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
///
/// [Ok] is returned on completion.
final class ReplaceTonWallet extends TdFunction {
  /// **ReplaceTonWallet** *(replaceTonWallet)* - TDLib function
  ///
  /// Replaces the current TON wallet with another existing v6r2 wallet or changes private key of the current TON wallet; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
  /// * [anchorPublicKey]: Original public key of the new TON wallet.
  /// * [proof]: Proof of ownership of the new private key of the TON wallet; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
  ///
  /// [Ok] is returned on completion.
  const ReplaceTonWallet({
    required this.password,
    required this.anchorPublicKey,
    required this.proof,
  });

  /// Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
  final String password;

  /// Original public key of the new TON wallet
  final String anchorPublicKey;

  /// Proof of ownership of the new private key of the TON wallet; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  final TonWalletOwnershipProof proof;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "password": password,
      "anchor_public_key": anchorPublicKey,
      "proof": proof.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
  /// * [anchor_public_key]: Original public key of the new TON wallet
  /// * [proof]: Proof of ownership of the new private key of the TON wallet; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  ReplaceTonWallet copyWith({
    String? password,
    String? anchorPublicKey,
    TonWalletOwnershipProof? proof,
  }) =>
      ReplaceTonWallet(
        password: password ?? this.password,
        anchorPublicKey: anchorPublicKey ?? this.anchorPublicKey,
        proof: proof ?? this.proof,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replaceTonWallet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
