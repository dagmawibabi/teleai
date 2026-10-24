part of '../tdapi.dart';

/// **DeleteBusinessMessages** *(deleteBusinessMessages)* - TDLib function
///
/// Deletes messages on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection through which the messages were received.
/// * [messageIds]: Identifier of the messages.
///
/// [Ok] is returned on completion.
final class DeleteBusinessMessages extends TdFunction {
  /// **DeleteBusinessMessages** *(deleteBusinessMessages)* - TDLib function
  ///
  /// Deletes messages on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection through which the messages were received.
  /// * [messageIds]: Identifier of the messages.
  ///
  /// [Ok] is returned on completion.
  const DeleteBusinessMessages({
    required this.businessConnectionId,
    required this.messageIds,
  });

  /// Unique identifier of business connection through which the messages were received
  final String businessConnectionId;

  /// Identifier of the messages
  final List<int> messageIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "message_ids": messageIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection through which the messages were received
  /// * [message_ids]: Identifier of the messages
  DeleteBusinessMessages copyWith({
    String? businessConnectionId,
    List<int>? messageIds,
  }) =>
      DeleteBusinessMessages(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        messageIds: messageIds ?? this.messageIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteBusinessMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
