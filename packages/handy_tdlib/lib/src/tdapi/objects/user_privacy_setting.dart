part of '../tdapi.dart';

/// **UserPrivacySetting** *(userPrivacySetting)* - parent
///
/// Describes available user privacy settings.
sealed class UserPrivacySetting extends TdObject {
  /// **UserPrivacySetting** *(userPrivacySetting)* - parent
  ///
  /// Describes available user privacy settings.
  const UserPrivacySetting();

  /// a UserPrivacySetting return type can be :
  /// * [UserPrivacySettingShowStatus]
  /// * [UserPrivacySettingShowProfilePhoto]
  /// * [UserPrivacySettingShowLinkInForwardedMessages]
  /// * [UserPrivacySettingShowPhoneNumber]
  /// * [UserPrivacySettingShowBio]
  /// * [UserPrivacySettingShowBirthdate]
  /// * [UserPrivacySettingShowProfileAudio]
  /// * [UserPrivacySettingAllowChatInvites]
  /// * [UserPrivacySettingAllowCalls]
  /// * [UserPrivacySettingAllowPeerToPeerCalls]
  /// * [UserPrivacySettingAllowFindingByPhoneNumber]
  /// * [UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages]
  /// * [UserPrivacySettingAutosaveGifts]
  /// * [UserPrivacySettingAllowUnpaidMessages]
  factory UserPrivacySetting.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UserPrivacySettingShowStatus.defaultObjectId:
        return UserPrivacySettingShowStatus.fromJson(json);
      case UserPrivacySettingShowProfilePhoto.defaultObjectId:
        return UserPrivacySettingShowProfilePhoto.fromJson(json);
      case UserPrivacySettingShowLinkInForwardedMessages.defaultObjectId:
        return UserPrivacySettingShowLinkInForwardedMessages.fromJson(json);
      case UserPrivacySettingShowPhoneNumber.defaultObjectId:
        return UserPrivacySettingShowPhoneNumber.fromJson(json);
      case UserPrivacySettingShowBio.defaultObjectId:
        return UserPrivacySettingShowBio.fromJson(json);
      case UserPrivacySettingShowBirthdate.defaultObjectId:
        return UserPrivacySettingShowBirthdate.fromJson(json);
      case UserPrivacySettingShowProfileAudio.defaultObjectId:
        return UserPrivacySettingShowProfileAudio.fromJson(json);
      case UserPrivacySettingAllowChatInvites.defaultObjectId:
        return UserPrivacySettingAllowChatInvites.fromJson(json);
      case UserPrivacySettingAllowCalls.defaultObjectId:
        return UserPrivacySettingAllowCalls.fromJson(json);
      case UserPrivacySettingAllowPeerToPeerCalls.defaultObjectId:
        return UserPrivacySettingAllowPeerToPeerCalls.fromJson(json);
      case UserPrivacySettingAllowFindingByPhoneNumber.defaultObjectId:
        return UserPrivacySettingAllowFindingByPhoneNumber.fromJson(json);
      case UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
            .defaultObjectId:
        return UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages.fromJson(
            json);
      case UserPrivacySettingAutosaveGifts.defaultObjectId:
        return UserPrivacySettingAutosaveGifts.fromJson(json);
      case UserPrivacySettingAllowUnpaidMessages.defaultObjectId:
        return UserPrivacySettingAllowUnpaidMessages.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UserPrivacySetting)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UserPrivacySetting copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySetting';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowStatus** *(userPrivacySettingShowStatus)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's online status is visible.
final class UserPrivacySettingShowStatus extends UserPrivacySetting {
  /// **UserPrivacySettingShowStatus** *(userPrivacySettingShowStatus)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's online status is visible.
  const UserPrivacySettingShowStatus();

  /// Parse from a json
  factory UserPrivacySettingShowStatus.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingShowStatus();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowStatus copyWith() =>
      const UserPrivacySettingShowStatus();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowProfilePhoto** *(userPrivacySettingShowProfilePhoto)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's profile photo is visible.
final class UserPrivacySettingShowProfilePhoto extends UserPrivacySetting {
  /// **UserPrivacySettingShowProfilePhoto** *(userPrivacySettingShowProfilePhoto)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's profile photo is visible.
  const UserPrivacySettingShowProfilePhoto();

  /// Parse from a json
  factory UserPrivacySettingShowProfilePhoto.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingShowProfilePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowProfilePhoto copyWith() =>
      const UserPrivacySettingShowProfilePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowLinkInForwardedMessages** *(userPrivacySettingShowLinkInForwardedMessages)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether a link to the user's account is included in forwarded messages.
final class UserPrivacySettingShowLinkInForwardedMessages
    extends UserPrivacySetting {
  /// **UserPrivacySettingShowLinkInForwardedMessages** *(userPrivacySettingShowLinkInForwardedMessages)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether a link to the user's account is included in forwarded messages.
  const UserPrivacySettingShowLinkInForwardedMessages();

  /// Parse from a json
  factory UserPrivacySettingShowLinkInForwardedMessages.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingShowLinkInForwardedMessages();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowLinkInForwardedMessages copyWith() =>
      const UserPrivacySettingShowLinkInForwardedMessages();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingShowLinkInForwardedMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowPhoneNumber** *(userPrivacySettingShowPhoneNumber)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's phone number is visible.
final class UserPrivacySettingShowPhoneNumber extends UserPrivacySetting {
  /// **UserPrivacySettingShowPhoneNumber** *(userPrivacySettingShowPhoneNumber)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's phone number is visible.
  const UserPrivacySettingShowPhoneNumber();

  /// Parse from a json
  factory UserPrivacySettingShowPhoneNumber.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingShowPhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowPhoneNumber copyWith() =>
      const UserPrivacySettingShowPhoneNumber();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowBio** *(userPrivacySettingShowBio)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's bio is visible.
final class UserPrivacySettingShowBio extends UserPrivacySetting {
  /// **UserPrivacySettingShowBio** *(userPrivacySettingShowBio)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's bio is visible.
  const UserPrivacySettingShowBio();

  /// Parse from a json
  factory UserPrivacySettingShowBio.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingShowBio();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowBio copyWith() => const UserPrivacySettingShowBio();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowBio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowBirthdate** *(userPrivacySettingShowBirthdate)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's birthdate is visible.
final class UserPrivacySettingShowBirthdate extends UserPrivacySetting {
  /// **UserPrivacySettingShowBirthdate** *(userPrivacySettingShowBirthdate)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's birthdate is visible.
  const UserPrivacySettingShowBirthdate();

  /// Parse from a json
  factory UserPrivacySettingShowBirthdate.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingShowBirthdate();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowBirthdate copyWith() =>
      const UserPrivacySettingShowBirthdate();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingShowProfileAudio** *(userPrivacySettingShowProfileAudio)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user's profile audio files are visible.
final class UserPrivacySettingShowProfileAudio extends UserPrivacySetting {
  /// **UserPrivacySettingShowProfileAudio** *(userPrivacySettingShowProfileAudio)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user's profile audio files are visible.
  const UserPrivacySettingShowProfileAudio();

  /// Parse from a json
  factory UserPrivacySettingShowProfileAudio.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingShowProfileAudio();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingShowProfileAudio copyWith() =>
      const UserPrivacySettingShowProfileAudio();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingShowProfileAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowChatInvites** *(userPrivacySettingAllowChatInvites)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user can be invited to chats.
final class UserPrivacySettingAllowChatInvites extends UserPrivacySetting {
  /// **UserPrivacySettingAllowChatInvites** *(userPrivacySettingAllowChatInvites)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user can be invited to chats.
  const UserPrivacySettingAllowChatInvites();

  /// Parse from a json
  factory UserPrivacySettingAllowChatInvites.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingAllowChatInvites();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowChatInvites copyWith() =>
      const UserPrivacySettingAllowChatInvites();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingAllowChatInvites';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowCalls** *(userPrivacySettingAllowCalls)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user can be called.
final class UserPrivacySettingAllowCalls extends UserPrivacySetting {
  /// **UserPrivacySettingAllowCalls** *(userPrivacySettingAllowCalls)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user can be called.
  const UserPrivacySettingAllowCalls();

  /// Parse from a json
  factory UserPrivacySettingAllowCalls.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingAllowCalls();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowCalls copyWith() =>
      const UserPrivacySettingAllowCalls();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingAllowCalls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowPeerToPeerCalls** *(userPrivacySettingAllowPeerToPeerCalls)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether peer-to-peer connections can be used for calls.
final class UserPrivacySettingAllowPeerToPeerCalls extends UserPrivacySetting {
  /// **UserPrivacySettingAllowPeerToPeerCalls** *(userPrivacySettingAllowPeerToPeerCalls)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether peer-to-peer connections can be used for calls.
  const UserPrivacySettingAllowPeerToPeerCalls();

  /// Parse from a json
  factory UserPrivacySettingAllowPeerToPeerCalls.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingAllowPeerToPeerCalls();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowPeerToPeerCalls copyWith() =>
      const UserPrivacySettingAllowPeerToPeerCalls();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingAllowPeerToPeerCalls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowFindingByPhoneNumber** *(userPrivacySettingAllowFindingByPhoneNumber)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all".
final class UserPrivacySettingAllowFindingByPhoneNumber
    extends UserPrivacySetting {
  /// **UserPrivacySettingAllowFindingByPhoneNumber** *(userPrivacySettingAllowFindingByPhoneNumber)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user can be found by their phone number. Checked only if the phone number is not known to the other user. Can be set only to "Allow contacts" or "Allow all".
  const UserPrivacySettingAllowFindingByPhoneNumber();

  /// Parse from a json
  factory UserPrivacySettingAllowFindingByPhoneNumber.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingAllowFindingByPhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowFindingByPhoneNumber copyWith() =>
      const UserPrivacySettingAllowFindingByPhoneNumber();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingAllowFindingByPhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages** *(userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user can receive voice and video messages in private chats; for Telegram Premium users only.
final class UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages
    extends UserPrivacySetting {
  /// **UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages** *(userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user can receive voice and video messages in private chats; for Telegram Premium users only.
  const UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages();

  /// Parse from a json
  factory UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages copyWith() =>
      const UserPrivacySettingAllowPrivateVoiceAndVideoNoteMessages();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingAllowPrivateVoiceAndVideoNoteMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAutosaveGifts** *(userPrivacySettingAutosaveGifts)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether received gifts are automatically shown on the user's profile page.
final class UserPrivacySettingAutosaveGifts extends UserPrivacySetting {
  /// **UserPrivacySettingAutosaveGifts** *(userPrivacySettingAutosaveGifts)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether received gifts are automatically shown on the user's profile page.
  const UserPrivacySettingAutosaveGifts();

  /// Parse from a json
  factory UserPrivacySettingAutosaveGifts.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingAutosaveGifts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAutosaveGifts copyWith() =>
      const UserPrivacySettingAutosaveGifts();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingAutosaveGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingAllowUnpaidMessages** *(userPrivacySettingAllowUnpaidMessages)* - child of UserPrivacySetting
///
/// A privacy setting for managing whether the user can receive messages without additional payment.
final class UserPrivacySettingAllowUnpaidMessages extends UserPrivacySetting {
  /// **UserPrivacySettingAllowUnpaidMessages** *(userPrivacySettingAllowUnpaidMessages)* - child of UserPrivacySetting
  ///
  /// A privacy setting for managing whether the user can receive messages without additional payment.
  const UserPrivacySettingAllowUnpaidMessages();

  /// Parse from a json
  factory UserPrivacySettingAllowUnpaidMessages.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingAllowUnpaidMessages();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingAllowUnpaidMessages copyWith() =>
      const UserPrivacySettingAllowUnpaidMessages();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingAllowUnpaidMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
