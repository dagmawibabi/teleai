part of '../tdapi.dart';

/// **CallbackQueryPayload** *(callbackQueryPayload)* - parent
///
/// Represents a payload of a callback query.
sealed class CallbackQueryPayload extends TdObject {
  /// **CallbackQueryPayload** *(callbackQueryPayload)* - parent
  ///
  /// Represents a payload of a callback query.
  const CallbackQueryPayload();

  /// a CallbackQueryPayload return type can be :
  /// * [CallbackQueryPayloadData]
  /// * [CallbackQueryPayloadDataWithPassword]
  /// * [CallbackQueryPayloadGame]
  factory CallbackQueryPayload.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CallbackQueryPayloadData.defaultObjectId:
        return CallbackQueryPayloadData.fromJson(json);
      case CallbackQueryPayloadDataWithPassword.defaultObjectId:
        return CallbackQueryPayloadDataWithPassword.fromJson(json);
      case CallbackQueryPayloadGame.defaultObjectId:
        return CallbackQueryPayloadGame.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CallbackQueryPayload)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CallbackQueryPayload copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'callbackQueryPayload';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallbackQueryPayloadData** *(callbackQueryPayloadData)* - child of CallbackQueryPayload
///
/// The payload for a general callback button.
///
/// * [data]: Data that was attached to the callback button.
final class CallbackQueryPayloadData extends CallbackQueryPayload {
  /// **CallbackQueryPayloadData** *(callbackQueryPayloadData)* - child of CallbackQueryPayload
  ///
  /// The payload for a general callback button.
  ///
  /// * [data]: Data that was attached to the callback button.
  const CallbackQueryPayloadData({
    required this.data,
  });

  /// Data that was attached to the callback button
  final String data;

  /// Parse from a json
  factory CallbackQueryPayloadData.fromJson(Map<String, dynamic> json) =>
      CallbackQueryPayloadData(
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [data]: Data that was attached to the callback button
  @override
  CallbackQueryPayloadData copyWith({
    String? data,
  }) =>
      CallbackQueryPayloadData(
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callbackQueryPayloadData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallbackQueryPayloadDataWithPassword** *(callbackQueryPayloadDataWithPassword)* - child of CallbackQueryPayload
///
/// The payload for a callback button requiring password.
///
/// * [password]: The 2-step verification password for the current user.
/// * [data]: Data that was attached to the callback button.
final class CallbackQueryPayloadDataWithPassword extends CallbackQueryPayload {
  /// **CallbackQueryPayloadDataWithPassword** *(callbackQueryPayloadDataWithPassword)* - child of CallbackQueryPayload
  ///
  /// The payload for a callback button requiring password.
  ///
  /// * [password]: The 2-step verification password for the current user.
  /// * [data]: Data that was attached to the callback button.
  const CallbackQueryPayloadDataWithPassword({
    required this.password,
    required this.data,
  });

  /// The 2-step verification password for the current user
  final String password;

  /// Data that was attached to the callback button
  final String data;

  /// Parse from a json
  factory CallbackQueryPayloadDataWithPassword.fromJson(
          Map<String, dynamic> json) =>
      CallbackQueryPayloadDataWithPassword(
        password: json['password'],
        data: json['data'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "password": password,
      "data": data,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: The 2-step verification password for the current user
  /// * [data]: Data that was attached to the callback button
  @override
  CallbackQueryPayloadDataWithPassword copyWith({
    String? password,
    String? data,
  }) =>
      CallbackQueryPayloadDataWithPassword(
        password: password ?? this.password,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callbackQueryPayloadDataWithPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallbackQueryPayloadGame** *(callbackQueryPayloadGame)* - child of CallbackQueryPayload
///
/// The payload for a game callback button.
///
/// * [gameShortName]: A short name of the game that was attached to the callback button.
final class CallbackQueryPayloadGame extends CallbackQueryPayload {
  /// **CallbackQueryPayloadGame** *(callbackQueryPayloadGame)* - child of CallbackQueryPayload
  ///
  /// The payload for a game callback button.
  ///
  /// * [gameShortName]: A short name of the game that was attached to the callback button.
  const CallbackQueryPayloadGame({
    required this.gameShortName,
  });

  /// A short name of the game that was attached to the callback button
  final String gameShortName;

  /// Parse from a json
  factory CallbackQueryPayloadGame.fromJson(Map<String, dynamic> json) =>
      CallbackQueryPayloadGame(
        gameShortName: json['game_short_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "game_short_name": gameShortName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [game_short_name]: A short name of the game that was attached to the callback button
  @override
  CallbackQueryPayloadGame copyWith({
    String? gameShortName,
  }) =>
      CallbackQueryPayloadGame(
        gameShortName: gameShortName ?? this.gameShortName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callbackQueryPayloadGame';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
