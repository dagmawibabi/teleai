part of '../tdapi.dart';

/// **SessionType** *(sessionType)* - parent
///
/// Describes type of user session.
sealed class SessionType extends TdObject {
  /// **SessionType** *(sessionType)* - parent
  ///
  /// Describes type of user session.
  const SessionType();

  /// a SessionType return type can be :
  /// * [SessionTypeDevice]
  /// * [SessionTypeConnectedBot]
  factory SessionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case SessionTypeDevice.defaultObjectId:
        return SessionTypeDevice.fromJson(json);
      case SessionTypeConnectedBot.defaultObjectId:
        return SessionTypeConnectedBot.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of SessionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  SessionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'sessionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionTypeDevice** *(sessionTypeDevice)* - child of SessionType
///
/// A regular session from a device.
///
/// * [sessionId]: Unique identifier of the session. Use terminateSession to terminate it or confirmSession to confirm it if it isn't confirmed yet.
final class SessionTypeDevice extends SessionType {
  /// **SessionTypeDevice** *(sessionTypeDevice)* - child of SessionType
  ///
  /// A regular session from a device.
  ///
  /// * [sessionId]: Unique identifier of the session. Use terminateSession to terminate it or confirmSession to confirm it if it isn't confirmed yet.
  const SessionTypeDevice({
    required this.sessionId,
  });

  /// Unique identifier of the session. Use terminateSession to terminate it or confirmSession to confirm it if it isn't confirmed yet
  final int sessionId;

  /// Parse from a json
  factory SessionTypeDevice.fromJson(Map<String, dynamic> json) =>
      SessionTypeDevice(
        sessionId: json['session_id'] is int
            ? json['session_id']
            : int.parse(json['session_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session. Use terminateSession to terminate it or confirmSession to confirm it if it isn't confirmed yet
  @override
  SessionTypeDevice copyWith({
    int? sessionId,
  }) =>
      SessionTypeDevice(
        sessionId: sessionId ?? this.sessionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sessionTypeDevice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **SessionTypeConnectedBot** *(sessionTypeConnectedBot)* - child of SessionType
///
/// A business bot connected to the current user's account.
///
/// * [botUserId]: User identifier of the bot. Use deleteBusinessConnectedBot to remove it or confirmBusinessConnectedBot to confirm it if it isn't confirmed yet.
final class SessionTypeConnectedBot extends SessionType {
  /// **SessionTypeConnectedBot** *(sessionTypeConnectedBot)* - child of SessionType
  ///
  /// A business bot connected to the current user's account.
  ///
  /// * [botUserId]: User identifier of the bot. Use deleteBusinessConnectedBot to remove it or confirmBusinessConnectedBot to confirm it if it isn't confirmed yet.
  const SessionTypeConnectedBot({
    required this.botUserId,
  });

  /// User identifier of the bot. Use deleteBusinessConnectedBot to remove it or confirmBusinessConnectedBot to confirm it if it isn't confirmed yet
  final int botUserId;

  /// Parse from a json
  factory SessionTypeConnectedBot.fromJson(Map<String, dynamic> json) =>
      SessionTypeConnectedBot(
        botUserId: json['bot_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot. Use deleteBusinessConnectedBot to remove it or confirmBusinessConnectedBot to confirm it if it isn't confirmed yet
  @override
  SessionTypeConnectedBot copyWith({
    int? botUserId,
  }) =>
      SessionTypeConnectedBot(
        botUserId: botUserId ?? this.botUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sessionTypeConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
