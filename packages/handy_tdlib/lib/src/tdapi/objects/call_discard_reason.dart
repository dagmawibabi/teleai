part of '../tdapi.dart';

/// **CallDiscardReason** *(callDiscardReason)* - parent
///
/// Describes the reason why a call was discarded.
sealed class CallDiscardReason extends TdObject {
  /// **CallDiscardReason** *(callDiscardReason)* - parent
  ///
  /// Describes the reason why a call was discarded.
  const CallDiscardReason();

  /// a CallDiscardReason return type can be :
  /// * [CallDiscardReasonEmpty]
  /// * [CallDiscardReasonMissed]
  /// * [CallDiscardReasonDeclined]
  /// * [CallDiscardReasonDisconnected]
  /// * [CallDiscardReasonHungUp]
  /// * [CallDiscardReasonUpgradeToGroupCall]
  factory CallDiscardReason.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CallDiscardReasonEmpty.defaultObjectId:
        return CallDiscardReasonEmpty.fromJson(json);
      case CallDiscardReasonMissed.defaultObjectId:
        return CallDiscardReasonMissed.fromJson(json);
      case CallDiscardReasonDeclined.defaultObjectId:
        return CallDiscardReasonDeclined.fromJson(json);
      case CallDiscardReasonDisconnected.defaultObjectId:
        return CallDiscardReasonDisconnected.fromJson(json);
      case CallDiscardReasonHungUp.defaultObjectId:
        return CallDiscardReasonHungUp.fromJson(json);
      case CallDiscardReasonUpgradeToGroupCall.defaultObjectId:
        return CallDiscardReasonUpgradeToGroupCall.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CallDiscardReason)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CallDiscardReason copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReason';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonEmpty** *(callDiscardReasonEmpty)* - child of CallDiscardReason
///
/// The call wasn't discarded, or the reason is unknown.
final class CallDiscardReasonEmpty extends CallDiscardReason {
  /// **CallDiscardReasonEmpty** *(callDiscardReasonEmpty)* - child of CallDiscardReason
  ///
  /// The call wasn't discarded, or the reason is unknown.
  const CallDiscardReasonEmpty();

  /// Parse from a json
  factory CallDiscardReasonEmpty.fromJson(Map<String, dynamic> json) =>
      const CallDiscardReasonEmpty();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallDiscardReasonEmpty copyWith() => const CallDiscardReasonEmpty();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonEmpty';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonMissed** *(callDiscardReasonMissed)* - child of CallDiscardReason
///
/// The call was ended before the conversation started. It was canceled by the caller or missed by the other party.
final class CallDiscardReasonMissed extends CallDiscardReason {
  /// **CallDiscardReasonMissed** *(callDiscardReasonMissed)* - child of CallDiscardReason
  ///
  /// The call was ended before the conversation started. It was canceled by the caller or missed by the other party.
  const CallDiscardReasonMissed();

  /// Parse from a json
  factory CallDiscardReasonMissed.fromJson(Map<String, dynamic> json) =>
      const CallDiscardReasonMissed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallDiscardReasonMissed copyWith() => const CallDiscardReasonMissed();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonMissed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonDeclined** *(callDiscardReasonDeclined)* - child of CallDiscardReason
///
/// The call was ended before the conversation started. It was declined by the other party.
final class CallDiscardReasonDeclined extends CallDiscardReason {
  /// **CallDiscardReasonDeclined** *(callDiscardReasonDeclined)* - child of CallDiscardReason
  ///
  /// The call was ended before the conversation started. It was declined by the other party.
  const CallDiscardReasonDeclined();

  /// Parse from a json
  factory CallDiscardReasonDeclined.fromJson(Map<String, dynamic> json) =>
      const CallDiscardReasonDeclined();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallDiscardReasonDeclined copyWith() => const CallDiscardReasonDeclined();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonDisconnected** *(callDiscardReasonDisconnected)* - child of CallDiscardReason
///
/// The call was ended during the conversation because the users were disconnected.
final class CallDiscardReasonDisconnected extends CallDiscardReason {
  /// **CallDiscardReasonDisconnected** *(callDiscardReasonDisconnected)* - child of CallDiscardReason
  ///
  /// The call was ended during the conversation because the users were disconnected.
  const CallDiscardReasonDisconnected();

  /// Parse from a json
  factory CallDiscardReasonDisconnected.fromJson(Map<String, dynamic> json) =>
      const CallDiscardReasonDisconnected();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallDiscardReasonDisconnected copyWith() =>
      const CallDiscardReasonDisconnected();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonDisconnected';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonHungUp** *(callDiscardReasonHungUp)* - child of CallDiscardReason
///
/// The call was ended because one of the parties hung up.
final class CallDiscardReasonHungUp extends CallDiscardReason {
  /// **CallDiscardReasonHungUp** *(callDiscardReasonHungUp)* - child of CallDiscardReason
  ///
  /// The call was ended because one of the parties hung up.
  const CallDiscardReasonHungUp();

  /// Parse from a json
  factory CallDiscardReasonHungUp.fromJson(Map<String, dynamic> json) =>
      const CallDiscardReasonHungUp();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallDiscardReasonHungUp copyWith() => const CallDiscardReasonHungUp();

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonHungUp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallDiscardReasonUpgradeToGroupCall** *(callDiscardReasonUpgradeToGroupCall)* - child of CallDiscardReason
///
/// The call was ended because it has been upgraded to a group call.
///
/// * [inviteLink]: Invite link for the group call.
final class CallDiscardReasonUpgradeToGroupCall extends CallDiscardReason {
  /// **CallDiscardReasonUpgradeToGroupCall** *(callDiscardReasonUpgradeToGroupCall)* - child of CallDiscardReason
  ///
  /// The call was ended because it has been upgraded to a group call.
  ///
  /// * [inviteLink]: Invite link for the group call.
  const CallDiscardReasonUpgradeToGroupCall({
    required this.inviteLink,
  });

  /// Invite link for the group call
  final String inviteLink;

  /// Parse from a json
  factory CallDiscardReasonUpgradeToGroupCall.fromJson(
          Map<String, dynamic> json) =>
      CallDiscardReasonUpgradeToGroupCall(
        inviteLink: json['invite_link'],
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
  /// * [invite_link]: Invite link for the group call
  @override
  CallDiscardReasonUpgradeToGroupCall copyWith({
    String? inviteLink,
  }) =>
      CallDiscardReasonUpgradeToGroupCall(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callDiscardReasonUpgradeToGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
