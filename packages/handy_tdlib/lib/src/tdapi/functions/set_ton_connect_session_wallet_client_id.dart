part of '../tdapi.dart';

/// **SetTonConnectSessionWalletClientId** *(setTonConnectSessionWalletClientId)* - TDLib function
///
/// Sets wallet_client_id for a pending TON Connect session. Then, sendTonConnectSessionConnectResult must be used to accept or reject the session.. If the session was created for an OAuth request, then acceptOauthRequest must be used instead.
///
/// * [sessionId]: Unique identifier of the session.
/// * [walletClientId]: Hex-encoded public X25519 key of the current user's application calculated from the TON wallet private key and session parameters.
///
/// [TonConnectChallenge] is returned on completion.
final class SetTonConnectSessionWalletClientId extends TdFunction {
  /// **SetTonConnectSessionWalletClientId** *(setTonConnectSessionWalletClientId)* - TDLib function
  ///
  /// Sets wallet_client_id for a pending TON Connect session. Then, sendTonConnectSessionConnectResult must be used to accept or reject the session.. If the session was created for an OAuth request, then acceptOauthRequest must be used instead.
  ///
  /// * [sessionId]: Unique identifier of the session.
  /// * [walletClientId]: Hex-encoded public X25519 key of the current user's application calculated from the TON wallet private key and session parameters.
  ///
  /// [TonConnectChallenge] is returned on completion.
  const SetTonConnectSessionWalletClientId({
    required this.sessionId,
    required this.walletClientId,
  });

  /// Unique identifier of the session
  final int sessionId;

  /// Hex-encoded public X25519 key of the current user's application calculated from the TON wallet private key and session parameters
  final String walletClientId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "wallet_client_id": walletClientId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session
  /// * [wallet_client_id]: Hex-encoded public X25519 key of the current user's application calculated from the TON wallet private key and session parameters
  SetTonConnectSessionWalletClientId copyWith({
    int? sessionId,
    String? walletClientId,
  }) =>
      SetTonConnectSessionWalletClientId(
        sessionId: sessionId ?? this.sessionId,
        walletClientId: walletClientId ?? this.walletClientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setTonConnectSessionWalletClientId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
