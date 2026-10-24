part of '../tdapi.dart';

/// **CallState** *(callState)* - parent
///
/// Describes the current call state.
sealed class CallState extends TdObject {
  /// **CallState** *(callState)* - parent
  ///
  /// Describes the current call state.
  const CallState();

  /// a CallState return type can be :
  /// * [CallStatePending]
  /// * [CallStateExchangingKeys]
  /// * [CallStateReady]
  /// * [CallStateHangingUp]
  /// * [CallStateDiscarded]
  /// * [CallStateError]
  factory CallState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CallStatePending.defaultObjectId:
        return CallStatePending.fromJson(json);
      case CallStateExchangingKeys.defaultObjectId:
        return CallStateExchangingKeys.fromJson(json);
      case CallStateReady.defaultObjectId:
        return CallStateReady.fromJson(json);
      case CallStateHangingUp.defaultObjectId:
        return CallStateHangingUp.fromJson(json);
      case CallStateDiscarded.defaultObjectId:
        return CallStateDiscarded.fromJson(json);
      case CallStateError.defaultObjectId:
        return CallStateError.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CallState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CallState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'callState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStatePending** *(callStatePending)* - child of CallState
///
/// The call is pending, waiting to be accepted by a user.
///
/// * [isCreated]: True, if the call has already been created by the server.
/// * [isReceived]: True, if the call has already been received by the other party.
final class CallStatePending extends CallState {
  /// **CallStatePending** *(callStatePending)* - child of CallState
  ///
  /// The call is pending, waiting to be accepted by a user.
  ///
  /// * [isCreated]: True, if the call has already been created by the server.
  /// * [isReceived]: True, if the call has already been received by the other party.
  const CallStatePending({
    required this.isCreated,
    required this.isReceived,
  });

  /// True, if the call has already been created by the server
  final bool isCreated;

  /// True, if the call has already been received by the other party
  final bool isReceived;

  /// Parse from a json
  factory CallStatePending.fromJson(Map<String, dynamic> json) =>
      CallStatePending(
        isCreated: json['is_created'],
        isReceived: json['is_received'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_created": isCreated,
      "is_received": isReceived,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_created]: True, if the call has already been created by the server
  /// * [is_received]: True, if the call has already been received by the other party
  @override
  CallStatePending copyWith({
    bool? isCreated,
    bool? isReceived,
  }) =>
      CallStatePending(
        isCreated: isCreated ?? this.isCreated,
        isReceived: isReceived ?? this.isReceived,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStateExchangingKeys** *(callStateExchangingKeys)* - child of CallState
///
/// The call has been answered and encryption keys are being exchanged.
final class CallStateExchangingKeys extends CallState {
  /// **CallStateExchangingKeys** *(callStateExchangingKeys)* - child of CallState
  ///
  /// The call has been answered and encryption keys are being exchanged.
  const CallStateExchangingKeys();

  /// Parse from a json
  factory CallStateExchangingKeys.fromJson(Map<String, dynamic> json) =>
      const CallStateExchangingKeys();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallStateExchangingKeys copyWith() => const CallStateExchangingKeys();

  /// TDLib object type
  static const String defaultObjectId = 'callStateExchangingKeys';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStateReady** *(callStateReady)* - child of CallState
///
/// The call is ready to use.
///
/// * [protocol]: Call protocols supported by the other call participant.
/// * [servers]: List of available call servers.
/// * [config]: A JSON-encoded call config.
/// * [encryptionKey]: Call encryption key.
/// * [emojis]: Encryption key fingerprint represented as 4 emoji.
/// * [allowP2p]: True, if peer-to-peer connection is allowed by users privacy settings.
/// * [isGroupCallSupported]: True, if the other party supports upgrading of the call to a group call.
/// * [customParameters]: Custom JSON-encoded call parameters to be passed to tgcalls.
final class CallStateReady extends CallState {
  /// **CallStateReady** *(callStateReady)* - child of CallState
  ///
  /// The call is ready to use.
  ///
  /// * [protocol]: Call protocols supported by the other call participant.
  /// * [servers]: List of available call servers.
  /// * [config]: A JSON-encoded call config.
  /// * [encryptionKey]: Call encryption key.
  /// * [emojis]: Encryption key fingerprint represented as 4 emoji.
  /// * [allowP2p]: True, if peer-to-peer connection is allowed by users privacy settings.
  /// * [isGroupCallSupported]: True, if the other party supports upgrading of the call to a group call.
  /// * [customParameters]: Custom JSON-encoded call parameters to be passed to tgcalls.
  const CallStateReady({
    required this.protocol,
    required this.servers,
    required this.config,
    required this.encryptionKey,
    required this.emojis,
    required this.allowP2p,
    required this.isGroupCallSupported,
    required this.customParameters,
  });

  /// Call protocols supported by the other call participant
  final CallProtocol protocol;

  /// List of available call servers
  final List<CallServer> servers;

  /// A JSON-encoded call config
  final String config;

  /// Call encryption key
  final String encryptionKey;

  /// Encryption key fingerprint represented as 4 emoji
  final List<String> emojis;

  /// True, if peer-to-peer connection is allowed by users privacy settings
  final bool allowP2p;

  /// True, if the other party supports upgrading of the call to a group call
  final bool isGroupCallSupported;

  /// Custom JSON-encoded call parameters to be passed to tgcalls
  final String customParameters;

  /// Parse from a json
  factory CallStateReady.fromJson(Map<String, dynamic> json) => CallStateReady(
        protocol: CallProtocol.fromJson(json['protocol']),
        servers: List<CallServer>.from((json['servers'] ?? [])
            .map((item) => CallServer.fromJson(item))
            .toList()),
        config: json['config'],
        encryptionKey: json['encryption_key'],
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        allowP2p: json['allow_p2p'],
        isGroupCallSupported: json['is_group_call_supported'],
        customParameters: json['custom_parameters'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "protocol": protocol.toJson(),
      "servers": servers.map((i) => i.toJson()).toList(),
      "config": config,
      "encryption_key": encryptionKey,
      "emojis": emojis.map((i) => i).toList(),
      "allow_p2p": allowP2p,
      "is_group_call_supported": isGroupCallSupported,
      "custom_parameters": customParameters,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [protocol]: Call protocols supported by the other call participant
  /// * [servers]: List of available call servers
  /// * [config]: A JSON-encoded call config
  /// * [encryption_key]: Call encryption key
  /// * [emojis]: Encryption key fingerprint represented as 4 emoji
  /// * [allow_p2p]: True, if peer-to-peer connection is allowed by users privacy settings
  /// * [is_group_call_supported]: True, if the other party supports upgrading of the call to a group call
  /// * [custom_parameters]: Custom JSON-encoded call parameters to be passed to tgcalls
  @override
  CallStateReady copyWith({
    CallProtocol? protocol,
    List<CallServer>? servers,
    String? config,
    String? encryptionKey,
    List<String>? emojis,
    bool? allowP2p,
    bool? isGroupCallSupported,
    String? customParameters,
  }) =>
      CallStateReady(
        protocol: protocol ?? this.protocol,
        servers: servers ?? this.servers,
        config: config ?? this.config,
        encryptionKey: encryptionKey ?? this.encryptionKey,
        emojis: emojis ?? this.emojis,
        allowP2p: allowP2p ?? this.allowP2p,
        isGroupCallSupported: isGroupCallSupported ?? this.isGroupCallSupported,
        customParameters: customParameters ?? this.customParameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callStateReady';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStateHangingUp** *(callStateHangingUp)* - child of CallState
///
/// The call is hanging up after discardCall has been called.
final class CallStateHangingUp extends CallState {
  /// **CallStateHangingUp** *(callStateHangingUp)* - child of CallState
  ///
  /// The call is hanging up after discardCall has been called.
  const CallStateHangingUp();

  /// Parse from a json
  factory CallStateHangingUp.fromJson(Map<String, dynamic> json) =>
      const CallStateHangingUp();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CallStateHangingUp copyWith() => const CallStateHangingUp();

  /// TDLib object type
  static const String defaultObjectId = 'callStateHangingUp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStateDiscarded** *(callStateDiscarded)* - child of CallState
///
/// The call has ended successfully.
///
/// * [reason]: The reason why the call has ended.
/// * [needRating]: True, if the call rating must be sent to the server.
/// * [needDebugInformation]: True, if the call debug information must be sent to the server.
/// * [needLog]: True, if the call log must be sent to the server.
final class CallStateDiscarded extends CallState {
  /// **CallStateDiscarded** *(callStateDiscarded)* - child of CallState
  ///
  /// The call has ended successfully.
  ///
  /// * [reason]: The reason why the call has ended.
  /// * [needRating]: True, if the call rating must be sent to the server.
  /// * [needDebugInformation]: True, if the call debug information must be sent to the server.
  /// * [needLog]: True, if the call log must be sent to the server.
  const CallStateDiscarded({
    required this.reason,
    required this.needRating,
    required this.needDebugInformation,
    required this.needLog,
  });

  /// The reason why the call has ended
  final CallDiscardReason reason;

  /// True, if the call rating must be sent to the server
  final bool needRating;

  /// True, if the call debug information must be sent to the server
  final bool needDebugInformation;

  /// True, if the call log must be sent to the server
  final bool needLog;

  /// Parse from a json
  factory CallStateDiscarded.fromJson(Map<String, dynamic> json) =>
      CallStateDiscarded(
        reason: CallDiscardReason.fromJson(json['reason']),
        needRating: json['need_rating'],
        needDebugInformation: json['need_debug_information'],
        needLog: json['need_log'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reason": reason.toJson(),
      "need_rating": needRating,
      "need_debug_information": needDebugInformation,
      "need_log": needLog,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: The reason why the call has ended
  /// * [need_rating]: True, if the call rating must be sent to the server
  /// * [need_debug_information]: True, if the call debug information must be sent to the server
  /// * [need_log]: True, if the call log must be sent to the server
  @override
  CallStateDiscarded copyWith({
    CallDiscardReason? reason,
    bool? needRating,
    bool? needDebugInformation,
    bool? needLog,
  }) =>
      CallStateDiscarded(
        reason: reason ?? this.reason,
        needRating: needRating ?? this.needRating,
        needDebugInformation: needDebugInformation ?? this.needDebugInformation,
        needLog: needLog ?? this.needLog,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callStateDiscarded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallStateError** *(callStateError)* - child of CallState
///
/// The call has ended with an error.
///
/// * [error]: Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout.
final class CallStateError extends CallState {
  /// **CallStateError** *(callStateError)* - child of CallState
  ///
  /// The call has ended with an error.
  ///
  /// * [error]: Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout.
  const CallStateError({
    required this.error,
  });

  /// Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
  final TdError error;

  /// Parse from a json
  factory CallStateError.fromJson(Map<String, dynamic> json) => CallStateError(
        error: TdError.fromJson(json['error']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "error": error.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [error]: Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
  @override
  CallStateError copyWith({
    TdError? error,
  }) =>
      CallStateError(
        error: error ?? this.error,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callStateError';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
