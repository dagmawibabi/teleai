part of '../tdapi.dart';

/// **ChatJoinResult** *(chatJoinResult)* - parent
///
/// Describes result of join of a chat by the current user.
sealed class ChatJoinResult extends TdObject {
  /// **ChatJoinResult** *(chatJoinResult)* - parent
  ///
  /// Describes result of join of a chat by the current user.
  const ChatJoinResult();

  /// a ChatJoinResult return type can be :
  /// * [ChatJoinResultSuccess]
  /// * [ChatJoinResultRequestSent]
  /// * [ChatJoinResultGuardBotApprovalRequired]
  /// * [ChatJoinResultDeclined]
  factory ChatJoinResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatJoinResultSuccess.defaultObjectId:
        return ChatJoinResultSuccess.fromJson(json);
      case ChatJoinResultRequestSent.defaultObjectId:
        return ChatJoinResultRequestSent.fromJson(json);
      case ChatJoinResultGuardBotApprovalRequired.defaultObjectId:
        return ChatJoinResultGuardBotApprovalRequired.fromJson(json);
      case ChatJoinResultDeclined.defaultObjectId:
        return ChatJoinResultDeclined.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatJoinResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatJoinResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinResultSuccess** *(chatJoinResultSuccess)* - child of ChatJoinResult
///
/// The chat was joined successfully.
///
/// * [chatId]: Identifier of the chat.
final class ChatJoinResultSuccess extends ChatJoinResult {
  /// **ChatJoinResultSuccess** *(chatJoinResultSuccess)* - child of ChatJoinResult
  ///
  /// The chat was joined successfully.
  ///
  /// * [chatId]: Identifier of the chat.
  const ChatJoinResultSuccess({
    required this.chatId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat
  final int chatId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatJoinResultSuccess.fromJson(Map<String, dynamic> json) =>
      ChatJoinResultSuccess(
        chatId: json['chat_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  @override
  ChatJoinResultSuccess copyWith({
    int? chatId,
    dynamic extra,
    int? clientId,
  }) =>
      ChatJoinResultSuccess(
        chatId: chatId ?? this.chatId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinResultSuccess';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinResultRequestSent** *(chatJoinResultRequestSent)* - child of ChatJoinResult
///
/// The join request was sent and has to be approved by administrators of the chat.
final class ChatJoinResultRequestSent extends ChatJoinResult {
  /// **ChatJoinResultRequestSent** *(chatJoinResultRequestSent)* - child of ChatJoinResult
  ///
  /// The join request was sent and has to be approved by administrators of the chat.
  const ChatJoinResultRequestSent({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatJoinResultRequestSent.fromJson(Map<String, dynamic> json) =>
      ChatJoinResultRequestSent(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatJoinResultRequestSent copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ChatJoinResultRequestSent(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinResultRequestSent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinResultGuardBotApprovalRequired** *(chatJoinResultGuardBotApprovalRequired)* - child of ChatJoinResult
///
/// An approval from a guard bot through a Web App is required to join the chat.
///
/// * [botUserId]: Identifier of the guard bot.
/// * [queryId]: Unique identifier of the join request, which will be used in getGuardBotWebAppUrl and updateChatJoinResult.
final class ChatJoinResultGuardBotApprovalRequired extends ChatJoinResult {
  /// **ChatJoinResultGuardBotApprovalRequired** *(chatJoinResultGuardBotApprovalRequired)* - child of ChatJoinResult
  ///
  /// An approval from a guard bot through a Web App is required to join the chat.
  ///
  /// * [botUserId]: Identifier of the guard bot.
  /// * [queryId]: Unique identifier of the join request, which will be used in getGuardBotWebAppUrl and updateChatJoinResult.
  const ChatJoinResultGuardBotApprovalRequired({
    required this.botUserId,
    required this.queryId,
    this.extra,
    this.clientId,
  });

  /// Identifier of the guard bot
  final int botUserId;

  /// Unique identifier of the join request, which will be used in getGuardBotWebAppUrl and updateChatJoinResult
  final int queryId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatJoinResultGuardBotApprovalRequired.fromJson(
          Map<String, dynamic> json) =>
      ChatJoinResultGuardBotApprovalRequired(
        botUserId: json['bot_user_id'],
        queryId: json['query_id'] is int
            ? json['query_id']
            : int.parse(json['query_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "query_id": queryId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the guard bot
  /// * [query_id]: Unique identifier of the join request, which will be used in getGuardBotWebAppUrl and updateChatJoinResult
  @override
  ChatJoinResultGuardBotApprovalRequired copyWith({
    int? botUserId,
    int? queryId,
    dynamic extra,
    int? clientId,
  }) =>
      ChatJoinResultGuardBotApprovalRequired(
        botUserId: botUserId ?? this.botUserId,
        queryId: queryId ?? this.queryId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatJoinResultGuardBotApprovalRequired';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinResultDeclined** *(chatJoinResultDeclined)* - child of ChatJoinResult
///
/// The join was declined by the guard bot.
final class ChatJoinResultDeclined extends ChatJoinResult {
  /// **ChatJoinResultDeclined** *(chatJoinResultDeclined)* - child of ChatJoinResult
  ///
  /// The join was declined by the guard bot.
  const ChatJoinResultDeclined({
    this.extra,
    this.clientId,
  });

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatJoinResultDeclined.fromJson(Map<String, dynamic> json) =>
      ChatJoinResultDeclined(
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatJoinResultDeclined copyWith({
    dynamic extra,
    int? clientId,
  }) =>
      ChatJoinResultDeclined(
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinResultDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
