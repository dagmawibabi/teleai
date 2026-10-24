part of '../tdapi.dart';

/// **UserStatus** *(userStatus)* - parent
///
/// Describes the last time the user was online.
sealed class UserStatus extends TdObject {
  /// **UserStatus** *(userStatus)* - parent
  ///
  /// Describes the last time the user was online.
  const UserStatus();

  /// a UserStatus return type can be :
  /// * [UserStatusEmpty]
  /// * [UserStatusOnline]
  /// * [UserStatusOffline]
  /// * [UserStatusRecently]
  /// * [UserStatusLastWeek]
  /// * [UserStatusLastMonth]
  factory UserStatus.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UserStatusEmpty.defaultObjectId:
        return UserStatusEmpty.fromJson(json);
      case UserStatusOnline.defaultObjectId:
        return UserStatusOnline.fromJson(json);
      case UserStatusOffline.defaultObjectId:
        return UserStatusOffline.fromJson(json);
      case UserStatusRecently.defaultObjectId:
        return UserStatusRecently.fromJson(json);
      case UserStatusLastWeek.defaultObjectId:
        return UserStatusLastWeek.fromJson(json);
      case UserStatusLastMonth.defaultObjectId:
        return UserStatusLastMonth.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UserStatus)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UserStatus copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'userStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusEmpty** *(userStatusEmpty)* - child of UserStatus
///
/// The user's status has never been changed.
final class UserStatusEmpty extends UserStatus {
  /// **UserStatusEmpty** *(userStatusEmpty)* - child of UserStatus
  ///
  /// The user's status has never been changed.
  const UserStatusEmpty();

  /// Parse from a json
  factory UserStatusEmpty.fromJson(Map<String, dynamic> json) =>
      const UserStatusEmpty();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserStatusEmpty copyWith() => const UserStatusEmpty();

  /// TDLib object type
  static const String defaultObjectId = 'userStatusEmpty';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusOnline** *(userStatusOnline)* - child of UserStatus
///
/// The user is online.
///
/// * [expires]: Point in time (Unix timestamp) when the user's online status will expire.
final class UserStatusOnline extends UserStatus {
  /// **UserStatusOnline** *(userStatusOnline)* - child of UserStatus
  ///
  /// The user is online.
  ///
  /// * [expires]: Point in time (Unix timestamp) when the user's online status will expire.
  const UserStatusOnline({
    required this.expires,
  });

  /// Point in time (Unix timestamp) when the user's online status will expire
  final int expires;

  /// Parse from a json
  factory UserStatusOnline.fromJson(Map<String, dynamic> json) =>
      UserStatusOnline(
        expires: json['expires'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "expires": expires,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [expires]: Point in time (Unix timestamp) when the user's online status will expire
  @override
  UserStatusOnline copyWith({
    int? expires,
  }) =>
      UserStatusOnline(
        expires: expires ?? this.expires,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userStatusOnline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusOffline** *(userStatusOffline)* - child of UserStatus
///
/// The user is offline.
///
/// * [wasOnline]: Point in time (Unix timestamp) when the user was last online.
final class UserStatusOffline extends UserStatus {
  /// **UserStatusOffline** *(userStatusOffline)* - child of UserStatus
  ///
  /// The user is offline.
  ///
  /// * [wasOnline]: Point in time (Unix timestamp) when the user was last online.
  const UserStatusOffline({
    required this.wasOnline,
  });

  /// Point in time (Unix timestamp) when the user was last online
  final int wasOnline;

  /// Parse from a json
  factory UserStatusOffline.fromJson(Map<String, dynamic> json) =>
      UserStatusOffline(
        wasOnline: json['was_online'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "was_online": wasOnline,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [was_online]: Point in time (Unix timestamp) when the user was last online
  @override
  UserStatusOffline copyWith({
    int? wasOnline,
  }) =>
      UserStatusOffline(
        wasOnline: wasOnline ?? this.wasOnline,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userStatusOffline';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusRecently** *(userStatusRecently)* - child of UserStatus
///
/// The user was online recently.
///
/// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
final class UserStatusRecently extends UserStatus {
  /// **UserStatusRecently** *(userStatusRecently)* - child of UserStatus
  ///
  /// The user was online recently.
  ///
  /// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
  const UserStatusRecently({
    required this.byMyPrivacySettings,
  });

  /// Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  final bool byMyPrivacySettings;

  /// Parse from a json
  factory UserStatusRecently.fromJson(Map<String, dynamic> json) =>
      UserStatusRecently(
        byMyPrivacySettings: json['by_my_privacy_settings'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "by_my_privacy_settings": byMyPrivacySettings,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [by_my_privacy_settings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  @override
  UserStatusRecently copyWith({
    bool? byMyPrivacySettings,
  }) =>
      UserStatusRecently(
        byMyPrivacySettings: byMyPrivacySettings ?? this.byMyPrivacySettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userStatusRecently';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusLastWeek** *(userStatusLastWeek)* - child of UserStatus
///
/// The user is offline, but was online last week.
///
/// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
final class UserStatusLastWeek extends UserStatus {
  /// **UserStatusLastWeek** *(userStatusLastWeek)* - child of UserStatus
  ///
  /// The user is offline, but was online last week.
  ///
  /// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
  const UserStatusLastWeek({
    required this.byMyPrivacySettings,
  });

  /// Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  final bool byMyPrivacySettings;

  /// Parse from a json
  factory UserStatusLastWeek.fromJson(Map<String, dynamic> json) =>
      UserStatusLastWeek(
        byMyPrivacySettings: json['by_my_privacy_settings'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "by_my_privacy_settings": byMyPrivacySettings,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [by_my_privacy_settings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  @override
  UserStatusLastWeek copyWith({
    bool? byMyPrivacySettings,
  }) =>
      UserStatusLastWeek(
        byMyPrivacySettings: byMyPrivacySettings ?? this.byMyPrivacySettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userStatusLastWeek';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserStatusLastMonth** *(userStatusLastMonth)* - child of UserStatus
///
/// The user is offline, but was online last month.
///
/// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
final class UserStatusLastMonth extends UserStatus {
  /// **UserStatusLastMonth** *(userStatusLastMonth)* - child of UserStatus
  ///
  /// The user is offline, but was online last month.
  ///
  /// * [byMyPrivacySettings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium.
  const UserStatusLastMonth({
    required this.byMyPrivacySettings,
  });

  /// Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  final bool byMyPrivacySettings;

  /// Parse from a json
  factory UserStatusLastMonth.fromJson(Map<String, dynamic> json) =>
      UserStatusLastMonth(
        byMyPrivacySettings: json['by_my_privacy_settings'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "by_my_privacy_settings": byMyPrivacySettings,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [by_my_privacy_settings]: Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
  @override
  UserStatusLastMonth copyWith({
    bool? byMyPrivacySettings,
  }) =>
      UserStatusLastMonth(
        byMyPrivacySettings: byMyPrivacySettings ?? this.byMyPrivacySettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userStatusLastMonth';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
