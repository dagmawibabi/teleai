part of '../tdapi.dart';

/// **StarPaymentOptions** *(starPaymentOptions)* - basic class
///
/// Contains a list of options for buying Telegram Stars.
///
/// * [options]: The list of options.
final class StarPaymentOptions extends TdObject {
  /// **StarPaymentOptions** *(starPaymentOptions)* - basic class
  ///
  /// Contains a list of options for buying Telegram Stars.
  ///
  /// * [options]: The list of options.
  const StarPaymentOptions({
    required this.options,
    this.extra,
    this.clientId,
  });

  /// The list of options
  final List<StarPaymentOption> options;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarPaymentOptions.fromJson(Map<String, dynamic> json) =>
      StarPaymentOptions(
        options: List<StarPaymentOption>.from((json['options'] ?? [])
            .map((item) => StarPaymentOption.fromJson(item))
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
  StarPaymentOptions copyWith({
    List<StarPaymentOption>? options,
    dynamic extra,
    int? clientId,
  }) =>
      StarPaymentOptions(
        options: options ?? this.options,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
