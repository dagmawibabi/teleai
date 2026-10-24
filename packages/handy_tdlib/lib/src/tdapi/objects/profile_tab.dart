part of '../tdapi.dart';

/// **ProfileTab** *(profileTab)* - parent
///
/// Describes a tab shown in a user or a chat profile.
sealed class ProfileTab extends TdObject {
  /// **ProfileTab** *(profileTab)* - parent
  ///
  /// Describes a tab shown in a user or a chat profile.
  const ProfileTab();

  /// a ProfileTab return type can be :
  /// * [ProfileTabPosts]
  /// * [ProfileTabGifts]
  /// * [ProfileTabMedia]
  /// * [ProfileTabFiles]
  /// * [ProfileTabLinks]
  /// * [ProfileTabMusic]
  /// * [ProfileTabVoice]
  /// * [ProfileTabGifs]
  factory ProfileTab.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ProfileTabPosts.defaultObjectId:
        return ProfileTabPosts.fromJson(json);
      case ProfileTabGifts.defaultObjectId:
        return ProfileTabGifts.fromJson(json);
      case ProfileTabMedia.defaultObjectId:
        return ProfileTabMedia.fromJson(json);
      case ProfileTabFiles.defaultObjectId:
        return ProfileTabFiles.fromJson(json);
      case ProfileTabLinks.defaultObjectId:
        return ProfileTabLinks.fromJson(json);
      case ProfileTabMusic.defaultObjectId:
        return ProfileTabMusic.fromJson(json);
      case ProfileTabVoice.defaultObjectId:
        return ProfileTabVoice.fromJson(json);
      case ProfileTabGifs.defaultObjectId:
        return ProfileTabGifs.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ProfileTab)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ProfileTab copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'profileTab';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabPosts** *(profileTabPosts)* - child of ProfileTab
///
/// A tab with stories posted by the user or the channel chat and saved to profile.
final class ProfileTabPosts extends ProfileTab {
  /// **ProfileTabPosts** *(profileTabPosts)* - child of ProfileTab
  ///
  /// A tab with stories posted by the user or the channel chat and saved to profile.
  const ProfileTabPosts();

  /// Parse from a json
  factory ProfileTabPosts.fromJson(Map<String, dynamic> json) =>
      const ProfileTabPosts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabPosts copyWith() => const ProfileTabPosts();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabPosts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabGifts** *(profileTabGifts)* - child of ProfileTab
///
/// A tab with gifts received by the user or the channel chat.
final class ProfileTabGifts extends ProfileTab {
  /// **ProfileTabGifts** *(profileTabGifts)* - child of ProfileTab
  ///
  /// A tab with gifts received by the user or the channel chat.
  const ProfileTabGifts();

  /// Parse from a json
  factory ProfileTabGifts.fromJson(Map<String, dynamic> json) =>
      const ProfileTabGifts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabGifts copyWith() => const ProfileTabGifts();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabMedia** *(profileTabMedia)* - child of ProfileTab
///
/// A tab with photos and videos posted by the channel.
final class ProfileTabMedia extends ProfileTab {
  /// **ProfileTabMedia** *(profileTabMedia)* - child of ProfileTab
  ///
  /// A tab with photos and videos posted by the channel.
  const ProfileTabMedia();

  /// Parse from a json
  factory ProfileTabMedia.fromJson(Map<String, dynamic> json) =>
      const ProfileTabMedia();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabMedia copyWith() => const ProfileTabMedia();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabFiles** *(profileTabFiles)* - child of ProfileTab
///
/// A tab with documents posted by the channel.
final class ProfileTabFiles extends ProfileTab {
  /// **ProfileTabFiles** *(profileTabFiles)* - child of ProfileTab
  ///
  /// A tab with documents posted by the channel.
  const ProfileTabFiles();

  /// Parse from a json
  factory ProfileTabFiles.fromJson(Map<String, dynamic> json) =>
      const ProfileTabFiles();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabFiles copyWith() => const ProfileTabFiles();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabFiles';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabLinks** *(profileTabLinks)* - child of ProfileTab
///
/// A tab with messages posted by the channel and containing links.
final class ProfileTabLinks extends ProfileTab {
  /// **ProfileTabLinks** *(profileTabLinks)* - child of ProfileTab
  ///
  /// A tab with messages posted by the channel and containing links.
  const ProfileTabLinks();

  /// Parse from a json
  factory ProfileTabLinks.fromJson(Map<String, dynamic> json) =>
      const ProfileTabLinks();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabLinks copyWith() => const ProfileTabLinks();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabMusic** *(profileTabMusic)* - child of ProfileTab
///
/// A tab with audio messages posted by the channel.
final class ProfileTabMusic extends ProfileTab {
  /// **ProfileTabMusic** *(profileTabMusic)* - child of ProfileTab
  ///
  /// A tab with audio messages posted by the channel.
  const ProfileTabMusic();

  /// Parse from a json
  factory ProfileTabMusic.fromJson(Map<String, dynamic> json) =>
      const ProfileTabMusic();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabMusic copyWith() => const ProfileTabMusic();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabMusic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabVoice** *(profileTabVoice)* - child of ProfileTab
///
/// A tab with voice notes posted by the channel.
final class ProfileTabVoice extends ProfileTab {
  /// **ProfileTabVoice** *(profileTabVoice)* - child of ProfileTab
  ///
  /// A tab with voice notes posted by the channel.
  const ProfileTabVoice();

  /// Parse from a json
  factory ProfileTabVoice.fromJson(Map<String, dynamic> json) =>
      const ProfileTabVoice();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabVoice copyWith() => const ProfileTabVoice();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabVoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ProfileTabGifs** *(profileTabGifs)* - child of ProfileTab
///
/// A tab with animations posted by the channel.
final class ProfileTabGifs extends ProfileTab {
  /// **ProfileTabGifs** *(profileTabGifs)* - child of ProfileTab
  ///
  /// A tab with animations posted by the channel.
  const ProfileTabGifs();

  /// Parse from a json
  factory ProfileTabGifs.fromJson(Map<String, dynamic> json) =>
      const ProfileTabGifs();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ProfileTabGifs copyWith() => const ProfileTabGifs();

  /// TDLib object type
  static const String defaultObjectId = 'profileTabGifs';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
