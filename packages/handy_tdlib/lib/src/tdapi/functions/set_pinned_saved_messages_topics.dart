part of '../tdapi.dart';

/// **SetPinnedSavedMessagesTopics** *(setPinnedSavedMessagesTopics)* - TDLib function
///
/// Changes the order of pinned Saved Messages topics.
///
/// * [savedMessagesTopicIds]: Identifiers of the new pinned Saved Messages topics.
///
/// [Ok] is returned on completion.
final class SetPinnedSavedMessagesTopics extends TdFunction {
  /// **SetPinnedSavedMessagesTopics** *(setPinnedSavedMessagesTopics)* - TDLib function
  ///
  /// Changes the order of pinned Saved Messages topics.
  ///
  /// * [savedMessagesTopicIds]: Identifiers of the new pinned Saved Messages topics.
  ///
  /// [Ok] is returned on completion.
  const SetPinnedSavedMessagesTopics({
    required this.savedMessagesTopicIds,
  });

  /// Identifiers of the new pinned Saved Messages topics
  final List<int> savedMessagesTopicIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_ids": savedMessagesTopicIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_ids]: Identifiers of the new pinned Saved Messages topics
  SetPinnedSavedMessagesTopics copyWith({
    List<int>? savedMessagesTopicIds,
  }) =>
      SetPinnedSavedMessagesTopics(
        savedMessagesTopicIds:
            savedMessagesTopicIds ?? this.savedMessagesTopicIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPinnedSavedMessagesTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
