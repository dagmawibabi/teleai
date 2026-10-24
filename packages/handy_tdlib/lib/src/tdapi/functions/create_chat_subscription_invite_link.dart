part of '../tdapi.dart';

/// **CreateChatSubscriptionInviteLink** *(createChatSubscriptionInviteLink)* - TDLib function
///
/// Creates a new subscription invite link for a channel chat. Requires can_invite_users right in the chat.
///
/// * [chatId]: Chat identifier.
/// * [name]: Invite link name; 0-32 characters.
/// * [subscriptionPricing]: Information about subscription plan that will be applied to the users joining the chat via the link.. Subscription period must be 2592000 in production environment, and 60 or 300 if Telegram test environment is used.
///
/// [ChatInviteLink] is returned on completion.
final class CreateChatSubscriptionInviteLink extends TdFunction {
  /// **CreateChatSubscriptionInviteLink** *(createChatSubscriptionInviteLink)* - TDLib function
  ///
  /// Creates a new subscription invite link for a channel chat. Requires can_invite_users right in the chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [name]: Invite link name; 0-32 characters.
  /// * [subscriptionPricing]: Information about subscription plan that will be applied to the users joining the chat via the link.. Subscription period must be 2592000 in production environment, and 60 or 300 if Telegram test environment is used.
  ///
  /// [ChatInviteLink] is returned on completion.
  const CreateChatSubscriptionInviteLink({
    required this.chatId,
    required this.name,
    required this.subscriptionPricing,
  });

  /// Chat identifier
  final int chatId;

  /// Invite link name; 0-32 characters
  final String name;

  /// Information about subscription plan that will be applied to the users joining the chat via the link.. Subscription period must be 2592000 in production environment, and 60 or 300 if Telegram test environment is used
  final StarSubscriptionPricing subscriptionPricing;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "name": name,
      "subscription_pricing": subscriptionPricing.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [name]: Invite link name; 0-32 characters
  /// * [subscription_pricing]: Information about subscription plan that will be applied to the users joining the chat via the link.. Subscription period must be 2592000 in production environment, and 60 or 300 if Telegram test environment is used
  CreateChatSubscriptionInviteLink copyWith({
    int? chatId,
    String? name,
    StarSubscriptionPricing? subscriptionPricing,
  }) =>
      CreateChatSubscriptionInviteLink(
        chatId: chatId ?? this.chatId,
        name: name ?? this.name,
        subscriptionPricing: subscriptionPricing ?? this.subscriptionPricing,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createChatSubscriptionInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
