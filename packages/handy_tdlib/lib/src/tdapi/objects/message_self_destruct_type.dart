part of '../tdapi.dart';

/// **MessageSelfDestructType** *(messageSelfDestructType)* - parent
///
/// Describes when a message will be self-destructed.
sealed class MessageSelfDestructType extends TdObject {
  /// **MessageSelfDestructType** *(messageSelfDestructType)* - parent
  ///
  /// Describes when a message will be self-destructed.
  const MessageSelfDestructType();

  /// a MessageSelfDestructType return type can be :
  /// * [MessageSelfDestructTypeTimer]
  /// * [MessageSelfDestructTypeImmediately]
  factory MessageSelfDestructType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageSelfDestructTypeTimer.defaultObjectId:
        return MessageSelfDestructTypeTimer.fromJson(json);
      case MessageSelfDestructTypeImmediately.defaultObjectId:
        return MessageSelfDestructTypeImmediately.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageSelfDestructType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageSelfDestructType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageSelfDestructType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSelfDestructTypeTimer** *(messageSelfDestructTypeTimer)* - child of MessageSelfDestructType
///
/// The message will be self-destructed in the specified time after its content was opened.
///
/// * [selfDestructTime]: The message's self-destruct time, in seconds; must be between 0 and 60 in private chats.
final class MessageSelfDestructTypeTimer extends MessageSelfDestructType {
  /// **MessageSelfDestructTypeTimer** *(messageSelfDestructTypeTimer)* - child of MessageSelfDestructType
  ///
  /// The message will be self-destructed in the specified time after its content was opened.
  ///
  /// * [selfDestructTime]: The message's self-destruct time, in seconds; must be between 0 and 60 in private chats.
  const MessageSelfDestructTypeTimer({
    required this.selfDestructTime,
  });

  /// The message's self-destruct time, in seconds; must be between 0 and 60 in private chats
  final int selfDestructTime;

  /// Parse from a json
  factory MessageSelfDestructTypeTimer.fromJson(Map<String, dynamic> json) =>
      MessageSelfDestructTypeTimer(
        selfDestructTime: json['self_destruct_time'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "self_destruct_time": selfDestructTime,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [self_destruct_time]: The message's self-destruct time, in seconds; must be between 0 and 60 in private chats
  @override
  MessageSelfDestructTypeTimer copyWith({
    int? selfDestructTime,
  }) =>
      MessageSelfDestructTypeTimer(
        selfDestructTime: selfDestructTime ?? this.selfDestructTime,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageSelfDestructTypeTimer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageSelfDestructTypeImmediately** *(messageSelfDestructTypeImmediately)* - child of MessageSelfDestructType
///
/// The message can be opened only once and will be self-destructed once closed.
final class MessageSelfDestructTypeImmediately extends MessageSelfDestructType {
  /// **MessageSelfDestructTypeImmediately** *(messageSelfDestructTypeImmediately)* - child of MessageSelfDestructType
  ///
  /// The message can be opened only once and will be self-destructed once closed.
  const MessageSelfDestructTypeImmediately();

  /// Parse from a json
  factory MessageSelfDestructTypeImmediately.fromJson(
          Map<String, dynamic> json) =>
      const MessageSelfDestructTypeImmediately();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  MessageSelfDestructTypeImmediately copyWith() =>
      const MessageSelfDestructTypeImmediately();

  /// TDLib object type
  static const String defaultObjectId = 'messageSelfDestructTypeImmediately';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
