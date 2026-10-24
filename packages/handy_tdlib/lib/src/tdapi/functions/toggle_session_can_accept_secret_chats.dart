part of '../tdapi.dart';

/// **ToggleSessionCanAcceptSecretChats** *(toggleSessionCanAcceptSecretChats)* - TDLib function
///
/// Toggles whether a session can accept incoming secret chats.
///
/// * [sessionId]: Session identifier.
/// * [canAcceptSecretChats]: Pass true to allow accepting secret chats by the session; pass false otherwise.
///
/// [Ok] is returned on completion.
final class ToggleSessionCanAcceptSecretChats extends TdFunction {
  /// **ToggleSessionCanAcceptSecretChats** *(toggleSessionCanAcceptSecretChats)* - TDLib function
  ///
  /// Toggles whether a session can accept incoming secret chats.
  ///
  /// * [sessionId]: Session identifier.
  /// * [canAcceptSecretChats]: Pass true to allow accepting secret chats by the session; pass false otherwise.
  ///
  /// [Ok] is returned on completion.
  const ToggleSessionCanAcceptSecretChats({
    required this.sessionId,
    required this.canAcceptSecretChats,
  });

  /// Session identifier
  final int sessionId;

  /// Pass true to allow accepting secret chats by the session; pass false otherwise
  final bool canAcceptSecretChats;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "can_accept_secret_chats": canAcceptSecretChats,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Session identifier
  /// * [can_accept_secret_chats]: Pass true to allow accepting secret chats by the session; pass false otherwise
  ToggleSessionCanAcceptSecretChats copyWith({
    int? sessionId,
    bool? canAcceptSecretChats,
  }) =>
      ToggleSessionCanAcceptSecretChats(
        sessionId: sessionId ?? this.sessionId,
        canAcceptSecretChats: canAcceptSecretChats ?? this.canAcceptSecretChats,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSessionCanAcceptSecretChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
