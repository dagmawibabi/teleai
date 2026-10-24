part of '../tdapi.dart';

/// **StarSubscriptions** *(starSubscriptions)* - basic class
///
/// Represents a list of Telegram Star subscriptions.
///
/// * [starAmount]: The amount of owned Telegram Stars.
/// * [subscriptions]: List of subscriptions for Telegram Stars.
/// * [requiredStarCount]: The number of Telegram Stars required to buy to extend subscriptions expiring soon.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class StarSubscriptions extends TdObject {
  /// **StarSubscriptions** *(starSubscriptions)* - basic class
  ///
  /// Represents a list of Telegram Star subscriptions.
  ///
  /// * [starAmount]: The amount of owned Telegram Stars.
  /// * [subscriptions]: List of subscriptions for Telegram Stars.
  /// * [requiredStarCount]: The number of Telegram Stars required to buy to extend subscriptions expiring soon.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const StarSubscriptions({
    required this.starAmount,
    required this.subscriptions,
    required this.requiredStarCount,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The amount of owned Telegram Stars
  final StarAmount starAmount;

  /// List of subscriptions for Telegram Stars
  final List<StarSubscription> subscriptions;

  /// The number of Telegram Stars required to buy to extend subscriptions expiring soon
  final int requiredStarCount;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarSubscriptions.fromJson(Map<String, dynamic> json) =>
      StarSubscriptions(
        starAmount: StarAmount.fromJson(json['star_amount']),
        subscriptions: List<StarSubscription>.from((json['subscriptions'] ?? [])
            .map((item) => StarSubscription.fromJson(item))
            .toList()),
        requiredStarCount: json['required_star_count'],
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_amount": starAmount.toJson(),
      "subscriptions": subscriptions.map((i) => i.toJson()).toList(),
      "required_star_count": requiredStarCount,
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_amount]: The amount of owned Telegram Stars
  /// * [subscriptions]: List of subscriptions for Telegram Stars
  /// * [required_star_count]: The number of Telegram Stars required to buy to extend subscriptions expiring soon
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  StarSubscriptions copyWith({
    StarAmount? starAmount,
    List<StarSubscription>? subscriptions,
    int? requiredStarCount,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      StarSubscriptions(
        starAmount: starAmount ?? this.starAmount,
        subscriptions: subscriptions ?? this.subscriptions,
        requiredStarCount: requiredStarCount ?? this.requiredStarCount,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starSubscriptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
