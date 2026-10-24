part of '../tdapi.dart';

/// **ToggleSavedMessagesTopicIsPinned** *(toggleSavedMessagesTopicIsPinned)* - TDLib function
///
/// Changes the pinned state of a Saved Messages topic. There can be up to getOption("pinned_saved_messages_topic_count_max") pinned topics. The limit can be increased with Telegram Premium.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic to pin or unpin.
/// * [isPinned]: Pass true to pin the topic; pass false to unpin it.
///
/// [Ok] is returned on completion.
final class ToggleSavedMessagesTopicIsPinned extends TdFunction {
  /// **ToggleSavedMessagesTopicIsPinned** *(toggleSavedMessagesTopicIsPinned)* - TDLib function
  ///
  /// Changes the pinned state of a Saved Messages topic. There can be up to getOption("pinned_saved_messages_topic_count_max") pinned topics. The limit can be increased with Telegram Premium.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic to pin or unpin.
  /// * [isPinned]: Pass true to pin the topic; pass false to unpin it.
  ///
  /// [Ok] is returned on completion.
  const ToggleSavedMessagesTopicIsPinned({
    required this.savedMessagesTopicId,
    required this.isPinned,
  });

  /// Identifier of Saved Messages topic to pin or unpin
  final int savedMessagesTopicId;

  /// Pass true to pin the topic; pass false to unpin it
  final bool isPinned;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "is_pinned": isPinned,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic to pin or unpin
  /// * [is_pinned]: Pass true to pin the topic; pass false to unpin it
  ToggleSavedMessagesTopicIsPinned copyWith({
    int? savedMessagesTopicId,
    bool? isPinned,
  }) =>
      ToggleSavedMessagesTopicIsPinned(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSavedMessagesTopicIsPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
