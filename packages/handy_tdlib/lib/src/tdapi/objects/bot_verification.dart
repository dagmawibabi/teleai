part of '../tdapi.dart';

/// **BotVerification** *(botVerification)* - basic class
///
/// Describes verification status provided by a bot.
///
/// * [botUserId]: Identifier of the bot that provided the verification.
/// * [iconCustomEmojiId]: Identifier of the custom emoji that is used as the verification sign.
/// * [customDescription]: Custom description of verification reason set by the bot. Can contain only Mention, Hashtag, Cashtag, PhoneNumber, BankCardNumber, TonAddress, Url, and EmailAddress entities.
final class BotVerification extends TdObject {
  /// **BotVerification** *(botVerification)* - basic class
  ///
  /// Describes verification status provided by a bot.
  ///
  /// * [botUserId]: Identifier of the bot that provided the verification.
  /// * [iconCustomEmojiId]: Identifier of the custom emoji that is used as the verification sign.
  /// * [customDescription]: Custom description of verification reason set by the bot. Can contain only Mention, Hashtag, Cashtag, PhoneNumber, BankCardNumber, TonAddress, Url, and EmailAddress entities.
  const BotVerification({
    required this.botUserId,
    required this.iconCustomEmojiId,
    required this.customDescription,
  });

  /// Identifier of the bot that provided the verification
  final int botUserId;

  /// Identifier of the custom emoji that is used as the verification sign
  final int iconCustomEmojiId;

  /// Custom description of verification reason set by the bot. Can contain only Mention, Hashtag, Cashtag, PhoneNumber, BankCardNumber, TonAddress, Url, and EmailAddress entities
  final FormattedText customDescription;

  /// Parse from a json
  factory BotVerification.fromJson(Map<String, dynamic> json) =>
      BotVerification(
        botUserId: json['bot_user_id'],
        iconCustomEmojiId: json['icon_custom_emoji_id'] is int
            ? json['icon_custom_emoji_id']
            : int.parse(json['icon_custom_emoji_id']),
        customDescription: FormattedText.fromJson(json['custom_description']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "icon_custom_emoji_id": iconCustomEmojiId,
      "custom_description": customDescription.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot that provided the verification
  /// * [icon_custom_emoji_id]: Identifier of the custom emoji that is used as the verification sign
  /// * [custom_description]: Custom description of verification reason set by the bot. Can contain only Mention, Hashtag, Cashtag, PhoneNumber, BankCardNumber, TonAddress, Url, and EmailAddress entities
  BotVerification copyWith({
    int? botUserId,
    int? iconCustomEmojiId,
    FormattedText? customDescription,
  }) =>
      BotVerification(
        botUserId: botUserId ?? this.botUserId,
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
        customDescription: customDescription ?? this.customDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botVerification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
