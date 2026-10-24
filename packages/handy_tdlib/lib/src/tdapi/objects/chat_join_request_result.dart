part of '../tdapi.dart';

/// **ChatJoinRequestResult** *(chatJoinRequestResult)* - parent
///
/// Describes result of a chat join request.
sealed class ChatJoinRequestResult extends TdObject {
  /// **ChatJoinRequestResult** *(chatJoinRequestResult)* - parent
  ///
  /// Describes result of a chat join request.
  const ChatJoinRequestResult();

  /// a ChatJoinRequestResult return type can be :
  /// * [ChatJoinRequestResultApproved]
  /// * [ChatJoinRequestResultDeclined]
  /// * [ChatJoinRequestResultQueued]
  factory ChatJoinRequestResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatJoinRequestResultApproved.defaultObjectId:
        return ChatJoinRequestResultApproved.fromJson(json);
      case ChatJoinRequestResultDeclined.defaultObjectId:
        return ChatJoinRequestResultDeclined.fromJson(json);
      case ChatJoinRequestResultQueued.defaultObjectId:
        return ChatJoinRequestResultQueued.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatJoinRequestResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatJoinRequestResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequestResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinRequestResultApproved** *(chatJoinRequestResultApproved)* - child of ChatJoinRequestResult
///
/// The request was approved.
final class ChatJoinRequestResultApproved extends ChatJoinRequestResult {
  /// **ChatJoinRequestResultApproved** *(chatJoinRequestResultApproved)* - child of ChatJoinRequestResult
  ///
  /// The request was approved.
  const ChatJoinRequestResultApproved();

  /// Parse from a json
  factory ChatJoinRequestResultApproved.fromJson(Map<String, dynamic> json) =>
      const ChatJoinRequestResultApproved();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatJoinRequestResultApproved copyWith() =>
      const ChatJoinRequestResultApproved();

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequestResultApproved';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinRequestResultDeclined** *(chatJoinRequestResultDeclined)* - child of ChatJoinRequestResult
///
/// The request was declined.
final class ChatJoinRequestResultDeclined extends ChatJoinRequestResult {
  /// **ChatJoinRequestResultDeclined** *(chatJoinRequestResultDeclined)* - child of ChatJoinRequestResult
  ///
  /// The request was declined.
  const ChatJoinRequestResultDeclined();

  /// Parse from a json
  factory ChatJoinRequestResultDeclined.fromJson(Map<String, dynamic> json) =>
      const ChatJoinRequestResultDeclined();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatJoinRequestResultDeclined copyWith() =>
      const ChatJoinRequestResultDeclined();

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequestResultDeclined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatJoinRequestResultQueued** *(chatJoinRequestResultQueued)* - child of ChatJoinRequestResult
///
/// The request was postponed without a decision.
final class ChatJoinRequestResultQueued extends ChatJoinRequestResult {
  /// **ChatJoinRequestResultQueued** *(chatJoinRequestResultQueued)* - child of ChatJoinRequestResult
  ///
  /// The request was postponed without a decision.
  const ChatJoinRequestResultQueued();

  /// Parse from a json
  factory ChatJoinRequestResultQueued.fromJson(Map<String, dynamic> json) =>
      const ChatJoinRequestResultQueued();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatJoinRequestResultQueued copyWith() => const ChatJoinRequestResultQueued();

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequestResultQueued';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
