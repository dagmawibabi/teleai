part of '../tdapi.dart';

/// **CanTransferOwnershipResult** *(canTransferOwnershipResult)* - parent
///
/// Represents result of checking whether the current session can be used to transfer a chat ownership to another user.
sealed class CanTransferOwnershipResult extends TdObject {
  /// **CanTransferOwnershipResult** *(canTransferOwnershipResult)* - parent
  ///
  /// Represents result of checking whether the current session can be used to transfer a chat ownership to another user.
  const CanTransferOwnershipResult();

  /// a CanTransferOwnershipResult return type can be :
  /// * [CanTransferOwnershipResultOk]
  /// * [CanTransferOwnershipResultPasswordNeeded]
  /// * [CanTransferOwnershipResultPasswordTooFresh]
  /// * [CanTransferOwnershipResultSessionTooFresh]
  factory CanTransferOwnershipResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CanTransferOwnershipResultOk.defaultObjectId:
        return CanTransferOwnershipResultOk.fromJson(json);
      case CanTransferOwnershipResultPasswordNeeded.defaultObjectId:
        return CanTransferOwnershipResultPasswordNeeded.fromJson(json);
      case CanTransferOwnershipResultPasswordTooFresh.defaultObjectId:
        return CanTransferOwnershipResultPasswordTooFresh.fromJson(json);
      case CanTransferOwnershipResultSessionTooFresh.defaultObjectId:
        return CanTransferOwnershipResultSessionTooFresh.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CanTransferOwnershipResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CanTransferOwnershipResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'canTransferOwnershipResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanTransferOwnershipResultOk** *(canTransferOwnershipResultOk)* - child of CanTransferOwnershipResult
///
/// The session can be used.
final class CanTransferOwnershipResultOk extends CanTransferOwnershipResult {
  /// **CanTransferOwnershipResultOk** *(canTransferOwnershipResultOk)* - child of CanTransferOwnershipResult
  ///
  /// The session can be used.
  const CanTransferOwnershipResultOk({
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
  factory CanTransferOwnershipResultOk.fromJson(Map<String, dynamic> json) =>
      CanTransferOwnershipResultOk(
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
  CanTransferOwnershipResultOk copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanTransferOwnershipResultOk(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canTransferOwnershipResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanTransferOwnershipResultPasswordNeeded** *(canTransferOwnershipResultPasswordNeeded)* - child of CanTransferOwnershipResult
///
/// The 2-step verification needs to be enabled first.
final class CanTransferOwnershipResultPasswordNeeded
    extends CanTransferOwnershipResult {
  /// **CanTransferOwnershipResultPasswordNeeded** *(canTransferOwnershipResultPasswordNeeded)* - child of CanTransferOwnershipResult
  ///
  /// The 2-step verification needs to be enabled first.
  const CanTransferOwnershipResultPasswordNeeded({
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
  factory CanTransferOwnershipResultPasswordNeeded.fromJson(
          Map<String, dynamic> json) =>
      CanTransferOwnershipResultPasswordNeeded(
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
  CanTransferOwnershipResultPasswordNeeded copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      CanTransferOwnershipResultPasswordNeeded(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canTransferOwnershipResultPasswordNeeded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanTransferOwnershipResultPasswordTooFresh** *(canTransferOwnershipResultPasswordTooFresh)* - child of CanTransferOwnershipResult
///
/// The 2-step verification was enabled recently, user needs to wait.
///
/// * [retryAfter]: Time left before the session can be used to transfer ownership of a chat, in seconds.
final class CanTransferOwnershipResultPasswordTooFresh
    extends CanTransferOwnershipResult {
  /// **CanTransferOwnershipResultPasswordTooFresh** *(canTransferOwnershipResultPasswordTooFresh)* - child of CanTransferOwnershipResult
  ///
  /// The 2-step verification was enabled recently, user needs to wait.
  ///
  /// * [retryAfter]: Time left before the session can be used to transfer ownership of a chat, in seconds.
  const CanTransferOwnershipResultPasswordTooFresh({
    required this.retryAfter,
    this.extra,
    this.clientId,
  });

  /// Time left before the session can be used to transfer ownership of a chat, in seconds
  final int retryAfter;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CanTransferOwnershipResultPasswordTooFresh.fromJson(
          Map<String, dynamic> json) =>
      CanTransferOwnershipResultPasswordTooFresh(
        retryAfter: json['retry_after'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "retry_after": retryAfter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [retry_after]: Time left before the session can be used to transfer ownership of a chat, in seconds
  @override
  CanTransferOwnershipResultPasswordTooFresh copyWith({
    int? retryAfter,
    dynamic extra,
    int? clientId,
  }) =>
      CanTransferOwnershipResultPasswordTooFresh(
        retryAfter: retryAfter ?? this.retryAfter,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canTransferOwnershipResultPasswordTooFresh';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CanTransferOwnershipResultSessionTooFresh** *(canTransferOwnershipResultSessionTooFresh)* - child of CanTransferOwnershipResult
///
/// The session was created recently, user needs to wait.
///
/// * [retryAfter]: Time left before the session can be used to transfer ownership of a chat, in seconds.
final class CanTransferOwnershipResultSessionTooFresh
    extends CanTransferOwnershipResult {
  /// **CanTransferOwnershipResultSessionTooFresh** *(canTransferOwnershipResultSessionTooFresh)* - child of CanTransferOwnershipResult
  ///
  /// The session was created recently, user needs to wait.
  ///
  /// * [retryAfter]: Time left before the session can be used to transfer ownership of a chat, in seconds.
  const CanTransferOwnershipResultSessionTooFresh({
    required this.retryAfter,
    this.extra,
    this.clientId,
  });

  /// Time left before the session can be used to transfer ownership of a chat, in seconds
  final int retryAfter;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CanTransferOwnershipResultSessionTooFresh.fromJson(
          Map<String, dynamic> json) =>
      CanTransferOwnershipResultSessionTooFresh(
        retryAfter: json['retry_after'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "retry_after": retryAfter,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [retry_after]: Time left before the session can be used to transfer ownership of a chat, in seconds
  @override
  CanTransferOwnershipResultSessionTooFresh copyWith({
    int? retryAfter,
    dynamic extra,
    int? clientId,
  }) =>
      CanTransferOwnershipResultSessionTooFresh(
        retryAfter: retryAfter ?? this.retryAfter,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'canTransferOwnershipResultSessionTooFresh';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
