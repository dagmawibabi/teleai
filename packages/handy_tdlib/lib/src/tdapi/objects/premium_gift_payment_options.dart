part of '../tdapi.dart';

/// **PremiumGiftPaymentOptions** *(premiumGiftPaymentOptions)* - basic class
///
/// Contains a list of options for gifting Telegram Premium to a user.
///
/// * [options]: The list of options sorted by Telegram Premium subscription duration.
final class PremiumGiftPaymentOptions extends TdObject {
  /// **PremiumGiftPaymentOptions** *(premiumGiftPaymentOptions)* - basic class
  ///
  /// Contains a list of options for gifting Telegram Premium to a user.
  ///
  /// * [options]: The list of options sorted by Telegram Premium subscription duration.
  const PremiumGiftPaymentOptions({
    required this.options,
    this.extra,
    this.clientId,
  });

  /// The list of options sorted by Telegram Premium subscription duration
  final List<PremiumGiftPaymentOption> options;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PremiumGiftPaymentOptions.fromJson(Map<String, dynamic> json) =>
      PremiumGiftPaymentOptions(
        options: List<PremiumGiftPaymentOption>.from((json['options'] ?? [])
            .map((item) => PremiumGiftPaymentOption.fromJson(item))
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
  /// * [options]: The list of options sorted by Telegram Premium subscription duration
  PremiumGiftPaymentOptions copyWith({
    List<PremiumGiftPaymentOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      PremiumGiftPaymentOptions(
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumGiftPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
