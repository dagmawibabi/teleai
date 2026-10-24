part of '../tdapi.dart';

/// **TonWalletSecretPhrase** *(tonWalletSecretPhrase)* - basic class
///
/// Contains the secret phrase of a TON wallet.
///
/// * [secretPhrase]: The secret phrase as a space separated list of words.
final class TonWalletSecretPhrase extends TdObject {
  /// **TonWalletSecretPhrase** *(tonWalletSecretPhrase)* - basic class
  ///
  /// Contains the secret phrase of a TON wallet.
  ///
  /// * [secretPhrase]: The secret phrase as a space separated list of words.
  const TonWalletSecretPhrase({
    required this.secretPhrase,
    this.extra,
    this.clientId,
  });

  /// The secret phrase as a space separated list of words
  final String secretPhrase;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletSecretPhrase.fromJson(Map<String, dynamic> json) =>
      TonWalletSecretPhrase(
        secretPhrase: json['secret_phrase'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "secret_phrase": secretPhrase,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [secret_phrase]: The secret phrase as a space separated list of words
  TonWalletSecretPhrase copyWith({
    String? secretPhrase,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletSecretPhrase(
        secretPhrase: secretPhrase ?? this.secretPhrase,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletSecretPhrase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
