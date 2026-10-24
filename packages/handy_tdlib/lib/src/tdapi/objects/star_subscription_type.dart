part of '../tdapi.dart';

/// **StarSubscriptionType** *(starSubscriptionType)* - parent
///
/// Describes type of subscription paid in Telegram Stars.
sealed class StarSubscriptionType extends TdObject {
  /// **StarSubscriptionType** *(starSubscriptionType)* - parent
  ///
  /// Describes type of subscription paid in Telegram Stars.
  const StarSubscriptionType();

  /// a StarSubscriptionType return type can be :
  /// * [StarSubscriptionTypeChannel]
  /// * [StarSubscriptionTypeBot]
  factory StarSubscriptionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StarSubscriptionTypeChannel.defaultObjectId:
        return StarSubscriptionTypeChannel.fromJson(json);
      case StarSubscriptionTypeBot.defaultObjectId:
        return StarSubscriptionTypeBot.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StarSubscriptionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StarSubscriptionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'starSubscriptionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarSubscriptionTypeChannel** *(starSubscriptionTypeChannel)* - child of StarSubscriptionType
///
/// Describes a subscription to a channel chat.
///
/// * [canReuse]: True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again.
/// * [inviteLink]: The invite link that can be used to renew the subscription if it has expired; may be empty if the link isn't available anymore.
final class StarSubscriptionTypeChannel extends StarSubscriptionType {
  /// **StarSubscriptionTypeChannel** *(starSubscriptionTypeChannel)* - child of StarSubscriptionType
  ///
  /// Describes a subscription to a channel chat.
  ///
  /// * [canReuse]: True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again.
  /// * [inviteLink]: The invite link that can be used to renew the subscription if it has expired; may be empty if the link isn't available anymore.
  const StarSubscriptionTypeChannel({
    required this.canReuse,
    required this.inviteLink,
  });

  /// True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again
  final bool canReuse;

  /// The invite link that can be used to renew the subscription if it has expired; may be empty if the link isn't available anymore
  final String inviteLink;

  /// Parse from a json
  factory StarSubscriptionTypeChannel.fromJson(Map<String, dynamic> json) =>
      StarSubscriptionTypeChannel(
        canReuse: json['can_reuse'],
        inviteLink: json['invite_link'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_reuse": canReuse,
      "invite_link": inviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_reuse]: True, if the subscription is active and the user can use the method reuseStarSubscription to join the subscribed chat again
  /// * [invite_link]: The invite link that can be used to renew the subscription if it has expired; may be empty if the link isn't available anymore
  @override
  StarSubscriptionTypeChannel copyWith({
    bool? canReuse,
    String? inviteLink,
  }) =>
      StarSubscriptionTypeChannel(
        canReuse: canReuse ?? this.canReuse,
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starSubscriptionTypeChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StarSubscriptionTypeBot** *(starSubscriptionTypeBot)* - child of StarSubscriptionType
///
/// Describes a subscription in a bot or a business account.
///
/// * [isCanceledByBot]: True, if the subscription was canceled by the bot and can't be extended.
/// * [title]: Subscription invoice title.
/// * [photo]: Subscription invoice photo.
/// * [invoiceLink]: The link to the subscription invoice.
final class StarSubscriptionTypeBot extends StarSubscriptionType {
  /// **StarSubscriptionTypeBot** *(starSubscriptionTypeBot)* - child of StarSubscriptionType
  ///
  /// Describes a subscription in a bot or a business account.
  ///
  /// * [isCanceledByBot]: True, if the subscription was canceled by the bot and can't be extended.
  /// * [title]: Subscription invoice title.
  /// * [photo]: Subscription invoice photo.
  /// * [invoiceLink]: The link to the subscription invoice.
  const StarSubscriptionTypeBot({
    required this.isCanceledByBot,
    required this.title,
    required this.photo,
    required this.invoiceLink,
  });

  /// True, if the subscription was canceled by the bot and can't be extended
  final bool isCanceledByBot;

  /// Subscription invoice title
  final String title;

  /// Subscription invoice photo
  final Photo photo;

  /// The link to the subscription invoice
  final String invoiceLink;

  /// Parse from a json
  factory StarSubscriptionTypeBot.fromJson(Map<String, dynamic> json) =>
      StarSubscriptionTypeBot(
        isCanceledByBot: json['is_canceled_by_bot'],
        title: json['title'],
        photo: Photo.fromJson(json['photo']),
        invoiceLink: json['invoice_link'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_canceled_by_bot": isCanceledByBot,
      "title": title,
      "photo": photo.toJson(),
      "invoice_link": invoiceLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_canceled_by_bot]: True, if the subscription was canceled by the bot and can't be extended
  /// * [title]: Subscription invoice title
  /// * [photo]: Subscription invoice photo
  /// * [invoice_link]: The link to the subscription invoice
  @override
  StarSubscriptionTypeBot copyWith({
    bool? isCanceledByBot,
    String? title,
    Photo? photo,
    String? invoiceLink,
  }) =>
      StarSubscriptionTypeBot(
        isCanceledByBot: isCanceledByBot ?? this.isCanceledByBot,
        title: title ?? this.title,
        photo: photo ?? this.photo,
        invoiceLink: invoiceLink ?? this.invoiceLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starSubscriptionTypeBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
