part of '../tdapi.dart';

/// **BusinessBotRights** *(businessBotRights)* - basic class
///
/// Describes rights of a business bot.
///
/// * [canReply]: True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours.
/// * [canReadMessages]: True, if the bot can mark incoming private messages as read.
/// * [canDeleteSentMessages]: True, if the bot can delete sent messages.
/// * [canDeleteAllMessages]: True, if the bot can delete any message.
/// * [canEditName]: True, if the bot can edit name of the business account.
/// * [canEditBio]: True, if the bot can edit bio of the business account.
/// * [canEditProfilePhoto]: True, if the bot can edit profile photo of the business account.
/// * [canEditUsername]: True, if the bot can edit username of the business account.
/// * [canViewGiftsAndStars]: True, if the bot can view gifts and Telegram Star amount owned by the business account.
/// * [canSellGifts]: True, if the bot can sell or delete regular gifts received by the business account.
/// * [canChangeGiftSettings]: True, if the bot can change gift receiving settings of the business account.
/// * [canTransferAndUpgradeGifts]: True, if the bot can transfer and upgrade gifts received by the business account.
/// * [canTransferStars]: True, if the bot can transfer Telegram Stars received by the business account to account of the bot, or use them to upgrade and transfer gifts.
/// * [canManageStories]: True, if the bot can post, edit and delete stories.
final class BusinessBotRights extends TdObject {
  /// **BusinessBotRights** *(businessBotRights)* - basic class
  ///
  /// Describes rights of a business bot.
  ///
  /// * [canReply]: True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours.
  /// * [canReadMessages]: True, if the bot can mark incoming private messages as read.
  /// * [canDeleteSentMessages]: True, if the bot can delete sent messages.
  /// * [canDeleteAllMessages]: True, if the bot can delete any message.
  /// * [canEditName]: True, if the bot can edit name of the business account.
  /// * [canEditBio]: True, if the bot can edit bio of the business account.
  /// * [canEditProfilePhoto]: True, if the bot can edit profile photo of the business account.
  /// * [canEditUsername]: True, if the bot can edit username of the business account.
  /// * [canViewGiftsAndStars]: True, if the bot can view gifts and Telegram Star amount owned by the business account.
  /// * [canSellGifts]: True, if the bot can sell or delete regular gifts received by the business account.
  /// * [canChangeGiftSettings]: True, if the bot can change gift receiving settings of the business account.
  /// * [canTransferAndUpgradeGifts]: True, if the bot can transfer and upgrade gifts received by the business account.
  /// * [canTransferStars]: True, if the bot can transfer Telegram Stars received by the business account to account of the bot, or use them to upgrade and transfer gifts.
  /// * [canManageStories]: True, if the bot can post, edit and delete stories.
  const BusinessBotRights({
    required this.canReply,
    required this.canReadMessages,
    required this.canDeleteSentMessages,
    required this.canDeleteAllMessages,
    required this.canEditName,
    required this.canEditBio,
    required this.canEditProfilePhoto,
    required this.canEditUsername,
    required this.canViewGiftsAndStars,
    required this.canSellGifts,
    required this.canChangeGiftSettings,
    required this.canTransferAndUpgradeGifts,
    required this.canTransferStars,
    required this.canManageStories,
  });

  /// True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
  final bool canReply;

  /// True, if the bot can mark incoming private messages as read
  final bool canReadMessages;

  /// True, if the bot can delete sent messages
  final bool canDeleteSentMessages;

  /// True, if the bot can delete any message
  final bool canDeleteAllMessages;

  /// True, if the bot can edit name of the business account
  final bool canEditName;

  /// True, if the bot can edit bio of the business account
  final bool canEditBio;

  /// True, if the bot can edit profile photo of the business account
  final bool canEditProfilePhoto;

  /// True, if the bot can edit username of the business account
  final bool canEditUsername;

  /// True, if the bot can view gifts and Telegram Star amount owned by the business account
  final bool canViewGiftsAndStars;

  /// True, if the bot can sell or delete regular gifts received by the business account
  final bool canSellGifts;

  /// True, if the bot can change gift receiving settings of the business account
  final bool canChangeGiftSettings;

  /// True, if the bot can transfer and upgrade gifts received by the business account
  final bool canTransferAndUpgradeGifts;

  /// True, if the bot can transfer Telegram Stars received by the business account to account of the bot, or use them to upgrade and transfer gifts
  final bool canTransferStars;

  /// True, if the bot can post, edit and delete stories
  final bool canManageStories;

  /// Parse from a json
  factory BusinessBotRights.fromJson(Map<String, dynamic> json) =>
      BusinessBotRights(
        canReply: json['can_reply'],
        canReadMessages: json['can_read_messages'],
        canDeleteSentMessages: json['can_delete_sent_messages'],
        canDeleteAllMessages: json['can_delete_all_messages'],
        canEditName: json['can_edit_name'],
        canEditBio: json['can_edit_bio'],
        canEditProfilePhoto: json['can_edit_profile_photo'],
        canEditUsername: json['can_edit_username'],
        canViewGiftsAndStars: json['can_view_gifts_and_stars'],
        canSellGifts: json['can_sell_gifts'],
        canChangeGiftSettings: json['can_change_gift_settings'],
        canTransferAndUpgradeGifts: json['can_transfer_and_upgrade_gifts'],
        canTransferStars: json['can_transfer_stars'],
        canManageStories: json['can_manage_stories'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_reply": canReply,
      "can_read_messages": canReadMessages,
      "can_delete_sent_messages": canDeleteSentMessages,
      "can_delete_all_messages": canDeleteAllMessages,
      "can_edit_name": canEditName,
      "can_edit_bio": canEditBio,
      "can_edit_profile_photo": canEditProfilePhoto,
      "can_edit_username": canEditUsername,
      "can_view_gifts_and_stars": canViewGiftsAndStars,
      "can_sell_gifts": canSellGifts,
      "can_change_gift_settings": canChangeGiftSettings,
      "can_transfer_and_upgrade_gifts": canTransferAndUpgradeGifts,
      "can_transfer_stars": canTransferStars,
      "can_manage_stories": canManageStories,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_reply]: True, if the bot can send and edit messages in the private chats that had incoming messages in the last 24 hours
  /// * [can_read_messages]: True, if the bot can mark incoming private messages as read
  /// * [can_delete_sent_messages]: True, if the bot can delete sent messages
  /// * [can_delete_all_messages]: True, if the bot can delete any message
  /// * [can_edit_name]: True, if the bot can edit name of the business account
  /// * [can_edit_bio]: True, if the bot can edit bio of the business account
  /// * [can_edit_profile_photo]: True, if the bot can edit profile photo of the business account
  /// * [can_edit_username]: True, if the bot can edit username of the business account
  /// * [can_view_gifts_and_stars]: True, if the bot can view gifts and Telegram Star amount owned by the business account
  /// * [can_sell_gifts]: True, if the bot can sell or delete regular gifts received by the business account
  /// * [can_change_gift_settings]: True, if the bot can change gift receiving settings of the business account
  /// * [can_transfer_and_upgrade_gifts]: True, if the bot can transfer and upgrade gifts received by the business account
  /// * [can_transfer_stars]: True, if the bot can transfer Telegram Stars received by the business account to account of the bot, or use them to upgrade and transfer gifts
  /// * [can_manage_stories]: True, if the bot can post, edit and delete stories
  BusinessBotRights copyWith({
    bool? canReply,
    bool? canReadMessages,
    bool? canDeleteSentMessages,
    bool? canDeleteAllMessages,
    bool? canEditName,
    bool? canEditBio,
    bool? canEditProfilePhoto,
    bool? canEditUsername,
    bool? canViewGiftsAndStars,
    bool? canSellGifts,
    bool? canChangeGiftSettings,
    bool? canTransferAndUpgradeGifts,
    bool? canTransferStars,
    bool? canManageStories,
  }) =>
      BusinessBotRights(
        canReply: canReply ?? this.canReply,
        canReadMessages: canReadMessages ?? this.canReadMessages,
        canDeleteSentMessages:
            canDeleteSentMessages ?? this.canDeleteSentMessages,
        canDeleteAllMessages: canDeleteAllMessages ?? this.canDeleteAllMessages,
        canEditName: canEditName ?? this.canEditName,
        canEditBio: canEditBio ?? this.canEditBio,
        canEditProfilePhoto: canEditProfilePhoto ?? this.canEditProfilePhoto,
        canEditUsername: canEditUsername ?? this.canEditUsername,
        canViewGiftsAndStars: canViewGiftsAndStars ?? this.canViewGiftsAndStars,
        canSellGifts: canSellGifts ?? this.canSellGifts,
        canChangeGiftSettings:
            canChangeGiftSettings ?? this.canChangeGiftSettings,
        canTransferAndUpgradeGifts:
            canTransferAndUpgradeGifts ?? this.canTransferAndUpgradeGifts,
        canTransferStars: canTransferStars ?? this.canTransferStars,
        canManageStories: canManageStories ?? this.canManageStories,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessBotRights';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
