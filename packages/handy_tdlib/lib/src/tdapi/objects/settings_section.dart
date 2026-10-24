part of '../tdapi.dart';

/// **SettingsSection** *(settingsSection)* - parent
///
/// Describes a section of the application settings.
sealed class SettingsSection extends TdObject {
  /// **SettingsSection** *(settingsSection)* - parent
  ///
  /// Describes a section of the application settings.
  const SettingsSection();

  /// a SettingsSection return type can be :
  /// * [SettingsSectionAppearance]
  /// * [SettingsSectionAskQuestion]
  /// * [SettingsSectionBusiness]
  /// * [SettingsSectionChatFolders]
  /// * [SettingsSectionDataAndStorage]
  /// * [SettingsSectionDevices]
  /// * [SettingsSectionEditProfile]
  /// * [SettingsSectionFaq]
  /// * [SettingsSectionFeatures]
  /// * [SettingsSectionInAppBrowser]
  /// * [SettingsSectionLanguage]
  /// * [SettingsSectionMyStars]
  /// * [SettingsSectionMyGrams]
  /// * [SettingsSectionNotifications]
  /// * [SettingsSectionPowerSaving]
  /// * [SettingsSectionPremium]
  /// * [SettingsSectionPrivacyAndSecurity]
  /// * [SettingsSectionPrivacyPolicy]
  /// * [SettingsSectionQrCode]
  /// * [SettingsSectionSearch]
  /// * [SettingsSectionSendGift]
  factory SettingsSection.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SettingsSectionAppearance.defaultObjectId:
        return SettingsSectionAppearance.fromJson(json);
      case SettingsSectionAskQuestion.defaultObjectId:
        return SettingsSectionAskQuestion.fromJson(json);
      case SettingsSectionBusiness.defaultObjectId:
        return SettingsSectionBusiness.fromJson(json);
      case SettingsSectionChatFolders.defaultObjectId:
        return SettingsSectionChatFolders.fromJson(json);
      case SettingsSectionDataAndStorage.defaultObjectId:
        return SettingsSectionDataAndStorage.fromJson(json);
      case SettingsSectionDevices.defaultObjectId:
        return SettingsSectionDevices.fromJson(json);
      case SettingsSectionEditProfile.defaultObjectId:
        return SettingsSectionEditProfile.fromJson(json);
      case SettingsSectionFaq.defaultObjectId:
        return SettingsSectionFaq.fromJson(json);
      case SettingsSectionFeatures.defaultObjectId:
        return SettingsSectionFeatures.fromJson(json);
      case SettingsSectionInAppBrowser.defaultObjectId:
        return SettingsSectionInAppBrowser.fromJson(json);
      case SettingsSectionLanguage.defaultObjectId:
        return SettingsSectionLanguage.fromJson(json);
      case SettingsSectionMyStars.defaultObjectId:
        return SettingsSectionMyStars.fromJson(json);
      case SettingsSectionMyGrams.defaultObjectId:
        return SettingsSectionMyGrams.fromJson(json);
      case SettingsSectionNotifications.defaultObjectId:
        return SettingsSectionNotifications.fromJson(json);
      case SettingsSectionPowerSaving.defaultObjectId:
        return SettingsSectionPowerSaving.fromJson(json);
      case SettingsSectionPremium.defaultObjectId:
        return SettingsSectionPremium.fromJson(json);
      case SettingsSectionPrivacyAndSecurity.defaultObjectId:
        return SettingsSectionPrivacyAndSecurity.fromJson(json);
      case SettingsSectionPrivacyPolicy.defaultObjectId:
        return SettingsSectionPrivacyPolicy.fromJson(json);
      case SettingsSectionQrCode.defaultObjectId:
        return SettingsSectionQrCode.fromJson(json);
      case SettingsSectionSearch.defaultObjectId:
        return SettingsSectionSearch.fromJson(json);
      case SettingsSectionSendGift.defaultObjectId:
        return SettingsSectionSendGift.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SettingsSection)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SettingsSection copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionAppearance** *(settingsSectionAppearance)* - child of SettingsSection
///
/// The appearance section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "themes", "themes/edit", "themes/create", "wallpapers", "wallpapers/edit", "wallpapers/set",. "wallpapers/choose-photo", "your-color/profile", "your-color/profile/add-icons", "your-color/profile/use-gift",. "your-color/profile/reset", "your-color/name", "your-color/name/add-icons", "your-color/name/use-gift",. "night-mode", "auto-night-mode", "text-size", "text-size/use-system", "message-corners", "animations",. "stickers-and-emoji", "stickers-and-emoji/edit", "stickers-and-emoji/trending", "stickers-and-emoji/archived",. "stickers-and-emoji/archived/edit", "stickers-and-emoji/emoji", "stickers-and-emoji/emoji/edit",. "stickers-and-emoji/emoji/archived", "stickers-and-emoji/emoji/archived/edit", "stickers-and-emoji/emoji/suggest",. "stickers-and-emoji/emoji/quick-reaction", "stickers-and-emoji/emoji/quick-reaction/choose",. "stickers-and-emoji/suggest-by-emoji", "stickers-and-emoji/large-emoji", "stickers-and-emoji/dynamic-order",. "stickers-and-emoji/emoji/show-more", "app-icon", "tap-for-next-media".
final class SettingsSectionAppearance extends SettingsSection {
  /// **SettingsSectionAppearance** *(settingsSectionAppearance)* - child of SettingsSection
  ///
  /// The appearance section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "themes", "themes/edit", "themes/create", "wallpapers", "wallpapers/edit", "wallpapers/set",. "wallpapers/choose-photo", "your-color/profile", "your-color/profile/add-icons", "your-color/profile/use-gift",. "your-color/profile/reset", "your-color/name", "your-color/name/add-icons", "your-color/name/use-gift",. "night-mode", "auto-night-mode", "text-size", "text-size/use-system", "message-corners", "animations",. "stickers-and-emoji", "stickers-and-emoji/edit", "stickers-and-emoji/trending", "stickers-and-emoji/archived",. "stickers-and-emoji/archived/edit", "stickers-and-emoji/emoji", "stickers-and-emoji/emoji/edit",. "stickers-and-emoji/emoji/archived", "stickers-and-emoji/emoji/archived/edit", "stickers-and-emoji/emoji/suggest",. "stickers-and-emoji/emoji/quick-reaction", "stickers-and-emoji/emoji/quick-reaction/choose",. "stickers-and-emoji/suggest-by-emoji", "stickers-and-emoji/large-emoji", "stickers-and-emoji/dynamic-order",. "stickers-and-emoji/emoji/show-more", "app-icon", "tap-for-next-media".
  const SettingsSectionAppearance({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "themes", "themes/edit", "themes/create", "wallpapers", "wallpapers/edit", "wallpapers/set",. "wallpapers/choose-photo", "your-color/profile", "your-color/profile/add-icons", "your-color/profile/use-gift",. "your-color/profile/reset", "your-color/name", "your-color/name/add-icons", "your-color/name/use-gift",. "night-mode", "auto-night-mode", "text-size", "text-size/use-system", "message-corners", "animations",. "stickers-and-emoji", "stickers-and-emoji/edit", "stickers-and-emoji/trending", "stickers-and-emoji/archived",. "stickers-and-emoji/archived/edit", "stickers-and-emoji/emoji", "stickers-and-emoji/emoji/edit",. "stickers-and-emoji/emoji/archived", "stickers-and-emoji/emoji/archived/edit", "stickers-and-emoji/emoji/suggest",. "stickers-and-emoji/emoji/quick-reaction", "stickers-and-emoji/emoji/quick-reaction/choose",. "stickers-and-emoji/suggest-by-emoji", "stickers-and-emoji/large-emoji", "stickers-and-emoji/dynamic-order",. "stickers-and-emoji/emoji/show-more", "app-icon", "tap-for-next-media"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionAppearance.fromJson(Map<String, dynamic> json) =>
      SettingsSectionAppearance(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "themes", "themes/edit", "themes/create", "wallpapers", "wallpapers/edit", "wallpapers/set",. "wallpapers/choose-photo", "your-color/profile", "your-color/profile/add-icons", "your-color/profile/use-gift",. "your-color/profile/reset", "your-color/name", "your-color/name/add-icons", "your-color/name/use-gift",. "night-mode", "auto-night-mode", "text-size", "text-size/use-system", "message-corners", "animations",. "stickers-and-emoji", "stickers-and-emoji/edit", "stickers-and-emoji/trending", "stickers-and-emoji/archived",. "stickers-and-emoji/archived/edit", "stickers-and-emoji/emoji", "stickers-and-emoji/emoji/edit",. "stickers-and-emoji/emoji/archived", "stickers-and-emoji/emoji/archived/edit", "stickers-and-emoji/emoji/suggest",. "stickers-and-emoji/emoji/quick-reaction", "stickers-and-emoji/emoji/quick-reaction/choose",. "stickers-and-emoji/suggest-by-emoji", "stickers-and-emoji/large-emoji", "stickers-and-emoji/dynamic-order",. "stickers-and-emoji/emoji/show-more", "app-icon", "tap-for-next-media"
  @override
  SettingsSectionAppearance copyWith({
    String? subsection,
  }) =>
      SettingsSectionAppearance(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionAppearance';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionAskQuestion** *(settingsSectionAskQuestion)* - child of SettingsSection
///
/// The "Ask a question" section.
final class SettingsSectionAskQuestion extends SettingsSection {
  /// **SettingsSectionAskQuestion** *(settingsSectionAskQuestion)* - child of SettingsSection
  ///
  /// The "Ask a question" section.
  const SettingsSectionAskQuestion();

  /// Parse from a json
  factory SettingsSectionAskQuestion.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionAskQuestion();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionAskQuestion copyWith() => const SettingsSectionAskQuestion();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionAskQuestion';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionBusiness** *(settingsSectionBusiness)* - child of SettingsSection
///
/// The "Telegram Business" section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "do-not-hide-ads".
final class SettingsSectionBusiness extends SettingsSection {
  /// **SettingsSectionBusiness** *(settingsSectionBusiness)* - child of SettingsSection
  ///
  /// The "Telegram Business" section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "do-not-hide-ads".
  const SettingsSectionBusiness({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "do-not-hide-ads"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionBusiness.fromJson(Map<String, dynamic> json) =>
      SettingsSectionBusiness(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "do-not-hide-ads"
  @override
  SettingsSectionBusiness copyWith({
    String? subsection,
  }) =>
      SettingsSectionBusiness(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionBusiness';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionChatFolders** *(settingsSectionChatFolders)* - child of SettingsSection
///
/// The chat folder settings section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "edit", "create", "add-recommended", "show-tags", "tab-view".
final class SettingsSectionChatFolders extends SettingsSection {
  /// **SettingsSectionChatFolders** *(settingsSectionChatFolders)* - child of SettingsSection
  ///
  /// The chat folder settings section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "edit", "create", "add-recommended", "show-tags", "tab-view".
  const SettingsSectionChatFolders({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "edit", "create", "add-recommended", "show-tags", "tab-view"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionChatFolders.fromJson(Map<String, dynamic> json) =>
      SettingsSectionChatFolders(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "edit", "create", "add-recommended", "show-tags", "tab-view"
  @override
  SettingsSectionChatFolders copyWith({
    String? subsection,
  }) =>
      SettingsSectionChatFolders(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionChatFolders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionDataAndStorage** *(settingsSectionDataAndStorage)* - child of SettingsSection
///
/// The data and storage settings section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "storage", "storage/edit", "storage/auto-remove", "storage/clear-cache", "storage/max-cache", "usage",. "usage/mobile", "usage/wifi", "usage/reset", "usage/roaming", "auto-download/mobile",. "auto-download/mobile/enable", "auto-download/mobile/usage", "auto-download/mobile/photos",. "auto-download/mobile/stories", "auto-download/mobile/videos", "auto-download/mobile/files", "auto-download/wifi",. "auto-download/wifi/enable", "auto-download/wifi/usage", "auto-download/wifi/photos",. "auto-download/wifi/stories", "auto-download/wifi/videos", "auto-download/wifi/files", "auto-download/roaming",. "auto-download/roaming/enable", "auto-download/roaming/usage", "auto-download/roaming/photos",. "auto-download/roaming/stories", "auto-download/roaming/videos", "auto-download/roaming/files",. "auto-download/reset", "save-to-photos/chats", "save-to-photos/chats/max-video-size",. "save-to-photos/chats/add-exception", "save-to-photos/chats/delete-all", "save-to-photos/groups",. "save-to-photos/groups/max-video-size", "save-to-photos/groups/add-exception", "save-to-photos/groups/delete-all",. "save-to-photos/channels", "save-to-photos/channels/max-video-size", "save-to-photos/channels/add-exception",. "save-to-photos/channels/delete-all", "less-data-calls", "open-links", "share-sheet",. "share-sheet/suggested-chats", "share-sheet/suggest-by", "share-sheet/reset", "saved-edited-photos",. "pause-music", "raise-to-listen", "raise-to-speak", "show-18-content", "proxy", "proxy/edit", "proxy/use-proxy",. "proxy/add-proxy", "proxy/share-list", "proxy/use-for-calls".
final class SettingsSectionDataAndStorage extends SettingsSection {
  /// **SettingsSectionDataAndStorage** *(settingsSectionDataAndStorage)* - child of SettingsSection
  ///
  /// The data and storage settings section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "storage", "storage/edit", "storage/auto-remove", "storage/clear-cache", "storage/max-cache", "usage",. "usage/mobile", "usage/wifi", "usage/reset", "usage/roaming", "auto-download/mobile",. "auto-download/mobile/enable", "auto-download/mobile/usage", "auto-download/mobile/photos",. "auto-download/mobile/stories", "auto-download/mobile/videos", "auto-download/mobile/files", "auto-download/wifi",. "auto-download/wifi/enable", "auto-download/wifi/usage", "auto-download/wifi/photos",. "auto-download/wifi/stories", "auto-download/wifi/videos", "auto-download/wifi/files", "auto-download/roaming",. "auto-download/roaming/enable", "auto-download/roaming/usage", "auto-download/roaming/photos",. "auto-download/roaming/stories", "auto-download/roaming/videos", "auto-download/roaming/files",. "auto-download/reset", "save-to-photos/chats", "save-to-photos/chats/max-video-size",. "save-to-photos/chats/add-exception", "save-to-photos/chats/delete-all", "save-to-photos/groups",. "save-to-photos/groups/max-video-size", "save-to-photos/groups/add-exception", "save-to-photos/groups/delete-all",. "save-to-photos/channels", "save-to-photos/channels/max-video-size", "save-to-photos/channels/add-exception",. "save-to-photos/channels/delete-all", "less-data-calls", "open-links", "share-sheet",. "share-sheet/suggested-chats", "share-sheet/suggest-by", "share-sheet/reset", "saved-edited-photos",. "pause-music", "raise-to-listen", "raise-to-speak", "show-18-content", "proxy", "proxy/edit", "proxy/use-proxy",. "proxy/add-proxy", "proxy/share-list", "proxy/use-for-calls".
  const SettingsSectionDataAndStorage({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "storage", "storage/edit", "storage/auto-remove", "storage/clear-cache", "storage/max-cache", "usage",. "usage/mobile", "usage/wifi", "usage/reset", "usage/roaming", "auto-download/mobile",. "auto-download/mobile/enable", "auto-download/mobile/usage", "auto-download/mobile/photos",. "auto-download/mobile/stories", "auto-download/mobile/videos", "auto-download/mobile/files", "auto-download/wifi",. "auto-download/wifi/enable", "auto-download/wifi/usage", "auto-download/wifi/photos",. "auto-download/wifi/stories", "auto-download/wifi/videos", "auto-download/wifi/files", "auto-download/roaming",. "auto-download/roaming/enable", "auto-download/roaming/usage", "auto-download/roaming/photos",. "auto-download/roaming/stories", "auto-download/roaming/videos", "auto-download/roaming/files",. "auto-download/reset", "save-to-photos/chats", "save-to-photos/chats/max-video-size",. "save-to-photos/chats/add-exception", "save-to-photos/chats/delete-all", "save-to-photos/groups",. "save-to-photos/groups/max-video-size", "save-to-photos/groups/add-exception", "save-to-photos/groups/delete-all",. "save-to-photos/channels", "save-to-photos/channels/max-video-size", "save-to-photos/channels/add-exception",. "save-to-photos/channels/delete-all", "less-data-calls", "open-links", "share-sheet",. "share-sheet/suggested-chats", "share-sheet/suggest-by", "share-sheet/reset", "saved-edited-photos",. "pause-music", "raise-to-listen", "raise-to-speak", "show-18-content", "proxy", "proxy/edit", "proxy/use-proxy",. "proxy/add-proxy", "proxy/share-list", "proxy/use-for-calls"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionDataAndStorage.fromJson(Map<String, dynamic> json) =>
      SettingsSectionDataAndStorage(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "storage", "storage/edit", "storage/auto-remove", "storage/clear-cache", "storage/max-cache", "usage",. "usage/mobile", "usage/wifi", "usage/reset", "usage/roaming", "auto-download/mobile",. "auto-download/mobile/enable", "auto-download/mobile/usage", "auto-download/mobile/photos",. "auto-download/mobile/stories", "auto-download/mobile/videos", "auto-download/mobile/files", "auto-download/wifi",. "auto-download/wifi/enable", "auto-download/wifi/usage", "auto-download/wifi/photos",. "auto-download/wifi/stories", "auto-download/wifi/videos", "auto-download/wifi/files", "auto-download/roaming",. "auto-download/roaming/enable", "auto-download/roaming/usage", "auto-download/roaming/photos",. "auto-download/roaming/stories", "auto-download/roaming/videos", "auto-download/roaming/files",. "auto-download/reset", "save-to-photos/chats", "save-to-photos/chats/max-video-size",. "save-to-photos/chats/add-exception", "save-to-photos/chats/delete-all", "save-to-photos/groups",. "save-to-photos/groups/max-video-size", "save-to-photos/groups/add-exception", "save-to-photos/groups/delete-all",. "save-to-photos/channels", "save-to-photos/channels/max-video-size", "save-to-photos/channels/add-exception",. "save-to-photos/channels/delete-all", "less-data-calls", "open-links", "share-sheet",. "share-sheet/suggested-chats", "share-sheet/suggest-by", "share-sheet/reset", "saved-edited-photos",. "pause-music", "raise-to-listen", "raise-to-speak", "show-18-content", "proxy", "proxy/edit", "proxy/use-proxy",. "proxy/add-proxy", "proxy/share-list", "proxy/use-for-calls"
  @override
  SettingsSectionDataAndStorage copyWith({
    String? subsection,
  }) =>
      SettingsSectionDataAndStorage(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionDataAndStorage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionDevices** *(settingsSectionDevices)* - child of SettingsSection
///
/// The Devices section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "edit", "link-desktop", "terminate-sessions", "auto-terminate".
final class SettingsSectionDevices extends SettingsSection {
  /// **SettingsSectionDevices** *(settingsSectionDevices)* - child of SettingsSection
  ///
  /// The Devices section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "edit", "link-desktop", "terminate-sessions", "auto-terminate".
  const SettingsSectionDevices({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "edit", "link-desktop", "terminate-sessions", "auto-terminate"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionDevices.fromJson(Map<String, dynamic> json) =>
      SettingsSectionDevices(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "edit", "link-desktop", "terminate-sessions", "auto-terminate"
  @override
  SettingsSectionDevices copyWith({
    String? subsection,
  }) =>
      SettingsSectionDevices(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionDevices';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionEditProfile** *(settingsSectionEditProfile)* - child of SettingsSection
///
/// The profile edit section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "set-photo", "first-name", "last-name", "emoji-status", "bio", "birthday", "change-number", "username",. "your-color", "channel", "add-account", "log-out", "profile-color/profile", "profile-color/profile/add-icons",. "profile-color/profile/use-gift", "profile-color/name", "profile-color/name/add-icons",. "profile-color/name/use-gift", "profile-photo/use-emoji".
final class SettingsSectionEditProfile extends SettingsSection {
  /// **SettingsSectionEditProfile** *(settingsSectionEditProfile)* - child of SettingsSection
  ///
  /// The profile edit section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "set-photo", "first-name", "last-name", "emoji-status", "bio", "birthday", "change-number", "username",. "your-color", "channel", "add-account", "log-out", "profile-color/profile", "profile-color/profile/add-icons",. "profile-color/profile/use-gift", "profile-color/name", "profile-color/name/add-icons",. "profile-color/name/use-gift", "profile-photo/use-emoji".
  const SettingsSectionEditProfile({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "set-photo", "first-name", "last-name", "emoji-status", "bio", "birthday", "change-number", "username",. "your-color", "channel", "add-account", "log-out", "profile-color/profile", "profile-color/profile/add-icons",. "profile-color/profile/use-gift", "profile-color/name", "profile-color/name/add-icons",. "profile-color/name/use-gift", "profile-photo/use-emoji"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionEditProfile.fromJson(Map<String, dynamic> json) =>
      SettingsSectionEditProfile(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "set-photo", "first-name", "last-name", "emoji-status", "bio", "birthday", "change-number", "username",. "your-color", "channel", "add-account", "log-out", "profile-color/profile", "profile-color/profile/add-icons",. "profile-color/profile/use-gift", "profile-color/name", "profile-color/name/add-icons",. "profile-color/name/use-gift", "profile-photo/use-emoji"
  @override
  SettingsSectionEditProfile copyWith({
    String? subsection,
  }) =>
      SettingsSectionEditProfile(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionEditProfile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionFaq** *(settingsSectionFaq)* - child of SettingsSection
///
/// The FAQ section.
final class SettingsSectionFaq extends SettingsSection {
  /// **SettingsSectionFaq** *(settingsSectionFaq)* - child of SettingsSection
  ///
  /// The FAQ section.
  const SettingsSectionFaq();

  /// Parse from a json
  factory SettingsSectionFaq.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionFaq();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionFaq copyWith() => const SettingsSectionFaq();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionFaq';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionFeatures** *(settingsSectionFeatures)* - child of SettingsSection
///
/// The "Telegram Features" section.
final class SettingsSectionFeatures extends SettingsSection {
  /// **SettingsSectionFeatures** *(settingsSectionFeatures)* - child of SettingsSection
  ///
  /// The "Telegram Features" section.
  const SettingsSectionFeatures();

  /// Parse from a json
  factory SettingsSectionFeatures.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionFeatures();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionFeatures copyWith() => const SettingsSectionFeatures();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionFeatures';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionInAppBrowser** *(settingsSectionInAppBrowser)* - child of SettingsSection
///
/// The in-app browser settings section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "enable-browser", "clear-cookies", "clear-cache", "history", "clear-history", "never-open", "clear-list", "search".
final class SettingsSectionInAppBrowser extends SettingsSection {
  /// **SettingsSectionInAppBrowser** *(settingsSectionInAppBrowser)* - child of SettingsSection
  ///
  /// The in-app browser settings section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "enable-browser", "clear-cookies", "clear-cache", "history", "clear-history", "never-open", "clear-list", "search".
  const SettingsSectionInAppBrowser({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "enable-browser", "clear-cookies", "clear-cache", "history", "clear-history", "never-open", "clear-list", "search"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionInAppBrowser.fromJson(Map<String, dynamic> json) =>
      SettingsSectionInAppBrowser(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "enable-browser", "clear-cookies", "clear-cache", "history", "clear-history", "never-open", "clear-list", "search"
  @override
  SettingsSectionInAppBrowser copyWith({
    String? subsection,
  }) =>
      SettingsSectionInAppBrowser(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionInAppBrowser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionLanguage** *(settingsSectionLanguage)* - child of SettingsSection
///
/// The application language section.
///
/// * [subsection]: Subsection of the section; may be one of "", "show-button" for Show Translate Button toggle,. "translate-chats" for Translate Entire Chats toggle, "do-not-translate" - for Do Not Translate language list.
final class SettingsSectionLanguage extends SettingsSection {
  /// **SettingsSectionLanguage** *(settingsSectionLanguage)* - child of SettingsSection
  ///
  /// The application language section.
  ///
  /// * [subsection]: Subsection of the section; may be one of "", "show-button" for Show Translate Button toggle,. "translate-chats" for Translate Entire Chats toggle, "do-not-translate" - for Do Not Translate language list.
  const SettingsSectionLanguage({
    required this.subsection,
  });

  /// Subsection of the section; may be one of "", "show-button" for Show Translate Button toggle,. "translate-chats" for Translate Entire Chats toggle, "do-not-translate" - for Do Not Translate language list
  final String subsection;

  /// Parse from a json
  factory SettingsSectionLanguage.fromJson(Map<String, dynamic> json) =>
      SettingsSectionLanguage(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of "", "show-button" for Show Translate Button toggle,. "translate-chats" for Translate Entire Chats toggle, "do-not-translate" - for Do Not Translate language list
  @override
  SettingsSectionLanguage copyWith({
    String? subsection,
  }) =>
      SettingsSectionLanguage(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionLanguage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionMyStars** *(settingsSectionMyStars)* - child of SettingsSection
///
/// The Telegram Star balance and transaction section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "top-up", "stats", "gift", "earn".
final class SettingsSectionMyStars extends SettingsSection {
  /// **SettingsSectionMyStars** *(settingsSectionMyStars)* - child of SettingsSection
  ///
  /// The Telegram Star balance and transaction section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "top-up", "stats", "gift", "earn".
  const SettingsSectionMyStars({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "top-up", "stats", "gift", "earn"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionMyStars.fromJson(Map<String, dynamic> json) =>
      SettingsSectionMyStars(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "top-up", "stats", "gift", "earn"
  @override
  SettingsSectionMyStars copyWith({
    String? subsection,
  }) =>
      SettingsSectionMyStars(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionMyStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionMyGrams** *(settingsSectionMyGrams)* - child of SettingsSection
///
/// The TON Gram balance and transaction section.
final class SettingsSectionMyGrams extends SettingsSection {
  /// **SettingsSectionMyGrams** *(settingsSectionMyGrams)* - child of SettingsSection
  ///
  /// The TON Gram balance and transaction section.
  const SettingsSectionMyGrams();

  /// Parse from a json
  factory SettingsSectionMyGrams.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionMyGrams();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionMyGrams copyWith() => const SettingsSectionMyGrams();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionMyGrams';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionNotifications** *(settingsSectionNotifications)* - child of SettingsSection
///
/// The notification settings section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "accounts", "private-chats", "private-chats/edit", "private-chats/show", "private-chats/preview",. "private-chats/sound", "private-chats/add-exception", "private-chats/delete-exceptions",. "private-chats/light-color", "private-chats/vibrate", "private-chats/priority", "groups", "groups/edit",. "groups/show", "groups/preview", "groups/sound", "groups/add-exception", "groups/delete-exceptions",. "groups/light-color", "groups/vibrate", "groups/priority", "channels", "channels/edit", "channels/show",. "channels/preview", "channels/sound", "channels/add-exception", "channels/delete-exceptions",. "channels/light-color", "channels/vibrate", "channels/priority", "stories", "stories/new", "stories/important",. "stories/show-sender", "stories/sound", "stories/add-exception", "stories/delete-exceptions",. "stories/light-color", "stories/vibrate", "stories/priority", "reactions", "reactions/messages",. "reactions/stories", "reactions/show-sender", "reactions/sound", "reactions/light-color", "reactions/vibrate",. "reactions/priority", "in-app-sounds", "in-app-vibrate", "in-app-preview", "in-chat-sounds", "in-app-popup",. "lock-screen-names", "include-channels", "include-muted-chats", "count-unread-messages", "new-contacts",. "pinned-messages", "reset", "web".
final class SettingsSectionNotifications extends SettingsSection {
  /// **SettingsSectionNotifications** *(settingsSectionNotifications)* - child of SettingsSection
  ///
  /// The notification settings section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "accounts", "private-chats", "private-chats/edit", "private-chats/show", "private-chats/preview",. "private-chats/sound", "private-chats/add-exception", "private-chats/delete-exceptions",. "private-chats/light-color", "private-chats/vibrate", "private-chats/priority", "groups", "groups/edit",. "groups/show", "groups/preview", "groups/sound", "groups/add-exception", "groups/delete-exceptions",. "groups/light-color", "groups/vibrate", "groups/priority", "channels", "channels/edit", "channels/show",. "channels/preview", "channels/sound", "channels/add-exception", "channels/delete-exceptions",. "channels/light-color", "channels/vibrate", "channels/priority", "stories", "stories/new", "stories/important",. "stories/show-sender", "stories/sound", "stories/add-exception", "stories/delete-exceptions",. "stories/light-color", "stories/vibrate", "stories/priority", "reactions", "reactions/messages",. "reactions/stories", "reactions/show-sender", "reactions/sound", "reactions/light-color", "reactions/vibrate",. "reactions/priority", "in-app-sounds", "in-app-vibrate", "in-app-preview", "in-chat-sounds", "in-app-popup",. "lock-screen-names", "include-channels", "include-muted-chats", "count-unread-messages", "new-contacts",. "pinned-messages", "reset", "web".
  const SettingsSectionNotifications({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "accounts", "private-chats", "private-chats/edit", "private-chats/show", "private-chats/preview",. "private-chats/sound", "private-chats/add-exception", "private-chats/delete-exceptions",. "private-chats/light-color", "private-chats/vibrate", "private-chats/priority", "groups", "groups/edit",. "groups/show", "groups/preview", "groups/sound", "groups/add-exception", "groups/delete-exceptions",. "groups/light-color", "groups/vibrate", "groups/priority", "channels", "channels/edit", "channels/show",. "channels/preview", "channels/sound", "channels/add-exception", "channels/delete-exceptions",. "channels/light-color", "channels/vibrate", "channels/priority", "stories", "stories/new", "stories/important",. "stories/show-sender", "stories/sound", "stories/add-exception", "stories/delete-exceptions",. "stories/light-color", "stories/vibrate", "stories/priority", "reactions", "reactions/messages",. "reactions/stories", "reactions/show-sender", "reactions/sound", "reactions/light-color", "reactions/vibrate",. "reactions/priority", "in-app-sounds", "in-app-vibrate", "in-app-preview", "in-chat-sounds", "in-app-popup",. "lock-screen-names", "include-channels", "include-muted-chats", "count-unread-messages", "new-contacts",. "pinned-messages", "reset", "web"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionNotifications.fromJson(Map<String, dynamic> json) =>
      SettingsSectionNotifications(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "accounts", "private-chats", "private-chats/edit", "private-chats/show", "private-chats/preview",. "private-chats/sound", "private-chats/add-exception", "private-chats/delete-exceptions",. "private-chats/light-color", "private-chats/vibrate", "private-chats/priority", "groups", "groups/edit",. "groups/show", "groups/preview", "groups/sound", "groups/add-exception", "groups/delete-exceptions",. "groups/light-color", "groups/vibrate", "groups/priority", "channels", "channels/edit", "channels/show",. "channels/preview", "channels/sound", "channels/add-exception", "channels/delete-exceptions",. "channels/light-color", "channels/vibrate", "channels/priority", "stories", "stories/new", "stories/important",. "stories/show-sender", "stories/sound", "stories/add-exception", "stories/delete-exceptions",. "stories/light-color", "stories/vibrate", "stories/priority", "reactions", "reactions/messages",. "reactions/stories", "reactions/show-sender", "reactions/sound", "reactions/light-color", "reactions/vibrate",. "reactions/priority", "in-app-sounds", "in-app-vibrate", "in-app-preview", "in-chat-sounds", "in-app-popup",. "lock-screen-names", "include-channels", "include-muted-chats", "count-unread-messages", "new-contacts",. "pinned-messages", "reset", "web"
  @override
  SettingsSectionNotifications copyWith({
    String? subsection,
  }) =>
      SettingsSectionNotifications(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionNotifications';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionPowerSaving** *(settingsSectionPowerSaving)* - child of SettingsSection
///
/// The power saving settings section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "videos", "gifs", "stickers", "emoji", "effects", "preload", "background", "call-animations", "particles", "transitions".
final class SettingsSectionPowerSaving extends SettingsSection {
  /// **SettingsSectionPowerSaving** *(settingsSectionPowerSaving)* - child of SettingsSection
  ///
  /// The power saving settings section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "videos", "gifs", "stickers", "emoji", "effects", "preload", "background", "call-animations", "particles", "transitions".
  const SettingsSectionPowerSaving({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "videos", "gifs", "stickers", "emoji", "effects", "preload", "background", "call-animations", "particles", "transitions"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionPowerSaving.fromJson(Map<String, dynamic> json) =>
      SettingsSectionPowerSaving(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "videos", "gifs", "stickers", "emoji", "effects", "preload", "background", "call-animations", "particles", "transitions"
  @override
  SettingsSectionPowerSaving copyWith({
    String? subsection,
  }) =>
      SettingsSectionPowerSaving(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionPowerSaving';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionPremium** *(settingsSectionPremium)* - child of SettingsSection
///
/// The "Telegram Premium" section.
final class SettingsSectionPremium extends SettingsSection {
  /// **SettingsSectionPremium** *(settingsSectionPremium)* - child of SettingsSection
  ///
  /// The "Telegram Premium" section.
  const SettingsSectionPremium();

  /// Parse from a json
  factory SettingsSectionPremium.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionPremium();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionPremium copyWith() => const SettingsSectionPremium();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionPremium';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionPrivacyAndSecurity** *(settingsSectionPrivacyAndSecurity)* - child of SettingsSection
///
/// The privacy and security section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "blocked", "blocked/edit", "blocked/block-user", "blocked/block-user/chats", "blocked/block-user/contacts",. "active-websites", "active-websites/edit", "active-websites/disconnect-all", "passcode", "passcode/disable",. "passcode/change", "passcode/auto-lock", "passcode/face-id", "passcode/fingerprint", "2sv", "2sv/change",. "2sv/disable", "2sv/change-email", "passkey", "passkey/create", "auto-delete", "auto-delete/set-custom",. "login-email", "phone-number", "phone-number/never", "phone-number/always", "last-seen", "last-seen/never",. "last-seen/always", "last-seen/hide-read-time", "profile-photos", "profile-photos/never", "profile-photos/always",. "profile-photos/set-public", "profile-photos/update-public", "profile-photos/remove-public", "bio", "bio/never",. "bio/always", "gifts", "gifts/show-icon", "gifts/never", "gifts/always", "gifts/accepted-types", "birthday",. "birthday/add", "birthday/never", "birthday/always", "saved-music", "saved-music/never", "saved-music/always",. "forwards", "forwards/never", "forwards/always", "calls", "calls/never", "calls/always", "calls/p2p",. "calls/p2p/never", "calls/p2p/always", "calls/ios-integration", "voice", "voice/never", "voice/always",. "messages", "messages/set-price", "messages/exceptions", "invites", "invites/never", "invites/always",. "self-destruct", "data-settings", "data-settings/sync-contacts", "data-settings/delete-synced",. "data-settings/suggest-contacts", "data-settings/delete-cloud-drafts", "data-settings/clear-payment-info",. "data-settings/link-previews", "data-settings/bot-settings", "data-settings/map-provider", "archive-and-mute".
final class SettingsSectionPrivacyAndSecurity extends SettingsSection {
  /// **SettingsSectionPrivacyAndSecurity** *(settingsSectionPrivacyAndSecurity)* - child of SettingsSection
  ///
  /// The privacy and security section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "blocked", "blocked/edit", "blocked/block-user", "blocked/block-user/chats", "blocked/block-user/contacts",. "active-websites", "active-websites/edit", "active-websites/disconnect-all", "passcode", "passcode/disable",. "passcode/change", "passcode/auto-lock", "passcode/face-id", "passcode/fingerprint", "2sv", "2sv/change",. "2sv/disable", "2sv/change-email", "passkey", "passkey/create", "auto-delete", "auto-delete/set-custom",. "login-email", "phone-number", "phone-number/never", "phone-number/always", "last-seen", "last-seen/never",. "last-seen/always", "last-seen/hide-read-time", "profile-photos", "profile-photos/never", "profile-photos/always",. "profile-photos/set-public", "profile-photos/update-public", "profile-photos/remove-public", "bio", "bio/never",. "bio/always", "gifts", "gifts/show-icon", "gifts/never", "gifts/always", "gifts/accepted-types", "birthday",. "birthday/add", "birthday/never", "birthday/always", "saved-music", "saved-music/never", "saved-music/always",. "forwards", "forwards/never", "forwards/always", "calls", "calls/never", "calls/always", "calls/p2p",. "calls/p2p/never", "calls/p2p/always", "calls/ios-integration", "voice", "voice/never", "voice/always",. "messages", "messages/set-price", "messages/exceptions", "invites", "invites/never", "invites/always",. "self-destruct", "data-settings", "data-settings/sync-contacts", "data-settings/delete-synced",. "data-settings/suggest-contacts", "data-settings/delete-cloud-drafts", "data-settings/clear-payment-info",. "data-settings/link-previews", "data-settings/bot-settings", "data-settings/map-provider", "archive-and-mute".
  const SettingsSectionPrivacyAndSecurity({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "blocked", "blocked/edit", "blocked/block-user", "blocked/block-user/chats", "blocked/block-user/contacts",. "active-websites", "active-websites/edit", "active-websites/disconnect-all", "passcode", "passcode/disable",. "passcode/change", "passcode/auto-lock", "passcode/face-id", "passcode/fingerprint", "2sv", "2sv/change",. "2sv/disable", "2sv/change-email", "passkey", "passkey/create", "auto-delete", "auto-delete/set-custom",. "login-email", "phone-number", "phone-number/never", "phone-number/always", "last-seen", "last-seen/never",. "last-seen/always", "last-seen/hide-read-time", "profile-photos", "profile-photos/never", "profile-photos/always",. "profile-photos/set-public", "profile-photos/update-public", "profile-photos/remove-public", "bio", "bio/never",. "bio/always", "gifts", "gifts/show-icon", "gifts/never", "gifts/always", "gifts/accepted-types", "birthday",. "birthday/add", "birthday/never", "birthday/always", "saved-music", "saved-music/never", "saved-music/always",. "forwards", "forwards/never", "forwards/always", "calls", "calls/never", "calls/always", "calls/p2p",. "calls/p2p/never", "calls/p2p/always", "calls/ios-integration", "voice", "voice/never", "voice/always",. "messages", "messages/set-price", "messages/exceptions", "invites", "invites/never", "invites/always",. "self-destruct", "data-settings", "data-settings/sync-contacts", "data-settings/delete-synced",. "data-settings/suggest-contacts", "data-settings/delete-cloud-drafts", "data-settings/clear-payment-info",. "data-settings/link-previews", "data-settings/bot-settings", "data-settings/map-provider", "archive-and-mute"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionPrivacyAndSecurity.fromJson(
          Map<String, dynamic> json) =>
      SettingsSectionPrivacyAndSecurity(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "blocked", "blocked/edit", "blocked/block-user", "blocked/block-user/chats", "blocked/block-user/contacts",. "active-websites", "active-websites/edit", "active-websites/disconnect-all", "passcode", "passcode/disable",. "passcode/change", "passcode/auto-lock", "passcode/face-id", "passcode/fingerprint", "2sv", "2sv/change",. "2sv/disable", "2sv/change-email", "passkey", "passkey/create", "auto-delete", "auto-delete/set-custom",. "login-email", "phone-number", "phone-number/never", "phone-number/always", "last-seen", "last-seen/never",. "last-seen/always", "last-seen/hide-read-time", "profile-photos", "profile-photos/never", "profile-photos/always",. "profile-photos/set-public", "profile-photos/update-public", "profile-photos/remove-public", "bio", "bio/never",. "bio/always", "gifts", "gifts/show-icon", "gifts/never", "gifts/always", "gifts/accepted-types", "birthday",. "birthday/add", "birthday/never", "birthday/always", "saved-music", "saved-music/never", "saved-music/always",. "forwards", "forwards/never", "forwards/always", "calls", "calls/never", "calls/always", "calls/p2p",. "calls/p2p/never", "calls/p2p/always", "calls/ios-integration", "voice", "voice/never", "voice/always",. "messages", "messages/set-price", "messages/exceptions", "invites", "invites/never", "invites/always",. "self-destruct", "data-settings", "data-settings/sync-contacts", "data-settings/delete-synced",. "data-settings/suggest-contacts", "data-settings/delete-cloud-drafts", "data-settings/clear-payment-info",. "data-settings/link-previews", "data-settings/bot-settings", "data-settings/map-provider", "archive-and-mute"
  @override
  SettingsSectionPrivacyAndSecurity copyWith({
    String? subsection,
  }) =>
      SettingsSectionPrivacyAndSecurity(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionPrivacyAndSecurity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionPrivacyPolicy** *(settingsSectionPrivacyPolicy)* - child of SettingsSection
///
/// The "Privacy Policy" section.
final class SettingsSectionPrivacyPolicy extends SettingsSection {
  /// **SettingsSectionPrivacyPolicy** *(settingsSectionPrivacyPolicy)* - child of SettingsSection
  ///
  /// The "Privacy Policy" section.
  const SettingsSectionPrivacyPolicy();

  /// Parse from a json
  factory SettingsSectionPrivacyPolicy.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionPrivacyPolicy();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionPrivacyPolicy copyWith() =>
      const SettingsSectionPrivacyPolicy();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionPrivacyPolicy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionQrCode** *(settingsSectionQrCode)* - child of SettingsSection
///
/// The current user's QR code section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "share", "scan".
final class SettingsSectionQrCode extends SettingsSection {
  /// **SettingsSectionQrCode** *(settingsSectionQrCode)* - child of SettingsSection
  ///
  /// The current user's QR code section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "share", "scan".
  const SettingsSectionQrCode({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "share", "scan"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionQrCode.fromJson(Map<String, dynamic> json) =>
      SettingsSectionQrCode(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "share", "scan"
  @override
  SettingsSectionQrCode copyWith({
    String? subsection,
  }) =>
      SettingsSectionQrCode(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionQrCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionSearch** *(settingsSectionSearch)* - child of SettingsSection
///
/// Search in Settings.
final class SettingsSectionSearch extends SettingsSection {
  /// **SettingsSectionSearch** *(settingsSectionSearch)* - child of SettingsSection
  ///
  /// Search in Settings.
  const SettingsSectionSearch();

  /// Parse from a json
  factory SettingsSectionSearch.fromJson(Map<String, dynamic> json) =>
      const SettingsSectionSearch();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SettingsSectionSearch copyWith() => const SettingsSectionSearch();

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionSearch';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SettingsSectionSendGift** *(settingsSectionSendGift)* - child of SettingsSection
///
/// The "Send a gift" section.
///
/// * [subsection]: Subsection of the section; may be one of. "", "self".
final class SettingsSectionSendGift extends SettingsSection {
  /// **SettingsSectionSendGift** *(settingsSectionSendGift)* - child of SettingsSection
  ///
  /// The "Send a gift" section.
  ///
  /// * [subsection]: Subsection of the section; may be one of. "", "self".
  const SettingsSectionSendGift({
    required this.subsection,
  });

  /// Subsection of the section; may be one of. "", "self"
  final String subsection;

  /// Parse from a json
  factory SettingsSectionSendGift.fromJson(Map<String, dynamic> json) =>
      SettingsSectionSendGift(
        subsection: json['subsection'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "subsection": subsection,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [subsection]: Subsection of the section; may be one of. "", "self"
  @override
  SettingsSectionSendGift copyWith({
    String? subsection,
  }) =>
      SettingsSectionSendGift(
        subsection: subsection ?? this.subsection,
      );

  /// TDLib object type
  static const String defaultObjectId = 'settingsSectionSendGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
