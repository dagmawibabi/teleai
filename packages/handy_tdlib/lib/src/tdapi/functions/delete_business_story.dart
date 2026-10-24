part of '../tdapi.dart';

/// **DeleteBusinessStory** *(deleteBusinessStory)* - TDLib function
///
/// Deletes a story posted by the bot on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [storyId]: Identifier of the story to delete.
///
/// [Ok] is returned on completion.
final class DeleteBusinessStory extends TdFunction {
  /// **DeleteBusinessStory** *(deleteBusinessStory)* - TDLib function
  ///
  /// Deletes a story posted by the bot on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [storyId]: Identifier of the story to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteBusinessStory({
    required this.businessConnectionId,
    required this.storyId,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// Identifier of the story to delete
  final int storyId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "story_id": storyId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [story_id]: Identifier of the story to delete
  DeleteBusinessStory copyWith({
    String? businessConnectionId,
    int? storyId,
  }) =>
      DeleteBusinessStory(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBusinessStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
