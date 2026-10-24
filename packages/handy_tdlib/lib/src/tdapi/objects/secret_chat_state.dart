part of '../tdapi.dart';

/// **SecretChatState** *(secretChatState)* - parent
///
/// Describes the current secret chat state.
sealed class SecretChatState extends TdObject {
  /// **SecretChatState** *(secretChatState)* - parent
  ///
  /// Describes the current secret chat state.
  const SecretChatState();

  /// a SecretChatState return type can be :
  /// * [SecretChatStatePending]
  /// * [SecretChatStateReady]
  /// * [SecretChatStateClosed]
  factory SecretChatState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SecretChatStatePending.defaultObjectId:
        return SecretChatStatePending.fromJson(json);
      case SecretChatStateReady.defaultObjectId:
        return SecretChatStateReady.fromJson(json);
      case SecretChatStateClosed.defaultObjectId:
        return SecretChatStateClosed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SecretChatState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SecretChatState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'secretChatState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SecretChatStatePending** *(secretChatStatePending)* - child of SecretChatState
///
/// The secret chat is not yet created; waiting for the other user to get online.
final class SecretChatStatePending extends SecretChatState {
  /// **SecretChatStatePending** *(secretChatStatePending)* - child of SecretChatState
  ///
  /// The secret chat is not yet created; waiting for the other user to get online.
  const SecretChatStatePending();

  /// Parse from a json
  factory SecretChatStatePending.fromJson(Map<String, dynamic> json) =>
      const SecretChatStatePending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SecretChatStatePending copyWith() => const SecretChatStatePending();

  /// TDLib object type
  static const String defaultObjectId = 'secretChatStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SecretChatStateReady** *(secretChatStateReady)* - child of SecretChatState
///
/// The secret chat is ready to use.
final class SecretChatStateReady extends SecretChatState {
  /// **SecretChatStateReady** *(secretChatStateReady)* - child of SecretChatState
  ///
  /// The secret chat is ready to use.
  const SecretChatStateReady();

  /// Parse from a json
  factory SecretChatStateReady.fromJson(Map<String, dynamic> json) =>
      const SecretChatStateReady();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SecretChatStateReady copyWith() => const SecretChatStateReady();

  /// TDLib object type
  static const String defaultObjectId = 'secretChatStateReady';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SecretChatStateClosed** *(secretChatStateClosed)* - child of SecretChatState
///
/// The secret chat is closed.
final class SecretChatStateClosed extends SecretChatState {
  /// **SecretChatStateClosed** *(secretChatStateClosed)* - child of SecretChatState
  ///
  /// The secret chat is closed.
  const SecretChatStateClosed();

  /// Parse from a json
  factory SecretChatStateClosed.fromJson(Map<String, dynamic> json) =>
      const SecretChatStateClosed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  SecretChatStateClosed copyWith() => const SecretChatStateClosed();

  /// TDLib object type
  static const String defaultObjectId = 'secretChatStateClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
