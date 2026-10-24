part of '../tdapi.dart';

/// **GiveawayParticipantStatus** *(giveawayParticipantStatus)* - parent
///
/// Contains information about status of a user in a giveaway.
sealed class GiveawayParticipantStatus extends TdObject {
  /// **GiveawayParticipantStatus** *(giveawayParticipantStatus)* - parent
  ///
  /// Contains information about status of a user in a giveaway.
  const GiveawayParticipantStatus();

  /// a GiveawayParticipantStatus return type can be :
  /// * [GiveawayParticipantStatusEligible]
  /// * [GiveawayParticipantStatusParticipating]
  /// * [GiveawayParticipantStatusAlreadyWasMember]
  /// * [GiveawayParticipantStatusAdministrator]
  /// * [GiveawayParticipantStatusDisallowedCountry]
  factory GiveawayParticipantStatus.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiveawayParticipantStatusEligible.defaultObjectId:
        return GiveawayParticipantStatusEligible.fromJson(json);
      case GiveawayParticipantStatusParticipating.defaultObjectId:
        return GiveawayParticipantStatusParticipating.fromJson(json);
      case GiveawayParticipantStatusAlreadyWasMember.defaultObjectId:
        return GiveawayParticipantStatusAlreadyWasMember.fromJson(json);
      case GiveawayParticipantStatusAdministrator.defaultObjectId:
        return GiveawayParticipantStatusAdministrator.fromJson(json);
      case GiveawayParticipantStatusDisallowedCountry.defaultObjectId:
        return GiveawayParticipantStatusDisallowedCountry.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiveawayParticipantStatus)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiveawayParticipantStatus copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giveawayParticipantStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayParticipantStatusEligible** *(giveawayParticipantStatusEligible)* - child of GiveawayParticipantStatus
///
/// The user is eligible for the giveaway.
final class GiveawayParticipantStatusEligible
    extends GiveawayParticipantStatus {
  /// **GiveawayParticipantStatusEligible** *(giveawayParticipantStatusEligible)* - child of GiveawayParticipantStatus
  ///
  /// The user is eligible for the giveaway.
  const GiveawayParticipantStatusEligible();

  /// Parse from a json
  factory GiveawayParticipantStatusEligible.fromJson(
          Map<String, dynamic> json) =>
      const GiveawayParticipantStatusEligible();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiveawayParticipantStatusEligible copyWith() =>
      const GiveawayParticipantStatusEligible();

  /// TDLib object type
  static const String defaultObjectId = 'giveawayParticipantStatusEligible';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayParticipantStatusParticipating** *(giveawayParticipantStatusParticipating)* - child of GiveawayParticipantStatus
///
/// The user participates in the giveaway.
final class GiveawayParticipantStatusParticipating
    extends GiveawayParticipantStatus {
  /// **GiveawayParticipantStatusParticipating** *(giveawayParticipantStatusParticipating)* - child of GiveawayParticipantStatus
  ///
  /// The user participates in the giveaway.
  const GiveawayParticipantStatusParticipating();

  /// Parse from a json
  factory GiveawayParticipantStatusParticipating.fromJson(
          Map<String, dynamic> json) =>
      const GiveawayParticipantStatusParticipating();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  GiveawayParticipantStatusParticipating copyWith() =>
      const GiveawayParticipantStatusParticipating();

  /// TDLib object type
  static const String defaultObjectId =
      'giveawayParticipantStatusParticipating';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayParticipantStatusAlreadyWasMember** *(giveawayParticipantStatusAlreadyWasMember)* - child of GiveawayParticipantStatus
///
/// The user can't participate in the giveaway, because they have already been member of the chat.
///
/// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined the chat.
final class GiveawayParticipantStatusAlreadyWasMember
    extends GiveawayParticipantStatus {
  /// **GiveawayParticipantStatusAlreadyWasMember** *(giveawayParticipantStatusAlreadyWasMember)* - child of GiveawayParticipantStatus
  ///
  /// The user can't participate in the giveaway, because they have already been member of the chat.
  ///
  /// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined the chat.
  const GiveawayParticipantStatusAlreadyWasMember({
    required this.joinedChatDate,
  });

  /// Point in time (Unix timestamp) when the user joined the chat
  final int joinedChatDate;

  /// Parse from a json
  factory GiveawayParticipantStatusAlreadyWasMember.fromJson(
          Map<String, dynamic> json) =>
      GiveawayParticipantStatusAlreadyWasMember(
        joinedChatDate: json['joined_chat_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "joined_chat_date": joinedChatDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [joined_chat_date]: Point in time (Unix timestamp) when the user joined the chat
  @override
  GiveawayParticipantStatusAlreadyWasMember copyWith({
    int? joinedChatDate,
  }) =>
      GiveawayParticipantStatusAlreadyWasMember(
        joinedChatDate: joinedChatDate ?? this.joinedChatDate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'giveawayParticipantStatusAlreadyWasMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayParticipantStatusAdministrator** *(giveawayParticipantStatusAdministrator)* - child of GiveawayParticipantStatus
///
/// The user can't participate in the giveaway, because they are an administrator in one of the chats that created the giveaway.
///
/// * [chatId]: Identifier of the chat administered by the user.
final class GiveawayParticipantStatusAdministrator
    extends GiveawayParticipantStatus {
  /// **GiveawayParticipantStatusAdministrator** *(giveawayParticipantStatusAdministrator)* - child of GiveawayParticipantStatus
  ///
  /// The user can't participate in the giveaway, because they are an administrator in one of the chats that created the giveaway.
  ///
  /// * [chatId]: Identifier of the chat administered by the user.
  const GiveawayParticipantStatusAdministrator({
    required this.chatId,
  });

  /// Identifier of the chat administered by the user
  final int chatId;

  /// Parse from a json
  factory GiveawayParticipantStatusAdministrator.fromJson(
          Map<String, dynamic> json) =>
      GiveawayParticipantStatusAdministrator(
        chatId: json['chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat administered by the user
  @override
  GiveawayParticipantStatusAdministrator copyWith({
    int? chatId,
  }) =>
      GiveawayParticipantStatusAdministrator(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'giveawayParticipantStatusAdministrator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiveawayParticipantStatusDisallowedCountry** *(giveawayParticipantStatusDisallowedCountry)* - child of GiveawayParticipantStatus
///
/// The user can't participate in the giveaway, because their phone number is from a disallowed country.
///
/// * [userCountryCode]: A two-letter ISO 3166-1 alpha-2 country code of the user's country.
final class GiveawayParticipantStatusDisallowedCountry
    extends GiveawayParticipantStatus {
  /// **GiveawayParticipantStatusDisallowedCountry** *(giveawayParticipantStatusDisallowedCountry)* - child of GiveawayParticipantStatus
  ///
  /// The user can't participate in the giveaway, because their phone number is from a disallowed country.
  ///
  /// * [userCountryCode]: A two-letter ISO 3166-1 alpha-2 country code of the user's country.
  const GiveawayParticipantStatusDisallowedCountry({
    required this.userCountryCode,
  });

  /// A two-letter ISO 3166-1 alpha-2 country code of the user's country
  final String userCountryCode;

  /// Parse from a json
  factory GiveawayParticipantStatusDisallowedCountry.fromJson(
          Map<String, dynamic> json) =>
      GiveawayParticipantStatusDisallowedCountry(
        userCountryCode: json['user_country_code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_country_code": userCountryCode,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_country_code]: A two-letter ISO 3166-1 alpha-2 country code of the user's country
  @override
  GiveawayParticipantStatusDisallowedCountry copyWith({
    String? userCountryCode,
  }) =>
      GiveawayParticipantStatusDisallowedCountry(
        userCountryCode: userCountryCode ?? this.userCountryCode,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'giveawayParticipantStatusDisallowedCountry';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
