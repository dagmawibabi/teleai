part of '../tdapi.dart';

/// **InternalLinkType** *(internalLinkType)* - parent
///
/// Describes an internal https://t.me or tg: link, which must be processed by the application in a special way.
sealed class InternalLinkType extends TdObject {
  /// **InternalLinkType** *(internalLinkType)* - parent
  ///
  /// Describes an internal https://t.me or tg: link, which must be processed by the application in a special way.
  const InternalLinkType();

  /// a InternalLinkType return type can be :
  /// * [InternalLinkTypeAttachmentMenuBot]
  /// * [InternalLinkTypeAuthenticationCode]
  /// * [InternalLinkTypeBackground]
  /// * [InternalLinkTypeBotAddToChannel]
  /// * [InternalLinkTypeBotStart]
  /// * [InternalLinkTypeBotStartInGroup]
  /// * [InternalLinkTypeBusinessChat]
  /// * [InternalLinkTypeCallsPage]
  /// * [InternalLinkTypeChatAffiliateProgram]
  /// * [InternalLinkTypeChatBoost]
  /// * [InternalLinkTypeChatFolderInvite]
  /// * [InternalLinkTypeChatInvite]
  /// * [InternalLinkTypeChatSelection]
  /// * [InternalLinkTypeContactsPage]
  /// * [InternalLinkTypeDirectMessagesChat]
  /// * [InternalLinkTypeGame]
  /// * [InternalLinkTypeGiftAuction]
  /// * [InternalLinkTypeGiftCollection]
  /// * [InternalLinkTypeGroupCall]
  /// * [InternalLinkTypeInstantView]
  /// * [InternalLinkTypeInvoice]
  /// * [InternalLinkTypeLanguagePack]
  /// * [InternalLinkTypeLiveStory]
  /// * [InternalLinkTypeMainWebApp]
  /// * [InternalLinkTypeMessage]
  /// * [InternalLinkTypeMessageDraft]
  /// * [InternalLinkTypeMyProfilePage]
  /// * [InternalLinkTypeNewChannelChat]
  /// * [InternalLinkTypeNewGroupChat]
  /// * [InternalLinkTypeNewPrivateChat]
  /// * [InternalLinkTypeNewStory]
  /// * [InternalLinkTypeOauth]
  /// * [InternalLinkTypePassportDataRequest]
  /// * [InternalLinkTypePhoneNumberConfirmation]
  /// * [InternalLinkTypePremiumFeaturesPage]
  /// * [InternalLinkTypePremiumGiftCode]
  /// * [InternalLinkTypePremiumGiftPurchase]
  /// * [InternalLinkTypeProxy]
  /// * [InternalLinkTypePublicChat]
  /// * [InternalLinkTypeQrCodeAuthentication]
  /// * [InternalLinkTypeRequestManagedBot]
  /// * [InternalLinkTypeRestorePurchases]
  /// * [InternalLinkTypeSavedMessages]
  /// * [InternalLinkTypeSearch]
  /// * [InternalLinkTypeSettings]
  /// * [InternalLinkTypeStarPurchase]
  /// * [InternalLinkTypeStickerSet]
  /// * [InternalLinkTypeStory]
  /// * [InternalLinkTypeStoryAlbum]
  /// * [InternalLinkTypeTextCompositionStyle]
  /// * [InternalLinkTypeTheme]
  /// * [InternalLinkTypeTonConnect]
  /// * [InternalLinkTypeTonWalletTransfer]
  /// * [InternalLinkTypeUnknownDeepLink]
  /// * [InternalLinkTypeUpgradedGift]
  /// * [InternalLinkTypeUserPhoneNumber]
  /// * [InternalLinkTypeUserToken]
  /// * [InternalLinkTypeVideoChat]
  /// * [InternalLinkTypeWebApp]
  factory InternalLinkType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InternalLinkTypeAttachmentMenuBot.defaultObjectId:
        return InternalLinkTypeAttachmentMenuBot.fromJson(json);
      case InternalLinkTypeAuthenticationCode.defaultObjectId:
        return InternalLinkTypeAuthenticationCode.fromJson(json);
      case InternalLinkTypeBackground.defaultObjectId:
        return InternalLinkTypeBackground.fromJson(json);
      case InternalLinkTypeBotAddToChannel.defaultObjectId:
        return InternalLinkTypeBotAddToChannel.fromJson(json);
      case InternalLinkTypeBotStart.defaultObjectId:
        return InternalLinkTypeBotStart.fromJson(json);
      case InternalLinkTypeBotStartInGroup.defaultObjectId:
        return InternalLinkTypeBotStartInGroup.fromJson(json);
      case InternalLinkTypeBusinessChat.defaultObjectId:
        return InternalLinkTypeBusinessChat.fromJson(json);
      case InternalLinkTypeCallsPage.defaultObjectId:
        return InternalLinkTypeCallsPage.fromJson(json);
      case InternalLinkTypeChatAffiliateProgram.defaultObjectId:
        return InternalLinkTypeChatAffiliateProgram.fromJson(json);
      case InternalLinkTypeChatBoost.defaultObjectId:
        return InternalLinkTypeChatBoost.fromJson(json);
      case InternalLinkTypeChatFolderInvite.defaultObjectId:
        return InternalLinkTypeChatFolderInvite.fromJson(json);
      case InternalLinkTypeChatInvite.defaultObjectId:
        return InternalLinkTypeChatInvite.fromJson(json);
      case InternalLinkTypeChatSelection.defaultObjectId:
        return InternalLinkTypeChatSelection.fromJson(json);
      case InternalLinkTypeContactsPage.defaultObjectId:
        return InternalLinkTypeContactsPage.fromJson(json);
      case InternalLinkTypeDirectMessagesChat.defaultObjectId:
        return InternalLinkTypeDirectMessagesChat.fromJson(json);
      case InternalLinkTypeGame.defaultObjectId:
        return InternalLinkTypeGame.fromJson(json);
      case InternalLinkTypeGiftAuction.defaultObjectId:
        return InternalLinkTypeGiftAuction.fromJson(json);
      case InternalLinkTypeGiftCollection.defaultObjectId:
        return InternalLinkTypeGiftCollection.fromJson(json);
      case InternalLinkTypeGroupCall.defaultObjectId:
        return InternalLinkTypeGroupCall.fromJson(json);
      case InternalLinkTypeInstantView.defaultObjectId:
        return InternalLinkTypeInstantView.fromJson(json);
      case InternalLinkTypeInvoice.defaultObjectId:
        return InternalLinkTypeInvoice.fromJson(json);
      case InternalLinkTypeLanguagePack.defaultObjectId:
        return InternalLinkTypeLanguagePack.fromJson(json);
      case InternalLinkTypeLiveStory.defaultObjectId:
        return InternalLinkTypeLiveStory.fromJson(json);
      case InternalLinkTypeMainWebApp.defaultObjectId:
        return InternalLinkTypeMainWebApp.fromJson(json);
      case InternalLinkTypeMessage.defaultObjectId:
        return InternalLinkTypeMessage.fromJson(json);
      case InternalLinkTypeMessageDraft.defaultObjectId:
        return InternalLinkTypeMessageDraft.fromJson(json);
      case InternalLinkTypeMyProfilePage.defaultObjectId:
        return InternalLinkTypeMyProfilePage.fromJson(json);
      case InternalLinkTypeNewChannelChat.defaultObjectId:
        return InternalLinkTypeNewChannelChat.fromJson(json);
      case InternalLinkTypeNewGroupChat.defaultObjectId:
        return InternalLinkTypeNewGroupChat.fromJson(json);
      case InternalLinkTypeNewPrivateChat.defaultObjectId:
        return InternalLinkTypeNewPrivateChat.fromJson(json);
      case InternalLinkTypeNewStory.defaultObjectId:
        return InternalLinkTypeNewStory.fromJson(json);
      case InternalLinkTypeOauth.defaultObjectId:
        return InternalLinkTypeOauth.fromJson(json);
      case InternalLinkTypePassportDataRequest.defaultObjectId:
        return InternalLinkTypePassportDataRequest.fromJson(json);
      case InternalLinkTypePhoneNumberConfirmation.defaultObjectId:
        return InternalLinkTypePhoneNumberConfirmation.fromJson(json);
      case InternalLinkTypePremiumFeaturesPage.defaultObjectId:
        return InternalLinkTypePremiumFeaturesPage.fromJson(json);
      case InternalLinkTypePremiumGiftCode.defaultObjectId:
        return InternalLinkTypePremiumGiftCode.fromJson(json);
      case InternalLinkTypePremiumGiftPurchase.defaultObjectId:
        return InternalLinkTypePremiumGiftPurchase.fromJson(json);
      case InternalLinkTypeProxy.defaultObjectId:
        return InternalLinkTypeProxy.fromJson(json);
      case InternalLinkTypePublicChat.defaultObjectId:
        return InternalLinkTypePublicChat.fromJson(json);
      case InternalLinkTypeQrCodeAuthentication.defaultObjectId:
        return InternalLinkTypeQrCodeAuthentication.fromJson(json);
      case InternalLinkTypeRequestManagedBot.defaultObjectId:
        return InternalLinkTypeRequestManagedBot.fromJson(json);
      case InternalLinkTypeRestorePurchases.defaultObjectId:
        return InternalLinkTypeRestorePurchases.fromJson(json);
      case InternalLinkTypeSavedMessages.defaultObjectId:
        return InternalLinkTypeSavedMessages.fromJson(json);
      case InternalLinkTypeSearch.defaultObjectId:
        return InternalLinkTypeSearch.fromJson(json);
      case InternalLinkTypeSettings.defaultObjectId:
        return InternalLinkTypeSettings.fromJson(json);
      case InternalLinkTypeStarPurchase.defaultObjectId:
        return InternalLinkTypeStarPurchase.fromJson(json);
      case InternalLinkTypeStickerSet.defaultObjectId:
        return InternalLinkTypeStickerSet.fromJson(json);
      case InternalLinkTypeStory.defaultObjectId:
        return InternalLinkTypeStory.fromJson(json);
      case InternalLinkTypeStoryAlbum.defaultObjectId:
        return InternalLinkTypeStoryAlbum.fromJson(json);
      case InternalLinkTypeTextCompositionStyle.defaultObjectId:
        return InternalLinkTypeTextCompositionStyle.fromJson(json);
      case InternalLinkTypeTheme.defaultObjectId:
        return InternalLinkTypeTheme.fromJson(json);
      case InternalLinkTypeTonConnect.defaultObjectId:
        return InternalLinkTypeTonConnect.fromJson(json);
      case InternalLinkTypeTonWalletTransfer.defaultObjectId:
        return InternalLinkTypeTonWalletTransfer.fromJson(json);
      case InternalLinkTypeUnknownDeepLink.defaultObjectId:
        return InternalLinkTypeUnknownDeepLink.fromJson(json);
      case InternalLinkTypeUpgradedGift.defaultObjectId:
        return InternalLinkTypeUpgradedGift.fromJson(json);
      case InternalLinkTypeUserPhoneNumber.defaultObjectId:
        return InternalLinkTypeUserPhoneNumber.fromJson(json);
      case InternalLinkTypeUserToken.defaultObjectId:
        return InternalLinkTypeUserToken.fromJson(json);
      case InternalLinkTypeVideoChat.defaultObjectId:
        return InternalLinkTypeVideoChat.fromJson(json);
      case InternalLinkTypeWebApp.defaultObjectId:
        return InternalLinkTypeWebApp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InternalLinkType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InternalLinkType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeAttachmentMenuBot** *(internalLinkTypeAttachmentMenuBot)* - child of InternalLinkType
///
/// The link is a link to an attachment menu bot to be opened in the specified or a chosen chat. Process given target_chat to open the chat.. Then, call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then, use getAttachmentMenuBot to receive information about the bot.. If the bot isn't added to attachment menu, then show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu.. If the user accepts the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot.. If the attachment menu bot can't be used in the opened chat, show an error to the user. If the bot is added to attachment menu and can be used in the chat, then use openWebApp with the given URL.
///
/// * [targetChat]: Target chat to be opened.
/// * [botUsername]: Username of the bot.
/// * [url]: URL to be passed to openWebApp.
final class InternalLinkTypeAttachmentMenuBot extends InternalLinkType {
  /// **InternalLinkTypeAttachmentMenuBot** *(internalLinkTypeAttachmentMenuBot)* - child of InternalLinkType
  ///
  /// The link is a link to an attachment menu bot to be opened in the specified or a chosen chat. Process given target_chat to open the chat.. Then, call searchPublicChat with the given bot username, check that the user is a bot and can be added to attachment menu. Then, use getAttachmentMenuBot to receive information about the bot.. If the bot isn't added to attachment menu, then show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu.. If the user accepts the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot.. If the attachment menu bot can't be used in the opened chat, show an error to the user. If the bot is added to attachment menu and can be used in the chat, then use openWebApp with the given URL.
  ///
  /// * [targetChat]: Target chat to be opened.
  /// * [botUsername]: Username of the bot.
  /// * [url]: URL to be passed to openWebApp.
  const InternalLinkTypeAttachmentMenuBot({
    required this.targetChat,
    required this.botUsername,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// Target chat to be opened
  final TargetChat targetChat;

  /// Username of the bot
  final String botUsername;

  /// URL to be passed to openWebApp
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeAttachmentMenuBot.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeAttachmentMenuBot(
        targetChat: TargetChat.fromJson(json['target_chat']),
        botUsername: json['bot_username'],
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "target_chat": targetChat.toJson(),
      "bot_username": botUsername,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [target_chat]: Target chat to be opened
  /// * [bot_username]: Username of the bot
  /// * [url]: URL to be passed to openWebApp
  @override
  InternalLinkTypeAttachmentMenuBot copyWith({
    TargetChat? targetChat,
    String? botUsername,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeAttachmentMenuBot(
        targetChat: targetChat ?? this.targetChat,
        botUsername: botUsername ?? this.botUsername,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeAttachmentMenuBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeAuthenticationCode** *(internalLinkTypeAuthenticationCode)* - child of InternalLinkType
///
/// The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode.
///
/// * [code]: The authentication code.
final class InternalLinkTypeAuthenticationCode extends InternalLinkType {
  /// **InternalLinkTypeAuthenticationCode** *(internalLinkTypeAuthenticationCode)* - child of InternalLinkType
  ///
  /// The link contains an authentication code. Call checkAuthenticationCode with the code if the current authorization state is authorizationStateWaitCode.
  ///
  /// * [code]: The authentication code.
  const InternalLinkTypeAuthenticationCode({
    required this.code,
    this.extra,
    this.clientId,
  });

  /// The authentication code
  final String code;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeAuthenticationCode.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeAuthenticationCode(
        code: json['code'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "code": code,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: The authentication code
  @override
  InternalLinkTypeAuthenticationCode copyWith({
    String? code,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeAuthenticationCode(
        code: code ?? this.code,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeAuthenticationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeBackground** *(internalLinkTypeBackground)* - child of InternalLinkType
///
/// The link is a link to a background. Call searchBackground with the given background name to process the link.. If background is found and the user wants to apply it, then call setDefaultBackground.
///
/// * [backgroundName]: Name of the background.
final class InternalLinkTypeBackground extends InternalLinkType {
  /// **InternalLinkTypeBackground** *(internalLinkTypeBackground)* - child of InternalLinkType
  ///
  /// The link is a link to a background. Call searchBackground with the given background name to process the link.. If background is found and the user wants to apply it, then call setDefaultBackground.
  ///
  /// * [backgroundName]: Name of the background.
  const InternalLinkTypeBackground({
    required this.backgroundName,
    this.extra,
    this.clientId,
  });

  /// Name of the background
  final String backgroundName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeBackground.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeBackground(
        backgroundName: json['background_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "background_name": backgroundName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [background_name]: Name of the background
  @override
  InternalLinkTypeBackground copyWith({
    String? backgroundName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeBackground(
        backgroundName: backgroundName ?? this.backgroundName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeBotAddToChannel** *(internalLinkTypeBotAddToChannel)* - child of InternalLinkType
///
/// The link is a link to a Telegram bot, which is expected to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot,. ask the current user to select a channel chat to add the bot to as an administrator. Then, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,. check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then, show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights.
///
/// * [botUsername]: Username of the bot.
/// * [administratorRights]: Expected administrator rights for the bot.
final class InternalLinkTypeBotAddToChannel extends InternalLinkType {
  /// **InternalLinkTypeBotAddToChannel** *(internalLinkTypeBotAddToChannel)* - child of InternalLinkType
  ///
  /// The link is a link to a Telegram bot, which is expected to be added to a channel chat as an administrator. Call searchPublicChat with the given bot username and check that the user is a bot,. ask the current user to select a channel chat to add the bot to as an administrator. Then, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,. check that the current user can edit its administrator rights and combine received rights with the requested administrator rights. Then, show confirmation box to the user, and call setChatMemberStatus with the chosen chat and confirmed rights.
  ///
  /// * [botUsername]: Username of the bot.
  /// * [administratorRights]: Expected administrator rights for the bot.
  const InternalLinkTypeBotAddToChannel({
    required this.botUsername,
    required this.administratorRights,
    this.extra,
    this.clientId,
  });

  /// Username of the bot
  final String botUsername;

  /// Expected administrator rights for the bot
  final ChatAdministratorRights administratorRights;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeBotAddToChannel.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeBotAddToChannel(
        botUsername: json['bot_username'],
        administratorRights:
            ChatAdministratorRights.fromJson(json['administrator_rights']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "administrator_rights": administratorRights.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot
  /// * [administrator_rights]: Expected administrator rights for the bot
  @override
  InternalLinkTypeBotAddToChannel copyWith({
    String? botUsername,
    ChatAdministratorRights? administratorRights,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeBotAddToChannel(
        botUsername: botUsername ?? this.botUsername,
        administratorRights: administratorRights ?? this.administratorRights,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeBotAddToChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeBotStart** *(internalLinkTypeBotStart)* - child of InternalLinkType
///
/// The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,. and then call sendBotStartMessage with the given start parameter after the button is pressed.
///
/// * [botUsername]: Username of the bot.
/// * [startParameter]: The parameter to be passed to sendBotStartMessage.
/// * [autostart]: True, if sendBotStartMessage must be called automatically without showing the START button.
final class InternalLinkTypeBotStart extends InternalLinkType {
  /// **InternalLinkTypeBotStart** *(internalLinkTypeBotStart)* - child of InternalLinkType
  ///
  /// The link is a link to a chat with a Telegram bot. Call searchPublicChat with the given bot username, check that the user is a bot, show START button in the chat with the bot,. and then call sendBotStartMessage with the given start parameter after the button is pressed.
  ///
  /// * [botUsername]: Username of the bot.
  /// * [startParameter]: The parameter to be passed to sendBotStartMessage.
  /// * [autostart]: True, if sendBotStartMessage must be called automatically without showing the START button.
  const InternalLinkTypeBotStart({
    required this.botUsername,
    required this.startParameter,
    required this.autostart,
    this.extra,
    this.clientId,
  });

  /// Username of the bot
  final String botUsername;

  /// The parameter to be passed to sendBotStartMessage
  final String startParameter;

  /// True, if sendBotStartMessage must be called automatically without showing the START button
  final bool autostart;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeBotStart.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeBotStart(
        botUsername: json['bot_username'],
        startParameter: json['start_parameter'],
        autostart: json['autostart'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "start_parameter": startParameter,
      "autostart": autostart,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot
  /// * [start_parameter]: The parameter to be passed to sendBotStartMessage
  /// * [autostart]: True, if sendBotStartMessage must be called automatically without showing the START button
  @override
  InternalLinkTypeBotStart copyWith({
    String? botUsername,
    String? startParameter,
    bool? autostart,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeBotStart(
        botUsername: botUsername ?? this.botUsername,
        startParameter: startParameter ?? this.startParameter,
        autostart: autostart ?? this.autostart,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeBotStart';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeBotStartInGroup** *(internalLinkTypeBotStartInGroup)* - child of InternalLinkType
///
/// The link is a link to a Telegram bot, which is expected to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,. ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup.. If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,. check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user,. and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat.. Then, if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat; otherwise, just send /start message with bot's username added to the chat.
///
/// * [botUsername]: Username of the bot.
/// * [startParameter]: The parameter to be passed to sendBotStartMessage.
/// * [administratorRights]: Expected administrator rights for the bot; may be null *(optional)*.
final class InternalLinkTypeBotStartInGroup extends InternalLinkType {
  /// **InternalLinkTypeBotStartInGroup** *(internalLinkTypeBotStartInGroup)* - child of InternalLinkType
  ///
  /// The link is a link to a Telegram bot, which is expected to be added to a group chat. Call searchPublicChat with the given bot username, check that the user is a bot and can be added to groups,. ask the current user to select a basic group or a supergroup chat to add the bot to, taking into account that bots can be added to a public supergroup only by administrators of the supergroup.. If administrator rights are provided by the link, call getChatMember to receive the current bot rights in the chat and if the bot already is an administrator,. check that the current user can edit its administrator rights, combine received rights with the requested administrator rights, show confirmation box to the user,. and call setChatMemberStatus with the chosen chat and confirmed administrator rights. Before call to setChatMemberStatus it may be required to upgrade the chosen basic group chat to a supergroup chat.. Then, if start_parameter isn't empty, call sendBotStartMessage with the given start parameter and the chosen chat; otherwise, just send /start message with bot's username added to the chat.
  ///
  /// * [botUsername]: Username of the bot.
  /// * [startParameter]: The parameter to be passed to sendBotStartMessage.
  /// * [administratorRights]: Expected administrator rights for the bot; may be null *(optional)*.
  const InternalLinkTypeBotStartInGroup({
    required this.botUsername,
    required this.startParameter,
    this.administratorRights,
    this.extra,
    this.clientId,
  });

  /// Username of the bot
  final String botUsername;

  /// The parameter to be passed to sendBotStartMessage
  final String startParameter;

  /// Expected administrator rights for the bot; may be null
  final ChatAdministratorRights? administratorRights;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeBotStartInGroup.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeBotStartInGroup(
        botUsername: json['bot_username'],
        startParameter: json['start_parameter'],
        administratorRights: json['administrator_rights'] == null
            ? null
            : ChatAdministratorRights.fromJson(json['administrator_rights']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "start_parameter": startParameter,
      "administrator_rights": administratorRights?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot
  /// * [start_parameter]: The parameter to be passed to sendBotStartMessage
  /// * [administrator_rights]: Expected administrator rights for the bot; may be null
  @override
  InternalLinkTypeBotStartInGroup copyWith({
    String? botUsername,
    String? startParameter,
    ChatAdministratorRights? administratorRights,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeBotStartInGroup(
        botUsername: botUsername ?? this.botUsername,
        startParameter: startParameter ?? this.startParameter,
        administratorRights: administratorRights ?? this.administratorRights,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeBotStartInGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeBusinessChat** *(internalLinkTypeBusinessChat)* - child of InternalLinkType
///
/// The link is a link to a business chat. Use getBusinessChatLinkInfo with the provided link name to get information about the link,. then open received private chat and replace chat draft with the provided text.
///
/// * [linkName]: Name of the link.
final class InternalLinkTypeBusinessChat extends InternalLinkType {
  /// **InternalLinkTypeBusinessChat** *(internalLinkTypeBusinessChat)* - child of InternalLinkType
  ///
  /// The link is a link to a business chat. Use getBusinessChatLinkInfo with the provided link name to get information about the link,. then open received private chat and replace chat draft with the provided text.
  ///
  /// * [linkName]: Name of the link.
  const InternalLinkTypeBusinessChat({
    required this.linkName,
    this.extra,
    this.clientId,
  });

  /// Name of the link
  final String linkName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeBusinessChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeBusinessChat(
        linkName: json['link_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "link_name": linkName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link_name]: Name of the link
  @override
  InternalLinkTypeBusinessChat copyWith({
    String? linkName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeBusinessChat(
        linkName: linkName ?? this.linkName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeBusinessChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeCallsPage** *(internalLinkTypeCallsPage)* - child of InternalLinkType
///
/// The link is a link to the Call tab or page.
///
/// * [section]: Section of the page; may be one of. "", "all", "missed", "edit", "show-tab", "start-call".
final class InternalLinkTypeCallsPage extends InternalLinkType {
  /// **InternalLinkTypeCallsPage** *(internalLinkTypeCallsPage)* - child of InternalLinkType
  ///
  /// The link is a link to the Call tab or page.
  ///
  /// * [section]: Section of the page; may be one of. "", "all", "missed", "edit", "show-tab", "start-call".
  const InternalLinkTypeCallsPage({
    required this.section,
    this.extra,
    this.clientId,
  });

  /// Section of the page; may be one of. "", "all", "missed", "edit", "show-tab", "start-call"
  final String section;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeCallsPage.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeCallsPage(
        section: json['section'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "section": section,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [section]: Section of the page; may be one of. "", "all", "missed", "edit", "show-tab", "start-call"
  @override
  InternalLinkTypeCallsPage copyWith({
    String? section,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeCallsPage(
        section: section ?? this.section,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeCallsPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeChatAffiliateProgram** *(internalLinkTypeChatAffiliateProgram)* - child of InternalLinkType
///
/// The link is an affiliate program link. Call searchChatAffiliateProgram with the given username and referrer to process the link.
///
/// * [username]: Username to be passed to searchChatAffiliateProgram.
/// * [referrer]: Referrer to be passed to searchChatAffiliateProgram.
final class InternalLinkTypeChatAffiliateProgram extends InternalLinkType {
  /// **InternalLinkTypeChatAffiliateProgram** *(internalLinkTypeChatAffiliateProgram)* - child of InternalLinkType
  ///
  /// The link is an affiliate program link. Call searchChatAffiliateProgram with the given username and referrer to process the link.
  ///
  /// * [username]: Username to be passed to searchChatAffiliateProgram.
  /// * [referrer]: Referrer to be passed to searchChatAffiliateProgram.
  const InternalLinkTypeChatAffiliateProgram({
    required this.username,
    required this.referrer,
    this.extra,
    this.clientId,
  });

  /// Username to be passed to searchChatAffiliateProgram
  final String username;

  /// Referrer to be passed to searchChatAffiliateProgram
  final String referrer;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeChatAffiliateProgram.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeChatAffiliateProgram(
        username: json['username'],
        referrer: json['referrer'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "username": username,
      "referrer": referrer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: Username to be passed to searchChatAffiliateProgram
  /// * [referrer]: Referrer to be passed to searchChatAffiliateProgram
  @override
  InternalLinkTypeChatAffiliateProgram copyWith({
    String? username,
    String? referrer,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeChatAffiliateProgram(
        username: username ?? this.username,
        referrer: referrer ?? this.referrer,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeChatAffiliateProgram';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeChatBoost** *(internalLinkTypeChatBoost)* - child of InternalLinkType
///
/// The link is a link to boost a Telegram chat. Call getChatBoostLinkInfo with the given URL to process the link.. If the chat is found, then call getChatBoostStatus and getAvailableChatBoostSlots to get the current boost status and check whether the chat can be boosted.. If the user wants to boost the chat and the chat can be boosted, then call boostChat.
///
/// * [url]: URL to be passed to getChatBoostLinkInfo.
final class InternalLinkTypeChatBoost extends InternalLinkType {
  /// **InternalLinkTypeChatBoost** *(internalLinkTypeChatBoost)* - child of InternalLinkType
  ///
  /// The link is a link to boost a Telegram chat. Call getChatBoostLinkInfo with the given URL to process the link.. If the chat is found, then call getChatBoostStatus and getAvailableChatBoostSlots to get the current boost status and check whether the chat can be boosted.. If the user wants to boost the chat and the chat can be boosted, then call boostChat.
  ///
  /// * [url]: URL to be passed to getChatBoostLinkInfo.
  const InternalLinkTypeChatBoost({
    required this.url,
    this.extra,
    this.clientId,
  });

  /// URL to be passed to getChatBoostLinkInfo
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeChatBoost.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeChatBoost(
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL to be passed to getChatBoostLinkInfo
  @override
  InternalLinkTypeChatBoost copyWith({
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeChatBoost(
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeChatBoost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeChatFolderInvite** *(internalLinkTypeChatFolderInvite)* - child of InternalLinkType
///
/// The link is an invite link to a chat folder. Call checkChatFolderInviteLink with the given invite link to process the link.. If the link is valid and the user wants to join the chat folder, then call addChatFolderByInviteLink.
///
/// * [inviteLink]: Internal representation of the invite link.
final class InternalLinkTypeChatFolderInvite extends InternalLinkType {
  /// **InternalLinkTypeChatFolderInvite** *(internalLinkTypeChatFolderInvite)* - child of InternalLinkType
  ///
  /// The link is an invite link to a chat folder. Call checkChatFolderInviteLink with the given invite link to process the link.. If the link is valid and the user wants to join the chat folder, then call addChatFolderByInviteLink.
  ///
  /// * [inviteLink]: Internal representation of the invite link.
  const InternalLinkTypeChatFolderInvite({
    required this.inviteLink,
    this.extra,
    this.clientId,
  });

  /// Internal representation of the invite link
  final String inviteLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeChatFolderInvite.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeChatFolderInvite(
        inviteLink: json['invite_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Internal representation of the invite link
  @override
  InternalLinkTypeChatFolderInvite copyWith({
    String? inviteLink,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeChatFolderInvite(
        inviteLink: inviteLink ?? this.inviteLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeChatFolderInvite';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeChatInvite** *(internalLinkTypeChatInvite)* - child of InternalLinkType
///
/// The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link.. If the link is valid and the user wants to join the chat, then call joinChatByInviteLink.
///
/// * [inviteLink]: Internal representation of the invite link.
final class InternalLinkTypeChatInvite extends InternalLinkType {
  /// **InternalLinkTypeChatInvite** *(internalLinkTypeChatInvite)* - child of InternalLinkType
  ///
  /// The link is a chat invite link. Call checkChatInviteLink with the given invite link to process the link.. If the link is valid and the user wants to join the chat, then call joinChatByInviteLink.
  ///
  /// * [inviteLink]: Internal representation of the invite link.
  const InternalLinkTypeChatInvite({
    required this.inviteLink,
    this.extra,
    this.clientId,
  });

  /// Internal representation of the invite link
  final String inviteLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeChatInvite.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeChatInvite(
        inviteLink: json['invite_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Internal representation of the invite link
  @override
  InternalLinkTypeChatInvite copyWith({
    String? inviteLink,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeChatInvite(
        inviteLink: inviteLink ?? this.inviteLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeChatInvite';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeChatSelection** *(internalLinkTypeChatSelection)* - child of InternalLinkType
///
/// The link is a link that allows to select some chats.
final class InternalLinkTypeChatSelection extends InternalLinkType {
  /// **InternalLinkTypeChatSelection** *(internalLinkTypeChatSelection)* - child of InternalLinkType
  ///
  /// The link is a link that allows to select some chats.
  const InternalLinkTypeChatSelection({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeChatSelection.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeChatSelection(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeChatSelection copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeChatSelection(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeChatSelection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeContactsPage** *(internalLinkTypeContactsPage)* - child of InternalLinkType
///
/// The link is a link to the Contacts tab or page.
///
/// * [section]: Section of the page; may be one of. "", "search", "sort", "new", "invite", "manage".
final class InternalLinkTypeContactsPage extends InternalLinkType {
  /// **InternalLinkTypeContactsPage** *(internalLinkTypeContactsPage)* - child of InternalLinkType
  ///
  /// The link is a link to the Contacts tab or page.
  ///
  /// * [section]: Section of the page; may be one of. "", "search", "sort", "new", "invite", "manage".
  const InternalLinkTypeContactsPage({
    required this.section,
    this.extra,
    this.clientId,
  });

  /// Section of the page; may be one of. "", "search", "sort", "new", "invite", "manage"
  final String section;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeContactsPage.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeContactsPage(
        section: json['section'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "section": section,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [section]: Section of the page; may be one of. "", "search", "sort", "new", "invite", "manage"
  @override
  InternalLinkTypeContactsPage copyWith({
    String? section,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeContactsPage(
        section: section ?? this.section,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeContactsPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeDirectMessagesChat** *(internalLinkTypeDirectMessagesChat)* - child of InternalLinkType
///
/// The link is a link to a channel direct messages chat by username of the channel. Call searchPublicChat with the given chat username to process the link.. If the chat is found and is channel, open the direct messages chat of the channel.
///
/// * [channelUsername]: Username of the channel.
final class InternalLinkTypeDirectMessagesChat extends InternalLinkType {
  /// **InternalLinkTypeDirectMessagesChat** *(internalLinkTypeDirectMessagesChat)* - child of InternalLinkType
  ///
  /// The link is a link to a channel direct messages chat by username of the channel. Call searchPublicChat with the given chat username to process the link.. If the chat is found and is channel, open the direct messages chat of the channel.
  ///
  /// * [channelUsername]: Username of the channel.
  const InternalLinkTypeDirectMessagesChat({
    required this.channelUsername,
    this.extra,
    this.clientId,
  });

  /// Username of the channel
  final String channelUsername;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeDirectMessagesChat.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeDirectMessagesChat(
        channelUsername: json['channel_username'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "channel_username": channelUsername,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [channel_username]: Username of the channel
  @override
  InternalLinkTypeDirectMessagesChat copyWith({
    String? channelUsername,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeDirectMessagesChat(
        channelUsername: channelUsername ?? this.channelUsername,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeDirectMessagesChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeGame** *(internalLinkTypeGame)* - child of InternalLinkType
///
/// The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot,. ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame.
///
/// * [botUsername]: Username of the bot that owns the game.
/// * [gameShortName]: Short name of the game.
final class InternalLinkTypeGame extends InternalLinkType {
  /// **InternalLinkTypeGame** *(internalLinkTypeGame)* - child of InternalLinkType
  ///
  /// The link is a link to a game. Call searchPublicChat with the given bot username, check that the user is a bot,. ask the current user to select a chat to send the game, and then call sendMessage with inputMessageGame.
  ///
  /// * [botUsername]: Username of the bot that owns the game.
  /// * [gameShortName]: Short name of the game.
  const InternalLinkTypeGame({
    required this.botUsername,
    required this.gameShortName,
    this.extra,
    this.clientId,
  });

  /// Username of the bot that owns the game
  final String botUsername;

  /// Short name of the game
  final String gameShortName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeGame.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeGame(
        botUsername: json['bot_username'],
        gameShortName: json['game_short_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "game_short_name": gameShortName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot that owns the game
  /// * [game_short_name]: Short name of the game
  @override
  InternalLinkTypeGame copyWith({
    String? botUsername,
    String? gameShortName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeGame(
        botUsername: botUsername ?? this.botUsername,
        gameShortName: gameShortName ?? this.gameShortName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeGiftAuction** *(internalLinkTypeGiftAuction)* - child of InternalLinkType
///
/// The link is a link to a gift auction. Call getGiftAuctionState with the given auction identifier to process the link.
///
/// * [auctionId]: Unique identifier of the auction.
final class InternalLinkTypeGiftAuction extends InternalLinkType {
  /// **InternalLinkTypeGiftAuction** *(internalLinkTypeGiftAuction)* - child of InternalLinkType
  ///
  /// The link is a link to a gift auction. Call getGiftAuctionState with the given auction identifier to process the link.
  ///
  /// * [auctionId]: Unique identifier of the auction.
  const InternalLinkTypeGiftAuction({
    required this.auctionId,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the auction
  final String auctionId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeGiftAuction.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeGiftAuction(
        auctionId: json['auction_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "auction_id": auctionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [auction_id]: Unique identifier of the auction
  @override
  InternalLinkTypeGiftAuction copyWith({
    String? auctionId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeGiftAuction(
        auctionId: auctionId ?? this.auctionId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeGiftAuction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeGiftCollection** *(internalLinkTypeGiftCollection)* - child of InternalLinkType
///
/// The link is a link to a gift collection. Call searchPublicChat with the given username, then call getReceivedGifts with the received gift owner identifier. and the given collection identifier, then show the collection if received.
///
/// * [giftOwnerUsername]: Username of the owner of the gift collection.
/// * [collectionId]: Gift collection identifier.
final class InternalLinkTypeGiftCollection extends InternalLinkType {
  /// **InternalLinkTypeGiftCollection** *(internalLinkTypeGiftCollection)* - child of InternalLinkType
  ///
  /// The link is a link to a gift collection. Call searchPublicChat with the given username, then call getReceivedGifts with the received gift owner identifier. and the given collection identifier, then show the collection if received.
  ///
  /// * [giftOwnerUsername]: Username of the owner of the gift collection.
  /// * [collectionId]: Gift collection identifier.
  const InternalLinkTypeGiftCollection({
    required this.giftOwnerUsername,
    required this.collectionId,
    this.extra,
    this.clientId,
  });

  /// Username of the owner of the gift collection
  final String giftOwnerUsername;

  /// Gift collection identifier
  final int collectionId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeGiftCollection.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeGiftCollection(
        giftOwnerUsername: json['gift_owner_username'],
        collectionId: json['collection_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift_owner_username": giftOwnerUsername,
      "collection_id": collectionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_owner_username]: Username of the owner of the gift collection
  /// * [collection_id]: Gift collection identifier
  @override
  InternalLinkTypeGiftCollection copyWith({
    String? giftOwnerUsername,
    int? collectionId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeGiftCollection(
        giftOwnerUsername: giftOwnerUsername ?? this.giftOwnerUsername,
        collectionId: collectionId ?? this.collectionId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeGiftCollection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeGroupCall** *(internalLinkTypeGroupCall)* - child of InternalLinkType
///
/// The link is a link to a group call that isn't bound to a chat. Use getGroupCallParticipants to get the list of group call participants and show them on the join group call screen.. Call joinGroupCall with the given invite_link to join the call.
///
/// * [inviteLink]: Internal representation of the invite link.
final class InternalLinkTypeGroupCall extends InternalLinkType {
  /// **InternalLinkTypeGroupCall** *(internalLinkTypeGroupCall)* - child of InternalLinkType
  ///
  /// The link is a link to a group call that isn't bound to a chat. Use getGroupCallParticipants to get the list of group call participants and show them on the join group call screen.. Call joinGroupCall with the given invite_link to join the call.
  ///
  /// * [inviteLink]: Internal representation of the invite link.
  const InternalLinkTypeGroupCall({
    required this.inviteLink,
    this.extra,
    this.clientId,
  });

  /// Internal representation of the invite link
  final String inviteLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeGroupCall.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeGroupCall(
        inviteLink: json['invite_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Internal representation of the invite link
  @override
  InternalLinkTypeGroupCall copyWith({
    String? inviteLink,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeGroupCall(
        inviteLink: inviteLink ?? this.inviteLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeInstantView** *(internalLinkTypeInstantView)* - child of InternalLinkType
///
/// The link must be opened in an Instant View. Call getWebPageInstantView with the given URL to process the link.. If Instant View is found, then show it, otherwise, open the fallback URL in an external browser.
///
/// * [url]: URL to be passed to getWebPageInstantView.
/// * [fallbackUrl]: An URL to open if getWebPageInstantView fails.
final class InternalLinkTypeInstantView extends InternalLinkType {
  /// **InternalLinkTypeInstantView** *(internalLinkTypeInstantView)* - child of InternalLinkType
  ///
  /// The link must be opened in an Instant View. Call getWebPageInstantView with the given URL to process the link.. If Instant View is found, then show it, otherwise, open the fallback URL in an external browser.
  ///
  /// * [url]: URL to be passed to getWebPageInstantView.
  /// * [fallbackUrl]: An URL to open if getWebPageInstantView fails.
  const InternalLinkTypeInstantView({
    required this.url,
    required this.fallbackUrl,
    this.extra,
    this.clientId,
  });

  /// URL to be passed to getWebPageInstantView
  final String url;

  /// An URL to open if getWebPageInstantView fails
  final String fallbackUrl;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeInstantView.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeInstantView(
        url: json['url'],
        fallbackUrl: json['fallback_url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
      "fallback_url": fallbackUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL to be passed to getWebPageInstantView
  /// * [fallback_url]: An URL to open if getWebPageInstantView fails
  @override
  InternalLinkTypeInstantView copyWith({
    String? url,
    String? fallbackUrl,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeInstantView(
        url: url ?? this.url,
        fallbackUrl: fallbackUrl ?? this.fallbackUrl,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeInstantView';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeInvoice** *(internalLinkTypeInvoice)* - child of InternalLinkType
///
/// The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link.
///
/// * [invoiceName]: Name of the invoice.
final class InternalLinkTypeInvoice extends InternalLinkType {
  /// **InternalLinkTypeInvoice** *(internalLinkTypeInvoice)* - child of InternalLinkType
  ///
  /// The link is a link to an invoice. Call getPaymentForm with the given invoice name to process the link.
  ///
  /// * [invoiceName]: Name of the invoice.
  const InternalLinkTypeInvoice({
    required this.invoiceName,
    this.extra,
    this.clientId,
  });

  /// Name of the invoice
  final String invoiceName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeInvoice.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeInvoice(
        invoiceName: json['invoice_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invoice_name": invoiceName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invoice_name]: Name of the invoice
  @override
  InternalLinkTypeInvoice copyWith({
    String? invoiceName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeInvoice(
        invoiceName: invoiceName ?? this.invoiceName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeInvoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeLanguagePack** *(internalLinkTypeLanguagePack)* - child of InternalLinkType
///
/// The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link.. If the language pack is found and the user wants to apply it, then call setOption for the option "language_pack_id".
///
/// * [languagePackId]: Language pack identifier.
final class InternalLinkTypeLanguagePack extends InternalLinkType {
  /// **InternalLinkTypeLanguagePack** *(internalLinkTypeLanguagePack)* - child of InternalLinkType
  ///
  /// The link is a link to a language pack. Call getLanguagePackInfo with the given language pack identifier to process the link.. If the language pack is found and the user wants to apply it, then call setOption for the option "language_pack_id".
  ///
  /// * [languagePackId]: Language pack identifier.
  const InternalLinkTypeLanguagePack({
    required this.languagePackId,
    this.extra,
    this.clientId,
  });

  /// Language pack identifier
  final String languagePackId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeLanguagePack.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeLanguagePack(
        languagePackId: json['language_pack_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "language_pack_id": languagePackId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_id]: Language pack identifier
  @override
  InternalLinkTypeLanguagePack copyWith({
    String? languagePackId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeLanguagePack(
        languagePackId: languagePackId ?? this.languagePackId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeLanguagePack';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeLiveStory** *(internalLinkTypeLiveStory)* - child of InternalLinkType
///
/// The link is a link to a live story. Call searchPublicChat with the given chat username, then getChatActiveStories to get active stories in the chat,. then find a live story among active stories of the chat, and then joinLiveStory to join the live story.
///
/// * [storyPosterUsername]: Username of the poster of the story.
final class InternalLinkTypeLiveStory extends InternalLinkType {
  /// **InternalLinkTypeLiveStory** *(internalLinkTypeLiveStory)* - child of InternalLinkType
  ///
  /// The link is a link to a live story. Call searchPublicChat with the given chat username, then getChatActiveStories to get active stories in the chat,. then find a live story among active stories of the chat, and then joinLiveStory to join the live story.
  ///
  /// * [storyPosterUsername]: Username of the poster of the story.
  const InternalLinkTypeLiveStory({
    required this.storyPosterUsername,
    this.extra,
    this.clientId,
  });

  /// Username of the poster of the story
  final String storyPosterUsername;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeLiveStory.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeLiveStory(
        storyPosterUsername: json['story_poster_username'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_poster_username": storyPosterUsername,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_username]: Username of the poster of the story
  @override
  InternalLinkTypeLiveStory copyWith({
    String? storyPosterUsername,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeLiveStory(
        storyPosterUsername: storyPosterUsername ?? this.storyPosterUsername,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeLiveStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeMainWebApp** *(internalLinkTypeMainWebApp)* - child of InternalLinkType
///
/// The link is a link to the main Web App of a bot. Call searchPublicChat with the given bot username, check that the user is a bot and has the main Web App.. If the bot can be added to attachment menu, then use getAttachmentMenuBot to receive information about the bot, then if the bot isn't added to side menu,. show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu,. then if the user accepts the terms and confirms adding, use toggleBotIsAddedToAttachmentMenu to add the bot.. Then, use getMainWebApp with the given start parameter and mode and open the returned URL as a Web App.
///
/// * [botUsername]: Username of the bot.
/// * [startParameter]: Start parameter to be passed to getMainWebApp.
/// * [mode]: The mode to be passed to getMainWebApp.
final class InternalLinkTypeMainWebApp extends InternalLinkType {
  /// **InternalLinkTypeMainWebApp** *(internalLinkTypeMainWebApp)* - child of InternalLinkType
  ///
  /// The link is a link to the main Web App of a bot. Call searchPublicChat with the given bot username, check that the user is a bot and has the main Web App.. If the bot can be added to attachment menu, then use getAttachmentMenuBot to receive information about the bot, then if the bot isn't added to side menu,. show a disclaimer about Mini Apps being third-party applications, ask the user to accept their Terms of service and confirm adding the bot to side and attachment menu,. then if the user accepts the terms and confirms adding, use toggleBotIsAddedToAttachmentMenu to add the bot.. Then, use getMainWebApp with the given start parameter and mode and open the returned URL as a Web App.
  ///
  /// * [botUsername]: Username of the bot.
  /// * [startParameter]: Start parameter to be passed to getMainWebApp.
  /// * [mode]: The mode to be passed to getMainWebApp.
  const InternalLinkTypeMainWebApp({
    required this.botUsername,
    required this.startParameter,
    required this.mode,
    this.extra,
    this.clientId,
  });

  /// Username of the bot
  final String botUsername;

  /// Start parameter to be passed to getMainWebApp
  final String startParameter;

  /// The mode to be passed to getMainWebApp
  final WebAppOpenMode mode;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeMainWebApp.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeMainWebApp(
        botUsername: json['bot_username'],
        startParameter: json['start_parameter'],
        mode: WebAppOpenMode.fromJson(json['mode']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "start_parameter": startParameter,
      "mode": mode.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot
  /// * [start_parameter]: Start parameter to be passed to getMainWebApp
  /// * [mode]: The mode to be passed to getMainWebApp
  @override
  InternalLinkTypeMainWebApp copyWith({
    String? botUsername,
    String? startParameter,
    WebAppOpenMode? mode,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeMainWebApp(
        botUsername: botUsername ?? this.botUsername,
        startParameter: startParameter ?? this.startParameter,
        mode: mode ?? this.mode,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeMainWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeMessage** *(internalLinkTypeMessage)* - child of InternalLinkType
///
/// The link is a link to a Telegram message or a forum topic. Call getMessageLinkInfo with the given URL to process the link,. and then open received forum topic or chat and show the message there.
///
/// * [url]: URL to be passed to getMessageLinkInfo.
final class InternalLinkTypeMessage extends InternalLinkType {
  /// **InternalLinkTypeMessage** *(internalLinkTypeMessage)* - child of InternalLinkType
  ///
  /// The link is a link to a Telegram message or a forum topic. Call getMessageLinkInfo with the given URL to process the link,. and then open received forum topic or chat and show the message there.
  ///
  /// * [url]: URL to be passed to getMessageLinkInfo.
  const InternalLinkTypeMessage({
    required this.url,
    this.extra,
    this.clientId,
  });

  /// URL to be passed to getMessageLinkInfo
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeMessage.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeMessage(
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL to be passed to getMessageLinkInfo
  @override
  InternalLinkTypeMessage copyWith({
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeMessage(
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeMessageDraft** *(internalLinkTypeMessageDraft)* - child of InternalLinkType
///
/// The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field.
///
/// * [text]: Message draft text.
/// * [containsLink]: True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected.
final class InternalLinkTypeMessageDraft extends InternalLinkType {
  /// **InternalLinkTypeMessageDraft** *(internalLinkTypeMessageDraft)* - child of InternalLinkType
  ///
  /// The link contains a message draft text. A share screen needs to be shown to the user, then the chosen chat must be opened and the text is added to the input field.
  ///
  /// * [text]: Message draft text.
  /// * [containsLink]: True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected.
  const InternalLinkTypeMessageDraft({
    required this.text,
    required this.containsLink,
    this.extra,
    this.clientId,
  });

  /// Message draft text
  final FormattedText text;

  /// True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
  final bool containsLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeMessageDraft.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeMessageDraft(
        text: FormattedText.fromJson(json['text']),
        containsLink: json['contains_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "contains_link": containsLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Message draft text
  /// * [contains_link]: True, if the first line of the text contains a link. If true, the input field needs to be focused and the text after the link must be selected
  @override
  InternalLinkTypeMessageDraft copyWith({
    FormattedText? text,
    bool? containsLink,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeMessageDraft(
        text: text ?? this.text,
        containsLink: containsLink ?? this.containsLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeMessageDraft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeMyProfilePage** *(internalLinkTypeMyProfilePage)* - child of InternalLinkType
///
/// The link is a link to the My Profile application page.
///
/// * [section]: Section of the page; may be one of. "", "posts", "posts/all-stories", "posts/add-album", "gifts", "archived-posts".
final class InternalLinkTypeMyProfilePage extends InternalLinkType {
  /// **InternalLinkTypeMyProfilePage** *(internalLinkTypeMyProfilePage)* - child of InternalLinkType
  ///
  /// The link is a link to the My Profile application page.
  ///
  /// * [section]: Section of the page; may be one of. "", "posts", "posts/all-stories", "posts/add-album", "gifts", "archived-posts".
  const InternalLinkTypeMyProfilePage({
    required this.section,
    this.extra,
    this.clientId,
  });

  /// Section of the page; may be one of. "", "posts", "posts/all-stories", "posts/add-album", "gifts", "archived-posts"
  final String section;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeMyProfilePage.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeMyProfilePage(
        section: json['section'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "section": section,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [section]: Section of the page; may be one of. "", "posts", "posts/all-stories", "posts/add-album", "gifts", "archived-posts"
  @override
  InternalLinkTypeMyProfilePage copyWith({
    String? section,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeMyProfilePage(
        section: section ?? this.section,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeMyProfilePage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeNewChannelChat** *(internalLinkTypeNewChannelChat)* - child of InternalLinkType
///
/// The link is a link to the screen for creating a new channel chat.
final class InternalLinkTypeNewChannelChat extends InternalLinkType {
  /// **InternalLinkTypeNewChannelChat** *(internalLinkTypeNewChannelChat)* - child of InternalLinkType
  ///
  /// The link is a link to the screen for creating a new channel chat.
  const InternalLinkTypeNewChannelChat({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeNewChannelChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeNewChannelChat(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeNewChannelChat copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeNewChannelChat(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeNewChannelChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeNewGroupChat** *(internalLinkTypeNewGroupChat)* - child of InternalLinkType
///
/// The link is a link to the screen for creating a new group chat.
final class InternalLinkTypeNewGroupChat extends InternalLinkType {
  /// **InternalLinkTypeNewGroupChat** *(internalLinkTypeNewGroupChat)* - child of InternalLinkType
  ///
  /// The link is a link to the screen for creating a new group chat.
  const InternalLinkTypeNewGroupChat({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeNewGroupChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeNewGroupChat(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeNewGroupChat copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeNewGroupChat(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeNewGroupChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeNewPrivateChat** *(internalLinkTypeNewPrivateChat)* - child of InternalLinkType
///
/// The link is a link to the screen for creating a new private chat with a contact.
final class InternalLinkTypeNewPrivateChat extends InternalLinkType {
  /// **InternalLinkTypeNewPrivateChat** *(internalLinkTypeNewPrivateChat)* - child of InternalLinkType
  ///
  /// The link is a link to the screen for creating a new private chat with a contact.
  const InternalLinkTypeNewPrivateChat({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeNewPrivateChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeNewPrivateChat(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeNewPrivateChat copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeNewPrivateChat(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeNewPrivateChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeNewStory** *(internalLinkTypeNewStory)* - child of InternalLinkType
///
/// The link is a link to open the story posting interface.
///
/// * [contentType]: The type of the content of the story to post; may be null if unspecified *(optional)*.
final class InternalLinkTypeNewStory extends InternalLinkType {
  /// **InternalLinkTypeNewStory** *(internalLinkTypeNewStory)* - child of InternalLinkType
  ///
  /// The link is a link to open the story posting interface.
  ///
  /// * [contentType]: The type of the content of the story to post; may be null if unspecified *(optional)*.
  const InternalLinkTypeNewStory({
    this.contentType,
    this.extra,
    this.clientId,
  });

  /// The type of the content of the story to post; may be null if unspecified
  final StoryContentType? contentType;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeNewStory.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeNewStory(
        contentType: json['content_type'] == null
            ? null
            : StoryContentType.fromJson(json['content_type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "content_type": contentType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [content_type]: The type of the content of the story to post; may be null if unspecified
  @override
  InternalLinkTypeNewStory copyWith({
    StoryContentType? contentType,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeNewStory(
        contentType: contentType ?? this.contentType,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeNewStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeOauth** *(internalLinkTypeOauth)* - child of InternalLinkType
///
/// The link is an OAuth link. Call getOauthLinkInfo with the given URL to process the link if the link was received from outside of the application; otherwise, ignore it.. After getOauthLinkInfo, show the user confirmation dialog and process it with checkOauthRequestMatchCode, acceptOauthRequest, or declineOauthRequest.
///
/// * [url]: URL to be passed to getOauthLinkInfo.
final class InternalLinkTypeOauth extends InternalLinkType {
  /// **InternalLinkTypeOauth** *(internalLinkTypeOauth)* - child of InternalLinkType
  ///
  /// The link is an OAuth link. Call getOauthLinkInfo with the given URL to process the link if the link was received from outside of the application; otherwise, ignore it.. After getOauthLinkInfo, show the user confirmation dialog and process it with checkOauthRequestMatchCode, acceptOauthRequest, or declineOauthRequest.
  ///
  /// * [url]: URL to be passed to getOauthLinkInfo.
  const InternalLinkTypeOauth({
    required this.url,
    this.extra,
    this.clientId,
  });

  /// URL to be passed to getOauthLinkInfo
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeOauth.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeOauth(
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL to be passed to getOauthLinkInfo
  @override
  InternalLinkTypeOauth copyWith({
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeOauth(
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeOauth';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePassportDataRequest** *(internalLinkTypePassportDataRequest)* - child of InternalLinkType
///
/// The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the application; otherwise, ignore it.
///
/// * [botUserId]: User identifier of the service's bot; the corresponding user may be unknown yet.
/// * [scope]: Telegram Passport element types requested by the service.
/// * [publicKey]: Service's public key.
/// * [nonce]: Unique request identifier provided by the service.
/// * [callbackUrl]: An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively.. If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise.
final class InternalLinkTypePassportDataRequest extends InternalLinkType {
  /// **InternalLinkTypePassportDataRequest** *(internalLinkTypePassportDataRequest)* - child of InternalLinkType
  ///
  /// The link contains a request of Telegram passport data. Call getPassportAuthorizationForm with the given parameters to process the link if the link was received from outside of the application; otherwise, ignore it.
  ///
  /// * [botUserId]: User identifier of the service's bot; the corresponding user may be unknown yet.
  /// * [scope]: Telegram Passport element types requested by the service.
  /// * [publicKey]: Service's public key.
  /// * [nonce]: Unique request identifier provided by the service.
  /// * [callbackUrl]: An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively.. If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise.
  const InternalLinkTypePassportDataRequest({
    required this.botUserId,
    required this.scope,
    required this.publicKey,
    required this.nonce,
    required this.callbackUrl,
    this.extra,
    this.clientId,
  });

  /// User identifier of the service's bot; the corresponding user may be unknown yet
  final int botUserId;

  /// Telegram Passport element types requested by the service
  final String scope;

  /// Service's public key
  final String publicKey;

  /// Unique request identifier provided by the service
  final String nonce;

  /// An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively.. If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise
  final String callbackUrl;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePassportDataRequest.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypePassportDataRequest(
        botUserId: json['bot_user_id'],
        scope: json['scope'],
        publicKey: json['public_key'],
        nonce: json['nonce'],
        callbackUrl: json['callback_url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "scope": scope,
      "public_key": publicKey,
      "nonce": nonce,
      "callback_url": callbackUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the service's bot; the corresponding user may be unknown yet
  /// * [scope]: Telegram Passport element types requested by the service
  /// * [public_key]: Service's public key
  /// * [nonce]: Unique request identifier provided by the service
  /// * [callback_url]: An HTTP URL to open once the request is finished, canceled, or failed with the parameters tg_passport=success, tg_passport=cancel, or tg_passport=error&error=... respectively.. If empty, then onActivityResult method must be used to return response on Android, or the link tgbot{bot_user_id}://passport/success or tgbot{bot_user_id}://passport/cancel must be opened otherwise
  @override
  InternalLinkTypePassportDataRequest copyWith({
    int? botUserId,
    String? scope,
    String? publicKey,
    String? nonce,
    String? callbackUrl,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePassportDataRequest(
        botUserId: botUserId ?? this.botUserId,
        scope: scope ?? this.scope,
        publicKey: publicKey ?? this.publicKey,
        nonce: nonce ?? this.nonce,
        callbackUrl: callbackUrl ?? this.callbackUrl,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypePassportDataRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePhoneNumberConfirmation** *(internalLinkTypePhoneNumberConfirmation)* - child of InternalLinkType
///
/// The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberCode with the given phone number and with phoneNumberCodeTypeConfirmOwnership with the given hash to process the link.. If succeeded, call checkPhoneNumberCode to check entered by the user code, or resendPhoneNumberCode to resend it.
///
/// * [hash]: Hash value from the link.
/// * [phoneNumber]: Phone number value from the link.
final class InternalLinkTypePhoneNumberConfirmation extends InternalLinkType {
  /// **InternalLinkTypePhoneNumberConfirmation** *(internalLinkTypePhoneNumberConfirmation)* - child of InternalLinkType
  ///
  /// The link can be used to confirm ownership of a phone number to prevent account deletion. Call sendPhoneNumberCode with the given phone number and with phoneNumberCodeTypeConfirmOwnership with the given hash to process the link.. If succeeded, call checkPhoneNumberCode to check entered by the user code, or resendPhoneNumberCode to resend it.
  ///
  /// * [hash]: Hash value from the link.
  /// * [phoneNumber]: Phone number value from the link.
  const InternalLinkTypePhoneNumberConfirmation({
    required this.hash,
    required this.phoneNumber,
    this.extra,
    this.clientId,
  });

  /// Hash value from the link
  final String hash;

  /// Phone number value from the link
  final String phoneNumber;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePhoneNumberConfirmation.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypePhoneNumberConfirmation(
        hash: json['hash'],
        phoneNumber: json['phone_number'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "hash": hash,
      "phone_number": phoneNumber,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [hash]: Hash value from the link
  /// * [phone_number]: Phone number value from the link
  @override
  InternalLinkTypePhoneNumberConfirmation copyWith({
    String? hash,
    String? phoneNumber,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePhoneNumberConfirmation(
        hash: hash ?? this.hash,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'internalLinkTypePhoneNumberConfirmation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePremiumFeaturesPage** *(internalLinkTypePremiumFeaturesPage)* - child of InternalLinkType
///
/// The link is a link to the Premium features screen of the application from which the user can subscribe to Telegram Premium. Call getPremiumFeatures with the given referrer to process the link.
///
/// * [referrer]: Referrer specified in the link.
final class InternalLinkTypePremiumFeaturesPage extends InternalLinkType {
  /// **InternalLinkTypePremiumFeaturesPage** *(internalLinkTypePremiumFeaturesPage)* - child of InternalLinkType
  ///
  /// The link is a link to the Premium features screen of the application from which the user can subscribe to Telegram Premium. Call getPremiumFeatures with the given referrer to process the link.
  ///
  /// * [referrer]: Referrer specified in the link.
  const InternalLinkTypePremiumFeaturesPage({
    required this.referrer,
    this.extra,
    this.clientId,
  });

  /// Referrer specified in the link
  final String referrer;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePremiumFeaturesPage.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypePremiumFeaturesPage(
        referrer: json['referrer'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "referrer": referrer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [referrer]: Referrer specified in the link
  @override
  InternalLinkTypePremiumFeaturesPage copyWith({
    String? referrer,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePremiumFeaturesPage(
        referrer: referrer ?? this.referrer,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypePremiumFeaturesPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePremiumGiftCode** *(internalLinkTypePremiumGiftCode)* - child of InternalLinkType
///
/// The link is a link with a Telegram Premium gift code. Call checkPremiumGiftCode with the given code to process the link.. If the code is valid and the user wants to apply it, then call applyPremiumGiftCode.
///
/// * [code]: The Telegram Premium gift code.
final class InternalLinkTypePremiumGiftCode extends InternalLinkType {
  /// **InternalLinkTypePremiumGiftCode** *(internalLinkTypePremiumGiftCode)* - child of InternalLinkType
  ///
  /// The link is a link with a Telegram Premium gift code. Call checkPremiumGiftCode with the given code to process the link.. If the code is valid and the user wants to apply it, then call applyPremiumGiftCode.
  ///
  /// * [code]: The Telegram Premium gift code.
  const InternalLinkTypePremiumGiftCode({
    required this.code,
    this.extra,
    this.clientId,
  });

  /// The Telegram Premium gift code
  final String code;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePremiumGiftCode.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypePremiumGiftCode(
        code: json['code'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "code": code,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: The Telegram Premium gift code
  @override
  InternalLinkTypePremiumGiftCode copyWith({
    String? code,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePremiumGiftCode(
        code: code ?? this.code,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypePremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePremiumGiftPurchase** *(internalLinkTypePremiumGiftPurchase)* - child of InternalLinkType
///
/// The link is a link to the screen for gifting Telegram Premium subscriptions to friends via inputInvoiceTelegram with telegramPaymentPurposePremiumGift payments or in-store purchases.
///
/// * [referrer]: Referrer specified in the link.
final class InternalLinkTypePremiumGiftPurchase extends InternalLinkType {
  /// **InternalLinkTypePremiumGiftPurchase** *(internalLinkTypePremiumGiftPurchase)* - child of InternalLinkType
  ///
  /// The link is a link to the screen for gifting Telegram Premium subscriptions to friends via inputInvoiceTelegram with telegramPaymentPurposePremiumGift payments or in-store purchases.
  ///
  /// * [referrer]: Referrer specified in the link.
  const InternalLinkTypePremiumGiftPurchase({
    required this.referrer,
    this.extra,
    this.clientId,
  });

  /// Referrer specified in the link
  final String referrer;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePremiumGiftPurchase.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypePremiumGiftPurchase(
        referrer: json['referrer'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "referrer": referrer,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [referrer]: Referrer specified in the link
  @override
  InternalLinkTypePremiumGiftPurchase copyWith({
    String? referrer,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePremiumGiftPurchase(
        referrer: referrer ?? this.referrer,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypePremiumGiftPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeProxy** *(internalLinkTypeProxy)* - child of InternalLinkType
///
/// The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy.
///
/// * [proxy]: The proxy; may be null if the proxy is unsupported, in which case an alert can be shown to the user *(optional)*.
final class InternalLinkTypeProxy extends InternalLinkType {
  /// **InternalLinkTypeProxy** *(internalLinkTypeProxy)* - child of InternalLinkType
  ///
  /// The link is a link to a proxy. Call addProxy with the given parameters to process the link and add the proxy.
  ///
  /// * [proxy]: The proxy; may be null if the proxy is unsupported, in which case an alert can be shown to the user *(optional)*.
  const InternalLinkTypeProxy({
    this.proxy,
    this.extra,
    this.clientId,
  });

  /// The proxy; may be null if the proxy is unsupported, in which case an alert can be shown to the user
  final Proxy? proxy;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeProxy.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeProxy(
        proxy: json['proxy'] == null ? null : Proxy.fromJson(json['proxy']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "proxy": proxy?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [proxy]: The proxy; may be null if the proxy is unsupported, in which case an alert can be shown to the user
  @override
  InternalLinkTypeProxy copyWith({
    Proxy? proxy,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeProxy(
        proxy: proxy ?? this.proxy,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypePublicChat** *(internalLinkTypePublicChat)* - child of InternalLinkType
///
/// The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link.. If the chat is found, open its profile information screen or the chat itself.. If draft text isn't empty and the chat is a private chat with a regular user, then put the draft text in the input field.
///
/// * [chatUsername]: Username of the chat.
/// * [draftText]: Draft text for message to send in the chat.
/// * [openProfile]: True, if chat profile information screen must be opened; otherwise, the chat itself must be opened.
/// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages; may be empty if none.. If the token isn't empty and the chat is a private chat with a regular user, then call applyUnpaidMessagesToken with the user and the token.
final class InternalLinkTypePublicChat extends InternalLinkType {
  /// **InternalLinkTypePublicChat** *(internalLinkTypePublicChat)* - child of InternalLinkType
  ///
  /// The link is a link to a chat by its username. Call searchPublicChat with the given chat username to process the link.. If the chat is found, open its profile information screen or the chat itself.. If draft text isn't empty and the chat is a private chat with a regular user, then put the draft text in the input field.
  ///
  /// * [chatUsername]: Username of the chat.
  /// * [draftText]: Draft text for message to send in the chat.
  /// * [openProfile]: True, if chat profile information screen must be opened; otherwise, the chat itself must be opened.
  /// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages; may be empty if none.. If the token isn't empty and the chat is a private chat with a regular user, then call applyUnpaidMessagesToken with the user and the token.
  const InternalLinkTypePublicChat({
    required this.chatUsername,
    required this.draftText,
    required this.openProfile,
    required this.unpaidMessagesToken,
    this.extra,
    this.clientId,
  });

  /// Username of the chat
  final String chatUsername;

  /// Draft text for message to send in the chat
  final String draftText;

  /// True, if chat profile information screen must be opened; otherwise, the chat itself must be opened
  final bool openProfile;

  /// Token, which allows the current user to send unpaid messages; may be empty if none.. If the token isn't empty and the chat is a private chat with a regular user, then call applyUnpaidMessagesToken with the user and the token
  final String unpaidMessagesToken;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypePublicChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypePublicChat(
        chatUsername: json['chat_username'],
        draftText: json['draft_text'],
        openProfile: json['open_profile'],
        unpaidMessagesToken: json['unpaid_messages_token'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_username": chatUsername,
      "draft_text": draftText,
      "open_profile": openProfile,
      "unpaid_messages_token": unpaidMessagesToken,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_username]: Username of the chat
  /// * [draft_text]: Draft text for message to send in the chat
  /// * [open_profile]: True, if chat profile information screen must be opened; otherwise, the chat itself must be opened
  /// * [unpaid_messages_token]: Token, which allows the current user to send unpaid messages; may be empty if none.. If the token isn't empty and the chat is a private chat with a regular user, then call applyUnpaidMessagesToken with the user and the token
  @override
  InternalLinkTypePublicChat copyWith({
    String? chatUsername,
    String? draftText,
    bool? openProfile,
    String? unpaidMessagesToken,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypePublicChat(
        chatUsername: chatUsername ?? this.chatUsername,
        draftText: draftText ?? this.draftText,
        openProfile: openProfile ?? this.openProfile,
        unpaidMessagesToken: unpaidMessagesToken ?? this.unpaidMessagesToken,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypePublicChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeQrCodeAuthentication** *(internalLinkTypeQrCodeAuthentication)* - child of InternalLinkType
///
/// The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to. "This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings.
final class InternalLinkTypeQrCodeAuthentication extends InternalLinkType {
  /// **InternalLinkTypeQrCodeAuthentication** *(internalLinkTypeQrCodeAuthentication)* - child of InternalLinkType
  ///
  /// The link can be used to login the current user on another device, but it must be scanned from QR-code using in-app camera. An alert similar to. "This code can be used to allow someone to log in to your Telegram account. To confirm Telegram login, please go to Settings.
  const InternalLinkTypeQrCodeAuthentication({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeQrCodeAuthentication.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeQrCodeAuthentication(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeQrCodeAuthentication copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeQrCodeAuthentication(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeQrCodeAuthentication';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeRequestManagedBot** *(internalLinkTypeRequestManagedBot)* - child of InternalLinkType
///
/// The link is a link to a dialog for creating of a managed bot. Call searchPublicChat with the given manager bot username.. If the chat is found, the chat is a chat with a bot and the bot has can_manage_bots == true, then show bot creation confirmation dialog. with the given suggested_bot_username and suggested_bot_name. If user agrees, call createBot with via_link == true to create the bot.
///
/// * [managerBotUsername]: Username of the bot which will manage the new bot.
/// * [suggestedBotUsername]: Suggested username for the bot; always ends with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.
/// * [suggestedBotName]: Suggested name for the bot; may be empty if not specified.
final class InternalLinkTypeRequestManagedBot extends InternalLinkType {
  /// **InternalLinkTypeRequestManagedBot** *(internalLinkTypeRequestManagedBot)* - child of InternalLinkType
  ///
  /// The link is a link to a dialog for creating of a managed bot. Call searchPublicChat with the given manager bot username.. If the chat is found, the chat is a chat with a bot and the bot has can_manage_bots == true, then show bot creation confirmation dialog. with the given suggested_bot_username and suggested_bot_name. If user agrees, call createBot with via_link == true to create the bot.
  ///
  /// * [managerBotUsername]: Username of the bot which will manage the new bot.
  /// * [suggestedBotUsername]: Suggested username for the bot; always ends with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.
  /// * [suggestedBotName]: Suggested name for the bot; may be empty if not specified.
  const InternalLinkTypeRequestManagedBot({
    required this.managerBotUsername,
    required this.suggestedBotUsername,
    required this.suggestedBotName,
    this.extra,
    this.clientId,
  });

  /// Username of the bot which will manage the new bot
  final String managerBotUsername;

  /// Suggested username for the bot; always ends with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive
  final String suggestedBotUsername;

  /// Suggested name for the bot; may be empty if not specified
  final String suggestedBotName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeRequestManagedBot.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeRequestManagedBot(
        managerBotUsername: json['manager_bot_username'],
        suggestedBotUsername: json['suggested_bot_username'],
        suggestedBotName: json['suggested_bot_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "manager_bot_username": managerBotUsername,
      "suggested_bot_username": suggestedBotUsername,
      "suggested_bot_name": suggestedBotName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [manager_bot_username]: Username of the bot which will manage the new bot
  /// * [suggested_bot_username]: Suggested username for the bot; always ends with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive
  /// * [suggested_bot_name]: Suggested name for the bot; may be empty if not specified
  @override
  InternalLinkTypeRequestManagedBot copyWith({
    String? managerBotUsername,
    String? suggestedBotUsername,
    String? suggestedBotName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeRequestManagedBot(
        managerBotUsername: managerBotUsername ?? this.managerBotUsername,
        suggestedBotUsername: suggestedBotUsername ?? this.suggestedBotUsername,
        suggestedBotName: suggestedBotName ?? this.suggestedBotName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeRequestManagedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeRestorePurchases** *(internalLinkTypeRestorePurchases)* - child of InternalLinkType
///
/// The link forces restore of App Store purchases when opened. For official iOS application only.
final class InternalLinkTypeRestorePurchases extends InternalLinkType {
  /// **InternalLinkTypeRestorePurchases** *(internalLinkTypeRestorePurchases)* - child of InternalLinkType
  ///
  /// The link forces restore of App Store purchases when opened. For official iOS application only.
  const InternalLinkTypeRestorePurchases({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeRestorePurchases.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeRestorePurchases(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeRestorePurchases copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeRestorePurchases(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeRestorePurchases';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeSavedMessages** *(internalLinkTypeSavedMessages)* - child of InternalLinkType
///
/// The link is a link to the Saved Messages chat. Call createPrivateChat with getOption("my_id") and open the chat.
final class InternalLinkTypeSavedMessages extends InternalLinkType {
  /// **InternalLinkTypeSavedMessages** *(internalLinkTypeSavedMessages)* - child of InternalLinkType
  ///
  /// The link is a link to the Saved Messages chat. Call createPrivateChat with getOption("my_id") and open the chat.
  const InternalLinkTypeSavedMessages({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeSavedMessages.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeSavedMessages(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeSavedMessages copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeSavedMessages(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeSavedMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeSearch** *(internalLinkTypeSearch)* - child of InternalLinkType
///
/// The link is a link to the global chat and messages search field.
final class InternalLinkTypeSearch extends InternalLinkType {
  /// **InternalLinkTypeSearch** *(internalLinkTypeSearch)* - child of InternalLinkType
  ///
  /// The link is a link to the global chat and messages search field.
  const InternalLinkTypeSearch({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeSearch.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeSearch(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  InternalLinkTypeSearch copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeSearch(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeSettings** *(internalLinkTypeSettings)* - child of InternalLinkType
///
/// The link is a link to application settings.
///
/// * [section]: Section of the application settings to open; may be null if none *(optional)*.
final class InternalLinkTypeSettings extends InternalLinkType {
  /// **InternalLinkTypeSettings** *(internalLinkTypeSettings)* - child of InternalLinkType
  ///
  /// The link is a link to application settings.
  ///
  /// * [section]: Section of the application settings to open; may be null if none *(optional)*.
  const InternalLinkTypeSettings({
    this.section,
    this.extra,
    this.clientId,
  });

  /// Section of the application settings to open; may be null if none
  final SettingsSection? section;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeSettings.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeSettings(
        section: json['section'] == null
            ? null
            : SettingsSection.fromJson(json['section']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "section": section?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [section]: Section of the application settings to open; may be null if none
  @override
  InternalLinkTypeSettings copyWith({
    SettingsSection? section,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeSettings(
        section: section ?? this.section,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeStarPurchase** *(internalLinkTypeStarPurchase)* - child of InternalLinkType
///
/// The link is a link to the Telegram Star purchase section of the application.
///
/// * [starCount]: The number of Telegram Stars that must be owned by the user.
/// * [purpose]: Purpose of Telegram Star purchase. Arbitrary string specified by the server, for example, "subs" if the Telegram Stars are required to extend channel subscriptions.
final class InternalLinkTypeStarPurchase extends InternalLinkType {
  /// **InternalLinkTypeStarPurchase** *(internalLinkTypeStarPurchase)* - child of InternalLinkType
  ///
  /// The link is a link to the Telegram Star purchase section of the application.
  ///
  /// * [starCount]: The number of Telegram Stars that must be owned by the user.
  /// * [purpose]: Purpose of Telegram Star purchase. Arbitrary string specified by the server, for example, "subs" if the Telegram Stars are required to extend channel subscriptions.
  const InternalLinkTypeStarPurchase({
    required this.starCount,
    required this.purpose,
    this.extra,
    this.clientId,
  });

  /// The number of Telegram Stars that must be owned by the user
  final int starCount;

  /// Purpose of Telegram Star purchase. Arbitrary string specified by the server, for example, "subs" if the Telegram Stars are required to extend channel subscriptions
  final String purpose;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeStarPurchase.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeStarPurchase(
        starCount: json['star_count'],
        purpose: json['purpose'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "purpose": purpose,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The number of Telegram Stars that must be owned by the user
  /// * [purpose]: Purpose of Telegram Star purchase. Arbitrary string specified by the server, for example, "subs" if the Telegram Stars are required to extend channel subscriptions
  @override
  InternalLinkTypeStarPurchase copyWith({
    int? starCount,
    String? purpose,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeStarPurchase(
        starCount: starCount ?? this.starCount,
        purpose: purpose ?? this.purpose,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeStarPurchase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeStickerSet** *(internalLinkTypeStickerSet)* - child of InternalLinkType
///
/// The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set.. If the sticker set is found and the user wants to add it, then call changeStickerSet.
///
/// * [stickerSetName]: Name of the sticker set.
/// * [expectCustomEmoji]: True, if the sticker set is expected to contain custom emoji.
final class InternalLinkTypeStickerSet extends InternalLinkType {
  /// **InternalLinkTypeStickerSet** *(internalLinkTypeStickerSet)* - child of InternalLinkType
  ///
  /// The link is a link to a sticker set. Call searchStickerSet with the given sticker set name to process the link and show the sticker set.. If the sticker set is found and the user wants to add it, then call changeStickerSet.
  ///
  /// * [stickerSetName]: Name of the sticker set.
  /// * [expectCustomEmoji]: True, if the sticker set is expected to contain custom emoji.
  const InternalLinkTypeStickerSet({
    required this.stickerSetName,
    required this.expectCustomEmoji,
    this.extra,
    this.clientId,
  });

  /// Name of the sticker set
  final String stickerSetName;

  /// True, if the sticker set is expected to contain custom emoji
  final bool expectCustomEmoji;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeStickerSet.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeStickerSet(
        stickerSetName: json['sticker_set_name'],
        expectCustomEmoji: json['expect_custom_emoji'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_set_name": stickerSetName,
      "expect_custom_emoji": expectCustomEmoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_set_name]: Name of the sticker set
  /// * [expect_custom_emoji]: True, if the sticker set is expected to contain custom emoji
  @override
  InternalLinkTypeStickerSet copyWith({
    String? stickerSetName,
    bool? expectCustomEmoji,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeStickerSet(
        stickerSetName: stickerSetName ?? this.stickerSetName,
        expectCustomEmoji: expectCustomEmoji ?? this.expectCustomEmoji,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeStory** *(internalLinkTypeStory)* - child of InternalLinkType
///
/// The link is a link to a story. Call searchPublicChat with the given poster username, then call getStory with the received chat identifier and the given story identifier, then show the story if received.
///
/// * [storyPosterUsername]: Username of the poster of the story.
/// * [storyId]: Story identifier.
final class InternalLinkTypeStory extends InternalLinkType {
  /// **InternalLinkTypeStory** *(internalLinkTypeStory)* - child of InternalLinkType
  ///
  /// The link is a link to a story. Call searchPublicChat with the given poster username, then call getStory with the received chat identifier and the given story identifier, then show the story if received.
  ///
  /// * [storyPosterUsername]: Username of the poster of the story.
  /// * [storyId]: Story identifier.
  const InternalLinkTypeStory({
    required this.storyPosterUsername,
    required this.storyId,
    this.extra,
    this.clientId,
  });

  /// Username of the poster of the story
  final String storyPosterUsername;

  /// Story identifier
  final int storyId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeStory.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeStory(
        storyPosterUsername: json['story_poster_username'],
        storyId: json['story_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_poster_username": storyPosterUsername,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_username]: Username of the poster of the story
  /// * [story_id]: Story identifier
  @override
  InternalLinkTypeStory copyWith({
    String? storyPosterUsername,
    int? storyId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeStory(
        storyPosterUsername: storyPosterUsername ?? this.storyPosterUsername,
        storyId: storyId ?? this.storyId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeStoryAlbum** *(internalLinkTypeStoryAlbum)* - child of InternalLinkType
///
/// The link is a link to an album of stories. Call searchPublicChat with the given username, then call getStoryAlbumStories with the received chat identifier. and the given story album identifier, then show the story album if received.
///
/// * [storyAlbumOwnerUsername]: Username of the owner of the story album.
/// * [storyAlbumId]: Story album identifier.
final class InternalLinkTypeStoryAlbum extends InternalLinkType {
  /// **InternalLinkTypeStoryAlbum** *(internalLinkTypeStoryAlbum)* - child of InternalLinkType
  ///
  /// The link is a link to an album of stories. Call searchPublicChat with the given username, then call getStoryAlbumStories with the received chat identifier. and the given story album identifier, then show the story album if received.
  ///
  /// * [storyAlbumOwnerUsername]: Username of the owner of the story album.
  /// * [storyAlbumId]: Story album identifier.
  const InternalLinkTypeStoryAlbum({
    required this.storyAlbumOwnerUsername,
    required this.storyAlbumId,
    this.extra,
    this.clientId,
  });

  /// Username of the owner of the story album
  final String storyAlbumOwnerUsername;

  /// Story album identifier
  final int storyAlbumId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeStoryAlbum.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeStoryAlbum(
        storyAlbumOwnerUsername: json['story_album_owner_username'],
        storyAlbumId: json['story_album_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_album_owner_username": storyAlbumOwnerUsername,
      "story_album_id": storyAlbumId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_album_owner_username]: Username of the owner of the story album
  /// * [story_album_id]: Story album identifier
  @override
  InternalLinkTypeStoryAlbum copyWith({
    String? storyAlbumOwnerUsername,
    int? storyAlbumId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeStoryAlbum(
        storyAlbumOwnerUsername:
            storyAlbumOwnerUsername ?? this.storyAlbumOwnerUsername,
        storyAlbumId: storyAlbumId ?? this.storyAlbumId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeStoryAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeTextCompositionStyle** *(internalLinkTypeTextCompositionStyle)* - child of InternalLinkType
///
/// The link is a link to a text composition style. Call searchTextCompositionStyle with the given style name to get information about the style.. If the style is found and the user wants to add it, then call addTextCompositionStyle.
///
/// * [styleName]: Name of the style.
final class InternalLinkTypeTextCompositionStyle extends InternalLinkType {
  /// **InternalLinkTypeTextCompositionStyle** *(internalLinkTypeTextCompositionStyle)* - child of InternalLinkType
  ///
  /// The link is a link to a text composition style. Call searchTextCompositionStyle with the given style name to get information about the style.. If the style is found and the user wants to add it, then call addTextCompositionStyle.
  ///
  /// * [styleName]: Name of the style.
  const InternalLinkTypeTextCompositionStyle({
    required this.styleName,
    this.extra,
    this.clientId,
  });

  /// Name of the style
  final String styleName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeTextCompositionStyle.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeTextCompositionStyle(
        styleName: json['style_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "style_name": styleName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [style_name]: Name of the style
  @override
  InternalLinkTypeTextCompositionStyle copyWith({
    String? styleName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeTextCompositionStyle(
        styleName: styleName ?? this.styleName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeTheme** *(internalLinkTypeTheme)* - child of InternalLinkType
///
/// The link is a link to a cloud theme. TDLib has no theme support yet.
///
/// * [themeName]: Name of the theme.
final class InternalLinkTypeTheme extends InternalLinkType {
  /// **InternalLinkTypeTheme** *(internalLinkTypeTheme)* - child of InternalLinkType
  ///
  /// The link is a link to a cloud theme. TDLib has no theme support yet.
  ///
  /// * [themeName]: Name of the theme.
  const InternalLinkTypeTheme({
    required this.themeName,
    this.extra,
    this.clientId,
  });

  /// Name of the theme
  final String themeName;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeTheme.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeTheme(
        themeName: json['theme_name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "theme_name": themeName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [theme_name]: Name of the theme
  @override
  InternalLinkTypeTheme copyWith({
    String? themeName,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeTheme(
        themeName: themeName ?? this.themeName,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeTonConnect** *(internalLinkTypeTonConnect)* - child of InternalLinkType
///
/// The link is a universal TON Connect link.
///
/// * [version]: TON Connect version.
/// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
/// * [connectRequest]: TON Connect connect request.
/// * [returnStrategy]: Request return strategy; one of "back", "none", or a URL to open.
/// * [rpcRequest]: Embedded RPC request represented as base64url-encoded JSON.
/// * [traceId]: Identifier to trace the connection request.
final class InternalLinkTypeTonConnect extends InternalLinkType {
  /// **InternalLinkTypeTonConnect** *(internalLinkTypeTonConnect)* - child of InternalLinkType
  ///
  /// The link is a universal TON Connect link.
  ///
  /// * [version]: TON Connect version.
  /// * [dappClientId]: Hex-encoded public X25519 key of the dApp.
  /// * [connectRequest]: TON Connect connect request.
  /// * [returnStrategy]: Request return strategy; one of "back", "none", or a URL to open.
  /// * [rpcRequest]: Embedded RPC request represented as base64url-encoded JSON.
  /// * [traceId]: Identifier to trace the connection request.
  const InternalLinkTypeTonConnect({
    required this.version,
    required this.dappClientId,
    required this.connectRequest,
    required this.returnStrategy,
    required this.rpcRequest,
    required this.traceId,
    this.extra,
    this.clientId,
  });

  /// TON Connect version
  final int version;

  /// Hex-encoded public X25519 key of the dApp
  final String dappClientId;

  /// TON Connect connect request
  final TonConnectConnectRequest connectRequest;

  /// Request return strategy; one of "back", "none", or a URL to open
  final String returnStrategy;

  /// Embedded RPC request represented as base64url-encoded JSON
  final String rpcRequest;

  /// Identifier to trace the connection request
  final String traceId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeTonConnect.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeTonConnect(
        version: json['version'],
        dappClientId: json['dapp_client_id'],
        connectRequest:
            TonConnectConnectRequest.fromJson(json['connect_request']),
        returnStrategy: json['return_strategy'],
        rpcRequest: json['rpc_request'],
        traceId: json['trace_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "version": version,
      "dapp_client_id": dappClientId,
      "connect_request": connectRequest.toJson(),
      "return_strategy": returnStrategy,
      "rpc_request": rpcRequest,
      "trace_id": traceId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [version]: TON Connect version
  /// * [dapp_client_id]: Hex-encoded public X25519 key of the dApp
  /// * [connect_request]: TON Connect connect request
  /// * [return_strategy]: Request return strategy; one of "back", "none", or a URL to open
  /// * [rpc_request]: Embedded RPC request represented as base64url-encoded JSON
  /// * [trace_id]: Identifier to trace the connection request
  @override
  InternalLinkTypeTonConnect copyWith({
    int? version,
    String? dappClientId,
    TonConnectConnectRequest? connectRequest,
    String? returnStrategy,
    String? rpcRequest,
    String? traceId,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeTonConnect(
        version: version ?? this.version,
        dappClientId: dappClientId ?? this.dappClientId,
        connectRequest: connectRequest ?? this.connectRequest,
        returnStrategy: returnStrategy ?? this.returnStrategy,
        rpcRequest: rpcRequest ?? this.rpcRequest,
        traceId: traceId ?? this.traceId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeTonConnect';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeTonWalletTransfer** *(internalLinkTypeTonWalletTransfer)* - child of InternalLinkType
///
/// The link is a link for sending Grams from the user's TON wallet.
///
/// * [receiver]: Chosen receiver of the transfer; may be null if none *(optional)*.
/// * [gramAmount]: The pre-filled amount of TON Grams to send; in the smallest units of the cryptocurrency.
final class InternalLinkTypeTonWalletTransfer extends InternalLinkType {
  /// **InternalLinkTypeTonWalletTransfer** *(internalLinkTypeTonWalletTransfer)* - child of InternalLinkType
  ///
  /// The link is a link for sending Grams from the user's TON wallet.
  ///
  /// * [receiver]: Chosen receiver of the transfer; may be null if none *(optional)*.
  /// * [gramAmount]: The pre-filled amount of TON Grams to send; in the smallest units of the cryptocurrency.
  const InternalLinkTypeTonWalletTransfer({
    this.receiver,
    required this.gramAmount,
    this.extra,
    this.clientId,
  });

  /// Chosen receiver of the transfer; may be null if none
  final TonWalletTransferReceiver? receiver;

  /// The pre-filled amount of TON Grams to send; in the smallest units of the cryptocurrency
  final int gramAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeTonWalletTransfer.fromJson(
          Map<String, dynamic> json) =>
      InternalLinkTypeTonWalletTransfer(
        receiver: json['receiver'] == null
            ? null
            : TonWalletTransferReceiver.fromJson(json['receiver']),
        gramAmount: json['gram_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "receiver": receiver?.toJson(),
      "gram_amount": gramAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [receiver]: Chosen receiver of the transfer; may be null if none
  /// * [gram_amount]: The pre-filled amount of TON Grams to send; in the smallest units of the cryptocurrency
  @override
  InternalLinkTypeTonWalletTransfer copyWith({
    TonWalletTransferReceiver? receiver,
    int? gramAmount,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeTonWalletTransfer(
        receiver: receiver ?? this.receiver,
        gramAmount: gramAmount ?? this.gramAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeTonWalletTransfer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeUnknownDeepLink** *(internalLinkTypeUnknownDeepLink)* - child of InternalLinkType
///
/// The link is an unknown tg: link. Call getDeepLinkInfo to process the link.
///
/// * [link]: Link to be passed to getDeepLinkInfo.
final class InternalLinkTypeUnknownDeepLink extends InternalLinkType {
  /// **InternalLinkTypeUnknownDeepLink** *(internalLinkTypeUnknownDeepLink)* - child of InternalLinkType
  ///
  /// The link is an unknown tg: link. Call getDeepLinkInfo to process the link.
  ///
  /// * [link]: Link to be passed to getDeepLinkInfo.
  const InternalLinkTypeUnknownDeepLink({
    required this.link,
    this.extra,
    this.clientId,
  });

  /// Link to be passed to getDeepLinkInfo
  final String link;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeUnknownDeepLink.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeUnknownDeepLink(
        link: json['link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "link": link,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: Link to be passed to getDeepLinkInfo
  @override
  InternalLinkTypeUnknownDeepLink copyWith({
    String? link,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeUnknownDeepLink(
        link: link ?? this.link,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeUnknownDeepLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeUpgradedGift** *(internalLinkTypeUpgradedGift)* - child of InternalLinkType
///
/// The link is a link to an upgraded gift. Call getUpgradedGift with the given name to process the link.
///
/// * [name]: Name of the unique gift.
final class InternalLinkTypeUpgradedGift extends InternalLinkType {
  /// **InternalLinkTypeUpgradedGift** *(internalLinkTypeUpgradedGift)* - child of InternalLinkType
  ///
  /// The link is a link to an upgraded gift. Call getUpgradedGift with the given name to process the link.
  ///
  /// * [name]: Name of the unique gift.
  const InternalLinkTypeUpgradedGift({
    required this.name,
    this.extra,
    this.clientId,
  });

  /// Name of the unique gift
  final String name;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeUpgradedGift.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeUpgradedGift(
        name: json['name'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Name of the unique gift
  @override
  InternalLinkTypeUpgradedGift copyWith({
    String? name,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeUpgradedGift(
        name: name ?? this.name,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeUserPhoneNumber** *(internalLinkTypeUserPhoneNumber)* - child of InternalLinkType
///
/// The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link.. If the user is found, then call createPrivateChat and open user's profile information screen or the chat itself. If draft text isn't empty, then put the draft text in the input field.
///
/// * [phoneNumber]: Phone number of the user.
/// * [draftText]: Draft text for message to send in the chat.
/// * [openProfile]: True, if user's profile information screen must be opened; otherwise, the chat itself must be opened.
/// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token.
final class InternalLinkTypeUserPhoneNumber extends InternalLinkType {
  /// **InternalLinkTypeUserPhoneNumber** *(internalLinkTypeUserPhoneNumber)* - child of InternalLinkType
  ///
  /// The link is a link to a user by its phone number. Call searchUserByPhoneNumber with the given phone number to process the link.. If the user is found, then call createPrivateChat and open user's profile information screen or the chat itself. If draft text isn't empty, then put the draft text in the input field.
  ///
  /// * [phoneNumber]: Phone number of the user.
  /// * [draftText]: Draft text for message to send in the chat.
  /// * [openProfile]: True, if user's profile information screen must be opened; otherwise, the chat itself must be opened.
  /// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token.
  const InternalLinkTypeUserPhoneNumber({
    required this.phoneNumber,
    required this.draftText,
    required this.openProfile,
    required this.unpaidMessagesToken,
    this.extra,
    this.clientId,
  });

  /// Phone number of the user
  final String phoneNumber;

  /// Draft text for message to send in the chat
  final String draftText;

  /// True, if user's profile information screen must be opened; otherwise, the chat itself must be opened
  final bool openProfile;

  /// Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token
  final String unpaidMessagesToken;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeUserPhoneNumber.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeUserPhoneNumber(
        phoneNumber: json['phone_number'],
        draftText: json['draft_text'],
        openProfile: json['open_profile'],
        unpaidMessagesToken: json['unpaid_messages_token'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "phone_number": phoneNumber,
      "draft_text": draftText,
      "open_profile": openProfile,
      "unpaid_messages_token": unpaidMessagesToken,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [phone_number]: Phone number of the user
  /// * [draft_text]: Draft text for message to send in the chat
  /// * [open_profile]: True, if user's profile information screen must be opened; otherwise, the chat itself must be opened
  /// * [unpaid_messages_token]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token
  @override
  InternalLinkTypeUserPhoneNumber copyWith({
    String? phoneNumber,
    String? draftText,
    bool? openProfile,
    String? unpaidMessagesToken,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeUserPhoneNumber(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        draftText: draftText ?? this.draftText,
        openProfile: openProfile ?? this.openProfile,
        unpaidMessagesToken: unpaidMessagesToken ?? this.unpaidMessagesToken,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeUserPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeUserToken** *(internalLinkTypeUserToken)* - child of InternalLinkType
///
/// The link is a link to a user by a temporary token. Call searchUserByToken with the given token to process the link.. If the user is found, then call createPrivateChat and open the chat.
///
/// * [token]: The token.
/// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token.
final class InternalLinkTypeUserToken extends InternalLinkType {
  /// **InternalLinkTypeUserToken** *(internalLinkTypeUserToken)* - child of InternalLinkType
  ///
  /// The link is a link to a user by a temporary token. Call searchUserByToken with the given token to process the link.. If the user is found, then call createPrivateChat and open the chat.
  ///
  /// * [token]: The token.
  /// * [unpaidMessagesToken]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token.
  const InternalLinkTypeUserToken({
    required this.token,
    required this.unpaidMessagesToken,
    this.extra,
    this.clientId,
  });

  /// The token
  final String token;

  /// Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token
  final String unpaidMessagesToken;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeUserToken.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeUserToken(
        token: json['token'],
        unpaidMessagesToken: json['unpaid_messages_token'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "token": token,
      "unpaid_messages_token": unpaidMessagesToken,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The token
  /// * [unpaid_messages_token]: Token, which allows the current user to send unpaid messages to the user; may be empty if none.. If the token isn't empty and the user is found, then call applyUnpaidMessagesToken with the user and the token
  @override
  InternalLinkTypeUserToken copyWith({
    String? token,
    String? unpaidMessagesToken,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeUserToken(
        token: token ?? this.token,
        unpaidMessagesToken: unpaidMessagesToken ?? this.unpaidMessagesToken,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeUserToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeVideoChat** *(internalLinkTypeVideoChat)* - child of InternalLinkType
///
/// The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinVideoChat with the given invite hash to process the link.
///
/// * [chatUsername]: Username of the chat with the video chat.
/// * [inviteHash]: If non-empty, invite hash to be used to join the video chat without being muted by administrators.
/// * [isLiveStream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group.
final class InternalLinkTypeVideoChat extends InternalLinkType {
  /// **InternalLinkTypeVideoChat** *(internalLinkTypeVideoChat)* - child of InternalLinkType
  ///
  /// The link is a link to a video chat. Call searchPublicChat with the given chat username, and then joinVideoChat with the given invite hash to process the link.
  ///
  /// * [chatUsername]: Username of the chat with the video chat.
  /// * [inviteHash]: If non-empty, invite hash to be used to join the video chat without being muted by administrators.
  /// * [isLiveStream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group.
  const InternalLinkTypeVideoChat({
    required this.chatUsername,
    required this.inviteHash,
    required this.isLiveStream,
    this.extra,
    this.clientId,
  });

  /// Username of the chat with the video chat
  final String chatUsername;

  /// If non-empty, invite hash to be used to join the video chat without being muted by administrators
  final String inviteHash;

  /// True, if the video chat is expected to be a live stream in a channel or a broadcast group
  final bool isLiveStream;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeVideoChat.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeVideoChat(
        chatUsername: json['chat_username'],
        inviteHash: json['invite_hash'],
        isLiveStream: json['is_live_stream'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_username": chatUsername,
      "invite_hash": inviteHash,
      "is_live_stream": isLiveStream,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_username]: Username of the chat with the video chat
  /// * [invite_hash]: If non-empty, invite hash to be used to join the video chat without being muted by administrators
  /// * [is_live_stream]: True, if the video chat is expected to be a live stream in a channel or a broadcast group
  @override
  InternalLinkTypeVideoChat copyWith({
    String? chatUsername,
    String? inviteHash,
    bool? isLiveStream,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeVideoChat(
        chatUsername: chatUsername ?? this.chatUsername,
        inviteHash: inviteHash ?? this.inviteHash,
        isLiveStream: isLiveStream ?? this.isLiveStream,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeVideoChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InternalLinkTypeWebApp** *(internalLinkTypeWebApp)* - child of InternalLinkType
///
/// The link is a link to a Web App. Call searchPublicChat with the given bot username, check that the user is a bot. If the bot is restricted for the current user, then show an error message.. Otherwise, call searchWebApp with the received bot and the given web_app_short_name. Process received foundWebApp by showing a confirmation dialog if needed.. If the bot can be added to attachment or side menu, but isn't added yet, then show a disclaimer about Mini Apps being third-party applications instead of the dialog. and ask the user to accept their Terms of service. If the user accepts the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot.. Then, call getWebAppLinkUrl and open the returned URL as a Web App.
///
/// * [botUsername]: Username of the bot that owns the Web App.
/// * [webAppShortName]: Short name of the Web App.
/// * [startParameter]: Start parameter to be passed to getWebAppLinkUrl.
/// * [mode]: The mode in which the Web App must be opened.
final class InternalLinkTypeWebApp extends InternalLinkType {
  /// **InternalLinkTypeWebApp** *(internalLinkTypeWebApp)* - child of InternalLinkType
  ///
  /// The link is a link to a Web App. Call searchPublicChat with the given bot username, check that the user is a bot. If the bot is restricted for the current user, then show an error message.. Otherwise, call searchWebApp with the received bot and the given web_app_short_name. Process received foundWebApp by showing a confirmation dialog if needed.. If the bot can be added to attachment or side menu, but isn't added yet, then show a disclaimer about Mini Apps being third-party applications instead of the dialog. and ask the user to accept their Terms of service. If the user accepts the terms and confirms adding, then use toggleBotIsAddedToAttachmentMenu to add the bot.. Then, call getWebAppLinkUrl and open the returned URL as a Web App.
  ///
  /// * [botUsername]: Username of the bot that owns the Web App.
  /// * [webAppShortName]: Short name of the Web App.
  /// * [startParameter]: Start parameter to be passed to getWebAppLinkUrl.
  /// * [mode]: The mode in which the Web App must be opened.
  const InternalLinkTypeWebApp({
    required this.botUsername,
    required this.webAppShortName,
    required this.startParameter,
    required this.mode,
    this.extra,
    this.clientId,
  });

  /// Username of the bot that owns the Web App
  final String botUsername;

  /// Short name of the Web App
  final String webAppShortName;

  /// Start parameter to be passed to getWebAppLinkUrl
  final String startParameter;

  /// The mode in which the Web App must be opened
  final WebAppOpenMode mode;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InternalLinkTypeWebApp.fromJson(Map<String, dynamic> json) =>
      InternalLinkTypeWebApp(
        botUsername: json['bot_username'],
        webAppShortName: json['web_app_short_name'],
        startParameter: json['start_parameter'],
        mode: WebAppOpenMode.fromJson(json['mode']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_username": botUsername,
      "web_app_short_name": webAppShortName,
      "start_parameter": startParameter,
      "mode": mode.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_username]: Username of the bot that owns the Web App
  /// * [web_app_short_name]: Short name of the Web App
  /// * [start_parameter]: Start parameter to be passed to getWebAppLinkUrl
  /// * [mode]: The mode in which the Web App must be opened
  @override
  InternalLinkTypeWebApp copyWith({
    String? botUsername,
    String? webAppShortName,
    String? startParameter,
    WebAppOpenMode? mode,
    dynamic extra,
    int? clientId,
  }) =>
      InternalLinkTypeWebApp(
        botUsername: botUsername ?? this.botUsername,
        webAppShortName: webAppShortName ?? this.webAppShortName,
        startParameter: startParameter ?? this.startParameter,
        mode: mode ?? this.mode,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'internalLinkTypeWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
