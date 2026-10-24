part of '../tdapi.dart';

/// **CheckChatUsernameResult** *(checkChatUsernameResult)* - parent
///
/// Represents result of checking whether a username can be set for a chat.
sealed class CheckChatUsernameResult extends TdObject {
  /// **CheckChatUsernameResult** *(checkChatUsernameResult)* - parent
  ///
  /// Represents result of checking whether a username can be set for a chat.
  const CheckChatUsernameResult();

  /// a CheckChatUsernameResult return type can be :
  /// * [CheckChatUsernameResultOk]
  /// * [CheckChatUsernameResultUsernameInvalid]
  /// * [CheckChatUsernameResultUsernameOccupied]
  /// * [CheckChatUsernameResultUsernamePurchasable]
  /// * [CheckChatUsernameResultPublicChatsTooMany]
  /// * [CheckChatUsernameResultPublicGroupsUnavailable]
  factory CheckChatUsernameResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CheckChatUsernameResultOk.defaultObjectId:
        return CheckChatUsernameResultOk.fromJson(json);
      case CheckChatUsernameResultUsernameInvalid.defaultObjectId:
        return CheckChatUsernameResultUsernameInvalid.fromJson(json);
      case CheckChatUsernameResultUsernameOccupied.defaultObjectId:
        return CheckChatUsernameResultUsernameOccupied.fromJson(json);
      case CheckChatUsernameResultUsernamePurchasable.defaultObjectId:
        return CheckChatUsernameResultUsernamePurchasable.fromJson(json);
      case CheckChatUsernameResultPublicChatsTooMany.defaultObjectId:
        return CheckChatUsernameResultPublicChatsTooMany.fromJson(json);
      case CheckChatUsernameResultPublicGroupsUnavailable.defaultObjectId:
        return CheckChatUsernameResultPublicGroupsUnavailable.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CheckChatUsernameResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CheckChatUsernameResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'checkChatUsernameResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultOk** *(checkChatUsernameResultOk)* - child of CheckChatUsernameResult
///
/// The username can be set.
final class CheckChatUsernameResultOk extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultOk** *(checkChatUsernameResultOk)* - child of CheckChatUsernameResult
  ///
  /// The username can be set.
  const CheckChatUsernameResultOk({
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
  factory CheckChatUsernameResultOk.fromJson(Map<String, dynamic> json) =>
      CheckChatUsernameResultOk(
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
  CheckChatUsernameResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkChatUsernameResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultUsernameInvalid** *(checkChatUsernameResultUsernameInvalid)* - child of CheckChatUsernameResult
///
/// The username is invalid.
final class CheckChatUsernameResultUsernameInvalid
    extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultUsernameInvalid** *(checkChatUsernameResultUsernameInvalid)* - child of CheckChatUsernameResult
  ///
  /// The username is invalid.
  const CheckChatUsernameResultUsernameInvalid({
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
  factory CheckChatUsernameResultUsernameInvalid.fromJson(
          Map<String, dynamic> json) =>
      CheckChatUsernameResultUsernameInvalid(
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
  CheckChatUsernameResultUsernameInvalid copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultUsernameInvalid(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkChatUsernameResultUsernameInvalid';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultUsernameOccupied** *(checkChatUsernameResultUsernameOccupied)* - child of CheckChatUsernameResult
///
/// The username is occupied.
final class CheckChatUsernameResultUsernameOccupied
    extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultUsernameOccupied** *(checkChatUsernameResultUsernameOccupied)* - child of CheckChatUsernameResult
  ///
  /// The username is occupied.
  const CheckChatUsernameResultUsernameOccupied({
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
  factory CheckChatUsernameResultUsernameOccupied.fromJson(
          Map<String, dynamic> json) =>
      CheckChatUsernameResultUsernameOccupied(
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
  CheckChatUsernameResultUsernameOccupied copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultUsernameOccupied(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkChatUsernameResultUsernameOccupied';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultUsernamePurchasable** *(checkChatUsernameResultUsernamePurchasable)* - child of CheckChatUsernameResult
///
/// The username can be purchased at https://fragment.com. Information about the username can be received using getCollectibleItemInfo.
final class CheckChatUsernameResultUsernamePurchasable
    extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultUsernamePurchasable** *(checkChatUsernameResultUsernamePurchasable)* - child of CheckChatUsernameResult
  ///
  /// The username can be purchased at https://fragment.com. Information about the username can be received using getCollectibleItemInfo.
  const CheckChatUsernameResultUsernamePurchasable({
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
  factory CheckChatUsernameResultUsernamePurchasable.fromJson(
          Map<String, dynamic> json) =>
      CheckChatUsernameResultUsernamePurchasable(
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
  CheckChatUsernameResultUsernamePurchasable copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultUsernamePurchasable(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkChatUsernameResultUsernamePurchasable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultPublicChatsTooMany** *(checkChatUsernameResultPublicChatsTooMany)* - child of CheckChatUsernameResult
///
/// The user has too many chats with username, one of them must be made private first.
final class CheckChatUsernameResultPublicChatsTooMany
    extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultPublicChatsTooMany** *(checkChatUsernameResultPublicChatsTooMany)* - child of CheckChatUsernameResult
  ///
  /// The user has too many chats with username, one of them must be made private first.
  const CheckChatUsernameResultPublicChatsTooMany({
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
  factory CheckChatUsernameResultPublicChatsTooMany.fromJson(
          Map<String, dynamic> json) =>
      CheckChatUsernameResultPublicChatsTooMany(
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
  CheckChatUsernameResultPublicChatsTooMany copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultPublicChatsTooMany(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkChatUsernameResultPublicChatsTooMany';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CheckChatUsernameResultPublicGroupsUnavailable** *(checkChatUsernameResultPublicGroupsUnavailable)* - child of CheckChatUsernameResult
///
/// The user can't be a member of a public supergroup.
final class CheckChatUsernameResultPublicGroupsUnavailable
    extends CheckChatUsernameResult {
  /// **CheckChatUsernameResultPublicGroupsUnavailable** *(checkChatUsernameResultPublicGroupsUnavailable)* - child of CheckChatUsernameResult
  ///
  /// The user can't be a member of a public supergroup.
  const CheckChatUsernameResultPublicGroupsUnavailable({
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
  factory CheckChatUsernameResultPublicGroupsUnavailable.fromJson(
          Map<String, dynamic> json) =>
      CheckChatUsernameResultPublicGroupsUnavailable(
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
  CheckChatUsernameResultPublicGroupsUnavailable copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CheckChatUsernameResultPublicGroupsUnavailable(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkChatUsernameResultPublicGroupsUnavailable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
