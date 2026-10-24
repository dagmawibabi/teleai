part of '../tdapi.dart';

/// **UserTonWalletAddress** *(userTonWalletAddress)* - basic class
///
/// Contains TON wallet address of a user.
///
/// * [userId]: Identifier of the user; 0 if unknown.
/// * [walletAddress]: Address of the user's wallet in the TON blockchain.
/// * [publicKey]: Public key of the user.
final class UserTonWalletAddress extends TdObject {
  /// **UserTonWalletAddress** *(userTonWalletAddress)* - basic class
  ///
  /// Contains TON wallet address of a user.
  ///
  /// * [userId]: Identifier of the user; 0 if unknown.
  /// * [walletAddress]: Address of the user's wallet in the TON blockchain.
  /// * [publicKey]: Public key of the user.
  const UserTonWalletAddress({
    required this.userId,
    required this.walletAddress,
    required this.publicKey,
    this.extra,
    this.clientId,
  });

  /// Identifier of the user; 0 if unknown
  final int userId;

  /// Address of the user's wallet in the TON blockchain
  final String walletAddress;

  /// Public key of the user
  final String publicKey;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UserTonWalletAddress.fromJson(Map<String, dynamic> json) =>
      UserTonWalletAddress(
        userId: json['user_id'],
        walletAddress: json['wallet_address'],
        publicKey: json['public_key'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "wallet_address": walletAddress,
      "public_key": publicKey,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user; 0 if unknown
  /// * [wallet_address]: Address of the user's wallet in the TON blockchain
  /// * [public_key]: Public key of the user
  UserTonWalletAddress copyWith({
    int? userId,
    String? walletAddress,
    String? publicKey,
    dynamic extra,
    int? clientId,
  }) =>
      UserTonWalletAddress(
        userId: userId ?? this.userId,
        walletAddress: walletAddress ?? this.walletAddress,
        publicKey: publicKey ?? this.publicKey,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userTonWalletAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
