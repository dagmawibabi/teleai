part of '../tdapi.dart';

/// **DeleteSavedMessagesTopicHistory** *(deleteSavedMessagesTopicHistory)* - TDLib function
///
/// Deletes all messages in a Saved Messages topic.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be deleted.
///
/// [Ok] is returned on completion.
final class DeleteSavedMessagesTopicHistory extends TdFunction {
  /// **DeleteSavedMessagesTopicHistory** *(deleteSavedMessagesTopicHistory)* - TDLib function
  ///
  /// Deletes all messages in a Saved Messages topic.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be deleted.
  ///
  /// [Ok] is returned on completion.
  const DeleteSavedMessagesTopicHistory({
    required this.savedMessagesTopicId,
  });

  /// Identifier of Saved Messages topic which messages will be deleted
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
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which messages will be deleted
  DeleteSavedMessagesTopicHistory copyWith({
    int? savedMessagesTopicId,
  }) =>
      DeleteSavedMessagesTopicHistory(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteSavedMessagesTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
