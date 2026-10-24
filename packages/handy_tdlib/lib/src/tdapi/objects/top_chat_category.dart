part of '../tdapi.dart';

/// **TopChatCategory** *(topChatCategory)* - parent
///
/// Represents the categories of chats for which a list of frequently used chats can be retrieved.
sealed class TopChatCategory extends TdObject {
  /// **TopChatCategory** *(topChatCategory)* - parent
  ///
  /// Represents the categories of chats for which a list of frequently used chats can be retrieved.
  const TopChatCategory();

  /// a TopChatCategory return type can be :
  /// * [TopChatCategoryUsers]
  /// * [TopChatCategoryBots]
  /// * [TopChatCategoryGroups]
  /// * [TopChatCategoryChannels]
  /// * [TopChatCategoryInlineBots]
  /// * [TopChatCategoryGuestBots]
  /// * [TopChatCategoryWebAppBots]
  /// * [TopChatCategoryCalls]
  /// * [TopChatCategoryForwardChats]
  factory TopChatCategory.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TopChatCategoryUsers.defaultObjectId:
        return TopChatCategoryUsers.fromJson(json);
      case TopChatCategoryBots.defaultObjectId:
        return TopChatCategoryBots.fromJson(json);
      case TopChatCategoryGroups.defaultObjectId:
        return TopChatCategoryGroups.fromJson(json);
      case TopChatCategoryChannels.defaultObjectId:
        return TopChatCategoryChannels.fromJson(json);
      case TopChatCategoryInlineBots.defaultObjectId:
        return TopChatCategoryInlineBots.fromJson(json);
      case TopChatCategoryGuestBots.defaultObjectId:
        return TopChatCategoryGuestBots.fromJson(json);
      case TopChatCategoryWebAppBots.defaultObjectId:
        return TopChatCategoryWebAppBots.fromJson(json);
      case TopChatCategoryCalls.defaultObjectId:
        return TopChatCategoryCalls.fromJson(json);
      case TopChatCategoryForwardChats.defaultObjectId:
        return TopChatCategoryForwardChats.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TopChatCategory)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TopChatCategory copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryUsers** *(topChatCategoryUsers)* - child of TopChatCategory
///
/// A category containing frequently used private chats with non-bot users.
final class TopChatCategoryUsers extends TopChatCategory {
  /// **TopChatCategoryUsers** *(topChatCategoryUsers)* - child of TopChatCategory
  ///
  /// A category containing frequently used private chats with non-bot users.
  const TopChatCategoryUsers();

  /// Parse from a json
  factory TopChatCategoryUsers.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryUsers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryUsers copyWith() => const TopChatCategoryUsers();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryBots** *(topChatCategoryBots)* - child of TopChatCategory
///
/// A category containing frequently used private chats with bot users.
final class TopChatCategoryBots extends TopChatCategory {
  /// **TopChatCategoryBots** *(topChatCategoryBots)* - child of TopChatCategory
  ///
  /// A category containing frequently used private chats with bot users.
  const TopChatCategoryBots();

  /// Parse from a json
  factory TopChatCategoryBots.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryBots copyWith() => const TopChatCategoryBots();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryGroups** *(topChatCategoryGroups)* - child of TopChatCategory
///
/// A category containing frequently used basic groups and supergroups.
final class TopChatCategoryGroups extends TopChatCategory {
  /// **TopChatCategoryGroups** *(topChatCategoryGroups)* - child of TopChatCategory
  ///
  /// A category containing frequently used basic groups and supergroups.
  const TopChatCategoryGroups();

  /// Parse from a json
  factory TopChatCategoryGroups.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryGroups();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryGroups copyWith() => const TopChatCategoryGroups();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryGroups';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryChannels** *(topChatCategoryChannels)* - child of TopChatCategory
///
/// A category containing frequently used channels.
final class TopChatCategoryChannels extends TopChatCategory {
  /// **TopChatCategoryChannels** *(topChatCategoryChannels)* - child of TopChatCategory
  ///
  /// A category containing frequently used channels.
  const TopChatCategoryChannels();

  /// Parse from a json
  factory TopChatCategoryChannels.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryChannels();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryChannels copyWith() => const TopChatCategoryChannels();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryChannels';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryInlineBots** *(topChatCategoryInlineBots)* - child of TopChatCategory
///
/// A category containing frequently used chats with inline bots sorted by their usage in inline mode.
final class TopChatCategoryInlineBots extends TopChatCategory {
  /// **TopChatCategoryInlineBots** *(topChatCategoryInlineBots)* - child of TopChatCategory
  ///
  /// A category containing frequently used chats with inline bots sorted by their usage in inline mode.
  const TopChatCategoryInlineBots();

  /// Parse from a json
  factory TopChatCategoryInlineBots.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryInlineBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryInlineBots copyWith() => const TopChatCategoryInlineBots();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryInlineBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryGuestBots** *(topChatCategoryGuestBots)* - child of TopChatCategory
///
/// A category containing frequently used chats with bots, which were used as guest bots.
final class TopChatCategoryGuestBots extends TopChatCategory {
  /// **TopChatCategoryGuestBots** *(topChatCategoryGuestBots)* - child of TopChatCategory
  ///
  /// A category containing frequently used chats with bots, which were used as guest bots.
  const TopChatCategoryGuestBots();

  /// Parse from a json
  factory TopChatCategoryGuestBots.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryGuestBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryGuestBots copyWith() => const TopChatCategoryGuestBots();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryGuestBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryWebAppBots** *(topChatCategoryWebAppBots)* - child of TopChatCategory
///
/// A category containing frequently used chats with bots, which Web Apps were opened.
final class TopChatCategoryWebAppBots extends TopChatCategory {
  /// **TopChatCategoryWebAppBots** *(topChatCategoryWebAppBots)* - child of TopChatCategory
  ///
  /// A category containing frequently used chats with bots, which Web Apps were opened.
  const TopChatCategoryWebAppBots();

  /// Parse from a json
  factory TopChatCategoryWebAppBots.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryWebAppBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryWebAppBots copyWith() => const TopChatCategoryWebAppBots();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryWebAppBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryCalls** *(topChatCategoryCalls)* - child of TopChatCategory
///
/// A category containing frequently used chats used for calls.
final class TopChatCategoryCalls extends TopChatCategory {
  /// **TopChatCategoryCalls** *(topChatCategoryCalls)* - child of TopChatCategory
  ///
  /// A category containing frequently used chats used for calls.
  const TopChatCategoryCalls();

  /// Parse from a json
  factory TopChatCategoryCalls.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryCalls();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryCalls copyWith() => const TopChatCategoryCalls();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryCalls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TopChatCategoryForwardChats** *(topChatCategoryForwardChats)* - child of TopChatCategory
///
/// A category containing frequently used chats used to forward messages.
final class TopChatCategoryForwardChats extends TopChatCategory {
  /// **TopChatCategoryForwardChats** *(topChatCategoryForwardChats)* - child of TopChatCategory
  ///
  /// A category containing frequently used chats used to forward messages.
  const TopChatCategoryForwardChats();

  /// Parse from a json
  factory TopChatCategoryForwardChats.fromJson(Map<String, dynamic> json) =>
      const TopChatCategoryForwardChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TopChatCategoryForwardChats copyWith() => const TopChatCategoryForwardChats();

  /// TDLib object type
  static const String defaultObjectId = 'topChatCategoryForwardChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
