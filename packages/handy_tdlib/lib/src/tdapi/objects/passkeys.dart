part of '../tdapi.dart';

/// **Passkeys** *(passkeys)* - basic class
///
/// Contains a list of passkeys.
///
/// * [passkeys]: List of passkeys.
final class Passkeys extends TdObject {
  /// **Passkeys** *(passkeys)* - basic class
  ///
  /// Contains a list of passkeys.
  ///
  /// * [passkeys]: List of passkeys.
  const Passkeys({
    required this.passkeys,
    this.extra,
    this.clientId,
  });

  /// List of passkeys
  final List<Passkey> passkeys;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Passkeys.fromJson(Map<String, dynamic> json) => Passkeys(
        passkeys: List<Passkey>.from((json['passkeys'] ?? [])
            .map((item) => Passkey.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "passkeys": passkeys.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [passkeys]: List of passkeys
  Passkeys copyWith({
    List<Passkey>? passkeys,
    dynamic extra,
    int? clientId,
  }) =>
      Passkeys(
        passkeys: passkeys ?? this.passkeys,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'passkeys';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
