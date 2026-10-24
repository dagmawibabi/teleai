part of '../tdapi.dart';

/// **EnableTonWalletBackup** *(enableTonWalletBackup)* - TDLib function
///
/// Enables backup of the TON wallet of the user. Works only if tonWalletState.can_enable_backup is true.
///
/// * [secretPhrase]: The secret phrase of the user's TON wallet as a space separated list of words.
/// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
///
/// [Ok] is returned on completion.
final class EnableTonWalletBackup extends TdFunction {
  /// **EnableTonWalletBackup** *(enableTonWalletBackup)* - TDLib function
  ///
  /// Enables backup of the TON wallet of the user. Works only if tonWalletState.can_enable_backup is true.
  ///
  /// * [secretPhrase]: The secret phrase of the user's TON wallet as a space separated list of words.
  /// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof.
  ///
  /// [Ok] is returned on completion.
  const EnableTonWalletBackup({
    required this.secretPhrase,
    required this.proof,
  });

  /// The secret phrase of the user's TON wallet as a space separated list of words
  final String secretPhrase;

  /// Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  final TonWalletOwnershipProof proof;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "secret_phrase": secretPhrase,
      "proof": proof.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [secret_phrase]: The secret phrase of the user's TON wallet as a space separated list of words
  /// * [proof]: Proof of the TON wallet ownership; use getTonWalletOwnershipProofChallenge to get a challenge for the proof
  EnableTonWalletBackup copyWith({
    String? secretPhrase,
    TonWalletOwnershipProof? proof,
  }) =>
      EnableTonWalletBackup(
        secretPhrase: secretPhrase ?? this.secretPhrase,
        proof: proof ?? this.proof,
      );

  /// TDLib object type
  static const String defaultObjectId = 'enableTonWalletBackup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
