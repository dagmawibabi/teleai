part of '../tdapi.dart';

/// **ChatNotificationSettings** *(chatNotificationSettings)* - basic class
///
/// Contains information about notification settings for a chat or a forum topic.
///
/// * [useDefaultMuteFor]: If true, the value for the relevant type of chat or the forum chat is used instead of mute_for.
/// * [muteFor]: Time left before notifications will be unmuted, in seconds.
/// * [useDefaultSound]: If true, the value for the relevant type of chat or the forum chat is used instead of sound_id.
/// * [soundId]: Identifier of the notification sound to be played for messages; 0 if sound is disabled.
/// * [useDefaultShowPreview]: If true, the value for the relevant type of chat or the forum chat is used instead of show_preview.
/// * [showPreview]: True, if message content must be displayed in notifications.
/// * [useDefaultMuteStories]: If true, the value for the relevant type of chat is used instead of mute_stories.
/// * [muteStories]: True, if story notifications are disabled for the chat.
/// * [useDefaultStorySound]: If true, the value for the relevant type of chat is used instead of story_sound_id.
/// * [storySoundId]: Identifier of the notification sound to be played for stories; 0 if sound is disabled.
/// * [useDefaultShowStoryPoster]: If true, the value for the relevant type of chat is used instead of show_story_poster.
/// * [showStoryPoster]: True, if the chat that posted a story must be displayed in notifications.
/// * [useDefaultDisablePinnedMessageNotifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_pinned_message_notifications.
/// * [disablePinnedMessageNotifications]: If true, notifications for incoming pinned messages will be created as for an ordinary unread message.
/// * [useDefaultDisableMentionNotifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_mention_notifications.
/// * [disableMentionNotifications]: If true, notifications for messages with mentions will be created as for an ordinary unread message.
final class ChatNotificationSettings extends TdObject {
  /// **ChatNotificationSettings** *(chatNotificationSettings)* - basic class
  ///
  /// Contains information about notification settings for a chat or a forum topic.
  ///
  /// * [useDefaultMuteFor]: If true, the value for the relevant type of chat or the forum chat is used instead of mute_for.
  /// * [muteFor]: Time left before notifications will be unmuted, in seconds.
  /// * [useDefaultSound]: If true, the value for the relevant type of chat or the forum chat is used instead of sound_id.
  /// * [soundId]: Identifier of the notification sound to be played for messages; 0 if sound is disabled.
  /// * [useDefaultShowPreview]: If true, the value for the relevant type of chat or the forum chat is used instead of show_preview.
  /// * [showPreview]: True, if message content must be displayed in notifications.
  /// * [useDefaultMuteStories]: If true, the value for the relevant type of chat is used instead of mute_stories.
  /// * [muteStories]: True, if story notifications are disabled for the chat.
  /// * [useDefaultStorySound]: If true, the value for the relevant type of chat is used instead of story_sound_id.
  /// * [storySoundId]: Identifier of the notification sound to be played for stories; 0 if sound is disabled.
  /// * [useDefaultShowStoryPoster]: If true, the value for the relevant type of chat is used instead of show_story_poster.
  /// * [showStoryPoster]: True, if the chat that posted a story must be displayed in notifications.
  /// * [useDefaultDisablePinnedMessageNotifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_pinned_message_notifications.
  /// * [disablePinnedMessageNotifications]: If true, notifications for incoming pinned messages will be created as for an ordinary unread message.
  /// * [useDefaultDisableMentionNotifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_mention_notifications.
  /// * [disableMentionNotifications]: If true, notifications for messages with mentions will be created as for an ordinary unread message.
  const ChatNotificationSettings({
    required this.useDefaultMuteFor,
    required this.muteFor,
    required this.useDefaultSound,
    required this.soundId,
    required this.useDefaultShowPreview,
    required this.showPreview,
    required this.useDefaultMuteStories,
    required this.muteStories,
    required this.useDefaultStorySound,
    required this.storySoundId,
    required this.useDefaultShowStoryPoster,
    required this.showStoryPoster,
    required this.useDefaultDisablePinnedMessageNotifications,
    required this.disablePinnedMessageNotifications,
    required this.useDefaultDisableMentionNotifications,
    required this.disableMentionNotifications,
  });

  /// If true, the value for the relevant type of chat or the forum chat is used instead of mute_for
  final bool useDefaultMuteFor;

  /// Time left before notifications will be unmuted, in seconds
  final int muteFor;

  /// If true, the value for the relevant type of chat or the forum chat is used instead of sound_id
  final bool useDefaultSound;

  /// Identifier of the notification sound to be played for messages; 0 if sound is disabled
  final int soundId;

  /// If true, the value for the relevant type of chat or the forum chat is used instead of show_preview
  final bool useDefaultShowPreview;

  /// True, if message content must be displayed in notifications
  final bool showPreview;

  /// If true, the value for the relevant type of chat is used instead of mute_stories
  final bool useDefaultMuteStories;

  /// True, if story notifications are disabled for the chat
  final bool muteStories;

  /// If true, the value for the relevant type of chat is used instead of story_sound_id
  final bool useDefaultStorySound;

  /// Identifier of the notification sound to be played for stories; 0 if sound is disabled
  final int storySoundId;

  /// If true, the value for the relevant type of chat is used instead of show_story_poster
  final bool useDefaultShowStoryPoster;

  /// True, if the chat that posted a story must be displayed in notifications
  final bool showStoryPoster;

  /// If true, the value for the relevant type of chat or the forum chat is used instead of disable_pinned_message_notifications
  final bool useDefaultDisablePinnedMessageNotifications;

  /// If true, notifications for incoming pinned messages will be created as for an ordinary unread message
  final bool disablePinnedMessageNotifications;

  /// If true, the value for the relevant type of chat or the forum chat is used instead of disable_mention_notifications
  final bool useDefaultDisableMentionNotifications;

  /// If true, notifications for messages with mentions will be created as for an ordinary unread message
  final bool disableMentionNotifications;

  /// Parse from a json
  factory ChatNotificationSettings.fromJson(Map<String, dynamic> json) =>
      ChatNotificationSettings(
        useDefaultMuteFor: json['use_default_mute_for'],
        muteFor: json['mute_for'],
        useDefaultSound: json['use_default_sound'],
        soundId: json['sound_id'] is int
            ? json['sound_id']
            : int.parse(json['sound_id']),
        useDefaultShowPreview: json['use_default_show_preview'],
        showPreview: json['show_preview'],
        useDefaultMuteStories: json['use_default_mute_stories'],
        muteStories: json['mute_stories'],
        useDefaultStorySound: json['use_default_story_sound'],
        storySoundId: json['story_sound_id'] is int
            ? json['story_sound_id']
            : int.parse(json['story_sound_id']),
        useDefaultShowStoryPoster: json['use_default_show_story_poster'],
        showStoryPoster: json['show_story_poster'],
        useDefaultDisablePinnedMessageNotifications:
            json['use_default_disable_pinned_message_notifications'],
        disablePinnedMessageNotifications:
            json['disable_pinned_message_notifications'],
        useDefaultDisableMentionNotifications:
            json['use_default_disable_mention_notifications'],
        disableMentionNotifications: json['disable_mention_notifications'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "use_default_mute_for": useDefaultMuteFor,
      "mute_for": muteFor,
      "use_default_sound": useDefaultSound,
      "sound_id": soundId,
      "use_default_show_preview": useDefaultShowPreview,
      "show_preview": showPreview,
      "use_default_mute_stories": useDefaultMuteStories,
      "mute_stories": muteStories,
      "use_default_story_sound": useDefaultStorySound,
      "story_sound_id": storySoundId,
      "use_default_show_story_poster": useDefaultShowStoryPoster,
      "show_story_poster": showStoryPoster,
      "use_default_disable_pinned_message_notifications":
          useDefaultDisablePinnedMessageNotifications,
      "disable_pinned_message_notifications": disablePinnedMessageNotifications,
      "use_default_disable_mention_notifications":
          useDefaultDisableMentionNotifications,
      "disable_mention_notifications": disableMentionNotifications,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [use_default_mute_for]: If true, the value for the relevant type of chat or the forum chat is used instead of mute_for
  /// * [mute_for]: Time left before notifications will be unmuted, in seconds
  /// * [use_default_sound]: If true, the value for the relevant type of chat or the forum chat is used instead of sound_id
  /// * [sound_id]: Identifier of the notification sound to be played for messages; 0 if sound is disabled
  /// * [use_default_show_preview]: If true, the value for the relevant type of chat or the forum chat is used instead of show_preview
  /// * [show_preview]: True, if message content must be displayed in notifications
  /// * [use_default_mute_stories]: If true, the value for the relevant type of chat is used instead of mute_stories
  /// * [mute_stories]: True, if story notifications are disabled for the chat
  /// * [use_default_story_sound]: If true, the value for the relevant type of chat is used instead of story_sound_id
  /// * [story_sound_id]: Identifier of the notification sound to be played for stories; 0 if sound is disabled
  /// * [use_default_show_story_poster]: If true, the value for the relevant type of chat is used instead of show_story_poster
  /// * [show_story_poster]: True, if the chat that posted a story must be displayed in notifications
  /// * [use_default_disable_pinned_message_notifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_pinned_message_notifications
  /// * [disable_pinned_message_notifications]: If true, notifications for incoming pinned messages will be created as for an ordinary unread message
  /// * [use_default_disable_mention_notifications]: If true, the value for the relevant type of chat or the forum chat is used instead of disable_mention_notifications
  /// * [disable_mention_notifications]: If true, notifications for messages with mentions will be created as for an ordinary unread message
  ChatNotificationSettings copyWith({
    bool? useDefaultMuteFor,
    int? muteFor,
    bool? useDefaultSound,
    int? soundId,
    bool? useDefaultShowPreview,
    bool? showPreview,
    bool? useDefaultMuteStories,
    bool? muteStories,
    bool? useDefaultStorySound,
    int? storySoundId,
    bool? useDefaultShowStoryPoster,
    bool? showStoryPoster,
    bool? useDefaultDisablePinnedMessageNotifications,
    bool? disablePinnedMessageNotifications,
    bool? useDefaultDisableMentionNotifications,
    bool? disableMentionNotifications,
  }) =>
      ChatNotificationSettings(
        useDefaultMuteFor: useDefaultMuteFor ?? this.useDefaultMuteFor,
        muteFor: muteFor ?? this.muteFor,
        useDefaultSound: useDefaultSound ?? this.useDefaultSound,
        soundId: soundId ?? this.soundId,
        useDefaultShowPreview:
            useDefaultShowPreview ?? this.useDefaultShowPreview,
        showPreview: showPreview ?? this.showPreview,
        useDefaultMuteStories:
            useDefaultMuteStories ?? this.useDefaultMuteStories,
        muteStories: muteStories ?? this.muteStories,
        useDefaultStorySound: useDefaultStorySound ?? this.useDefaultStorySound,
        storySoundId: storySoundId ?? this.storySoundId,
        useDefaultShowStoryPoster:
            useDefaultShowStoryPoster ?? this.useDefaultShowStoryPoster,
        showStoryPoster: showStoryPoster ?? this.showStoryPoster,
        useDefaultDisablePinnedMessageNotifications:
            useDefaultDisablePinnedMessageNotifications ??
                this.useDefaultDisablePinnedMessageNotifications,
        disablePinnedMessageNotifications: disablePinnedMessageNotifications ??
            this.disablePinnedMessageNotifications,
        useDefaultDisableMentionNotifications:
            useDefaultDisableMentionNotifications ??
                this.useDefaultDisableMentionNotifications,
        disableMentionNotifications:
            disableMentionNotifications ?? this.disableMentionNotifications,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
