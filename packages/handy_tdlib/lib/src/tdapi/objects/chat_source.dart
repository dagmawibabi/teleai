part of '../tdapi.dart';

/// **ChatSource** *(chatSource)* - parent
///
/// Describes a reason why an external chat is shown in a chat list.
sealed class ChatSource extends TdObject {
  /// **ChatSource** *(chatSource)* - parent
  ///
  /// Describes a reason why an external chat is shown in a chat list.
  const ChatSource();

  /// a ChatSource return type can be :
  /// * [ChatSourceMtprotoProxy]
  /// * [ChatSourcePublicServiceAnnouncement]
  factory ChatSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatSourceMtprotoProxy.defaultObjectId:
        return ChatSourceMtprotoProxy.fromJson(json);
      case ChatSourcePublicServiceAnnouncement.defaultObjectId:
        return ChatSourcePublicServiceAnnouncement.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatSourceMtprotoProxy** *(chatSourceMtprotoProxy)* - child of ChatSource
///
/// The chat is sponsored by the user's MTProxy server.
final class ChatSourceMtprotoProxy extends ChatSource {
  /// **ChatSourceMtprotoProxy** *(chatSourceMtprotoProxy)* - child of ChatSource
  ///
  /// The chat is sponsored by the user's MTProxy server.
  const ChatSourceMtprotoProxy();

  /// Parse from a json
  factory ChatSourceMtprotoProxy.fromJson(Map<String, dynamic> json) =>
      const ChatSourceMtprotoProxy();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatSourceMtprotoProxy copyWith() => const ChatSourceMtprotoProxy();

  /// TDLib object type
  static const String defaultObjectId = 'chatSourceMtprotoProxy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatSourcePublicServiceAnnouncement** *(chatSourcePublicServiceAnnouncement)* - child of ChatSource
///
/// The chat contains a public service announcement.
///
/// * [type]: The type of the announcement.
/// * [text]: The text of the announcement.
final class ChatSourcePublicServiceAnnouncement extends ChatSource {
  /// **ChatSourcePublicServiceAnnouncement** *(chatSourcePublicServiceAnnouncement)* - child of ChatSource
  ///
  /// The chat contains a public service announcement.
  ///
  /// * [type]: The type of the announcement.
  /// * [text]: The text of the announcement.
  const ChatSourcePublicServiceAnnouncement({
    required this.type,
    required this.text,
  });

  /// The type of the announcement
  final String type;

  /// The text of the announcement
  final String text;

  /// Parse from a json
  factory ChatSourcePublicServiceAnnouncement.fromJson(
          Map<String, dynamic> json) =>
      ChatSourcePublicServiceAnnouncement(
        type: json['type'],
        text: json['text'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type,
      "text": text,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: The type of the announcement
  /// * [text]: The text of the announcement
  @override
  ChatSourcePublicServiceAnnouncement copyWith({
    String? type,
    String? text,
  }) =>
      ChatSourcePublicServiceAnnouncement(
        type: type ?? this.type,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatSourcePublicServiceAnnouncement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
