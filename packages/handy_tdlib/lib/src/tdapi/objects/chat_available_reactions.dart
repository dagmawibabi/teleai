part of '../tdapi.dart';

/// **ChatAvailableReactions** *(chatAvailableReactions)* - parent
///
/// Describes reactions available in the chat.
sealed class ChatAvailableReactions extends TdObject {
  /// **ChatAvailableReactions** *(chatAvailableReactions)* - parent
  ///
  /// Describes reactions available in the chat.
  const ChatAvailableReactions();

  /// a ChatAvailableReactions return type can be :
  /// * [ChatAvailableReactionsAll]
  /// * [ChatAvailableReactionsSome]
  factory ChatAvailableReactions.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatAvailableReactionsAll.defaultObjectId:
        return ChatAvailableReactionsAll.fromJson(json);
      case ChatAvailableReactionsSome.defaultObjectId:
        return ChatAvailableReactionsSome.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatAvailableReactions)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatAvailableReactions copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatAvailableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatAvailableReactionsAll** *(chatAvailableReactionsAll)* - child of ChatAvailableReactions
///
/// All reactions are available in the chat, excluding the paid reaction and custom reactions in channel chats.
///
/// * [maxReactionCount]: The maximum allowed number of reactions per message; 1-11.
final class ChatAvailableReactionsAll extends ChatAvailableReactions {
  /// **ChatAvailableReactionsAll** *(chatAvailableReactionsAll)* - child of ChatAvailableReactions
  ///
  /// All reactions are available in the chat, excluding the paid reaction and custom reactions in channel chats.
  ///
  /// * [maxReactionCount]: The maximum allowed number of reactions per message; 1-11.
  const ChatAvailableReactionsAll({
    required this.maxReactionCount,
  });

  /// The maximum allowed number of reactions per message; 1-11
  final int maxReactionCount;

  /// Parse from a json
  factory ChatAvailableReactionsAll.fromJson(Map<String, dynamic> json) =>
      ChatAvailableReactionsAll(
        maxReactionCount: json['max_reaction_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "max_reaction_count": maxReactionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [max_reaction_count]: The maximum allowed number of reactions per message; 1-11
  @override
  ChatAvailableReactionsAll copyWith({
    int? maxReactionCount,
  }) =>
      ChatAvailableReactionsAll(
        maxReactionCount: maxReactionCount ?? this.maxReactionCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatAvailableReactionsAll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatAvailableReactionsSome** *(chatAvailableReactionsSome)* - child of ChatAvailableReactions
///
/// Only specific reactions are available in the chat.
///
/// * [reactions]: The list of reactions.
/// * [maxReactionCount]: The maximum allowed number of reactions per message; 1-11.
final class ChatAvailableReactionsSome extends ChatAvailableReactions {
  /// **ChatAvailableReactionsSome** *(chatAvailableReactionsSome)* - child of ChatAvailableReactions
  ///
  /// Only specific reactions are available in the chat.
  ///
  /// * [reactions]: The list of reactions.
  /// * [maxReactionCount]: The maximum allowed number of reactions per message; 1-11.
  const ChatAvailableReactionsSome({
    required this.reactions,
    required this.maxReactionCount,
  });

  /// The list of reactions
  final List<ReactionType> reactions;

  /// The maximum allowed number of reactions per message; 1-11
  final int maxReactionCount;

  /// Parse from a json
  factory ChatAvailableReactionsSome.fromJson(Map<String, dynamic> json) =>
      ChatAvailableReactionsSome(
        reactions: List<ReactionType>.from((json['reactions'] ?? [])
            .map((item) => ReactionType.fromJson(item))
            .toList()),
        maxReactionCount: json['max_reaction_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reactions": reactions.map((i) => i.toJson()).toList(),
      "max_reaction_count": maxReactionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reactions]: The list of reactions
  /// * [max_reaction_count]: The maximum allowed number of reactions per message; 1-11
  @override
  ChatAvailableReactionsSome copyWith({
    List<ReactionType>? reactions,
    int? maxReactionCount,
  }) =>
      ChatAvailableReactionsSome(
        reactions: reactions ?? this.reactions,
        maxReactionCount: maxReactionCount ?? this.maxReactionCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatAvailableReactionsSome';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
