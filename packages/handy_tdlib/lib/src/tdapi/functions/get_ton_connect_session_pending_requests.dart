part of '../tdapi.dart';

/// **GetTonConnectSessionPendingRequests** *(getTonConnectSessionPendingRequests)* - TDLib function
///
/// Returns pending requests in a TON Connect session.
///
/// * [sessionId]: Unique identifier of the session.
///
/// [TonConnectRequests] is returned on completion.
final class GetTonConnectSessionPendingRequests extends TdFunction {
  /// **GetTonConnectSessionPendingRequests** *(getTonConnectSessionPendingRequests)* - TDLib function
  ///
  /// Returns pending requests in a TON Connect session.
  ///
  /// * [sessionId]: Unique identifier of the session.
  ///
  /// [TonConnectRequests] is returned on completion.
  const GetTonConnectSessionPendingRequests({
    required this.sessionId,
  });

  /// Unique identifier of the session
  final int sessionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session
  GetTonConnectSessionPendingRequests copyWith({
    int? sessionId,
  }) =>
      GetTonConnectSessionPendingRequests(
        sessionId: sessionId ?? this.sessionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonConnectSessionPendingRequests';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
