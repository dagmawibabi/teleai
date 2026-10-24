part of '../tdapi.dart';

/// **StarSubscription** *(starSubscription)* - basic class
///
/// Contains information about subscription to a channel chat, a bot, or a business account that was paid in Telegram Stars.
///
/// * [id]: Unique identifier of the subscription.
/// * [chatId]: Identifier of the chat that is subscribed.
/// * [expirationDate]: Point in time (Unix timestamp) when the subscription will expire or expired.
/// * [isCanceled]: True, if the subscription was canceled.
/// * [isExpiring]: True, if the subscription expires soon and there aren't enough Telegram Stars on the user's balance to extend it.
/// * [pricing]: The subscription plan.
/// * [type]: Type of the subscription.
final class StarSubscription extends TdObject {
  /// **StarSubscription** *(starSubscription)* - basic class
  ///
  /// Contains information about subscription to a channel chat, a bot, or a business account that was paid in Telegram Stars.
  ///
  /// * [id]: Unique identifier of the subscription.
  /// * [chatId]: Identifier of the chat that is subscribed.
  /// * [expirationDate]: Point in time (Unix timestamp) when the subscription will expire or expired.
  /// * [isCanceled]: True, if the subscription was canceled.
  /// * [isExpiring]: True, if the subscription expires soon and there aren't enough Telegram Stars on the user's balance to extend it.
  /// * [pricing]: The subscription plan.
  /// * [type]: Type of the subscription.
  const StarSubscription({
    required this.id,
    required this.chatId,
    required this.expirationDate,
    required this.isCanceled,
    required this.isExpiring,
    required this.pricing,
    required this.type,
  });

  /// Unique identifier of the subscription
  final String id;

  /// Identifier of the chat that is subscribed
  final int chatId;

  /// Point in time (Unix timestamp) when the subscription will expire or expired
  final int expirationDate;

  /// True, if the subscription was canceled
  final bool isCanceled;

  /// True, if the subscription expires soon and there aren't enough Telegram Stars on the user's balance to extend it
  final bool isExpiring;

  /// The subscription plan
  final StarSubscriptionPricing pricing;

  /// Type of the subscription
  final StarSubscriptionType type;

  /// Parse from a json
  factory StarSubscription.fromJson(Map<String, dynamic> json) =>
      StarSubscription(
        id: json['id'],
        chatId: json['chat_id'],
        expirationDate: json['expiration_date'],
        isCanceled: json['is_canceled'],
        isExpiring: json['is_expiring'],
        pricing: StarSubscriptionPricing.fromJson(json['pricing']),
        type: StarSubscriptionType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "chat_id": chatId,
      "expiration_date": expirationDate,
      "is_canceled": isCanceled,
      "is_expiring": isExpiring,
      "pricing": pricing.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the subscription
  /// * [chat_id]: Identifier of the chat that is subscribed
  /// * [expiration_date]: Point in time (Unix timestamp) when the subscription will expire or expired
  /// * [is_canceled]: True, if the subscription was canceled
  /// * [is_expiring]: True, if the subscription expires soon and there aren't enough Telegram Stars on the user's balance to extend it
  /// * [pricing]: The subscription plan
  /// * [type]: Type of the subscription
  StarSubscription copyWith({
    String? id,
    int? chatId,
    int? expirationDate,
    bool? isCanceled,
    bool? isExpiring,
    StarSubscriptionPricing? pricing,
    StarSubscriptionType? type,
  }) =>
      StarSubscription(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        expirationDate: expirationDate ?? this.expirationDate,
        isCanceled: isCanceled ?? this.isCanceled,
        isExpiring: isExpiring ?? this.isExpiring,
        pricing: pricing ?? this.pricing,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starSubscription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
