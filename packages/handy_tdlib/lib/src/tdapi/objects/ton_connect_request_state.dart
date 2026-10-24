part of '../tdapi.dart';

/// **TonConnectRequestState** *(tonConnectRequestState)* - parent
///
/// Describes state of a request received from a dApp through TON Connect.
sealed class TonConnectRequestState extends TdObject {
  /// **TonConnectRequestState** *(tonConnectRequestState)* - parent
  ///
  /// Describes state of a request received from a dApp through TON Connect.
  const TonConnectRequestState();

  /// a TonConnectRequestState return type can be :
  /// * [TonConnectRequestStatePending]
  /// * [TonConnectRequestStateAccepted]
  /// * [TonConnectRequestStateRejected]
  factory TonConnectRequestState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TonConnectRequestStatePending.defaultObjectId:
        return TonConnectRequestStatePending.fromJson(json);
      case TonConnectRequestStateAccepted.defaultObjectId:
        return TonConnectRequestStateAccepted.fromJson(json);
      case TonConnectRequestStateRejected.defaultObjectId:
        return TonConnectRequestStateRejected.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TonConnectRequestState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TonConnectRequestState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequestState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectRequestStatePending** *(tonConnectRequestStatePending)* - child of TonConnectRequestState
///
/// The request must be accepted or rejected if it isn't expired yet.
///
/// * [expirationDate]: Point in time (Unix timestamp) when the request will expire or has expired.
final class TonConnectRequestStatePending extends TonConnectRequestState {
  /// **TonConnectRequestStatePending** *(tonConnectRequestStatePending)* - child of TonConnectRequestState
  ///
  /// The request must be accepted or rejected if it isn't expired yet.
  ///
  /// * [expirationDate]: Point in time (Unix timestamp) when the request will expire or has expired.
  const TonConnectRequestStatePending({
    required this.expirationDate,
  });

  /// Point in time (Unix timestamp) when the request will expire or has expired
  final int expirationDate;

  /// Parse from a json
  factory TonConnectRequestStatePending.fromJson(Map<String, dynamic> json) =>
      TonConnectRequestStatePending(
        expirationDate: json['expiration_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "expiration_date": expirationDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [expiration_date]: Point in time (Unix timestamp) when the request will expire or has expired
  @override
  TonConnectRequestStatePending copyWith({
    int? expirationDate,
  }) =>
      TonConnectRequestStatePending(
        expirationDate: expirationDate ?? this.expirationDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequestStatePending';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectRequestStateAccepted** *(tonConnectRequestStateAccepted)* - child of TonConnectRequestState
///
/// The request was accepted.
final class TonConnectRequestStateAccepted extends TonConnectRequestState {
  /// **TonConnectRequestStateAccepted** *(tonConnectRequestStateAccepted)* - child of TonConnectRequestState
  ///
  /// The request was accepted.
  const TonConnectRequestStateAccepted();

  /// Parse from a json
  factory TonConnectRequestStateAccepted.fromJson(Map<String, dynamic> json) =>
      const TonConnectRequestStateAccepted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectRequestStateAccepted copyWith() =>
      const TonConnectRequestStateAccepted();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequestStateAccepted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TonConnectRequestStateRejected** *(tonConnectRequestStateRejected)* - child of TonConnectRequestState
///
/// The request was rejected.
final class TonConnectRequestStateRejected extends TonConnectRequestState {
  /// **TonConnectRequestStateRejected** *(tonConnectRequestStateRejected)* - child of TonConnectRequestState
  ///
  /// The request was rejected.
  const TonConnectRequestStateRejected();

  /// Parse from a json
  factory TonConnectRequestStateRejected.fromJson(Map<String, dynamic> json) =>
      const TonConnectRequestStateRejected();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TonConnectRequestStateRejected copyWith() =>
      const TonConnectRequestStateRejected();

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequestStateRejected';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
