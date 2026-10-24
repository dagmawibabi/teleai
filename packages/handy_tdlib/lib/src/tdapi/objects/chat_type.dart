part of '../tdapi.dart';

/// **ChatType** *(chatType)* - parent
///
/// Describes the type of chat.
sealed class ChatType extends TdObject {
  /// **ChatType** *(chatType)* - parent
  ///
  /// Describes the type of chat.
  const ChatType();

  /// a ChatType return type can be :
  /// * [ChatTypePrivate]
  /// * [ChatTypeBasicGroup]
  /// * [ChatTypeSupergroup]
  /// * [ChatTypeSecret]
  factory ChatType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatTypePrivate.defaultObjectId:
        return ChatTypePrivate.fromJson(json);
      case ChatTypeBasicGroup.defaultObjectId:
        return ChatTypeBasicGroup.fromJson(json);
      case ChatTypeSupergroup.defaultObjectId:
        return ChatTypeSupergroup.fromJson(json);
      case ChatTypeSecret.defaultObjectId:
        return ChatTypeSecret.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatTypePrivate** *(chatTypePrivate)* - child of ChatType
///
/// An ordinary chat with a user.
///
/// * [userId]: User identifier.
final class ChatTypePrivate extends ChatType {
  /// **ChatTypePrivate** *(chatTypePrivate)* - child of ChatType
  ///
  /// An ordinary chat with a user.
  ///
  /// * [userId]: User identifier.
  const ChatTypePrivate({
    required this.userId,
  });

  /// User identifier
  final int userId;

  /// Parse from a json
  factory ChatTypePrivate.fromJson(Map<String, dynamic> json) =>
      ChatTypePrivate(
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  @override
  ChatTypePrivate copyWith({
    int? userId,
  }) =>
      ChatTypePrivate(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatTypePrivate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatTypeBasicGroup** *(chatTypeBasicGroup)* - child of ChatType
///
/// A basic group (a chat with 0-200 other users).
///
/// * [basicGroupId]: Basic group identifier.
final class ChatTypeBasicGroup extends ChatType {
  /// **ChatTypeBasicGroup** *(chatTypeBasicGroup)* - child of ChatType
  ///
  /// A basic group (a chat with 0-200 other users).
  ///
  /// * [basicGroupId]: Basic group identifier.
  const ChatTypeBasicGroup({
    required this.basicGroupId,
  });

  /// Basic group identifier
  final int basicGroupId;

  /// Parse from a json
  factory ChatTypeBasicGroup.fromJson(Map<String, dynamic> json) =>
      ChatTypeBasicGroup(
        basicGroupId: json['basic_group_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "basic_group_id": basicGroupId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [basic_group_id]: Basic group identifier
  @override
  ChatTypeBasicGroup copyWith({
    int? basicGroupId,
  }) =>
      ChatTypeBasicGroup(
        basicGroupId: basicGroupId ?? this.basicGroupId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatTypeBasicGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatTypeSupergroup** *(chatTypeSupergroup)* - child of ChatType
///
/// A supergroup or channel (with unlimited members).
///
/// * [supergroupId]: Supergroup or channel identifier.
/// * [isChannel]: True, if the supergroup is a channel.
final class ChatTypeSupergroup extends ChatType {
  /// **ChatTypeSupergroup** *(chatTypeSupergroup)* - child of ChatType
  ///
  /// A supergroup or channel (with unlimited members).
  ///
  /// * [supergroupId]: Supergroup or channel identifier.
  /// * [isChannel]: True, if the supergroup is a channel.
  const ChatTypeSupergroup({
    required this.supergroupId,
    required this.isChannel,
  });

  /// Supergroup or channel identifier
  final int supergroupId;

  /// True, if the supergroup is a channel
  final bool isChannel;

  /// Parse from a json
  factory ChatTypeSupergroup.fromJson(Map<String, dynamic> json) =>
      ChatTypeSupergroup(
        supergroupId: json['supergroup_id'],
        isChannel: json['is_channel'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "is_channel": isChannel,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Supergroup or channel identifier
  /// * [is_channel]: True, if the supergroup is a channel
  @override
  ChatTypeSupergroup copyWith({
    int? supergroupId,
    bool? isChannel,
  }) =>
      ChatTypeSupergroup(
        supergroupId: supergroupId ?? this.supergroupId,
        isChannel: isChannel ?? this.isChannel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatTypeSupergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatTypeSecret** *(chatTypeSecret)* - child of ChatType
///
/// A secret chat with a user.
///
/// * [secretChatId]: Secret chat identifier.
/// * [userId]: User identifier of the other user in the secret chat.
final class ChatTypeSecret extends ChatType {
  /// **ChatTypeSecret** *(chatTypeSecret)* - child of ChatType
  ///
  /// A secret chat with a user.
  ///
  /// * [secretChatId]: Secret chat identifier.
  /// * [userId]: User identifier of the other user in the secret chat.
  const ChatTypeSecret({
    required this.secretChatId,
    required this.userId,
  });

  /// Secret chat identifier
  final int secretChatId;

  /// User identifier of the other user in the secret chat
  final int userId;

  /// Parse from a json
  factory ChatTypeSecret.fromJson(Map<String, dynamic> json) => ChatTypeSecret(
        secretChatId: json['secret_chat_id'],
        userId: json['user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "secret_chat_id": secretChatId,
      "user_id": userId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [secret_chat_id]: Secret chat identifier
  /// * [user_id]: User identifier of the other user in the secret chat
  @override
  ChatTypeSecret copyWith({
    int? secretChatId,
    int? userId,
  }) =>
      ChatTypeSecret(
        secretChatId: secretChatId ?? this.secretChatId,
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatTypeSecret';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
