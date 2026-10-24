part of '../tdapi.dart';

/// **StarGiveawayPaymentOptions** *(starGiveawayPaymentOptions)* - basic class
///
/// Contains a list of options for creating of Telegram Star giveaway.
///
/// * [options]: The list of options.
final class StarGiveawayPaymentOptions extends TdObject {
  /// **StarGiveawayPaymentOptions** *(starGiveawayPaymentOptions)* - basic class
  ///
  /// Contains a list of options for creating of Telegram Star giveaway.
  ///
  /// * [options]: The list of options.
  const StarGiveawayPaymentOptions({
    required this.options,
    this.extra,
    this.clientId,
  });

  /// The list of options
  final List<StarGiveawayPaymentOption> options;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarGiveawayPaymentOptions.fromJson(Map<String, dynamic> json) =>
      StarGiveawayPaymentOptions(
        options: List<StarGiveawayPaymentOption>.from((json['options'] ?? [])
            .map((item) => StarGiveawayPaymentOption.fromJson(item))
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
  StarGiveawayPaymentOptions copyWith({
    List<StarGiveawayPaymentOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      StarGiveawayPaymentOptions(
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starGiveawayPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
