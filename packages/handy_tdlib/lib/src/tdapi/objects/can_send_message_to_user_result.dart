part of '../tdapi.dart';

/// **CanSendMessageToUserResult** *(canSendMessageToUserResult)* - parent
///
/// Describes result of canSendMessageToUser.
sealed class CanSendMessageToUserResult extends TdObject {
  /// **CanSendMessageToUserResult** *(canSendMessageToUserResult)* - parent
  ///
  /// Describes result of canSendMessageToUser.
  const CanSendMessageToUserResult();

  /// a CanSendMessageToUserResult return type can be :
  /// * [CanSendMessageToUserResultOk]
  /// * [CanSendMessageToUserResultUserHasPaidMessages]
  /// * [CanSendMessageToUserResultUserIsDeleted]
  /// * [CanSendMessageToUserResultUserRestrictsNewChats]
  factory CanSendMessageToUserResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CanSendMessageToUserResultOk.defaultObjectId:
        return CanSendMessageToUserResultOk.fromJson(json);
      case CanSendMessageToUserResultUserHasPaidMessages.defaultObjectId:
        return CanSendMessageToUserResultUserHasPaidMessages.fromJson(json);
      case CanSendMessageToUserResultUserIsDeleted.defaultObjectId:
        return CanSendMessageToUserResultUserIsDeleted.fromJson(json);
      case CanSendMessageToUserResultUserRestrictsNewChats.defaultObjectId:
        return CanSendMessageToUserResultUserRestrictsNewChats.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CanSendMessageToUserResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CanSendMessageToUserResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'canSendMessageToUserResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendMessageToUserResultOk** *(canSendMessageToUserResultOk)* - child of CanSendMessageToUserResult
///
/// The user can be messaged.
final class CanSendMessageToUserResultOk extends CanSendMessageToUserResult {
  /// **CanSendMessageToUserResultOk** *(canSendMessageToUserResultOk)* - child of CanSendMessageToUserResult
  ///
  /// The user can be messaged.
  const CanSendMessageToUserResultOk({
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
  factory CanSendMessageToUserResultOk.fromJson(Map<String, dynamic> json) =>
      CanSendMessageToUserResultOk(
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
  CanSendMessageToUserResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanSendMessageToUserResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canSendMessageToUserResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendMessageToUserResultUserHasPaidMessages** *(canSendMessageToUserResultUserHasPaidMessages)* - child of CanSendMessageToUserResult
///
/// The user can be messaged, but the messages are paid.
///
/// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the user.
final class CanSendMessageToUserResultUserHasPaidMessages
    extends CanSendMessageToUserResult {
  /// **CanSendMessageToUserResultUserHasPaidMessages** *(canSendMessageToUserResultUserHasPaidMessages)* - child of CanSendMessageToUserResult
  ///
  /// The user can be messaged, but the messages are paid.
  ///
  /// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the user.
  const CanSendMessageToUserResultUserHasPaidMessages({
    required this.outgoingPaidMessageStarCount,
    this.extra,
    this.clientId,
  });

  /// Number of Telegram Stars that must be paid by the current user for each sent message to the user
  final int outgoingPaidMessageStarCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CanSendMessageToUserResultUserHasPaidMessages.fromJson(
          Map<String, dynamic> json) =>
      CanSendMessageToUserResultUserHasPaidMessages(
        outgoingPaidMessageStarCount: json['outgoing_paid_message_star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "outgoing_paid_message_star_count": outgoingPaidMessageStarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [outgoing_paid_message_star_count]: Number of Telegram Stars that must be paid by the current user for each sent message to the user
  @override
  CanSendMessageToUserResultUserHasPaidMessages copyWith({
    int? outgoingPaidMessageStarCount,
    dynamic extra,
    int? clientId,
  }) =>
      CanSendMessageToUserResultUserHasPaidMessages(
        outgoingPaidMessageStarCount:
            outgoingPaidMessageStarCount ?? this.outgoingPaidMessageStarCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canSendMessageToUserResultUserHasPaidMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendMessageToUserResultUserIsDeleted** *(canSendMessageToUserResultUserIsDeleted)* - child of CanSendMessageToUserResult
///
/// The user can't be messaged, because they are deleted or unknown.
final class CanSendMessageToUserResultUserIsDeleted
    extends CanSendMessageToUserResult {
  /// **CanSendMessageToUserResultUserIsDeleted** *(canSendMessageToUserResultUserIsDeleted)* - child of CanSendMessageToUserResult
  ///
  /// The user can't be messaged, because they are deleted or unknown.
  const CanSendMessageToUserResultUserIsDeleted({
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
  factory CanSendMessageToUserResultUserIsDeleted.fromJson(
          Map<String, dynamic> json) =>
      CanSendMessageToUserResultUserIsDeleted(
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
  CanSendMessageToUserResultUserIsDeleted copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanSendMessageToUserResultUserIsDeleted(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canSendMessageToUserResultUserIsDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanSendMessageToUserResultUserRestrictsNewChats** *(canSendMessageToUserResultUserRestrictsNewChats)* - child of CanSendMessageToUserResult
///
/// The user can't be messaged, because they restrict new chats with non-contacts.
final class CanSendMessageToUserResultUserRestrictsNewChats
    extends CanSendMessageToUserResult {
  /// **CanSendMessageToUserResultUserRestrictsNewChats** *(canSendMessageToUserResultUserRestrictsNewChats)* - child of CanSendMessageToUserResult
  ///
  /// The user can't be messaged, because they restrict new chats with non-contacts.
  const CanSendMessageToUserResultUserRestrictsNewChats({
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
  factory CanSendMessageToUserResultUserRestrictsNewChats.fromJson(
          Map<String, dynamic> json) =>
      CanSendMessageToUserResultUserRestrictsNewChats(
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
  CanSendMessageToUserResultUserRestrictsNewChats copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanSendMessageToUserResultUserRestrictsNewChats(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canSendMessageToUserResultUserRestrictsNewChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
