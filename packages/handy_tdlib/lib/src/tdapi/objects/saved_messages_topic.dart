part of '../tdapi.dart';

/// **SavedMessagesTopic** *(savedMessagesTopic)* - basic class
///
/// Contains information about a Saved Messages topic.
///
/// * [id]: Unique topic identifier.
/// * [type]: Type of the topic.
/// * [isPinned]: True, if the topic is pinned.
/// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
/// * [lastMessage]: Last message in the topic; may be null if none or unknown *(optional)*.
/// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
final class SavedMessagesTopic extends TdObject {
  /// **SavedMessagesTopic** *(savedMessagesTopic)* - basic class
  ///
  /// Contains information about a Saved Messages topic.
  ///
  /// * [id]: Unique topic identifier.
  /// * [type]: Type of the topic.
  /// * [isPinned]: True, if the topic is pinned.
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
  /// * [lastMessage]: Last message in the topic; may be null if none or unknown *(optional)*.
  /// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
  const SavedMessagesTopic({
    required this.id,
    required this.type,
    required this.isPinned,
    required this.order,
    this.lastMessage,
    this.draftMessage,
  });

  /// Unique topic identifier
  final int id;

  /// Type of the topic
  final SavedMessagesTopicType type;

  /// True, if the topic is pinned
  final bool isPinned;

  /// A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  final int order;

  /// Last message in the topic; may be null if none or unknown
  final Message? lastMessage;

  /// A draft of a message in the topic; may be null if none
  final DraftMessage? draftMessage;

  /// Parse from a json
  factory SavedMessagesTopic.fromJson(Map<String, dynamic> json) =>
      SavedMessagesTopic(
        id: json['id'],
        type: SavedMessagesTopicType.fromJson(json['type']),
        isPinned: json['is_pinned'],
        order: json['order'] is int ? json['order'] : int.parse(json['order']),
        lastMessage: json['last_message'] == null
            ? null
            : Message.fromJson(json['last_message']),
        draftMessage: json['draft_message'] == null
            ? null
            : DraftMessage.fromJson(json['draft_message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "type": type.toJson(),
      "is_pinned": isPinned,
      "order": order,
      "last_message": lastMessage?.toJson(),
      "draft_message": draftMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique topic identifier
  /// * [type]: Type of the topic
  /// * [is_pinned]: True, if the topic is pinned
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  /// * [last_message]: Last message in the topic; may be null if none or unknown
  /// * [draft_message]: A draft of a message in the topic; may be null if none
  SavedMessagesTopic copyWith({
    int? id,
    SavedMessagesTopicType? type,
    bool? isPinned,
    int? order,
    Message? lastMessage,
    DraftMessage? draftMessage,
  }) =>
      SavedMessagesTopic(
        id: id ?? this.id,
        type: type ?? this.type,
        isPinned: isPinned ?? this.isPinned,
        order: order ?? this.order,
        lastMessage: lastMessage ?? this.lastMessage,
        draftMessage: draftMessage ?? this.draftMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savedMessagesTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
