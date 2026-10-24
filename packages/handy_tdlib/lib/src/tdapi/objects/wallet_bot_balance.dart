part of '../tdapi.dart';

/// **WalletBotBalance** *(walletBotBalance)* - basic class
///
/// Describes balance of the current user in the bot https://t.me/walt.
///
/// * [hasBalance]: True, if the user has positive TON Gram balance.
/// * [url]: The URL to open to launch the bot; may be empty if none.
final class WalletBotBalance extends TdObject {
  /// **WalletBotBalance** *(walletBotBalance)* - basic class
  ///
  /// Describes balance of the current user in the bot https://t.me/walt.
  ///
  /// * [hasBalance]: True, if the user has positive TON Gram balance.
  /// * [url]: The URL to open to launch the bot; may be empty if none.
  const WalletBotBalance({
    required this.hasBalance,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// True, if the user has positive TON Gram balance
  final bool hasBalance;

  /// The URL to open to launch the bot; may be empty if none
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory WalletBotBalance.fromJson(Map<String, dynamic> json) =>
      WalletBotBalance(
        hasBalance: json['has_balance'],
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_balance": hasBalance,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_balance]: True, if the user has positive TON Gram balance
  /// * [url]: The URL to open to launch the bot; may be empty if none
  WalletBotBalance copyWith({
    bool? hasBalance,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      WalletBotBalance(
        hasBalance: hasBalance ?? this.hasBalance,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'walletBotBalance';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
