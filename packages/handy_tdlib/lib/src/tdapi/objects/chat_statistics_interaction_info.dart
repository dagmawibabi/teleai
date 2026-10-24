part of '../tdapi.dart';

/// **ChatStatisticsInteractionInfo** *(chatStatisticsInteractionInfo)* - basic class
///
/// Contains statistics about interactions with a message sent in the chat or a story posted on behalf of the chat.
///
/// * [objectType]: Type of the object.
/// * [viewCount]: Number of times the object was viewed.
/// * [forwardCount]: Number of times the object was forwarded.
/// * [reactionCount]: Number of times reactions were added to the object.
final class ChatStatisticsInteractionInfo extends TdObject {
  /// **ChatStatisticsInteractionInfo** *(chatStatisticsInteractionInfo)* - basic class
  ///
  /// Contains statistics about interactions with a message sent in the chat or a story posted on behalf of the chat.
  ///
  /// * [objectType]: Type of the object.
  /// * [viewCount]: Number of times the object was viewed.
  /// * [forwardCount]: Number of times the object was forwarded.
  /// * [reactionCount]: Number of times reactions were added to the object.
  const ChatStatisticsInteractionInfo({
    required this.objectType,
    required this.viewCount,
    required this.forwardCount,
    required this.reactionCount,
  });

  /// Type of the object
  final ChatStatisticsObjectType objectType;

  /// Number of times the object was viewed
  final int viewCount;

  /// Number of times the object was forwarded
  final int forwardCount;

  /// Number of times reactions were added to the object
  final int reactionCount;

  /// Parse from a json
  factory ChatStatisticsInteractionInfo.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsInteractionInfo(
        objectType: ChatStatisticsObjectType.fromJson(json['object_type']),
        viewCount: json['view_count'],
        forwardCount: json['forward_count'],
        reactionCount: json['reaction_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "object_type": objectType.toJson(),
      "view_count": viewCount,
      "forward_count": forwardCount,
      "reaction_count": reactionCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [object_type]: Type of the object
  /// * [view_count]: Number of times the object was viewed
  /// * [forward_count]: Number of times the object was forwarded
  /// * [reaction_count]: Number of times reactions were added to the object
  ChatStatisticsInteractionInfo copyWith({
    ChatStatisticsObjectType? objectType,
    int? viewCount,
    int? forwardCount,
    int? reactionCount,
  }) =>
      ChatStatisticsInteractionInfo(
        objectType: objectType ?? this.objectType,
        viewCount: viewCount ?? this.viewCount,
        forwardCount: forwardCount ?? this.forwardCount,
        reactionCount: reactionCount ?? this.reactionCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsInteractionInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
