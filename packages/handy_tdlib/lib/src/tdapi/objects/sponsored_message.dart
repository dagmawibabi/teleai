part of '../tdapi.dart';

/// **SponsoredMessage** *(sponsoredMessage)* - basic class
///
/// Describes a sponsored message.
///
/// * [messageId]: Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages.
/// * [isRecommended]: True, if the message needs to be labeled as "recommended" instead of "sponsored".
/// * [canBeReported]: True, if the message can be reported to Telegram moderators through reportChatSponsoredMessage.
/// * [content]: Content of the message. Currently, can be only of the types messageText, messageAnimation, messagePhoto, or messageVideo. Video messages can be viewed fullscreen.. The content must be fully downloaded before the message is shown.
/// * [sponsor]: Information about the sponsor of the message.
/// * [title]: Title of the sponsored message.
/// * [buttonText]: Text for the message action button.
/// * [accentColorId]: Identifier of the accent color for title, button text and message background.
/// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the message background; 0 if none.
/// * [additionalInfo]: If non-empty, additional information about the sponsored message to be shown along with the message.
final class SponsoredMessage extends TdObject {
  /// **SponsoredMessage** *(sponsoredMessage)* - basic class
  ///
  /// Describes a sponsored message.
  ///
  /// * [messageId]: Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages.
  /// * [isRecommended]: True, if the message needs to be labeled as "recommended" instead of "sponsored".
  /// * [canBeReported]: True, if the message can be reported to Telegram moderators through reportChatSponsoredMessage.
  /// * [content]: Content of the message. Currently, can be only of the types messageText, messageAnimation, messagePhoto, or messageVideo. Video messages can be viewed fullscreen.. The content must be fully downloaded before the message is shown.
  /// * [sponsor]: Information about the sponsor of the message.
  /// * [title]: Title of the sponsored message.
  /// * [buttonText]: Text for the message action button.
  /// * [accentColorId]: Identifier of the accent color for title, button text and message background.
  /// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the message background; 0 if none.
  /// * [additionalInfo]: If non-empty, additional information about the sponsored message to be shown along with the message.
  const SponsoredMessage({
    required this.messageId,
    required this.isRecommended,
    required this.canBeReported,
    required this.content,
    required this.sponsor,
    required this.title,
    required this.buttonText,
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
    required this.additionalInfo,
  });

  /// Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
  final int messageId;

  /// True, if the message needs to be labeled as "recommended" instead of "sponsored"
  final bool isRecommended;

  /// True, if the message can be reported to Telegram moderators through reportChatSponsoredMessage
  final bool canBeReported;

  /// Content of the message. Currently, can be only of the types messageText, messageAnimation, messagePhoto, or messageVideo. Video messages can be viewed fullscreen.. The content must be fully downloaded before the message is shown
  final MessageContent content;

  /// Information about the sponsor of the message
  final AdvertisementSponsor sponsor;

  /// Title of the sponsored message
  final String title;

  /// Text for the message action button
  final String buttonText;

  /// Identifier of the accent color for title, button text and message background
  final int accentColorId;

  /// Identifier of a custom emoji to be shown on the message background; 0 if none
  final int backgroundCustomEmojiId;

  /// If non-empty, additional information about the sponsored message to be shown along with the message
  final String additionalInfo;

  /// Parse from a json
  factory SponsoredMessage.fromJson(Map<String, dynamic> json) =>
      SponsoredMessage(
        messageId: json['message_id'],
        isRecommended: json['is_recommended'],
        canBeReported: json['can_be_reported'],
        content: MessageContent.fromJson(json['content']),
        sponsor: AdvertisementSponsor.fromJson(json['sponsor']),
        title: json['title'],
        buttonText: json['button_text'],
        accentColorId: json['accent_color_id'],
        backgroundCustomEmojiId: json['background_custom_emoji_id'] is int
            ? json['background_custom_emoji_id']
            : int.tryParse(json['background_custom_emoji_id'] ?? "") ?? 0,
        additionalInfo: json['additional_info'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
      "is_recommended": isRecommended,
      "can_be_reported": canBeReported,
      "content": content.toJson(),
      "sponsor": sponsor.toJson(),
      "title": title,
      "button_text": buttonText,
      "accent_color_id": accentColorId,
      "background_custom_emoji_id": backgroundCustomEmojiId,
      "additional_info": additionalInfo,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
  /// * [is_recommended]: True, if the message needs to be labeled as "recommended" instead of "sponsored"
  /// * [can_be_reported]: True, if the message can be reported to Telegram moderators through reportChatSponsoredMessage
  /// * [content]: Content of the message. Currently, can be only of the types messageText, messageAnimation, messagePhoto, or messageVideo. Video messages can be viewed fullscreen.. The content must be fully downloaded before the message is shown
  /// * [sponsor]: Information about the sponsor of the message
  /// * [title]: Title of the sponsored message
  /// * [button_text]: Text for the message action button
  /// * [accent_color_id]: Identifier of the accent color for title, button text and message background
  /// * [background_custom_emoji_id]: Identifier of a custom emoji to be shown on the message background; 0 if none
  /// * [additional_info]: If non-empty, additional information about the sponsored message to be shown along with the message
  SponsoredMessage copyWith({
    int? messageId,
    bool? isRecommended,
    bool? canBeReported,
    MessageContent? content,
    AdvertisementSponsor? sponsor,
    String? title,
    String? buttonText,
    int? accentColorId,
    int? backgroundCustomEmojiId,
    String? additionalInfo,
  }) =>
      SponsoredMessage(
        messageId: messageId ?? this.messageId,
        isRecommended: isRecommended ?? this.isRecommended,
        canBeReported: canBeReported ?? this.canBeReported,
        content: content ?? this.content,
        sponsor: sponsor ?? this.sponsor,
        title: title ?? this.title,
        buttonText: buttonText ?? this.buttonText,
        accentColorId: accentColorId ?? this.accentColorId,
        backgroundCustomEmojiId:
            backgroundCustomEmojiId ?? this.backgroundCustomEmojiId,
        additionalInfo: additionalInfo ?? this.additionalInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sponsoredMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
