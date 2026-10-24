part of '../tdapi.dart';

/// **InviteGroupCallParticipantResult** *(inviteGroupCallParticipantResult)* - parent
///
/// Describes result of group call participant invitation.
sealed class InviteGroupCallParticipantResult extends TdObject {
  /// **InviteGroupCallParticipantResult** *(inviteGroupCallParticipantResult)* - parent
  ///
  /// Describes result of group call participant invitation.
  const InviteGroupCallParticipantResult();

  /// a InviteGroupCallParticipantResult return type can be :
  /// * [InviteGroupCallParticipantResultUserPrivacyRestricted]
  /// * [InviteGroupCallParticipantResultUserAlreadyParticipant]
  /// * [InviteGroupCallParticipantResultUserWasBanned]
  /// * [InviteGroupCallParticipantResultSuccess]
  factory InviteGroupCallParticipantResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InviteGroupCallParticipantResultUserPrivacyRestricted
            .defaultObjectId:
        return InviteGroupCallParticipantResultUserPrivacyRestricted.fromJson(
            json);
      case InviteGroupCallParticipantResultUserAlreadyParticipant
            .defaultObjectId:
        return InviteGroupCallParticipantResultUserAlreadyParticipant.fromJson(
            json);
      case InviteGroupCallParticipantResultUserWasBanned.defaultObjectId:
        return InviteGroupCallParticipantResultUserWasBanned.fromJson(json);
      case InviteGroupCallParticipantResultSuccess.defaultObjectId:
        return InviteGroupCallParticipantResultSuccess.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InviteGroupCallParticipantResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InviteGroupCallParticipantResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inviteGroupCallParticipantResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteGroupCallParticipantResultUserPrivacyRestricted** *(inviteGroupCallParticipantResultUserPrivacyRestricted)* - child of InviteGroupCallParticipantResult
///
/// The user can't be invited due to their privacy settings.
final class InviteGroupCallParticipantResultUserPrivacyRestricted
    extends InviteGroupCallParticipantResult {
  /// **InviteGroupCallParticipantResultUserPrivacyRestricted** *(inviteGroupCallParticipantResultUserPrivacyRestricted)* - child of InviteGroupCallParticipantResult
  ///
  /// The user can't be invited due to their privacy settings.
  const InviteGroupCallParticipantResultUserPrivacyRestricted({
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
  factory InviteGroupCallParticipantResultUserPrivacyRestricted.fromJson(
          Map<String, dynamic> json) =>
      InviteGroupCallParticipantResultUserPrivacyRestricted(
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
  InviteGroupCallParticipantResultUserPrivacyRestricted copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InviteGroupCallParticipantResultUserPrivacyRestricted(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inviteGroupCallParticipantResultUserPrivacyRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteGroupCallParticipantResultUserAlreadyParticipant** *(inviteGroupCallParticipantResultUserAlreadyParticipant)* - child of InviteGroupCallParticipantResult
///
/// The user can't be invited because they are already a participant of the call.
final class InviteGroupCallParticipantResultUserAlreadyParticipant
    extends InviteGroupCallParticipantResult {
  /// **InviteGroupCallParticipantResultUserAlreadyParticipant** *(inviteGroupCallParticipantResultUserAlreadyParticipant)* - child of InviteGroupCallParticipantResult
  ///
  /// The user can't be invited because they are already a participant of the call.
  const InviteGroupCallParticipantResultUserAlreadyParticipant({
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
  factory InviteGroupCallParticipantResultUserAlreadyParticipant.fromJson(
          Map<String, dynamic> json) =>
      InviteGroupCallParticipantResultUserAlreadyParticipant(
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
  InviteGroupCallParticipantResultUserAlreadyParticipant copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InviteGroupCallParticipantResultUserAlreadyParticipant(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inviteGroupCallParticipantResultUserAlreadyParticipant';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteGroupCallParticipantResultUserWasBanned** *(inviteGroupCallParticipantResultUserWasBanned)* - child of InviteGroupCallParticipantResult
///
/// The user can't be invited because they were banned by the owner of the call and can be invited back only by the owner of the group call.
final class InviteGroupCallParticipantResultUserWasBanned
    extends InviteGroupCallParticipantResult {
  /// **InviteGroupCallParticipantResultUserWasBanned** *(inviteGroupCallParticipantResultUserWasBanned)* - child of InviteGroupCallParticipantResult
  ///
  /// The user can't be invited because they were banned by the owner of the call and can be invited back only by the owner of the group call.
  const InviteGroupCallParticipantResultUserWasBanned({
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
  factory InviteGroupCallParticipantResultUserWasBanned.fromJson(
          Map<String, dynamic> json) =>
      InviteGroupCallParticipantResultUserWasBanned(
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
  InviteGroupCallParticipantResultUserWasBanned copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      InviteGroupCallParticipantResultUserWasBanned(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inviteGroupCallParticipantResultUserWasBanned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InviteGroupCallParticipantResultSuccess** *(inviteGroupCallParticipantResultSuccess)* - child of InviteGroupCallParticipantResult
///
/// The user was invited and a service message of the type messageGroupCall was sent which can be used in declineGroupCallInvitation to cancel the invitation.
///
/// * [chatId]: Identifier of the chat with the invitation message.
/// * [messageId]: Identifier of the message.
final class InviteGroupCallParticipantResultSuccess
    extends InviteGroupCallParticipantResult {
  /// **InviteGroupCallParticipantResultSuccess** *(inviteGroupCallParticipantResultSuccess)* - child of InviteGroupCallParticipantResult
  ///
  /// The user was invited and a service message of the type messageGroupCall was sent which can be used in declineGroupCallInvitation to cancel the invitation.
  ///
  /// * [chatId]: Identifier of the chat with the invitation message.
  /// * [messageId]: Identifier of the message.
  const InviteGroupCallParticipantResultSuccess({
    required this.chatId,
    required this.messageId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat with the invitation message
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InviteGroupCallParticipantResultSuccess.fromJson(
          Map<String, dynamic> json) =>
      InviteGroupCallParticipantResultSuccess(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the invitation message
  /// * [message_id]: Identifier of the message
  @override
  InviteGroupCallParticipantResultSuccess copyWith({
    int? chatId,
    int? messageId,
    dynamic extra,
    int? clientId,
  }) =>
      InviteGroupCallParticipantResultSuccess(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'inviteGroupCallParticipantResultSuccess';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
