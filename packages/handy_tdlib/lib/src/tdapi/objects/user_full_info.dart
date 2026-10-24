part of '../tdapi.dart';

/// **UserFullInfo** *(userFullInfo)* - basic class
///
/// Contains full information about a user.
///
/// * [personalPhoto]: User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos *(optional)*.
/// * [photo]: User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo *(optional)*.
/// * [publicPhoto]: User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos *(optional)*.
/// * [communityId]: Identifier of the community to which chat with the bot was added; for bots only.
/// * [blockList]: Block list to which the user is added; may be null if none *(optional)*.
/// * [canBeCalled]: True, if the user can be called.
/// * [supportsVideoCalls]: True, if a video call can be created with the user.
/// * [hasPrivateCalls]: True, if the user can't be called due to their privacy settings.
/// * [hasPrivateForwards]: True, if the user can't be linked in forwarded messages due to their privacy settings.
/// * [hasRestrictedVoiceAndVideoNoteMessages]: True, if voice and video notes can't be sent or forwarded to the user.
/// * [hasPostedToProfileStories]: True, if the user has posted to profile stories.
/// * [hasSponsoredMessagesEnabled]: True, if the user always enabled sponsored messages; known only for the current user.
/// * [needPhoneNumberPrivacyException]: True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used.
/// * [setChatBackground]: True, if the user set chat background for both chat users and it wasn't reverted yet.
/// * [usesUnofficialApp]: True, if the user uses an unofficial application that poses a security risk.
/// * [bio]: A short user bio; may be null for bots *(optional)*.
/// * [birthdate]: Birthdate of the user; may be null if unknown *(optional)*.
/// * [personalChatId]: Identifier of the personal chat of the user; 0 if none.
/// * [giftCount]: Number of saved to profile gifts for other users or the total number of received gifts for the current user.
/// * [groupInCommonCount]: Number of group chats where both the other user and the current user are a member; 0 for the current user.
/// * [incomingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the user for each sent message to the current user.
/// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the user.
/// * [giftSettings]: Settings for gift receiving for the user.
/// * [botVerification]: Information about verification status of the user provided by a bot; may be null if none or unknown *(optional)*.
/// * [mainProfileTab]: The main tab chosen by the user; may be null if not chosen manually *(optional)*.
/// * [firstProfileAudio]: The first audio file added to the user's profile; may be null if none *(optional)*.
/// * [rating]: The current rating of the user; may be null if none *(optional)*.
/// * [pendingRating]: The rating of the user after the next change; may be null if the user isn't the current user or there are no pending rating changes *(optional)*.
/// * [pendingRatingDate]: Unix timestamp when rating of the user will change to pending_rating; 0 if the user isn't the current user or there are no pending rating changes.
/// * [note]: Note added to the user's contact; may be null if none *(optional)*.
/// * [tonWalletCard]: TON wallet card of the user; may be null if none *(optional)*.
/// * [shareTheme]: Theme of the screen for sharing a link to the user; may be null if the default theme is used *(optional)*.
/// * [businessInfo]: Information about business settings for Telegram Business accounts; may be null if none *(optional)*.
/// * [botInfo]: For bots, information about the bot; may be null if the user isn't a bot *(optional)*.
final class UserFullInfo extends TdObject {
  /// **UserFullInfo** *(userFullInfo)* - basic class
  ///
  /// Contains full information about a user.
  ///
  /// * [personalPhoto]: User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos *(optional)*.
  /// * [photo]: User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo *(optional)*.
  /// * [publicPhoto]: User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos *(optional)*.
  /// * [communityId]: Identifier of the community to which chat with the bot was added; for bots only.
  /// * [blockList]: Block list to which the user is added; may be null if none *(optional)*.
  /// * [canBeCalled]: True, if the user can be called.
  /// * [supportsVideoCalls]: True, if a video call can be created with the user.
  /// * [hasPrivateCalls]: True, if the user can't be called due to their privacy settings.
  /// * [hasPrivateForwards]: True, if the user can't be linked in forwarded messages due to their privacy settings.
  /// * [hasRestrictedVoiceAndVideoNoteMessages]: True, if voice and video notes can't be sent or forwarded to the user.
  /// * [hasPostedToProfileStories]: True, if the user has posted to profile stories.
  /// * [hasSponsoredMessagesEnabled]: True, if the user always enabled sponsored messages; known only for the current user.
  /// * [needPhoneNumberPrivacyException]: True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used.
  /// * [setChatBackground]: True, if the user set chat background for both chat users and it wasn't reverted yet.
  /// * [usesUnofficialApp]: True, if the user uses an unofficial application that poses a security risk.
  /// * [bio]: A short user bio; may be null for bots *(optional)*.
  /// * [birthdate]: Birthdate of the user; may be null if unknown *(optional)*.
  /// * [personalChatId]: Identifier of the personal chat of the user; 0 if none.
  /// * [giftCount]: Number of saved to profile gifts for other users or the total number of received gifts for the current user.
  /// * [groupInCommonCount]: Number of group chats where both the other user and the current user are a member; 0 for the current user.
  /// * [incomingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the user for each sent message to the current user.
  /// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the user.
  /// * [giftSettings]: Settings for gift receiving for the user.
  /// * [botVerification]: Information about verification status of the user provided by a bot; may be null if none or unknown *(optional)*.
  /// * [mainProfileTab]: The main tab chosen by the user; may be null if not chosen manually *(optional)*.
  /// * [firstProfileAudio]: The first audio file added to the user's profile; may be null if none *(optional)*.
  /// * [rating]: The current rating of the user; may be null if none *(optional)*.
  /// * [pendingRating]: The rating of the user after the next change; may be null if the user isn't the current user or there are no pending rating changes *(optional)*.
  /// * [pendingRatingDate]: Unix timestamp when rating of the user will change to pending_rating; 0 if the user isn't the current user or there are no pending rating changes.
  /// * [note]: Note added to the user's contact; may be null if none *(optional)*.
  /// * [tonWalletCard]: TON wallet card of the user; may be null if none *(optional)*.
  /// * [shareTheme]: Theme of the screen for sharing a link to the user; may be null if the default theme is used *(optional)*.
  /// * [businessInfo]: Information about business settings for Telegram Business accounts; may be null if none *(optional)*.
  /// * [botInfo]: For bots, information about the bot; may be null if the user isn't a bot *(optional)*.
  const UserFullInfo({
    this.personalPhoto,
    this.photo,
    this.publicPhoto,
    required this.communityId,
    this.blockList,
    required this.canBeCalled,
    required this.supportsVideoCalls,
    required this.hasPrivateCalls,
    required this.hasPrivateForwards,
    required this.hasRestrictedVoiceAndVideoNoteMessages,
    required this.hasPostedToProfileStories,
    required this.hasSponsoredMessagesEnabled,
    required this.needPhoneNumberPrivacyException,
    required this.setChatBackground,
    required this.usesUnofficialApp,
    this.bio,
    this.birthdate,
    required this.personalChatId,
    required this.giftCount,
    required this.groupInCommonCount,
    required this.incomingPaidMessageStarCount,
    required this.outgoingPaidMessageStarCount,
    required this.giftSettings,
    this.botVerification,
    this.mainProfileTab,
    this.firstProfileAudio,
    this.rating,
    this.pendingRating,
    required this.pendingRatingDate,
    this.note,
    this.tonWalletCard,
    this.shareTheme,
    this.businessInfo,
    this.botInfo,
    this.extra,
    this.clientId,
  });

  /// User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
  final ChatPhoto? personalPhoto;

  /// User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo
  final ChatPhoto? photo;

  /// User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
  final ChatPhoto? publicPhoto;

  /// Identifier of the community to which chat with the bot was added; for bots only
  final int communityId;

  /// Block list to which the user is added; may be null if none
  final BlockList? blockList;

  /// True, if the user can be called
  final bool canBeCalled;

  /// True, if a video call can be created with the user
  final bool supportsVideoCalls;

  /// True, if the user can't be called due to their privacy settings
  final bool hasPrivateCalls;

  /// True, if the user can't be linked in forwarded messages due to their privacy settings
  final bool hasPrivateForwards;

  /// True, if voice and video notes can't be sent or forwarded to the user
  final bool hasRestrictedVoiceAndVideoNoteMessages;

  /// True, if the user has posted to profile stories
  final bool hasPostedToProfileStories;

  /// True, if the user always enabled sponsored messages; known only for the current user
  final bool hasSponsoredMessagesEnabled;

  /// True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
  final bool needPhoneNumberPrivacyException;

  /// True, if the user set chat background for both chat users and it wasn't reverted yet
  final bool setChatBackground;

  /// True, if the user uses an unofficial application that poses a security risk
  final bool usesUnofficialApp;

  /// A short user bio; may be null for bots
  final FormattedText? bio;

  /// Birthdate of the user; may be null if unknown
  final Birthdate? birthdate;

  /// Identifier of the personal chat of the user; 0 if none
  final int personalChatId;

  /// Number of saved to profile gifts for other users or the total number of received gifts for the current user
  final int giftCount;

  /// Number of group chats where both the other user and the current user are a member; 0 for the current user
  final int groupInCommonCount;

  /// Number of Telegram Stars that must be paid by the user for each sent message to the current user
  final int incomingPaidMessageStarCount;

  /// Number of Telegram Stars that must be paid by the current user for each sent message to the user
  final int outgoingPaidMessageStarCount;

  /// Settings for gift receiving for the user
  final GiftSettings giftSettings;

  /// Information about verification status of the user provided by a bot; may be null if none or unknown
  final BotVerification? botVerification;

  /// The main tab chosen by the user; may be null if not chosen manually
  final ProfileTab? mainProfileTab;

  /// The first audio file added to the user's profile; may be null if none
  final Audio? firstProfileAudio;

  /// The current rating of the user; may be null if none
  final UserRating? rating;

  /// The rating of the user after the next change; may be null if the user isn't the current user or there are no pending rating changes
  final UserRating? pendingRating;

  /// Unix timestamp when rating of the user will change to pending_rating; 0 if the user isn't the current user or there are no pending rating changes
  final int pendingRatingDate;

  /// Note added to the user's contact; may be null if none
  final FormattedText? note;

  /// TON wallet card of the user; may be null if none
  final TonWalletCard? tonWalletCard;

  /// Theme of the screen for sharing a link to the user; may be null if the default theme is used
  final ProfileShareTheme? shareTheme;

  /// Information about business settings for Telegram Business accounts; may be null if none
  final BusinessInfo? businessInfo;

  /// For bots, information about the bot; may be null if the user isn't a bot
  final BotInfo? botInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UserFullInfo.fromJson(Map<String, dynamic> json) => UserFullInfo(
        personalPhoto: json['personal_photo'] == null
            ? null
            : ChatPhoto.fromJson(json['personal_photo']),
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        publicPhoto: json['public_photo'] == null
            ? null
            : ChatPhoto.fromJson(json['public_photo']),
        communityId: json['community_id'],
        blockList: json['block_list'] == null
            ? null
            : BlockList.fromJson(json['block_list']),
        canBeCalled: json['can_be_called'],
        supportsVideoCalls: json['supports_video_calls'],
        hasPrivateCalls: json['has_private_calls'],
        hasPrivateForwards: json['has_private_forwards'],
        hasRestrictedVoiceAndVideoNoteMessages:
            json['has_restricted_voice_and_video_note_messages'],
        hasPostedToProfileStories: json['has_posted_to_profile_stories'],
        hasSponsoredMessagesEnabled: json['has_sponsored_messages_enabled'],
        needPhoneNumberPrivacyException:
            json['need_phone_number_privacy_exception'],
        setChatBackground: json['set_chat_background'],
        usesUnofficialApp: json['uses_unofficial_app'],
        bio: json['bio'] == null ? null : FormattedText.fromJson(json['bio']),
        birthdate: json['birthdate'] == null
            ? null
            : Birthdate.fromJson(json['birthdate']),
        personalChatId: json['personal_chat_id'] ?? 0,
        giftCount: json['gift_count'],
        groupInCommonCount: json['group_in_common_count'],
        incomingPaidMessageStarCount: json['incoming_paid_message_star_count'],
        outgoingPaidMessageStarCount: json['outgoing_paid_message_star_count'],
        giftSettings: GiftSettings.fromJson(json['gift_settings']),
        botVerification: json['bot_verification'] == null
            ? null
            : BotVerification.fromJson(json['bot_verification']),
        mainProfileTab: json['main_profile_tab'] == null
            ? null
            : ProfileTab.fromJson(json['main_profile_tab']),
        firstProfileAudio: json['first_profile_audio'] == null
            ? null
            : Audio.fromJson(json['first_profile_audio']),
        rating:
            json['rating'] == null ? null : UserRating.fromJson(json['rating']),
        pendingRating: json['pending_rating'] == null
            ? null
            : UserRating.fromJson(json['pending_rating']),
        pendingRatingDate: json['pending_rating_date'],
        note:
            json['note'] == null ? null : FormattedText.fromJson(json['note']),
        tonWalletCard: json['ton_wallet_card'] == null
            ? null
            : TonWalletCard.fromJson(json['ton_wallet_card']),
        shareTheme: json['share_theme'] == null
            ? null
            : ProfileShareTheme.fromJson(json['share_theme']),
        businessInfo: json['business_info'] == null
            ? null
            : BusinessInfo.fromJson(json['business_info']),
        botInfo: json['bot_info'] == null
            ? null
            : BotInfo.fromJson(json['bot_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "personal_photo": personalPhoto?.toJson(),
      "photo": photo?.toJson(),
      "public_photo": publicPhoto?.toJson(),
      "community_id": communityId,
      "block_list": blockList?.toJson(),
      "can_be_called": canBeCalled,
      "supports_video_calls": supportsVideoCalls,
      "has_private_calls": hasPrivateCalls,
      "has_private_forwards": hasPrivateForwards,
      "has_restricted_voice_and_video_note_messages":
          hasRestrictedVoiceAndVideoNoteMessages,
      "has_posted_to_profile_stories": hasPostedToProfileStories,
      "has_sponsored_messages_enabled": hasSponsoredMessagesEnabled,
      "need_phone_number_privacy_exception": needPhoneNumberPrivacyException,
      "set_chat_background": setChatBackground,
      "uses_unofficial_app": usesUnofficialApp,
      "bio": bio?.toJson(),
      "birthdate": birthdate?.toJson(),
      "personal_chat_id": personalChatId,
      "gift_count": giftCount,
      "group_in_common_count": groupInCommonCount,
      "incoming_paid_message_star_count": incomingPaidMessageStarCount,
      "outgoing_paid_message_star_count": outgoingPaidMessageStarCount,
      "gift_settings": giftSettings.toJson(),
      "bot_verification": botVerification?.toJson(),
      "main_profile_tab": mainProfileTab?.toJson(),
      "first_profile_audio": firstProfileAudio?.toJson(),
      "rating": rating?.toJson(),
      "pending_rating": pendingRating?.toJson(),
      "pending_rating_date": pendingRatingDate,
      "note": note?.toJson(),
      "ton_wallet_card": tonWalletCard?.toJson(),
      "share_theme": shareTheme?.toJson(),
      "business_info": businessInfo?.toJson(),
      "bot_info": botInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [personal_photo]: User profile photo set by the current user for the contact; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
  /// * [photo]: User profile photo; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and personal_photo is null, then it is the same photo as in user.profile_photo and chat.photo
  /// * [public_photo]: User profile photo visible if the main photo is hidden by privacy settings; may be null. If null and user.profile_photo is null, then the photo is empty; otherwise, it is unknown.. If non-null and both photo and personal_photo are null, then it is the same photo as in user.profile_photo and chat.photo. This photo isn't returned in the list of user photos
  /// * [community_id]: Identifier of the community to which chat with the bot was added; for bots only
  /// * [block_list]: Block list to which the user is added; may be null if none
  /// * [can_be_called]: True, if the user can be called
  /// * [supports_video_calls]: True, if a video call can be created with the user
  /// * [has_private_calls]: True, if the user can't be called due to their privacy settings
  /// * [has_private_forwards]: True, if the user can't be linked in forwarded messages due to their privacy settings
  /// * [has_restricted_voice_and_video_note_messages]: True, if voice and video notes can't be sent or forwarded to the user
  /// * [has_posted_to_profile_stories]: True, if the user has posted to profile stories
  /// * [has_sponsored_messages_enabled]: True, if the user always enabled sponsored messages; known only for the current user
  /// * [need_phone_number_privacy_exception]: True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
  /// * [set_chat_background]: True, if the user set chat background for both chat users and it wasn't reverted yet
  /// * [uses_unofficial_app]: True, if the user uses an unofficial application that poses a security risk
  /// * [bio]: A short user bio; may be null for bots
  /// * [birthdate]: Birthdate of the user; may be null if unknown
  /// * [personal_chat_id]: Identifier of the personal chat of the user; 0 if none
  /// * [gift_count]: Number of saved to profile gifts for other users or the total number of received gifts for the current user
  /// * [group_in_common_count]: Number of group chats where both the other user and the current user are a member; 0 for the current user
  /// * [incoming_paid_message_star_count]: Number of Telegram Stars that must be paid by the user for each sent message to the current user
  /// * [outgoing_paid_message_star_count]: Number of Telegram Stars that must be paid by the current user for each sent message to the user
  /// * [gift_settings]: Settings for gift receiving for the user
  /// * [bot_verification]: Information about verification status of the user provided by a bot; may be null if none or unknown
  /// * [main_profile_tab]: The main tab chosen by the user; may be null if not chosen manually
  /// * [first_profile_audio]: The first audio file added to the user's profile; may be null if none
  /// * [rating]: The current rating of the user; may be null if none
  /// * [pending_rating]: The rating of the user after the next change; may be null if the user isn't the current user or there are no pending rating changes
  /// * [pending_rating_date]: Unix timestamp when rating of the user will change to pending_rating; 0 if the user isn't the current user or there are no pending rating changes
  /// * [note]: Note added to the user's contact; may be null if none
  /// * [ton_wallet_card]: TON wallet card of the user; may be null if none
  /// * [share_theme]: Theme of the screen for sharing a link to the user; may be null if the default theme is used
  /// * [business_info]: Information about business settings for Telegram Business accounts; may be null if none
  /// * [bot_info]: For bots, information about the bot; may be null if the user isn't a bot
  UserFullInfo copyWith({
    ChatPhoto? personalPhoto,
    ChatPhoto? photo,
    ChatPhoto? publicPhoto,
    int? communityId,
    BlockList? blockList,
    bool? canBeCalled,
    bool? supportsVideoCalls,
    bool? hasPrivateCalls,
    bool? hasPrivateForwards,
    bool? hasRestrictedVoiceAndVideoNoteMessages,
    bool? hasPostedToProfileStories,
    bool? hasSponsoredMessagesEnabled,
    bool? needPhoneNumberPrivacyException,
    bool? setChatBackground,
    bool? usesUnofficialApp,
    FormattedText? bio,
    Birthdate? birthdate,
    int? personalChatId,
    int? giftCount,
    int? groupInCommonCount,
    int? incomingPaidMessageStarCount,
    int? outgoingPaidMessageStarCount,
    GiftSettings? giftSettings,
    BotVerification? botVerification,
    ProfileTab? mainProfileTab,
    Audio? firstProfileAudio,
    UserRating? rating,
    UserRating? pendingRating,
    int? pendingRatingDate,
    FormattedText? note,
    TonWalletCard? tonWalletCard,
    ProfileShareTheme? shareTheme,
    BusinessInfo? businessInfo,
    BotInfo? botInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UserFullInfo(
        personalPhoto: personalPhoto ?? this.personalPhoto,
        photo: photo ?? this.photo,
        publicPhoto: publicPhoto ?? this.publicPhoto,
        communityId: communityId ?? this.communityId,
        blockList: blockList ?? this.blockList,
        canBeCalled: canBeCalled ?? this.canBeCalled,
        supportsVideoCalls: supportsVideoCalls ?? this.supportsVideoCalls,
        hasPrivateCalls: hasPrivateCalls ?? this.hasPrivateCalls,
        hasPrivateForwards: hasPrivateForwards ?? this.hasPrivateForwards,
        hasRestrictedVoiceAndVideoNoteMessages:
            hasRestrictedVoiceAndVideoNoteMessages ??
                this.hasRestrictedVoiceAndVideoNoteMessages,
        hasPostedToProfileStories:
            hasPostedToProfileStories ?? this.hasPostedToProfileStories,
        hasSponsoredMessagesEnabled:
            hasSponsoredMessagesEnabled ?? this.hasSponsoredMessagesEnabled,
        needPhoneNumberPrivacyException: needPhoneNumberPrivacyException ??
            this.needPhoneNumberPrivacyException,
        setChatBackground: setChatBackground ?? this.setChatBackground,
        usesUnofficialApp: usesUnofficialApp ?? this.usesUnofficialApp,
        bio: bio ?? this.bio,
        birthdate: birthdate ?? this.birthdate,
        personalChatId: personalChatId ?? this.personalChatId,
        giftCount: giftCount ?? this.giftCount,
        groupInCommonCount: groupInCommonCount ?? this.groupInCommonCount,
        incomingPaidMessageStarCount:
            incomingPaidMessageStarCount ?? this.incomingPaidMessageStarCount,
        outgoingPaidMessageStarCount:
            outgoingPaidMessageStarCount ?? this.outgoingPaidMessageStarCount,
        giftSettings: giftSettings ?? this.giftSettings,
        botVerification: botVerification ?? this.botVerification,
        mainProfileTab: mainProfileTab ?? this.mainProfileTab,
        firstProfileAudio: firstProfileAudio ?? this.firstProfileAudio,
        rating: rating ?? this.rating,
        pendingRating: pendingRating ?? this.pendingRating,
        pendingRatingDate: pendingRatingDate ?? this.pendingRatingDate,
        note: note ?? this.note,
        tonWalletCard: tonWalletCard ?? this.tonWalletCard,
        shareTheme: shareTheme ?? this.shareTheme,
        businessInfo: businessInfo ?? this.businessInfo,
        botInfo: botInfo ?? this.botInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
