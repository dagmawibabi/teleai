part of '../tdapi.dart';

/// **ChatBoostFeatures** *(chatBoostFeatures)* - basic class
///
/// Contains a list of features available on the first chat boost levels.
///
/// * [features]: The list of features.
/// * [minProfileBackgroundCustomEmojiBoostLevel]: The minimum boost level required to set custom emoji for profile background.
/// * [minBackgroundCustomEmojiBoostLevel]: The minimum boost level required to set custom emoji for reply header and link preview background; for channel chats only.
/// * [minEmojiStatusBoostLevel]: The minimum boost level required to set emoji status.
/// * [minChatThemeBackgroundBoostLevel]: The minimum boost level required to set a chat theme background as chat background.
/// * [minCustomBackgroundBoostLevel]: The minimum boost level required to set custom chat background.
/// * [minCustomEmojiStickerSetBoostLevel]: The minimum boost level required to set custom emoji sticker set for the chat; for supergroup chats only.
/// * [minAutomaticTranslationBoostLevel]: The minimum boost level allowing to enable automatic translation of messages for non-Premium users; for channel chats only.
/// * [minSpeechRecognitionBoostLevel]: The minimum boost level allowing to recognize speech in video note and voice note messages for non-Premium users; for supergroup chats only.
/// * [minSponsoredMessageDisableBoostLevel]: The minimum boost level allowing to disable sponsored messages in the chat; for channel chats only.
final class ChatBoostFeatures extends TdObject {
  /// **ChatBoostFeatures** *(chatBoostFeatures)* - basic class
  ///
  /// Contains a list of features available on the first chat boost levels.
  ///
  /// * [features]: The list of features.
  /// * [minProfileBackgroundCustomEmojiBoostLevel]: The minimum boost level required to set custom emoji for profile background.
  /// * [minBackgroundCustomEmojiBoostLevel]: The minimum boost level required to set custom emoji for reply header and link preview background; for channel chats only.
  /// * [minEmojiStatusBoostLevel]: The minimum boost level required to set emoji status.
  /// * [minChatThemeBackgroundBoostLevel]: The minimum boost level required to set a chat theme background as chat background.
  /// * [minCustomBackgroundBoostLevel]: The minimum boost level required to set custom chat background.
  /// * [minCustomEmojiStickerSetBoostLevel]: The minimum boost level required to set custom emoji sticker set for the chat; for supergroup chats only.
  /// * [minAutomaticTranslationBoostLevel]: The minimum boost level allowing to enable automatic translation of messages for non-Premium users; for channel chats only.
  /// * [minSpeechRecognitionBoostLevel]: The minimum boost level allowing to recognize speech in video note and voice note messages for non-Premium users; for supergroup chats only.
  /// * [minSponsoredMessageDisableBoostLevel]: The minimum boost level allowing to disable sponsored messages in the chat; for channel chats only.
  const ChatBoostFeatures({
    required this.features,
    required this.minProfileBackgroundCustomEmojiBoostLevel,
    required this.minBackgroundCustomEmojiBoostLevel,
    required this.minEmojiStatusBoostLevel,
    required this.minChatThemeBackgroundBoostLevel,
    required this.minCustomBackgroundBoostLevel,
    required this.minCustomEmojiStickerSetBoostLevel,
    required this.minAutomaticTranslationBoostLevel,
    required this.minSpeechRecognitionBoostLevel,
    required this.minSponsoredMessageDisableBoostLevel,
    this.extra,
    this.clientId,
  });

  /// The list of features
  final List<ChatBoostLevelFeatures> features;

  /// The minimum boost level required to set custom emoji for profile background
  final int minProfileBackgroundCustomEmojiBoostLevel;

  /// The minimum boost level required to set custom emoji for reply header and link preview background; for channel chats only
  final int minBackgroundCustomEmojiBoostLevel;

  /// The minimum boost level required to set emoji status
  final int minEmojiStatusBoostLevel;

  /// The minimum boost level required to set a chat theme background as chat background
  final int minChatThemeBackgroundBoostLevel;

  /// The minimum boost level required to set custom chat background
  final int minCustomBackgroundBoostLevel;

  /// The minimum boost level required to set custom emoji sticker set for the chat; for supergroup chats only
  final int minCustomEmojiStickerSetBoostLevel;

  /// The minimum boost level allowing to enable automatic translation of messages for non-Premium users; for channel chats only
  final int minAutomaticTranslationBoostLevel;

  /// The minimum boost level allowing to recognize speech in video note and voice note messages for non-Premium users; for supergroup chats only
  final int minSpeechRecognitionBoostLevel;

  /// The minimum boost level allowing to disable sponsored messages in the chat; for channel chats only
  final int minSponsoredMessageDisableBoostLevel;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostFeatures.fromJson(Map<String, dynamic> json) =>
      ChatBoostFeatures(
        features: List<ChatBoostLevelFeatures>.from((json['features'] ?? [])
            .map((item) => ChatBoostLevelFeatures.fromJson(item))
            .toList()),
        minProfileBackgroundCustomEmojiBoostLevel:
            json['min_profile_background_custom_emoji_boost_level'],
        minBackgroundCustomEmojiBoostLevel:
            json['min_background_custom_emoji_boost_level'],
        minEmojiStatusBoostLevel: json['min_emoji_status_boost_level'],
        minChatThemeBackgroundBoostLevel:
            json['min_chat_theme_background_boost_level'],
        minCustomBackgroundBoostLevel:
            json['min_custom_background_boost_level'],
        minCustomEmojiStickerSetBoostLevel:
            json['min_custom_emoji_sticker_set_boost_level'],
        minAutomaticTranslationBoostLevel:
            json['min_automatic_translation_boost_level'],
        minSpeechRecognitionBoostLevel:
            json['min_speech_recognition_boost_level'],
        minSponsoredMessageDisableBoostLevel:
            json['min_sponsored_message_disable_boost_level'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "features": features.map((i) => i.toJson()).toList(),
      "min_profile_background_custom_emoji_boost_level":
          minProfileBackgroundCustomEmojiBoostLevel,
      "min_background_custom_emoji_boost_level":
          minBackgroundCustomEmojiBoostLevel,
      "min_emoji_status_boost_level": minEmojiStatusBoostLevel,
      "min_chat_theme_background_boost_level": minChatThemeBackgroundBoostLevel,
      "min_custom_background_boost_level": minCustomBackgroundBoostLevel,
      "min_custom_emoji_sticker_set_boost_level":
          minCustomEmojiStickerSetBoostLevel,
      "min_automatic_translation_boost_level":
          minAutomaticTranslationBoostLevel,
      "min_speech_recognition_boost_level": minSpeechRecognitionBoostLevel,
      "min_sponsored_message_disable_boost_level":
          minSponsoredMessageDisableBoostLevel,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [features]: The list of features
  /// * [min_profile_background_custom_emoji_boost_level]: The minimum boost level required to set custom emoji for profile background
  /// * [min_background_custom_emoji_boost_level]: The minimum boost level required to set custom emoji for reply header and link preview background; for channel chats only
  /// * [min_emoji_status_boost_level]: The minimum boost level required to set emoji status
  /// * [min_chat_theme_background_boost_level]: The minimum boost level required to set a chat theme background as chat background
  /// * [min_custom_background_boost_level]: The minimum boost level required to set custom chat background
  /// * [min_custom_emoji_sticker_set_boost_level]: The minimum boost level required to set custom emoji sticker set for the chat; for supergroup chats only
  /// * [min_automatic_translation_boost_level]: The minimum boost level allowing to enable automatic translation of messages for non-Premium users; for channel chats only
  /// * [min_speech_recognition_boost_level]: The minimum boost level allowing to recognize speech in video note and voice note messages for non-Premium users; for supergroup chats only
  /// * [min_sponsored_message_disable_boost_level]: The minimum boost level allowing to disable sponsored messages in the chat; for channel chats only
  ChatBoostFeatures copyWith({
    List<ChatBoostLevelFeatures>? features,
    int? minProfileBackgroundCustomEmojiBoostLevel,
    int? minBackgroundCustomEmojiBoostLevel,
    int? minEmojiStatusBoostLevel,
    int? minChatThemeBackgroundBoostLevel,
    int? minCustomBackgroundBoostLevel,
    int? minCustomEmojiStickerSetBoostLevel,
    int? minAutomaticTranslationBoostLevel,
    int? minSpeechRecognitionBoostLevel,
    int? minSponsoredMessageDisableBoostLevel,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostFeatures(
        features: features ?? this.features,
        minProfileBackgroundCustomEmojiBoostLevel:
            minProfileBackgroundCustomEmojiBoostLevel ??
                this.minProfileBackgroundCustomEmojiBoostLevel,
        minBackgroundCustomEmojiBoostLevel:
            minBackgroundCustomEmojiBoostLevel ??
                this.minBackgroundCustomEmojiBoostLevel,
        minEmojiStatusBoostLevel:
            minEmojiStatusBoostLevel ?? this.minEmojiStatusBoostLevel,
        minChatThemeBackgroundBoostLevel: minChatThemeBackgroundBoostLevel ??
            this.minChatThemeBackgroundBoostLevel,
        minCustomBackgroundBoostLevel:
            minCustomBackgroundBoostLevel ?? this.minCustomBackgroundBoostLevel,
        minCustomEmojiStickerSetBoostLevel:
            minCustomEmojiStickerSetBoostLevel ??
                this.minCustomEmojiStickerSetBoostLevel,
        minAutomaticTranslationBoostLevel: minAutomaticTranslationBoostLevel ??
            this.minAutomaticTranslationBoostLevel,
        minSpeechRecognitionBoostLevel: minSpeechRecognitionBoostLevel ??
            this.minSpeechRecognitionBoostLevel,
        minSponsoredMessageDisableBoostLevel:
            minSponsoredMessageDisableBoostLevel ??
                this.minSponsoredMessageDisableBoostLevel,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
