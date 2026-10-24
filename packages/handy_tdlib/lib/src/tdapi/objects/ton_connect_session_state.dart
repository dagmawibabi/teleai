part of '../tdapi.dart';

/// **TonConnectSessionState** *(tonConnectSessionState)* - parent
///
/// Describes state of a TON Connect session.
sealed class TonConnectSessionState extends TdObject {
  /// **TonConnectSessionState** *(tonConnectSessionState)* - parent
  ///
  /// Describes state of a TON Connect session.
  const TonConnectSessionState();

  /// a TonConnectSessionState return type can be :
  /// * [TonConnectSessionStatePending]
  /// * [TonConnectSessionStateReady]
  /// * [TonConnectSessionStateClosing]
  /// * [TonConnectSessionStateClosed]
  factory TonConnectSessionState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonConnectSessionStatePending.defaultObjectId:
        return TonConnectSessionStatePending.fromJson(json);
      case TonConnectSessionStateReady.defaultObjectId:
        return TonConnectSessionStateReady.fromJson(json);
      case TonConnectSessionStateClosing.defaultObjectId:
        return TonConnectSessionStateClosing.fromJson(json);
      case TonConnectSessionStateClosed.defaultObjectId:
        return TonConnectSessionStateClosed.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonConnectSessionState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonConnectSessionState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectSessionStatePending** *(tonConnectSessionStatePending)* - child of TonConnectSessionState
///
/// The session is pending.
final class TonConnectSessionStatePending extends TonConnectSessionState {
  /// **TonConnectSessionStatePending** *(tonConnectSessionStatePending)* - child of TonConnectSessionState
  ///
  /// The session is pending.
  const TonConnectSessionStatePending();

  /// Parse from a json
  factory TonConnectSessionStatePending.fromJson(Map<String, dynamic> json) =>
      const TonConnectSessionStatePending();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectSessionStatePending copyWith() =>
      const TonConnectSessionStatePending();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectSessionStateReady** *(tonConnectSessionStateReady)* - child of TonConnectSessionState
///
/// The session is ready.
final class TonConnectSessionStateReady extends TonConnectSessionState {
  /// **TonConnectSessionStateReady** *(tonConnectSessionStateReady)* - child of TonConnectSessionState
  ///
  /// The session is ready.
  const TonConnectSessionStateReady();

  /// Parse from a json
  factory TonConnectSessionStateReady.fromJson(Map<String, dynamic> json) =>
      const TonConnectSessionStateReady();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectSessionStateReady copyWith() => const TonConnectSessionStateReady();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionStateReady';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectSessionStateClosing** *(tonConnectSessionStateClosing)* - child of TonConnectSessionState
///
/// The session is being closed.
final class TonConnectSessionStateClosing extends TonConnectSessionState {
  /// **TonConnectSessionStateClosing** *(tonConnectSessionStateClosing)* - child of TonConnectSessionState
  ///
  /// The session is being closed.
  const TonConnectSessionStateClosing();

  /// Parse from a json
  factory TonConnectSessionStateClosing.fromJson(Map<String, dynamic> json) =>
      const TonConnectSessionStateClosing();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectSessionStateClosing copyWith() =>
      const TonConnectSessionStateClosing();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionStateClosing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectSessionStateClosed** *(tonConnectSessionStateClosed)* - child of TonConnectSessionState
///
/// The session is closed.
final class TonConnectSessionStateClosed extends TonConnectSessionState {
  /// **TonConnectSessionStateClosed** *(tonConnectSessionStateClosed)* - child of TonConnectSessionState
  ///
  /// The session is closed.
  const TonConnectSessionStateClosed();

  /// Parse from a json
  factory TonConnectSessionStateClosed.fromJson(Map<String, dynamic> json) =>
      const TonConnectSessionStateClosed();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectSessionStateClosed copyWith() =>
      const TonConnectSessionStateClosed();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionStateClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
