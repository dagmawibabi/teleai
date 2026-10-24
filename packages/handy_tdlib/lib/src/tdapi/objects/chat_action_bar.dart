part of '../tdapi.dart';

/// **ChatActionBar** *(chatActionBar)* - parent
///
/// Describes actions which must be possible to do through a chat action bar.
sealed class ChatActionBar extends TdObject {
  /// **ChatActionBar** *(chatActionBar)* - parent
  ///
  /// Describes actions which must be possible to do through a chat action bar.
  const ChatActionBar();

  /// a ChatActionBar return type can be :
  /// * [ChatActionBarReportSpam]
  /// * [ChatActionBarInviteMembers]
  /// * [ChatActionBarReportAddBlock]
  /// * [ChatActionBarAddContact]
  /// * [ChatActionBarSharePhoneNumber]
  /// * [ChatActionBarJoinRequest]
  factory ChatActionBar.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatActionBarReportSpam.defaultObjectId:
        return ChatActionBarReportSpam.fromJson(json);
      case ChatActionBarInviteMembers.defaultObjectId:
        return ChatActionBarInviteMembers.fromJson(json);
      case ChatActionBarReportAddBlock.defaultObjectId:
        return ChatActionBarReportAddBlock.fromJson(json);
      case ChatActionBarAddContact.defaultObjectId:
        return ChatActionBarAddContact.fromJson(json);
      case ChatActionBarSharePhoneNumber.defaultObjectId:
        return ChatActionBarSharePhoneNumber.fromJson(json);
      case ChatActionBarJoinRequest.defaultObjectId:
        return ChatActionBarJoinRequest.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatActionBar)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatActionBar copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarReportSpam** *(chatActionBarReportSpam)* - child of ChatActionBar
///
/// The chat can be reported as spam using the method reportChat with an empty option_id and message_ids. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown.
///
/// * [canUnarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings.
final class ChatActionBarReportSpam extends ChatActionBar {
  /// **ChatActionBarReportSpam** *(chatActionBarReportSpam)* - child of ChatActionBar
  ///
  /// The chat can be reported as spam using the method reportChat with an empty option_id and message_ids. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown.
  ///
  /// * [canUnarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings.
  const ChatActionBarReportSpam({
    required this.canUnarchive,
  });

  /// If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  final bool canUnarchive;

  /// Parse from a json
  factory ChatActionBarReportSpam.fromJson(Map<String, dynamic> json) =>
      ChatActionBarReportSpam(
        canUnarchive: json['can_unarchive'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_unarchive": canUnarchive,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_unarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  @override
  ChatActionBarReportSpam copyWith({
    bool? canUnarchive,
  }) =>
      ChatActionBarReportSpam(
        canUnarchive: canUnarchive ?? this.canUnarchive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarReportSpam';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarInviteMembers** *(chatActionBarInviteMembers)* - child of ChatActionBar
///
/// The chat is a recently created group chat to which new members can be invited.
final class ChatActionBarInviteMembers extends ChatActionBar {
  /// **ChatActionBarInviteMembers** *(chatActionBarInviteMembers)* - child of ChatActionBar
  ///
  /// The chat is a recently created group chat to which new members can be invited.
  const ChatActionBarInviteMembers();

  /// Parse from a json
  factory ChatActionBarInviteMembers.fromJson(Map<String, dynamic> json) =>
      const ChatActionBarInviteMembers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatActionBarInviteMembers copyWith() => const ChatActionBarInviteMembers();

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarInviteMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarReportAddBlock** *(chatActionBarReportAddBlock)* - child of ChatActionBar
///
/// The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method setMessageSenderBlockList,. or the other user can be added to the contact list using the method addContact. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown.
///
/// * [canUnarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings.
/// * [accountInfo]: Basic information about the other user in the chat; may be null if unknown *(optional)*.
final class ChatActionBarReportAddBlock extends ChatActionBar {
  /// **ChatActionBarReportAddBlock** *(chatActionBarReportAddBlock)* - child of ChatActionBar
  ///
  /// The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method setMessageSenderBlockList,. or the other user can be added to the contact list using the method addContact. If the chat is a private chat with a user with an emoji status, then a notice about emoji status usage must be shown.
  ///
  /// * [canUnarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings.
  /// * [accountInfo]: Basic information about the other user in the chat; may be null if unknown *(optional)*.
  const ChatActionBarReportAddBlock({
    required this.canUnarchive,
    this.accountInfo,
  });

  /// If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  final bool canUnarchive;

  /// Basic information about the other user in the chat; may be null if unknown
  final AccountInfo? accountInfo;

  /// Parse from a json
  factory ChatActionBarReportAddBlock.fromJson(Map<String, dynamic> json) =>
      ChatActionBarReportAddBlock(
        canUnarchive: json['can_unarchive'],
        accountInfo: json['account_info'] == null
            ? null
            : AccountInfo.fromJson(json['account_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_unarchive": canUnarchive,
      "account_info": accountInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_unarchive]: If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  /// * [account_info]: Basic information about the other user in the chat; may be null if unknown
  @override
  ChatActionBarReportAddBlock copyWith({
    bool? canUnarchive,
    AccountInfo? accountInfo,
  }) =>
      ChatActionBarReportAddBlock(
        canUnarchive: canUnarchive ?? this.canUnarchive,
        accountInfo: accountInfo ?? this.accountInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarReportAddBlock';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarAddContact** *(chatActionBarAddContact)* - child of ChatActionBar
///
/// The chat is a private or secret chat and the other user can be added to the contact list using the method addContact.
final class ChatActionBarAddContact extends ChatActionBar {
  /// **ChatActionBarAddContact** *(chatActionBarAddContact)* - child of ChatActionBar
  ///
  /// The chat is a private or secret chat and the other user can be added to the contact list using the method addContact.
  const ChatActionBarAddContact();

  /// Parse from a json
  factory ChatActionBarAddContact.fromJson(Map<String, dynamic> json) =>
      const ChatActionBarAddContact();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatActionBarAddContact copyWith() => const ChatActionBarAddContact();

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarAddContact';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarSharePhoneNumber** *(chatActionBarSharePhoneNumber)* - child of ChatActionBar
///
/// The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber.
final class ChatActionBarSharePhoneNumber extends ChatActionBar {
  /// **ChatActionBarSharePhoneNumber** *(chatActionBarSharePhoneNumber)* - child of ChatActionBar
  ///
  /// The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber.
  const ChatActionBarSharePhoneNumber();

  /// Parse from a json
  factory ChatActionBarSharePhoneNumber.fromJson(Map<String, dynamic> json) =>
      const ChatActionBarSharePhoneNumber();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatActionBarSharePhoneNumber copyWith() =>
      const ChatActionBarSharePhoneNumber();

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarSharePhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatActionBarJoinRequest** *(chatActionBarJoinRequest)* - child of ChatActionBar
///
/// The chat is a private chat with an administrator of a chat to which the user sent join request.
///
/// * [title]: Title of the chat to which the join request was sent.
/// * [isChannel]: True, if the join request was sent to a channel chat.
/// * [requestDate]: Point in time (Unix timestamp) when the join request was sent.
final class ChatActionBarJoinRequest extends ChatActionBar {
  /// **ChatActionBarJoinRequest** *(chatActionBarJoinRequest)* - child of ChatActionBar
  ///
  /// The chat is a private chat with an administrator of a chat to which the user sent join request.
  ///
  /// * [title]: Title of the chat to which the join request was sent.
  /// * [isChannel]: True, if the join request was sent to a channel chat.
  /// * [requestDate]: Point in time (Unix timestamp) when the join request was sent.
  const ChatActionBarJoinRequest({
    required this.title,
    required this.isChannel,
    required this.requestDate,
  });

  /// Title of the chat to which the join request was sent
  final String title;

  /// True, if the join request was sent to a channel chat
  final bool isChannel;

  /// Point in time (Unix timestamp) when the join request was sent
  final int requestDate;

  /// Parse from a json
  factory ChatActionBarJoinRequest.fromJson(Map<String, dynamic> json) =>
      ChatActionBarJoinRequest(
        title: json['title'],
        isChannel: json['is_channel'],
        requestDate: json['request_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "title": title,
      "is_channel": isChannel,
      "request_date": requestDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the chat to which the join request was sent
  /// * [is_channel]: True, if the join request was sent to a channel chat
  /// * [request_date]: Point in time (Unix timestamp) when the join request was sent
  @override
  ChatActionBarJoinRequest copyWith({
    String? title,
    bool? isChannel,
    int? requestDate,
  }) =>
      ChatActionBarJoinRequest(
        title: title ?? this.title,
        isChannel: isChannel ?? this.isChannel,
        requestDate: requestDate ?? this.requestDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatActionBarJoinRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
