part of '../tdapi.dart';

/// **GetTonWalletOwnershipProofChallenge** *(getTonWalletOwnershipProofChallenge)* - TDLib function
///
/// Returns a challenge which may be used to prove ownership of a TON wallet; can be used only if getOption("can_use_ton_wallet").
///
/// [TonWalletOwnershipProofChallenge] is returned on completion.
final class GetTonWalletOwnershipProofChallenge extends TdFunction {
  /// **GetTonWalletOwnershipProofChallenge** *(getTonWalletOwnershipProofChallenge)* - TDLib function
  ///
  /// Returns a challenge which may be used to prove ownership of a TON wallet; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [TonWalletOwnershipProofChallenge] is returned on completion.
  const GetTonWalletOwnershipProofChallenge();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTonWalletOwnershipProofChallenge copyWith() =>
      const GetTonWalletOwnershipProofChallenge();

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletOwnershipProofChallenge';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
