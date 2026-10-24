part of '../tdapi.dart';

/// **ChatMembersFilter** *(chatMembersFilter)* - parent
///
/// Specifies the kind of chat members to return in searchChatMembers.
sealed class ChatMembersFilter extends TdObject {
  /// **ChatMembersFilter** *(chatMembersFilter)* - parent
  ///
  /// Specifies the kind of chat members to return in searchChatMembers.
  const ChatMembersFilter();

  /// a ChatMembersFilter return type can be :
  /// * [ChatMembersFilterContacts]
  /// * [ChatMembersFilterAdministrators]
  /// * [ChatMembersFilterMembers]
  /// * [ChatMembersFilterMention]
  /// * [ChatMembersFilterRestricted]
  /// * [ChatMembersFilterBanned]
  /// * [ChatMembersFilterBots]
  factory ChatMembersFilter.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatMembersFilterContacts.defaultObjectId:
        return ChatMembersFilterContacts.fromJson(json);
      case ChatMembersFilterAdministrators.defaultObjectId:
        return ChatMembersFilterAdministrators.fromJson(json);
      case ChatMembersFilterMembers.defaultObjectId:
        return ChatMembersFilterMembers.fromJson(json);
      case ChatMembersFilterMention.defaultObjectId:
        return ChatMembersFilterMention.fromJson(json);
      case ChatMembersFilterRestricted.defaultObjectId:
        return ChatMembersFilterRestricted.fromJson(json);
      case ChatMembersFilterBanned.defaultObjectId:
        return ChatMembersFilterBanned.fromJson(json);
      case ChatMembersFilterBots.defaultObjectId:
        return ChatMembersFilterBots.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatMembersFilter)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatMembersFilter copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilter';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterContacts** *(chatMembersFilterContacts)* - child of ChatMembersFilter
///
/// Returns contacts of the user.
final class ChatMembersFilterContacts extends ChatMembersFilter {
  /// **ChatMembersFilterContacts** *(chatMembersFilterContacts)* - child of ChatMembersFilter
  ///
  /// Returns contacts of the user.
  const ChatMembersFilterContacts();

  /// Parse from a json
  factory ChatMembersFilterContacts.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterContacts copyWith() => const ChatMembersFilterContacts();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterAdministrators** *(chatMembersFilterAdministrators)* - child of ChatMembersFilter
///
/// Returns the owner and administrators.
final class ChatMembersFilterAdministrators extends ChatMembersFilter {
  /// **ChatMembersFilterAdministrators** *(chatMembersFilterAdministrators)* - child of ChatMembersFilter
  ///
  /// Returns the owner and administrators.
  const ChatMembersFilterAdministrators();

  /// Parse from a json
  factory ChatMembersFilterAdministrators.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterAdministrators();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterAdministrators copyWith() =>
      const ChatMembersFilterAdministrators();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterAdministrators';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterMembers** *(chatMembersFilterMembers)* - child of ChatMembersFilter
///
/// Returns all chat members, including restricted chat members.
final class ChatMembersFilterMembers extends ChatMembersFilter {
  /// **ChatMembersFilterMembers** *(chatMembersFilterMembers)* - child of ChatMembersFilter
  ///
  /// Returns all chat members, including restricted chat members.
  const ChatMembersFilterMembers();

  /// Parse from a json
  factory ChatMembersFilterMembers.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterMembers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterMembers copyWith() => const ChatMembersFilterMembers();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterMention** *(chatMembersFilterMention)* - child of ChatMembersFilter
///
/// Returns users who can be mentioned in the chat.
///
/// * [topicId]: Identifier of the topic in which the users will be mentioned; pass null if none *(optional)*.
final class ChatMembersFilterMention extends ChatMembersFilter {
  /// **ChatMembersFilterMention** *(chatMembersFilterMention)* - child of ChatMembersFilter
  ///
  /// Returns users who can be mentioned in the chat.
  ///
  /// * [topicId]: Identifier of the topic in which the users will be mentioned; pass null if none *(optional)*.
  const ChatMembersFilterMention({
    this.topicId,
  });

  /// Identifier of the topic in which the users will be mentioned; pass null if none
  final MessageTopic? topicId;

  /// Parse from a json
  factory ChatMembersFilterMention.fromJson(Map<String, dynamic> json) =>
      ChatMembersFilterMention(
        topicId: json['topic_id'] == null
            ? null
            : MessageTopic.fromJson(json['topic_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_id": topicId?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_id]: Identifier of the topic in which the users will be mentioned; pass null if none
  @override
  ChatMembersFilterMention copyWith({
    MessageTopic? topicId,
  }) =>
      ChatMembersFilterMention(
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterMention';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterRestricted** *(chatMembersFilterRestricted)* - child of ChatMembersFilter
///
/// Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup.
final class ChatMembersFilterRestricted extends ChatMembersFilter {
  /// **ChatMembersFilterRestricted** *(chatMembersFilterRestricted)* - child of ChatMembersFilter
  ///
  /// Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup.
  const ChatMembersFilterRestricted();

  /// Parse from a json
  factory ChatMembersFilterRestricted.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterRestricted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterRestricted copyWith() => const ChatMembersFilterRestricted();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterBanned** *(chatMembersFilterBanned)* - child of ChatMembersFilter
///
/// Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel.
final class ChatMembersFilterBanned extends ChatMembersFilter {
  /// **ChatMembersFilterBanned** *(chatMembersFilterBanned)* - child of ChatMembersFilter
  ///
  /// Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel.
  const ChatMembersFilterBanned();

  /// Parse from a json
  factory ChatMembersFilterBanned.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterBanned();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterBanned copyWith() => const ChatMembersFilterBanned();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterBanned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMembersFilterBots** *(chatMembersFilterBots)* - child of ChatMembersFilter
///
/// Returns bot members of the chat.
final class ChatMembersFilterBots extends ChatMembersFilter {
  /// **ChatMembersFilterBots** *(chatMembersFilterBots)* - child of ChatMembersFilter
  ///
  /// Returns bot members of the chat.
  const ChatMembersFilterBots();

  /// Parse from a json
  factory ChatMembersFilterBots.fromJson(Map<String, dynamic> json) =>
      const ChatMembersFilterBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMembersFilterBots copyWith() => const ChatMembersFilterBots();

  /// TDLib object type
  static const String defaultObjectId = 'chatMembersFilterBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
