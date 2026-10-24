part of '../tdapi.dart';

/// **AttachmentMenuBot** *(attachmentMenuBot)* - basic class
///
/// Represents a bot, which can be added to attachment or side menu.
///
/// * [botUserId]: User identifier of the bot.
/// * [supportsSelfChat]: True, if the bot supports opening from attachment menu in the chat with the bot.
/// * [supportsUserChats]: True, if the bot supports opening from attachment menu in private chats with ordinary users.
/// * [supportsBotChats]: True, if the bot supports opening from attachment menu in private chats with other bots.
/// * [supportsGroupChats]: True, if the bot supports opening from attachment menu in basic group and supergroup chats.
/// * [supportsChannelChats]: True, if the bot supports opening from attachment menu in channel chats.
/// * [requestWriteAccess]: True, if the user must be asked for the permission to send messages to the bot.
/// * [isAdded]: True, if the bot was explicitly added by the user. If the bot isn't added, then on the first bot launch toggleBotIsAddedToAttachmentMenu must be called and the bot must be added or removed.
/// * [showInAttachmentMenu]: True, if the bot must be shown in the attachment menu.
/// * [showInSideMenu]: True, if the bot must be shown in the side menu.
/// * [showDisclaimerInSideMenu]: True, if a disclaimer, why the bot is shown in the side menu, is needed.
/// * [name]: Name for the bot in attachment menu.
/// * [nameColor]: Color to highlight selected name of the bot if appropriate; may be null *(optional)*.
/// * [defaultIcon]: Default icon for the bot in SVG format; may be null *(optional)*.
/// * [iosStaticIcon]: Icon for the bot in SVG format for the official iOS app; may be null *(optional)*.
/// * [iosAnimatedIcon]: Icon for the bot in TGS format for the official iOS app; may be null *(optional)*.
/// * [iosSideMenuIcon]: Icon for the bot in PNG format for the official iOS app side menu; may be null *(optional)*.
/// * [androidIcon]: Icon for the bot in TGS format for the official Android app; may be null *(optional)*.
/// * [androidSideMenuIcon]: Icon for the bot in SVG format for the official Android app side menu; may be null *(optional)*.
/// * [macosIcon]: Icon for the bot in TGS format for the official native macOS app; may be null *(optional)*.
/// * [macosSideMenuIcon]: Icon for the bot in PNG format for the official macOS app side menu; may be null *(optional)*.
/// * [iconColor]: Color to highlight selected icon of the bot if appropriate; may be null *(optional)*.
/// * [webAppPlaceholder]: Default placeholder for opened Web Apps in SVG format; may be null *(optional)*.
final class AttachmentMenuBot extends TdObject {
  /// **AttachmentMenuBot** *(attachmentMenuBot)* - basic class
  ///
  /// Represents a bot, which can be added to attachment or side menu.
  ///
  /// * [botUserId]: User identifier of the bot.
  /// * [supportsSelfChat]: True, if the bot supports opening from attachment menu in the chat with the bot.
  /// * [supportsUserChats]: True, if the bot supports opening from attachment menu in private chats with ordinary users.
  /// * [supportsBotChats]: True, if the bot supports opening from attachment menu in private chats with other bots.
  /// * [supportsGroupChats]: True, if the bot supports opening from attachment menu in basic group and supergroup chats.
  /// * [supportsChannelChats]: True, if the bot supports opening from attachment menu in channel chats.
  /// * [requestWriteAccess]: True, if the user must be asked for the permission to send messages to the bot.
  /// * [isAdded]: True, if the bot was explicitly added by the user. If the bot isn't added, then on the first bot launch toggleBotIsAddedToAttachmentMenu must be called and the bot must be added or removed.
  /// * [showInAttachmentMenu]: True, if the bot must be shown in the attachment menu.
  /// * [showInSideMenu]: True, if the bot must be shown in the side menu.
  /// * [showDisclaimerInSideMenu]: True, if a disclaimer, why the bot is shown in the side menu, is needed.
  /// * [name]: Name for the bot in attachment menu.
  /// * [nameColor]: Color to highlight selected name of the bot if appropriate; may be null *(optional)*.
  /// * [defaultIcon]: Default icon for the bot in SVG format; may be null *(optional)*.
  /// * [iosStaticIcon]: Icon for the bot in SVG format for the official iOS app; may be null *(optional)*.
  /// * [iosAnimatedIcon]: Icon for the bot in TGS format for the official iOS app; may be null *(optional)*.
  /// * [iosSideMenuIcon]: Icon for the bot in PNG format for the official iOS app side menu; may be null *(optional)*.
  /// * [androidIcon]: Icon for the bot in TGS format for the official Android app; may be null *(optional)*.
  /// * [androidSideMenuIcon]: Icon for the bot in SVG format for the official Android app side menu; may be null *(optional)*.
  /// * [macosIcon]: Icon for the bot in TGS format for the official native macOS app; may be null *(optional)*.
  /// * [macosSideMenuIcon]: Icon for the bot in PNG format for the official macOS app side menu; may be null *(optional)*.
  /// * [iconColor]: Color to highlight selected icon of the bot if appropriate; may be null *(optional)*.
  /// * [webAppPlaceholder]: Default placeholder for opened Web Apps in SVG format; may be null *(optional)*.
  const AttachmentMenuBot({
    required this.botUserId,
    required this.supportsSelfChat,
    required this.supportsUserChats,
    required this.supportsBotChats,
    required this.supportsGroupChats,
    required this.supportsChannelChats,
    required this.requestWriteAccess,
    required this.isAdded,
    required this.showInAttachmentMenu,
    required this.showInSideMenu,
    required this.showDisclaimerInSideMenu,
    required this.name,
    this.nameColor,
    this.defaultIcon,
    this.iosStaticIcon,
    this.iosAnimatedIcon,
    this.iosSideMenuIcon,
    this.androidIcon,
    this.androidSideMenuIcon,
    this.macosIcon,
    this.macosSideMenuIcon,
    this.iconColor,
    this.webAppPlaceholder,
    this.extra,
    this.clientId,
  });

  /// User identifier of the bot
  final int botUserId;

  /// True, if the bot supports opening from attachment menu in the chat with the bot
  final bool supportsSelfChat;

  /// True, if the bot supports opening from attachment menu in private chats with ordinary users
  final bool supportsUserChats;

  /// True, if the bot supports opening from attachment menu in private chats with other bots
  final bool supportsBotChats;

  /// True, if the bot supports opening from attachment menu in basic group and supergroup chats
  final bool supportsGroupChats;

  /// True, if the bot supports opening from attachment menu in channel chats
  final bool supportsChannelChats;

  /// True, if the user must be asked for the permission to send messages to the bot
  final bool requestWriteAccess;

  /// True, if the bot was explicitly added by the user. If the bot isn't added, then on the first bot launch toggleBotIsAddedToAttachmentMenu must be called and the bot must be added or removed
  final bool isAdded;

  /// True, if the bot must be shown in the attachment menu
  final bool showInAttachmentMenu;

  /// True, if the bot must be shown in the side menu
  final bool showInSideMenu;

  /// True, if a disclaimer, why the bot is shown in the side menu, is needed
  final bool showDisclaimerInSideMenu;

  /// Name for the bot in attachment menu
  final String name;

  /// Color to highlight selected name of the bot if appropriate; may be null
  final AttachmentMenuBotColor? nameColor;

  /// Default icon for the bot in SVG format; may be null
  final File? defaultIcon;

  /// Icon for the bot in SVG format for the official iOS app; may be null
  final File? iosStaticIcon;

  /// Icon for the bot in TGS format for the official iOS app; may be null
  final File? iosAnimatedIcon;

  /// Icon for the bot in PNG format for the official iOS app side menu; may be null
  final File? iosSideMenuIcon;

  /// Icon for the bot in TGS format for the official Android app; may be null
  final File? androidIcon;

  /// Icon for the bot in SVG format for the official Android app side menu; may be null
  final File? androidSideMenuIcon;

  /// Icon for the bot in TGS format for the official native macOS app; may be null
  final File? macosIcon;

  /// Icon for the bot in PNG format for the official macOS app side menu; may be null
  final File? macosSideMenuIcon;

  /// Color to highlight selected icon of the bot if appropriate; may be null
  final AttachmentMenuBotColor? iconColor;

  /// Default placeholder for opened Web Apps in SVG format; may be null
  final File? webAppPlaceholder;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AttachmentMenuBot.fromJson(Map<String, dynamic> json) =>
      AttachmentMenuBot(
        botUserId: json['bot_user_id'],
        supportsSelfChat: json['supports_self_chat'],
        supportsUserChats: json['supports_user_chats'],
        supportsBotChats: json['supports_bot_chats'],
        supportsGroupChats: json['supports_group_chats'],
        supportsChannelChats: json['supports_channel_chats'],
        requestWriteAccess: json['request_write_access'],
        isAdded: json['is_added'],
        showInAttachmentMenu: json['show_in_attachment_menu'],
        showInSideMenu: json['show_in_side_menu'],
        showDisclaimerInSideMenu: json['show_disclaimer_in_side_menu'],
        name: json['name'],
        nameColor: json['name_color'] == null
            ? null
            : AttachmentMenuBotColor.fromJson(json['name_color']),
        defaultIcon: json['default_icon'] == null
            ? null
            : File.fromJson(json['default_icon']),
        iosStaticIcon: json['ios_static_icon'] == null
            ? null
            : File.fromJson(json['ios_static_icon']),
        iosAnimatedIcon: json['ios_animated_icon'] == null
            ? null
            : File.fromJson(json['ios_animated_icon']),
        iosSideMenuIcon: json['ios_side_menu_icon'] == null
            ? null
            : File.fromJson(json['ios_side_menu_icon']),
        androidIcon: json['android_icon'] == null
            ? null
            : File.fromJson(json['android_icon']),
        androidSideMenuIcon: json['android_side_menu_icon'] == null
            ? null
            : File.fromJson(json['android_side_menu_icon']),
        macosIcon: json['macos_icon'] == null
            ? null
            : File.fromJson(json['macos_icon']),
        macosSideMenuIcon: json['macos_side_menu_icon'] == null
            ? null
            : File.fromJson(json['macos_side_menu_icon']),
        iconColor: json['icon_color'] == null
            ? null
            : AttachmentMenuBotColor.fromJson(json['icon_color']),
        webAppPlaceholder: json['web_app_placeholder'] == null
            ? null
            : File.fromJson(json['web_app_placeholder']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "supports_self_chat": supportsSelfChat,
      "supports_user_chats": supportsUserChats,
      "supports_bot_chats": supportsBotChats,
      "supports_group_chats": supportsGroupChats,
      "supports_channel_chats": supportsChannelChats,
      "request_write_access": requestWriteAccess,
      "is_added": isAdded,
      "show_in_attachment_menu": showInAttachmentMenu,
      "show_in_side_menu": showInSideMenu,
      "show_disclaimer_in_side_menu": showDisclaimerInSideMenu,
      "name": name,
      "name_color": nameColor?.toJson(),
      "default_icon": defaultIcon?.toJson(),
      "ios_static_icon": iosStaticIcon?.toJson(),
      "ios_animated_icon": iosAnimatedIcon?.toJson(),
      "ios_side_menu_icon": iosSideMenuIcon?.toJson(),
      "android_icon": androidIcon?.toJson(),
      "android_side_menu_icon": androidSideMenuIcon?.toJson(),
      "macos_icon": macosIcon?.toJson(),
      "macos_side_menu_icon": macosSideMenuIcon?.toJson(),
      "icon_color": iconColor?.toJson(),
      "web_app_placeholder": webAppPlaceholder?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot
  /// * [supports_self_chat]: True, if the bot supports opening from attachment menu in the chat with the bot
  /// * [supports_user_chats]: True, if the bot supports opening from attachment menu in private chats with ordinary users
  /// * [supports_bot_chats]: True, if the bot supports opening from attachment menu in private chats with other bots
  /// * [supports_group_chats]: True, if the bot supports opening from attachment menu in basic group and supergroup chats
  /// * [supports_channel_chats]: True, if the bot supports opening from attachment menu in channel chats
  /// * [request_write_access]: True, if the user must be asked for the permission to send messages to the bot
  /// * [is_added]: True, if the bot was explicitly added by the user. If the bot isn't added, then on the first bot launch toggleBotIsAddedToAttachmentMenu must be called and the bot must be added or removed
  /// * [show_in_attachment_menu]: True, if the bot must be shown in the attachment menu
  /// * [show_in_side_menu]: True, if the bot must be shown in the side menu
  /// * [show_disclaimer_in_side_menu]: True, if a disclaimer, why the bot is shown in the side menu, is needed
  /// * [name]: Name for the bot in attachment menu
  /// * [name_color]: Color to highlight selected name of the bot if appropriate; may be null
  /// * [default_icon]: Default icon for the bot in SVG format; may be null
  /// * [ios_static_icon]: Icon for the bot in SVG format for the official iOS app; may be null
  /// * [ios_animated_icon]: Icon for the bot in TGS format for the official iOS app; may be null
  /// * [ios_side_menu_icon]: Icon for the bot in PNG format for the official iOS app side menu; may be null
  /// * [android_icon]: Icon for the bot in TGS format for the official Android app; may be null
  /// * [android_side_menu_icon]: Icon for the bot in SVG format for the official Android app side menu; may be null
  /// * [macos_icon]: Icon for the bot in TGS format for the official native macOS app; may be null
  /// * [macos_side_menu_icon]: Icon for the bot in PNG format for the official macOS app side menu; may be null
  /// * [icon_color]: Color to highlight selected icon of the bot if appropriate; may be null
  /// * [web_app_placeholder]: Default placeholder for opened Web Apps in SVG format; may be null
  AttachmentMenuBot copyWith({
    int? botUserId,
    bool? supportsSelfChat,
    bool? supportsUserChats,
    bool? supportsBotChats,
    bool? supportsGroupChats,
    bool? supportsChannelChats,
    bool? requestWriteAccess,
    bool? isAdded,
    bool? showInAttachmentMenu,
    bool? showInSideMenu,
    bool? showDisclaimerInSideMenu,
    String? name,
    AttachmentMenuBotColor? nameColor,
    File? defaultIcon,
    File? iosStaticIcon,
    File? iosAnimatedIcon,
    File? iosSideMenuIcon,
    File? androidIcon,
    File? androidSideMenuIcon,
    File? macosIcon,
    File? macosSideMenuIcon,
    AttachmentMenuBotColor? iconColor,
    File? webAppPlaceholder,
    dynamic extra,
    int? clientId,
  }) =>
      AttachmentMenuBot(
        botUserId: botUserId ?? this.botUserId,
        supportsSelfChat: supportsSelfChat ?? this.supportsSelfChat,
        supportsUserChats: supportsUserChats ?? this.supportsUserChats,
        supportsBotChats: supportsBotChats ?? this.supportsBotChats,
        supportsGroupChats: supportsGroupChats ?? this.supportsGroupChats,
        supportsChannelChats: supportsChannelChats ?? this.supportsChannelChats,
        requestWriteAccess: requestWriteAccess ?? this.requestWriteAccess,
        isAdded: isAdded ?? this.isAdded,
        showInAttachmentMenu: showInAttachmentMenu ?? this.showInAttachmentMenu,
        showInSideMenu: showInSideMenu ?? this.showInSideMenu,
        showDisclaimerInSideMenu:
            showDisclaimerInSideMenu ?? this.showDisclaimerInSideMenu,
        name: name ?? this.name,
        nameColor: nameColor ?? this.nameColor,
        defaultIcon: defaultIcon ?? this.defaultIcon,
        iosStaticIcon: iosStaticIcon ?? this.iosStaticIcon,
        iosAnimatedIcon: iosAnimatedIcon ?? this.iosAnimatedIcon,
        iosSideMenuIcon: iosSideMenuIcon ?? this.iosSideMenuIcon,
        androidIcon: androidIcon ?? this.androidIcon,
        androidSideMenuIcon: androidSideMenuIcon ?? this.androidSideMenuIcon,
        macosIcon: macosIcon ?? this.macosIcon,
        macosSideMenuIcon: macosSideMenuIcon ?? this.macosSideMenuIcon,
        iconColor: iconColor ?? this.iconColor,
        webAppPlaceholder: webAppPlaceholder ?? this.webAppPlaceholder,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'attachmentMenuBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
