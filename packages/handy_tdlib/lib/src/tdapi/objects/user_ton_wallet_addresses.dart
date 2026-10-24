part of '../tdapi.dart';

/// **UserTonWalletAddresses** *(userTonWalletAddresses)* - basic class
///
/// Represents a list of TON wallet addresses of users.
///
/// * [addresses]: A list of TON wallet addresses.
final class UserTonWalletAddresses extends TdObject {
  /// **UserTonWalletAddresses** *(userTonWalletAddresses)* - basic class
  ///
  /// Represents a list of TON wallet addresses of users.
  ///
  /// * [addresses]: A list of TON wallet addresses.
  const UserTonWalletAddresses({
    required this.addresses,
    this.extra,
    this.clientId,
  });

  /// A list of TON wallet addresses
  final List<UserTonWalletAddress> addresses;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UserTonWalletAddresses.fromJson(Map<String, dynamic> json) =>
      UserTonWalletAddresses(
        addresses: List<UserTonWalletAddress>.from((json['addresses'] ?? [])
            .map((item) => UserTonWalletAddress.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "addresses": addresses.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [addresses]: A list of TON wallet addresses
  UserTonWalletAddresses copyWith({
    List<UserTonWalletAddress>? addresses,
    dynamic extra,
    int? clientId,
  }) =>
      UserTonWalletAddresses(
        addresses: addresses ?? this.addresses,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userTonWalletAddresses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
