part of '../tdapi.dart';

/// **DisableTonWalletBackupWithProof** *(disableTonWalletBackupWithProof)* - TDLib function
///
/// Disables backup of the TON wallet of the user using proof of wallet ownership instead of the password. Works only if tonWalletState.is_backup_enabled is true.
///
/// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
///
/// [Ok] is returned on completion.
final class DisableTonWalletBackupWithProof extends TdFunction {
  /// **DisableTonWalletBackupWithProof** *(disableTonWalletBackupWithProof)* - TDLib function
  ///
  /// Disables backup of the TON wallet of the user using proof of wallet ownership instead of the password. Works only if tonWalletState.is_backup_enabled is true.
  ///
  /// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
  ///
  /// [Ok] is returned on completion.
  const DisableTonWalletBackupWithProof({
    required this.proof,
  });

  /// Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  final TonWalletOwnershipProof proof;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "proof": proof.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  DisableTonWalletBackupWithProof copyWith({
    TonWalletOwnershipProof? proof,
  }) =>
      DisableTonWalletBackupWithProof(
        proof: proof ?? this.proof,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disableTonWalletBackupWithProof';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
