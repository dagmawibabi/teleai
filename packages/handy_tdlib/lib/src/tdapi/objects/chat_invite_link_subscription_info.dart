part of '../tdapi.dart';

/// **ChatInviteLinkSubscriptionInfo** *(chatInviteLinkSubscriptionInfo)* - basic class
///
/// Contains information about subscription plan that must be paid by the user to use a chat invite link.
///
/// * [pricing]: Information about subscription plan that must be paid by the user to use the link.
/// * [canReuse]: True, if the user has already paid for the subscription and can use joinChatByInviteLink to join the subscribed chat again.
/// * [formId]: Identifier of the payment form to use for subscription payment; 0 if the subscription can't be paid.
final class ChatInviteLinkSubscriptionInfo extends TdObject {
  /// **ChatInviteLinkSubscriptionInfo** *(chatInviteLinkSubscriptionInfo)* - basic class
  ///
  /// Contains information about subscription plan that must be paid by the user to use a chat invite link.
  ///
  /// * [pricing]: Information about subscription plan that must be paid by the user to use the link.
  /// * [canReuse]: True, if the user has already paid for the subscription and can use joinChatByInviteLink to join the subscribed chat again.
  /// * [formId]: Identifier of the payment form to use for subscription payment; 0 if the subscription can't be paid.
  const ChatInviteLinkSubscriptionInfo({
    required this.pricing,
    required this.canReuse,
    required this.formId,
  });

  /// Information about subscription plan that must be paid by the user to use the link
  final StarSubscriptionPricing pricing;

  /// True, if the user has already paid for the subscription and can use joinChatByInviteLink to join the subscribed chat again
  final bool canReuse;

  /// Identifier of the payment form to use for subscription payment; 0 if the subscription can't be paid
  final int formId;

  /// Parse from a json
  factory ChatInviteLinkSubscriptionInfo.fromJson(Map<String, dynamic> json) =>
      ChatInviteLinkSubscriptionInfo(
        pricing: StarSubscriptionPricing.fromJson(json['pricing']),
        canReuse: json['can_reuse'],
        formId: json['form_id'] is int
            ? json['form_id']
            : int.parse(json['form_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "pricing": pricing.toJson(),
      "can_reuse": canReuse,
      "form_id": formId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pricing]: Information about subscription plan that must be paid by the user to use the link
  /// * [can_reuse]: True, if the user has already paid for the subscription and can use joinChatByInviteLink to join the subscribed chat again
  /// * [form_id]: Identifier of the payment form to use for subscription payment; 0 if the subscription can't be paid
  ChatInviteLinkSubscriptionInfo copyWith({
    StarSubscriptionPricing? pricing,
    bool? canReuse,
    int? formId,
  }) =>
      ChatInviteLinkSubscriptionInfo(
        pricing: pricing ?? this.pricing,
        canReuse: canReuse ?? this.canReuse,
        formId: formId ?? this.formId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLinkSubscriptionInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
