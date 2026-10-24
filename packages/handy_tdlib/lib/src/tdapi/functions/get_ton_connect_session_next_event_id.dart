part of '../tdapi.dart';

/// **GetTonConnectSessionNextEventId** *(getTonConnectSessionNextEventId)* - TDLib function
///
/// Returns the next event identifier for the given TON Connect session.
///
/// * [sessionId]: Unique identifier of the TON Connect session.
///
/// [TonConnectSessionEventId] is returned on completion.
final class GetTonConnectSessionNextEventId extends TdFunction {
  /// **GetTonConnectSessionNextEventId** *(getTonConnectSessionNextEventId)* - TDLib function
  ///
  /// Returns the next event identifier for the given TON Connect session.
  ///
  /// * [sessionId]: Unique identifier of the TON Connect session.
  ///
  /// [TonConnectSessionEventId] is returned on completion.
  const GetTonConnectSessionNextEventId({
    required this.sessionId,
  });

  /// Unique identifier of the TON Connect session
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
  /// * [session_id]: Unique identifier of the TON Connect session
  GetTonConnectSessionNextEventId copyWith({
    int? sessionId,
  }) =>
      GetTonConnectSessionNextEventId(
        sessionId: sessionId ?? this.sessionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonConnectSessionNextEventId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
