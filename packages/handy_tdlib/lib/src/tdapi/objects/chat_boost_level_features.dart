part of '../tdapi.dart';

/// **ChatBoostLevelFeatures** *(chatBoostLevelFeatures)* - basic class
///
/// Contains a list of features available on a specific chat boost level.
///
/// * [level]: Target chat boost level.
/// * [storyPerDayCount]: Number of stories that the chat can publish daily.
/// * [customEmojiReactionCount]: Number of custom emoji reactions that can be added to the list of available reactions.
/// * [titleColorCount]: Number of custom colors for chat title.
/// * [profileAccentColorCount]: Number of custom colors for profile photo background.
/// * [canSetProfileBackgroundCustomEmoji]: True, if custom emoji for profile background can be set.
/// * [accentColorCount]: Number of custom colors for background of empty chat photo, replies to messages and link previews.
/// * [canSetBackgroundCustomEmoji]: True, if custom emoji for reply header and link preview background can be set.
/// * [canSetEmojiStatus]: True, if emoji status can be set.
/// * [chatThemeBackgroundCount]: Number of chat theme backgrounds that can be set as chat background.
/// * [canSetCustomBackground]: True, if custom background can be set in the chat for all users.
/// * [canSetCustomEmojiStickerSet]: True, if custom emoji sticker set can be set for the chat.
/// * [canEnableAutomaticTranslation]: True, if automatic translation of messages can be enabled in the chat.
/// * [canRecognizeSpeech]: True, if speech recognition can be used for video note and voice note messages by all users.
/// * [canDisableSponsoredMessages]: True, if sponsored messages can be disabled in the chat.
final class ChatBoostLevelFeatures extends TdObject {
  /// **ChatBoostLevelFeatures** *(chatBoostLevelFeatures)* - basic class
  ///
  /// Contains a list of features available on a specific chat boost level.
  ///
  /// * [level]: Target chat boost level.
  /// * [storyPerDayCount]: Number of stories that the chat can publish daily.
  /// * [customEmojiReactionCount]: Number of custom emoji reactions that can be added to the list of available reactions.
  /// * [titleColorCount]: Number of custom colors for chat title.
  /// * [profileAccentColorCount]: Number of custom colors for profile photo background.
  /// * [canSetProfileBackgroundCustomEmoji]: True, if custom emoji for profile background can be set.
  /// * [accentColorCount]: Number of custom colors for background of empty chat photo, replies to messages and link previews.
  /// * [canSetBackgroundCustomEmoji]: True, if custom emoji for reply header and link preview background can be set.
  /// * [canSetEmojiStatus]: True, if emoji status can be set.
  /// * [chatThemeBackgroundCount]: Number of chat theme backgrounds that can be set as chat background.
  /// * [canSetCustomBackground]: True, if custom background can be set in the chat for all users.
  /// * [canSetCustomEmojiStickerSet]: True, if custom emoji sticker set can be set for the chat.
  /// * [canEnableAutomaticTranslation]: True, if automatic translation of messages can be enabled in the chat.
  /// * [canRecognizeSpeech]: True, if speech recognition can be used for video note and voice note messages by all users.
  /// * [canDisableSponsoredMessages]: True, if sponsored messages can be disabled in the chat.
  const ChatBoostLevelFeatures({
    required this.level,
    required this.storyPerDayCount,
    required this.customEmojiReactionCount,
    required this.titleColorCount,
    required this.profileAccentColorCount,
    required this.canSetProfileBackgroundCustomEmoji,
    required this.accentColorCount,
    required this.canSetBackgroundCustomEmoji,
    required this.canSetEmojiStatus,
    required this.chatThemeBackgroundCount,
    required this.canSetCustomBackground,
    required this.canSetCustomEmojiStickerSet,
    required this.canEnableAutomaticTranslation,
    required this.canRecognizeSpeech,
    required this.canDisableSponsoredMessages,
    this.extra,
    this.clientId,
  });

  /// Target chat boost level
  final int level;

  /// Number of stories that the chat can publish daily
  final int storyPerDayCount;

  /// Number of custom emoji reactions that can be added to the list of available reactions
  final int customEmojiReactionCount;

  /// Number of custom colors for chat title
  final int titleColorCount;

  /// Number of custom colors for profile photo background
  final int profileAccentColorCount;

  /// True, if custom emoji for profile background can be set
  final bool canSetProfileBackgroundCustomEmoji;

  /// Number of custom colors for background of empty chat photo, replies to messages and link previews
  final int accentColorCount;

  /// True, if custom emoji for reply header and link preview background can be set
  final bool canSetBackgroundCustomEmoji;

  /// True, if emoji status can be set
  final bool canSetEmojiStatus;

  /// Number of chat theme backgrounds that can be set as chat background
  final int chatThemeBackgroundCount;

  /// True, if custom background can be set in the chat for all users
  final bool canSetCustomBackground;

  /// True, if custom emoji sticker set can be set for the chat
  final bool canSetCustomEmojiStickerSet;

  /// True, if automatic translation of messages can be enabled in the chat
  final bool canEnableAutomaticTranslation;

  /// True, if speech recognition can be used for video note and voice note messages by all users
  final bool canRecognizeSpeech;

  /// True, if sponsored messages can be disabled in the chat
  final bool canDisableSponsoredMessages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostLevelFeatures.fromJson(Map<String, dynamic> json) =>
      ChatBoostLevelFeatures(
        level: json['level'],
        storyPerDayCount: json['story_per_day_count'],
        customEmojiReactionCount: json['custom_emoji_reaction_count'],
        titleColorCount: json['title_color_count'],
        profileAccentColorCount: json['profile_accent_color_count'],
        canSetProfileBackgroundCustomEmoji:
            json['can_set_profile_background_custom_emoji'],
        accentColorCount: json['accent_color_count'],
        canSetBackgroundCustomEmoji: json['can_set_background_custom_emoji'],
        canSetEmojiStatus: json['can_set_emoji_status'],
        chatThemeBackgroundCount: json['chat_theme_background_count'],
        canSetCustomBackground: json['can_set_custom_background'],
        canSetCustomEmojiStickerSet: json['can_set_custom_emoji_sticker_set'],
        canEnableAutomaticTranslation: json['can_enable_automatic_translation'],
        canRecognizeSpeech: json['can_recognize_speech'],
        canDisableSponsoredMessages: json['can_disable_sponsored_messages'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "level": level,
      "story_per_day_count": storyPerDayCount,
      "custom_emoji_reaction_count": customEmojiReactionCount,
      "title_color_count": titleColorCount,
      "profile_accent_color_count": profileAccentColorCount,
      "can_set_profile_background_custom_emoji":
          canSetProfileBackgroundCustomEmoji,
      "accent_color_count": accentColorCount,
      "can_set_background_custom_emoji": canSetBackgroundCustomEmoji,
      "can_set_emoji_status": canSetEmojiStatus,
      "chat_theme_background_count": chatThemeBackgroundCount,
      "can_set_custom_background": canSetCustomBackground,
      "can_set_custom_emoji_sticker_set": canSetCustomEmojiStickerSet,
      "can_enable_automatic_translation": canEnableAutomaticTranslation,
      "can_recognize_speech": canRecognizeSpeech,
      "can_disable_sponsored_messages": canDisableSponsoredMessages,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [level]: Target chat boost level
  /// * [story_per_day_count]: Number of stories that the chat can publish daily
  /// * [custom_emoji_reaction_count]: Number of custom emoji reactions that can be added to the list of available reactions
  /// * [title_color_count]: Number of custom colors for chat title
  /// * [profile_accent_color_count]: Number of custom colors for profile photo background
  /// * [can_set_profile_background_custom_emoji]: True, if custom emoji for profile background can be set
  /// * [accent_color_count]: Number of custom colors for background of empty chat photo, replies to messages and link previews
  /// * [can_set_background_custom_emoji]: True, if custom emoji for reply header and link preview background can be set
  /// * [can_set_emoji_status]: True, if emoji status can be set
  /// * [chat_theme_background_count]: Number of chat theme backgrounds that can be set as chat background
  /// * [can_set_custom_background]: True, if custom background can be set in the chat for all users
  /// * [can_set_custom_emoji_sticker_set]: True, if custom emoji sticker set can be set for the chat
  /// * [can_enable_automatic_translation]: True, if automatic translation of messages can be enabled in the chat
  /// * [can_recognize_speech]: True, if speech recognition can be used for video note and voice note messages by all users
  /// * [can_disable_sponsored_messages]: True, if sponsored messages can be disabled in the chat
  ChatBoostLevelFeatures copyWith({
    int? level,
    int? storyPerDayCount,
    int? customEmojiReactionCount,
    int? titleColorCount,
    int? profileAccentColorCount,
    bool? canSetProfileBackgroundCustomEmoji,
    int? accentColorCount,
    bool? canSetBackgroundCustomEmoji,
    bool? canSetEmojiStatus,
    int? chatThemeBackgroundCount,
    bool? canSetCustomBackground,
    bool? canSetCustomEmojiStickerSet,
    bool? canEnableAutomaticTranslation,
    bool? canRecognizeSpeech,
    bool? canDisableSponsoredMessages,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostLevelFeatures(
        level: level ?? this.level,
        storyPerDayCount: storyPerDayCount ?? this.storyPerDayCount,
        customEmojiReactionCount:
            customEmojiReactionCount ?? this.customEmojiReactionCount,
        titleColorCount: titleColorCount ?? this.titleColorCount,
        profileAccentColorCount:
            profileAccentColorCount ?? this.profileAccentColorCount,
        canSetProfileBackgroundCustomEmoji:
            canSetProfileBackgroundCustomEmoji ??
                this.canSetProfileBackgroundCustomEmoji,
        accentColorCount: accentColorCount ?? this.accentColorCount,
        canSetBackgroundCustomEmoji:
            canSetBackgroundCustomEmoji ?? this.canSetBackgroundCustomEmoji,
        canSetEmojiStatus: canSetEmojiStatus ?? this.canSetEmojiStatus,
        chatThemeBackgroundCount:
            chatThemeBackgroundCount ?? this.chatThemeBackgroundCount,
        canSetCustomBackground:
            canSetCustomBackground ?? this.canSetCustomBackground,
        canSetCustomEmojiStickerSet:
            canSetCustomEmojiStickerSet ?? this.canSetCustomEmojiStickerSet,
        canEnableAutomaticTranslation:
            canEnableAutomaticTranslation ?? this.canEnableAutomaticTranslation,
        canRecognizeSpeech: canRecognizeSpeech ?? this.canRecognizeSpeech,
        canDisableSponsoredMessages:
            canDisableSponsoredMessages ?? this.canDisableSponsoredMessages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostLevelFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
