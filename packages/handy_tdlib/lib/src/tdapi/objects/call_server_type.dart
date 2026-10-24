part of '../tdapi.dart';

/// **CallServerType** *(callServerType)* - parent
///
/// Describes the type of call server.
sealed class CallServerType extends TdObject {
  /// **CallServerType** *(callServerType)* - parent
  ///
  /// Describes the type of call server.
  const CallServerType();

  /// a CallServerType return type can be :
  /// * [CallServerTypeTelegramReflector]
  /// * [CallServerTypeWebrtc]
  factory CallServerType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CallServerTypeTelegramReflector.defaultObjectId:
        return CallServerTypeTelegramReflector.fromJson(json);
      case CallServerTypeWebrtc.defaultObjectId:
        return CallServerTypeWebrtc.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CallServerType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CallServerType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'callServerType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallServerTypeTelegramReflector** *(callServerTypeTelegramReflector)* - child of CallServerType
///
/// A Telegram call reflector.
///
/// * [peerTag]: A peer tag to be used with the reflector.
/// * [isTcp]: True, if the server uses TCP instead of UDP.
final class CallServerTypeTelegramReflector extends CallServerType {
  /// **CallServerTypeTelegramReflector** *(callServerTypeTelegramReflector)* - child of CallServerType
  ///
  /// A Telegram call reflector.
  ///
  /// * [peerTag]: A peer tag to be used with the reflector.
  /// * [isTcp]: True, if the server uses TCP instead of UDP.
  const CallServerTypeTelegramReflector({
    required this.peerTag,
    required this.isTcp,
  });

  /// A peer tag to be used with the reflector
  final String peerTag;

  /// True, if the server uses TCP instead of UDP
  final bool isTcp;

  /// Parse from a json
  factory CallServerTypeTelegramReflector.fromJson(Map<String, dynamic> json) =>
      CallServerTypeTelegramReflector(
        peerTag: json['peer_tag'],
        isTcp: json['is_tcp'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "peer_tag": peerTag,
      "is_tcp": isTcp,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [peer_tag]: A peer tag to be used with the reflector
  /// * [is_tcp]: True, if the server uses TCP instead of UDP
  @override
  CallServerTypeTelegramReflector copyWith({
    String? peerTag,
    bool? isTcp,
  }) =>
      CallServerTypeTelegramReflector(
        peerTag: peerTag ?? this.peerTag,
        isTcp: isTcp ?? this.isTcp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callServerTypeTelegramReflector';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CallServerTypeWebrtc** *(callServerTypeWebrtc)* - child of CallServerType
///
/// A WebRTC server.
///
/// * [username]: Username to be used for authentication.
/// * [password]: Authentication password.
/// * [supportsTurn]: True, if the server supports TURN.
/// * [supportsStun]: True, if the server supports STUN.
final class CallServerTypeWebrtc extends CallServerType {
  /// **CallServerTypeWebrtc** *(callServerTypeWebrtc)* - child of CallServerType
  ///
  /// A WebRTC server.
  ///
  /// * [username]: Username to be used for authentication.
  /// * [password]: Authentication password.
  /// * [supportsTurn]: True, if the server supports TURN.
  /// * [supportsStun]: True, if the server supports STUN.
  const CallServerTypeWebrtc({
    required this.username,
    required this.password,
    required this.supportsTurn,
    required this.supportsStun,
  });

  /// Username to be used for authentication
  final String username;

  /// Authentication password
  final String password;

  /// True, if the server supports TURN
  final bool supportsTurn;

  /// True, if the server supports STUN
  final bool supportsStun;

  /// Parse from a json
  factory CallServerTypeWebrtc.fromJson(Map<String, dynamic> json) =>
      CallServerTypeWebrtc(
        username: json['username'],
        password: json['password'],
        supportsTurn: json['supports_turn'],
        supportsStun: json['supports_stun'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "username": username,
      "password": password,
      "supports_turn": supportsTurn,
      "supports_stun": supportsStun,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: Username to be used for authentication
  /// * [password]: Authentication password
  /// * [supports_turn]: True, if the server supports TURN
  /// * [supports_stun]: True, if the server supports STUN
  @override
  CallServerTypeWebrtc copyWith({
    String? username,
    String? password,
    bool? supportsTurn,
    bool? supportsStun,
  }) =>
      CallServerTypeWebrtc(
        username: username ?? this.username,
        password: password ?? this.password,
        supportsTurn: supportsTurn ?? this.supportsTurn,
        supportsStun: supportsStun ?? this.supportsStun,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callServerTypeWebrtc';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
