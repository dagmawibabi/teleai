part of '../tdapi.dart';

/// **TonConnectConnectData** *(tonConnectConnectData)* - basic class
///
/// Contains data required to give access to the TON wallet of the current user in acceptOauthRequest.
///
/// * [sessionId]: Unique identifier of the session.
/// * [challengeAnswer]: Answer to the challenge received from setTonConnectSessionWalletClientId.
/// * [body]: Body of the result of the connection request as in sendTonConnectSessionConnectResult.
/// * [proof]: Proof of the TON wallet ownership for the payload oauthLinkInfo.ton_proof_payload.
final class TonConnectConnectData extends TdObject {
  /// **TonConnectConnectData** *(tonConnectConnectData)* - basic class
  ///
  /// Contains data required to give access to the TON wallet of the current user in acceptOauthRequest.
  ///
  /// * [sessionId]: Unique identifier of the session.
  /// * [challengeAnswer]: Answer to the challenge received from setTonConnectSessionWalletClientId.
  /// * [body]: Body of the result of the connection request as in sendTonConnectSessionConnectResult.
  /// * [proof]: Proof of the TON wallet ownership for the payload oauthLinkInfo.ton_proof_payload.
  const TonConnectConnectData({
    required this.sessionId,
    required this.challengeAnswer,
    required this.body,
    required this.proof,
  });

  /// Unique identifier of the session
  final int sessionId;

  /// Answer to the challenge received from setTonConnectSessionWalletClientId
  final String challengeAnswer;

  /// Body of the result of the connection request as in sendTonConnectSessionConnectResult
  final String body;

  /// Proof of the TON wallet ownership for the payload oauthLinkInfo.ton_proof_payload
  final TonWalletOwnershipProof proof;

  /// Parse from a json
  factory TonConnectConnectData.fromJson(Map<String, dynamic> json) =>
      TonConnectConnectData(
        sessionId: json['session_id'] is int
            ? json['session_id']
            : int.parse(json['session_id']),
        challengeAnswer: json['challenge_answer'],
        body: json['body'],
        proof: TonWalletOwnershipProof.fromJson(json['proof']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "challenge_answer": challengeAnswer,
      "body": body,
      "proof": proof.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session
  /// * [challenge_answer]: Answer to the challenge received from setTonConnectSessionWalletClientId
  /// * [body]: Body of the result of the connection request as in sendTonConnectSessionConnectResult
  /// * [proof]: Proof of the TON wallet ownership for the payload oauthLinkInfo.ton_proof_payload
  TonConnectConnectData copyWith({
    int? sessionId,
    String? challengeAnswer,
    String? body,
    TonWalletOwnershipProof? proof,
  }) =>
      TonConnectConnectData(
        sessionId: sessionId ?? this.sessionId,
        challengeAnswer: challengeAnswer ?? this.challengeAnswer,
        body: body ?? this.body,
        proof: proof ?? this.proof,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectConnectData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
