part of '../tdapi.dart';

/// **PollVoteRestrictionReason** *(pollVoteRestrictionReason)* - parent
///
/// Reason of vote restriction in the poll for the current user.
sealed class PollVoteRestrictionReason extends TdObject {
  /// **PollVoteRestrictionReason** *(pollVoteRestrictionReason)* - parent
  ///
  /// Reason of vote restriction in the poll for the current user.
  const PollVoteRestrictionReason();

  /// a PollVoteRestrictionReason return type can be :
  /// * [PollVoteRestrictionReasonClosed]
  /// * [PollVoteRestrictionReasonYetUnsent]
  /// * [PollVoteRestrictionReasonScheduled]
  /// * [PollVoteRestrictionReasonCountryRestricted]
  /// * [PollVoteRestrictionReasonMembershipRequired]
  /// * [PollVoteRestrictionReasonOther]
  factory PollVoteRestrictionReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PollVoteRestrictionReasonClosed.defaultObjectId:
        return PollVoteRestrictionReasonClosed.fromJson(json);
      case PollVoteRestrictionReasonYetUnsent.defaultObjectId:
        return PollVoteRestrictionReasonYetUnsent.fromJson(json);
      case PollVoteRestrictionReasonScheduled.defaultObjectId:
        return PollVoteRestrictionReasonScheduled.fromJson(json);
      case PollVoteRestrictionReasonCountryRestricted.defaultObjectId:
        return PollVoteRestrictionReasonCountryRestricted.fromJson(json);
      case PollVoteRestrictionReasonMembershipRequired.defaultObjectId:
        return PollVoteRestrictionReasonMembershipRequired.fromJson(json);
      case PollVoteRestrictionReasonOther.defaultObjectId:
        return PollVoteRestrictionReasonOther.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PollVoteRestrictionReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PollVoteRestrictionReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteRestrictionReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonClosed** *(pollVoteRestrictionReasonClosed)* - child of PollVoteRestrictionReason
///
/// The poll is closed.
final class PollVoteRestrictionReasonClosed extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonClosed** *(pollVoteRestrictionReasonClosed)* - child of PollVoteRestrictionReason
  ///
  /// The poll is closed.
  const PollVoteRestrictionReasonClosed();

  /// Parse from a json
  factory PollVoteRestrictionReasonClosed.fromJson(Map<String, dynamic> json) =>
      const PollVoteRestrictionReasonClosed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PollVoteRestrictionReasonClosed copyWith() =>
      const PollVoteRestrictionReasonClosed();

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteRestrictionReasonClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonYetUnsent** *(pollVoteRestrictionReasonYetUnsent)* - child of PollVoteRestrictionReason
///
/// The poll isn't sent yet.
final class PollVoteRestrictionReasonYetUnsent
    extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonYetUnsent** *(pollVoteRestrictionReasonYetUnsent)* - child of PollVoteRestrictionReason
  ///
  /// The poll isn't sent yet.
  const PollVoteRestrictionReasonYetUnsent();

  /// Parse from a json
  factory PollVoteRestrictionReasonYetUnsent.fromJson(
          Map<String, dynamic> json) =>
      const PollVoteRestrictionReasonYetUnsent();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PollVoteRestrictionReasonYetUnsent copyWith() =>
      const PollVoteRestrictionReasonYetUnsent();

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteRestrictionReasonYetUnsent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonScheduled** *(pollVoteRestrictionReasonScheduled)* - child of PollVoteRestrictionReason
///
/// The poll is from a scheduled message.
final class PollVoteRestrictionReasonScheduled
    extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonScheduled** *(pollVoteRestrictionReasonScheduled)* - child of PollVoteRestrictionReason
  ///
  /// The poll is from a scheduled message.
  const PollVoteRestrictionReasonScheduled();

  /// Parse from a json
  factory PollVoteRestrictionReasonScheduled.fromJson(
          Map<String, dynamic> json) =>
      const PollVoteRestrictionReasonScheduled();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PollVoteRestrictionReasonScheduled copyWith() =>
      const PollVoteRestrictionReasonScheduled();

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteRestrictionReasonScheduled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonCountryRestricted** *(pollVoteRestrictionReasonCountryRestricted)* - child of PollVoteRestrictionReason
///
/// The user is from a country, users from which aren't allowed to vote.
///
/// * [countryCode]: Two-letter ISO 3166-1 alpha-2 code of the current user's country.
final class PollVoteRestrictionReasonCountryRestricted
    extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonCountryRestricted** *(pollVoteRestrictionReasonCountryRestricted)* - child of PollVoteRestrictionReason
  ///
  /// The user is from a country, users from which aren't allowed to vote.
  ///
  /// * [countryCode]: Two-letter ISO 3166-1 alpha-2 code of the current user's country.
  const PollVoteRestrictionReasonCountryRestricted({
    required this.countryCode,
  });

  /// Two-letter ISO 3166-1 alpha-2 code of the current user's country
  final String countryCode;

  /// Parse from a json
  factory PollVoteRestrictionReasonCountryRestricted.fromJson(
          Map<String, dynamic> json) =>
      PollVoteRestrictionReasonCountryRestricted(
        countryCode: json['country_code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "country_code": countryCode,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [country_code]: Two-letter ISO 3166-1 alpha-2 code of the current user's country
  @override
  PollVoteRestrictionReasonCountryRestricted copyWith({
    String? countryCode,
  }) =>
      PollVoteRestrictionReasonCountryRestricted(
        countryCode: countryCode ?? this.countryCode,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'pollVoteRestrictionReasonCountryRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonMembershipRequired** *(pollVoteRestrictionReasonMembershipRequired)* - child of PollVoteRestrictionReason
///
/// The user must be a member of the chat for at least a day to vote.
///
/// * [chatId]: Identifier of the chat which must be joined for at least a day before the user can vote.
final class PollVoteRestrictionReasonMembershipRequired
    extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonMembershipRequired** *(pollVoteRestrictionReasonMembershipRequired)* - child of PollVoteRestrictionReason
  ///
  /// The user must be a member of the chat for at least a day to vote.
  ///
  /// * [chatId]: Identifier of the chat which must be joined for at least a day before the user can vote.
  const PollVoteRestrictionReasonMembershipRequired({
    required this.chatId,
  });

  /// Identifier of the chat which must be joined for at least a day before the user can vote
  final int chatId;

  /// Parse from a json
  factory PollVoteRestrictionReasonMembershipRequired.fromJson(
          Map<String, dynamic> json) =>
      PollVoteRestrictionReasonMembershipRequired(
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
  /// * [chat_id]: Identifier of the chat which must be joined for at least a day before the user can vote
  @override
  PollVoteRestrictionReasonMembershipRequired copyWith({
    int? chatId,
  }) =>
      PollVoteRestrictionReasonMembershipRequired(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'pollVoteRestrictionReasonMembershipRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PollVoteRestrictionReasonOther** *(pollVoteRestrictionReasonOther)* - child of PollVoteRestrictionReason
///
/// The poll can't be voted by the user due to some other reason.
final class PollVoteRestrictionReasonOther extends PollVoteRestrictionReason {
  /// **PollVoteRestrictionReasonOther** *(pollVoteRestrictionReasonOther)* - child of PollVoteRestrictionReason
  ///
  /// The poll can't be voted by the user due to some other reason.
  const PollVoteRestrictionReasonOther();

  /// Parse from a json
  factory PollVoteRestrictionReasonOther.fromJson(Map<String, dynamic> json) =>
      const PollVoteRestrictionReasonOther();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PollVoteRestrictionReasonOther copyWith() =>
      const PollVoteRestrictionReasonOther();

  /// TDLib object type
  static const String defaultObjectId = 'pollVoteRestrictionReasonOther';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
