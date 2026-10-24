part of '../tdapi.dart';

/// **GetSavedMessagesTags** *(getSavedMessagesTags)* - TDLib function
///
/// Returns tags used in Saved Messages or a Saved Messages topic.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags.
///
/// [SavedMessagesTags] is returned on completion.
final class GetSavedMessagesTags extends TdFunction {
  /// **GetSavedMessagesTags** *(getSavedMessagesTags)* - TDLib function
  ///
  /// Returns tags used in Saved Messages or a Saved Messages topic.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags.
  ///
  /// [SavedMessagesTags] is returned on completion.
  const GetSavedMessagesTags({
    required this.savedMessagesTopicId,
  });

  /// Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags
  final int savedMessagesTopicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags
  GetSavedMessagesTags copyWith({
    int? savedMessagesTopicId,
  }) =>
      GetSavedMessagesTags(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSavedMessagesTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
