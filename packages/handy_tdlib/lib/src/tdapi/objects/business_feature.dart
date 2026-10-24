part of '../tdapi.dart';

/// **BusinessFeature** *(businessFeature)* - parent
///
/// Describes a feature available to Business user accounts.
sealed class BusinessFeature extends TdObject {
  /// **BusinessFeature** *(businessFeature)* - parent
  ///
  /// Describes a feature available to Business user accounts.
  const BusinessFeature();

  /// a BusinessFeature return type can be :
  /// * [BusinessFeatureLocation]
  /// * [BusinessFeatureOpeningHours]
  /// * [BusinessFeatureQuickReplies]
  /// * [BusinessFeatureGreetingMessage]
  /// * [BusinessFeatureAwayMessage]
  /// * [BusinessFeatureAccountLinks]
  /// * [BusinessFeatureStartPage]
  /// * [BusinessFeatureBots]
  /// * [BusinessFeatureEmojiStatus]
  /// * [BusinessFeatureChatFolderTags]
  /// * [BusinessFeatureUpgradedStories]
  factory BusinessFeature.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case BusinessFeatureLocation.defaultObjectId:
        return BusinessFeatureLocation.fromJson(json);
      case BusinessFeatureOpeningHours.defaultObjectId:
        return BusinessFeatureOpeningHours.fromJson(json);
      case BusinessFeatureQuickReplies.defaultObjectId:
        return BusinessFeatureQuickReplies.fromJson(json);
      case BusinessFeatureGreetingMessage.defaultObjectId:
        return BusinessFeatureGreetingMessage.fromJson(json);
      case BusinessFeatureAwayMessage.defaultObjectId:
        return BusinessFeatureAwayMessage.fromJson(json);
      case BusinessFeatureAccountLinks.defaultObjectId:
        return BusinessFeatureAccountLinks.fromJson(json);
      case BusinessFeatureStartPage.defaultObjectId:
        return BusinessFeatureStartPage.fromJson(json);
      case BusinessFeatureBots.defaultObjectId:
        return BusinessFeatureBots.fromJson(json);
      case BusinessFeatureEmojiStatus.defaultObjectId:
        return BusinessFeatureEmojiStatus.fromJson(json);
      case BusinessFeatureChatFolderTags.defaultObjectId:
        return BusinessFeatureChatFolderTags.fromJson(json);
      case BusinessFeatureUpgradedStories.defaultObjectId:
        return BusinessFeatureUpgradedStories.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of BusinessFeature)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  BusinessFeature copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeature';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureLocation** *(businessFeatureLocation)* - child of BusinessFeature
///
/// The ability to set location.
final class BusinessFeatureLocation extends BusinessFeature {
  /// **BusinessFeatureLocation** *(businessFeatureLocation)* - child of BusinessFeature
  ///
  /// The ability to set location.
  const BusinessFeatureLocation();

  /// Parse from a json
  factory BusinessFeatureLocation.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureLocation();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureLocation copyWith() => const BusinessFeatureLocation();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureOpeningHours** *(businessFeatureOpeningHours)* - child of BusinessFeature
///
/// The ability to set opening hours.
final class BusinessFeatureOpeningHours extends BusinessFeature {
  /// **BusinessFeatureOpeningHours** *(businessFeatureOpeningHours)* - child of BusinessFeature
  ///
  /// The ability to set opening hours.
  const BusinessFeatureOpeningHours();

  /// Parse from a json
  factory BusinessFeatureOpeningHours.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureOpeningHours();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureOpeningHours copyWith() => const BusinessFeatureOpeningHours();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureOpeningHours';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureQuickReplies** *(businessFeatureQuickReplies)* - child of BusinessFeature
///
/// The ability to use quick replies.
final class BusinessFeatureQuickReplies extends BusinessFeature {
  /// **BusinessFeatureQuickReplies** *(businessFeatureQuickReplies)* - child of BusinessFeature
  ///
  /// The ability to use quick replies.
  const BusinessFeatureQuickReplies();

  /// Parse from a json
  factory BusinessFeatureQuickReplies.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureQuickReplies();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureQuickReplies copyWith() => const BusinessFeatureQuickReplies();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureQuickReplies';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureGreetingMessage** *(businessFeatureGreetingMessage)* - child of BusinessFeature
///
/// The ability to set up a greeting message.
final class BusinessFeatureGreetingMessage extends BusinessFeature {
  /// **BusinessFeatureGreetingMessage** *(businessFeatureGreetingMessage)* - child of BusinessFeature
  ///
  /// The ability to set up a greeting message.
  const BusinessFeatureGreetingMessage();

  /// Parse from a json
  factory BusinessFeatureGreetingMessage.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureGreetingMessage();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureGreetingMessage copyWith() =>
      const BusinessFeatureGreetingMessage();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureGreetingMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureAwayMessage** *(businessFeatureAwayMessage)* - child of BusinessFeature
///
/// The ability to set up an away message.
final class BusinessFeatureAwayMessage extends BusinessFeature {
  /// **BusinessFeatureAwayMessage** *(businessFeatureAwayMessage)* - child of BusinessFeature
  ///
  /// The ability to set up an away message.
  const BusinessFeatureAwayMessage();

  /// Parse from a json
  factory BusinessFeatureAwayMessage.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureAwayMessage();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureAwayMessage copyWith() => const BusinessFeatureAwayMessage();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureAwayMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureAccountLinks** *(businessFeatureAccountLinks)* - child of BusinessFeature
///
/// The ability to create links to the business account with predefined message text.
final class BusinessFeatureAccountLinks extends BusinessFeature {
  /// **BusinessFeatureAccountLinks** *(businessFeatureAccountLinks)* - child of BusinessFeature
  ///
  /// The ability to create links to the business account with predefined message text.
  const BusinessFeatureAccountLinks();

  /// Parse from a json
  factory BusinessFeatureAccountLinks.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureAccountLinks();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureAccountLinks copyWith() => const BusinessFeatureAccountLinks();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureAccountLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureStartPage** *(businessFeatureStartPage)* - child of BusinessFeature
///
/// The ability to customize start page.
final class BusinessFeatureStartPage extends BusinessFeature {
  /// **BusinessFeatureStartPage** *(businessFeatureStartPage)* - child of BusinessFeature
  ///
  /// The ability to customize start page.
  const BusinessFeatureStartPage();

  /// Parse from a json
  factory BusinessFeatureStartPage.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureStartPage();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureStartPage copyWith() => const BusinessFeatureStartPage();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureStartPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureBots** *(businessFeatureBots)* - child of BusinessFeature
///
/// The ability to connect a bot to the account.
final class BusinessFeatureBots extends BusinessFeature {
  /// **BusinessFeatureBots** *(businessFeatureBots)* - child of BusinessFeature
  ///
  /// The ability to connect a bot to the account.
  const BusinessFeatureBots();

  /// Parse from a json
  factory BusinessFeatureBots.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureBots copyWith() => const BusinessFeatureBots();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureEmojiStatus** *(businessFeatureEmojiStatus)* - child of BusinessFeature
///
/// The ability to show an emoji status along with the business name.
final class BusinessFeatureEmojiStatus extends BusinessFeature {
  /// **BusinessFeatureEmojiStatus** *(businessFeatureEmojiStatus)* - child of BusinessFeature
  ///
  /// The ability to show an emoji status along with the business name.
  const BusinessFeatureEmojiStatus();

  /// Parse from a json
  factory BusinessFeatureEmojiStatus.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureEmojiStatus();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureEmojiStatus copyWith() => const BusinessFeatureEmojiStatus();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureChatFolderTags** *(businessFeatureChatFolderTags)* - child of BusinessFeature
///
/// The ability to display folder names for each chat in the chat list.
final class BusinessFeatureChatFolderTags extends BusinessFeature {
  /// **BusinessFeatureChatFolderTags** *(businessFeatureChatFolderTags)* - child of BusinessFeature
  ///
  /// The ability to display folder names for each chat in the chat list.
  const BusinessFeatureChatFolderTags();

  /// Parse from a json
  factory BusinessFeatureChatFolderTags.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureChatFolderTags();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureChatFolderTags copyWith() =>
      const BusinessFeatureChatFolderTags();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureChatFolderTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **BusinessFeatureUpgradedStories** *(businessFeatureUpgradedStories)* - child of BusinessFeature
///
/// Allowed to use many additional features for stories.
final class BusinessFeatureUpgradedStories extends BusinessFeature {
  /// **BusinessFeatureUpgradedStories** *(businessFeatureUpgradedStories)* - child of BusinessFeature
  ///
  /// Allowed to use many additional features for stories.
  const BusinessFeatureUpgradedStories();

  /// Parse from a json
  factory BusinessFeatureUpgradedStories.fromJson(Map<String, dynamic> json) =>
      const BusinessFeatureUpgradedStories();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  BusinessFeatureUpgradedStories copyWith() =>
      const BusinessFeatureUpgradedStories();

  /// TDLib object type
  static const String defaultObjectId = 'businessFeatureUpgradedStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
