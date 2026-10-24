part of '../tdapi.dart';

/// **PostStory** *(postStory)* - TDLib function
///
/// Posts a new story on behalf of a chat; requires can_post_stories administrator right for supergroup and channel chats. Returns a temporary story.
///
/// * [chatId]: Identifier of the chat that will post the story. Pass Saved Messages chat identifier when posting a story on behalf of the current user.
/// * [content]: Content of the story.
/// * [areas]: Clickable rectangle areas to be shown on the story media; pass null if none *(optional)*.
/// * [caption]: Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption") *(optional)*.
/// * [privacySettings]: The privacy settings for the story; ignored for stories posted on behalf of supergroup and channel chats.
/// * [albumIds]: Identifiers of story albums to which the story will be added upon posting. An album can have up to getOption("story_album_size_max") stories.
/// * [activePeriod]: Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise.
/// * [fromStoryFullId]: Full identifier of the original story, which content was used to create the story; pass null if the story isn't repost of another story *(optional)*.
/// * [isPostedToChatPage]: Pass true to keep the story accessible after expiration.
/// * [protectContent]: Pass true if the content of the story must be protected from forwarding and screenshotting.
///
/// [Story] is returned on completion.
final class PostStory extends TdFunction {
  /// **PostStory** *(postStory)* - TDLib function
  ///
  /// Posts a new story on behalf of a chat; requires can_post_stories administrator right for supergroup and channel chats. Returns a temporary story.
  ///
  /// * [chatId]: Identifier of the chat that will post the story. Pass Saved Messages chat identifier when posting a story on behalf of the current user.
  /// * [content]: Content of the story.
  /// * [areas]: Clickable rectangle areas to be shown on the story media; pass null if none *(optional)*.
  /// * [caption]: Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption") *(optional)*.
  /// * [privacySettings]: The privacy settings for the story; ignored for stories posted on behalf of supergroup and channel chats.
  /// * [albumIds]: Identifiers of story albums to which the story will be added upon posting. An album can have up to getOption("story_album_size_max") stories.
  /// * [activePeriod]: Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise.
  /// * [fromStoryFullId]: Full identifier of the original story, which content was used to create the story; pass null if the story isn't repost of another story *(optional)*.
  /// * [isPostedToChatPage]: Pass true to keep the story accessible after expiration.
  /// * [protectContent]: Pass true if the content of the story must be protected from forwarding and screenshotting.
  ///
  /// [Story] is returned on completion.
  const PostStory({
    required this.chatId,
    required this.content,
    this.areas,
    this.caption,
    required this.privacySettings,
    required this.albumIds,
    required this.activePeriod,
    this.fromStoryFullId,
    required this.isPostedToChatPage,
    required this.protectContent,
  });

  /// Identifier of the chat that will post the story. Pass Saved Messages chat identifier when posting a story on behalf of the current user
  final int chatId;

  /// Content of the story
  final InputStoryContent content;

  /// Clickable rectangle areas to be shown on the story media; pass null if none
  final InputStoryAreas? areas;

  /// Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption")
  final FormattedText? caption;

  /// The privacy settings for the story; ignored for stories posted on behalf of supergroup and channel chats
  final StoryPrivacySettings privacySettings;

  /// Identifiers of story albums to which the story will be added upon posting. An album can have up to getOption("story_album_size_max") stories
  final List<int> albumIds;

  /// Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
  final int activePeriod;

  /// Full identifier of the original story, which content was used to create the story; pass null if the story isn't repost of another story
  final StoryFullId? fromStoryFullId;

  /// Pass true to keep the story accessible after expiration
  final bool isPostedToChatPage;

  /// Pass true if the content of the story must be protected from forwarding and screenshotting
  final bool protectContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "content": content.toJson(),
      "areas": areas?.toJson(),
      "caption": caption?.toJson(),
      "privacy_settings": privacySettings.toJson(),
      "album_ids": albumIds.map((i) => i).toList(),
      "active_period": activePeriod,
      "from_story_full_id": fromStoryFullId?.toJson(),
      "is_posted_to_chat_page": isPostedToChatPage,
      "protect_content": protectContent,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that will post the story. Pass Saved Messages chat identifier when posting a story on behalf of the current user
  /// * [content]: Content of the story
  /// * [areas]: Clickable rectangle areas to be shown on the story media; pass null if none
  /// * [caption]: Story caption; pass null to use an empty caption; 0-getOption("story_caption_length_max") characters; can have entities only if getOption("can_use_text_entities_in_story_caption")
  /// * [privacy_settings]: The privacy settings for the story; ignored for stories posted on behalf of supergroup and channel chats
  /// * [album_ids]: Identifiers of story albums to which the story will be added upon posting. An album can have up to getOption("story_album_size_max") stories
  /// * [active_period]: Period after which the story is moved to archive, in seconds; must be one of 6 * 3600, 12 * 3600, 86400, or 2 * 86400 for Telegram Premium users, and 86400 otherwise
  /// * [from_story_full_id]: Full identifier of the original story, which content was used to create the story; pass null if the story isn't repost of another story
  /// * [is_posted_to_chat_page]: Pass true to keep the story accessible after expiration
  /// * [protect_content]: Pass true if the content of the story must be protected from forwarding and screenshotting
  PostStory copyWith({
    int? chatId,
    InputStoryContent? content,
    InputStoryAreas? areas,
    FormattedText? caption,
    StoryPrivacySettings? privacySettings,
    List<int>? albumIds,
    int? activePeriod,
    StoryFullId? fromStoryFullId,
    bool? isPostedToChatPage,
    bool? protectContent,
  }) =>
      PostStory(
        chatId: chatId ?? this.chatId,
        content: content ?? this.content,
        areas: areas ?? this.areas,
        caption: caption ?? this.caption,
        privacySettings: privacySettings ?? this.privacySettings,
        albumIds: albumIds ?? this.albumIds,
        activePeriod: activePeriod ?? this.activePeriod,
        fromStoryFullId: fromStoryFullId ?? this.fromStoryFullId,
        isPostedToChatPage: isPostedToChatPage ?? this.isPostedToChatPage,
        protectContent: protectContent ?? this.protectContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'postStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
