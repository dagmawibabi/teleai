part of '../tdapi.dart';

/// **PaidReactionType** *(paidReactionType)* - parent
///
/// Describes type of paid message reaction.
sealed class PaidReactionType extends TdObject {
  /// **PaidReactionType** *(paidReactionType)* - parent
  ///
  /// Describes type of paid message reaction.
  const PaidReactionType();

  /// a PaidReactionType return type can be :
  /// * [PaidReactionTypeRegular]
  /// * [PaidReactionTypeAnonymous]
  /// * [PaidReactionTypeChat]
  factory PaidReactionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PaidReactionTypeRegular.defaultObjectId:
        return PaidReactionTypeRegular.fromJson(json);
      case PaidReactionTypeAnonymous.defaultObjectId:
        return PaidReactionTypeAnonymous.fromJson(json);
      case PaidReactionTypeChat.defaultObjectId:
        return PaidReactionTypeChat.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PaidReactionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PaidReactionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'paidReactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaidReactionTypeRegular** *(paidReactionTypeRegular)* - child of PaidReactionType
///
/// A paid reaction on behalf of the current user.
final class PaidReactionTypeRegular extends PaidReactionType {
  /// **PaidReactionTypeRegular** *(paidReactionTypeRegular)* - child of PaidReactionType
  ///
  /// A paid reaction on behalf of the current user.
  const PaidReactionTypeRegular();

  /// Parse from a json
  factory PaidReactionTypeRegular.fromJson(Map<String, dynamic> json) =>
      const PaidReactionTypeRegular();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PaidReactionTypeRegular copyWith() => const PaidReactionTypeRegular();

  /// TDLib object type
  static const String defaultObjectId = 'paidReactionTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaidReactionTypeAnonymous** *(paidReactionTypeAnonymous)* - child of PaidReactionType
///
/// An anonymous paid reaction.
final class PaidReactionTypeAnonymous extends PaidReactionType {
  /// **PaidReactionTypeAnonymous** *(paidReactionTypeAnonymous)* - child of PaidReactionType
  ///
  /// An anonymous paid reaction.
  const PaidReactionTypeAnonymous();

  /// Parse from a json
  factory PaidReactionTypeAnonymous.fromJson(Map<String, dynamic> json) =>
      const PaidReactionTypeAnonymous();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  PaidReactionTypeAnonymous copyWith() => const PaidReactionTypeAnonymous();

  /// TDLib object type
  static const String defaultObjectId = 'paidReactionTypeAnonymous';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaidReactionTypeChat** *(paidReactionTypeChat)* - child of PaidReactionType
///
/// A paid reaction on behalf of an owned chat.
///
/// * [chatId]: Identifier of the chat.
final class PaidReactionTypeChat extends PaidReactionType {
  /// **PaidReactionTypeChat** *(paidReactionTypeChat)* - child of PaidReactionType
  ///
  /// A paid reaction on behalf of an owned chat.
  ///
  /// * [chatId]: Identifier of the chat.
  const PaidReactionTypeChat({
    required this.chatId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Parse from a json
  factory PaidReactionTypeChat.fromJson(Map<String, dynamic> json) =>
      PaidReactionTypeChat(
        chatId: json['chat_id'],
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
  PaidReactionTypeChat copyWith({
    int? chatId,
  }) =>
      PaidReactionTypeChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paidReactionTypeChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
