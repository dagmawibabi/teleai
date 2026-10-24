part of '../tdapi.dart';

/// **PremiumGiveawayPaymentOptions** *(premiumGiveawayPaymentOptions)* - basic class
///
/// Contains a list of options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members.
///
/// * [options]: The list of options.
final class PremiumGiveawayPaymentOptions extends TdObject {
  /// **PremiumGiveawayPaymentOptions** *(premiumGiveawayPaymentOptions)* - basic class
  ///
  /// Contains a list of options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members.
  ///
  /// * [options]: The list of options.
  const PremiumGiveawayPaymentOptions({
    required this.options,
    this.extra,
    this.clientId,
  });

  /// The list of options
  final List<PremiumGiveawayPaymentOption> options;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PremiumGiveawayPaymentOptions.fromJson(Map<String, dynamic> json) =>
      PremiumGiveawayPaymentOptions(
        options: List<PremiumGiveawayPaymentOption>.from((json['options'] ?? [])
            .map((item) => PremiumGiveawayPaymentOption.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "options": options.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [options]: The list of options
  PremiumGiveawayPaymentOptions copyWith({
    List<PremiumGiveawayPaymentOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      PremiumGiveawayPaymentOptions(
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumGiveawayPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
