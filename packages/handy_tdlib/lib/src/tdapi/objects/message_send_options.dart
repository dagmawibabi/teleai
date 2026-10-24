part of '../tdapi.dart';

/// **MessageSendOptions** *(messageSendOptions)* - basic class
///
/// Options to be used when a message is sent.
///
/// * [suggestedPostInfo]: Information about the suggested post; pass null if none. For messages to channel direct messages chat only. Applicable only to sendMessage and addOffer *(optional)*.
/// * [disableNotification]: Pass true to disable notification for the message.
/// * [fromBackground]: Pass true if the message is sent from the background.
/// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving; for bots only.
/// * [allowPaidBroadcast]: Pass true to allow the message to ignore regular broadcast limits for a small fee; for bots only.
/// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the messages.
/// * [updateOrderOfInstalledStickerSets]: Pass true if the user has explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum.
/// * [schedulingState]: Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, to a chat with paid messages, to a channel direct messages chat,. live location messages and self-destructing messages can't be scheduled *(optional)*.
/// * [effectId]: Identifier of the effect to apply to the message; pass 0 if none; applicable only to sendMessage, sendMessageAlbum in private chats and forwardMessages with one message to private chats.
/// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
/// * [onlyPreview]: Pass true to get a fake message instead of actually sending them.
final class MessageSendOptions extends TdObject {
  /// **MessageSendOptions** *(messageSendOptions)* - basic class
  ///
  /// Options to be used when a message is sent.
  ///
  /// * [suggestedPostInfo]: Information about the suggested post; pass null if none. For messages to channel direct messages chat only. Applicable only to sendMessage and addOffer *(optional)*.
  /// * [disableNotification]: Pass true to disable notification for the message.
  /// * [fromBackground]: Pass true if the message is sent from the background.
  /// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving; for bots only.
  /// * [allowPaidBroadcast]: Pass true to allow the message to ignore regular broadcast limits for a small fee; for bots only.
  /// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the messages.
  /// * [updateOrderOfInstalledStickerSets]: Pass true if the user has explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum.
  /// * [schedulingState]: Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, to a chat with paid messages, to a channel direct messages chat,. live location messages and self-destructing messages can't be scheduled *(optional)*.
  /// * [effectId]: Identifier of the effect to apply to the message; pass 0 if none; applicable only to sendMessage, sendMessageAlbum in private chats and forwardMessages with one message to private chats.
  /// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
  /// * [onlyPreview]: Pass true to get a fake message instead of actually sending them.
  const MessageSendOptions({
    this.suggestedPostInfo,
    required this.disableNotification,
    required this.fromBackground,
    required this.protectContent,
    required this.allowPaidBroadcast,
    required this.paidMessageStarCount,
    required this.updateOrderOfInstalledStickerSets,
    this.schedulingState,
    required this.effectId,
    required this.sendingId,
    required this.onlyPreview,
  });

  /// Information about the suggested post; pass null if none. For messages to channel direct messages chat only. Applicable only to sendMessage and addOffer
  final InputSuggestedPostInfo? suggestedPostInfo;

  /// Pass true to disable notification for the message
  final bool disableNotification;

  /// Pass true if the message is sent from the background
  final bool fromBackground;

  /// Pass true if the content of the message must be protected from forwarding and saving; for bots only
  final bool protectContent;

  /// Pass true to allow the message to ignore regular broadcast limits for a small fee; for bots only
  final bool allowPaidBroadcast;

  /// The number of Telegram Stars the user agreed to pay to send the messages
  final int paidMessageStarCount;

  /// Pass true if the user has explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
  final bool updateOrderOfInstalledStickerSets;

  /// Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, to a chat with paid messages, to a channel direct messages chat,. live location messages and self-destructing messages can't be scheduled
  final MessageSchedulingState? schedulingState;

  /// Identifier of the effect to apply to the message; pass 0 if none; applicable only to sendMessage, sendMessageAlbum in private chats and forwardMessages with one message to private chats
  final int effectId;

  /// Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  final int sendingId;

  /// Pass true to get a fake message instead of actually sending them
  final bool onlyPreview;

  /// Parse from a json
  factory MessageSendOptions.fromJson(Map<String, dynamic> json) =>
      MessageSendOptions(
        suggestedPostInfo: json['suggested_post_info'] == null
            ? null
            : InputSuggestedPostInfo.fromJson(json['suggested_post_info']),
        disableNotification: json['disable_notification'],
        fromBackground: json['from_background'],
        protectContent: json['protect_content'],
        allowPaidBroadcast: json['allow_paid_broadcast'],
        paidMessageStarCount: json['paid_message_star_count'],
        updateOrderOfInstalledStickerSets:
            json['update_order_of_installed_sticker_sets'],
        schedulingState: json['scheduling_state'] == null
            ? null
            : MessageSchedulingState.fromJson(json['scheduling_state']),
        effectId: json['effect_id'] is int
            ? json['effect_id']
            : int.tryParse(json['effect_id'] ?? "") ?? 0,
        sendingId: json['sending_id'],
        onlyPreview: json['only_preview'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "suggested_post_info": suggestedPostInfo?.toJson(),
      "disable_notification": disableNotification,
      "from_background": fromBackground,
      "protect_content": protectContent,
      "allow_paid_broadcast": allowPaidBroadcast,
      "paid_message_star_count": paidMessageStarCount,
      "update_order_of_installed_sticker_sets":
          updateOrderOfInstalledStickerSets,
      "scheduling_state": schedulingState?.toJson(),
      "effect_id": effectId,
      "sending_id": sendingId,
      "only_preview": onlyPreview,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [suggested_post_info]: Information about the suggested post; pass null if none. For messages to channel direct messages chat only. Applicable only to sendMessage and addOffer
  /// * [disable_notification]: Pass true to disable notification for the message
  /// * [from_background]: Pass true if the message is sent from the background
  /// * [protect_content]: Pass true if the content of the message must be protected from forwarding and saving; for bots only
  /// * [allow_paid_broadcast]: Pass true to allow the message to ignore regular broadcast limits for a small fee; for bots only
  /// * [paid_message_star_count]: The number of Telegram Stars the user agreed to pay to send the messages
  /// * [update_order_of_installed_sticker_sets]: Pass true if the user has explicitly chosen a sticker or a custom emoji from an installed sticker set; applicable only to sendMessage and sendMessageAlbum
  /// * [scheduling_state]: Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, to a chat with paid messages, to a channel direct messages chat,. live location messages and self-destructing messages can't be scheduled
  /// * [effect_id]: Identifier of the effect to apply to the message; pass 0 if none; applicable only to sendMessage, sendMessageAlbum in private chats and forwardMessages with one message to private chats
  /// * [sending_id]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  /// * [only_preview]: Pass true to get a fake message instead of actually sending them
  MessageSendOptions copyWith({
    InputSuggestedPostInfo? suggestedPostInfo,
    bool? disableNotification,
    bool? fromBackground,
    bool? protectContent,
    bool? allowPaidBroadcast,
    int? paidMessageStarCount,
    bool? updateOrderOfInstalledStickerSets,
    MessageSchedulingState? schedulingState,
    int? effectId,
    int? sendingId,
    bool? onlyPreview,
  }) =>
      MessageSendOptions(
        suggestedPostInfo: suggestedPostInfo ?? this.suggestedPostInfo,
        disableNotification: disableNotification ?? this.disableNotification,
        fromBackground: fromBackground ?? this.fromBackground,
        protectContent: protectContent ?? this.protectContent,
        allowPaidBroadcast: allowPaidBroadcast ?? this.allowPaidBroadcast,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
        updateOrderOfInstalledStickerSets: updateOrderOfInstalledStickerSets ??
            this.updateOrderOfInstalledStickerSets,
        schedulingState: schedulingState ?? this.schedulingState,
        effectId: effectId ?? this.effectId,
        sendingId: sendingId ?? this.sendingId,
        onlyPreview: onlyPreview ?? this.onlyPreview,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSendOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
