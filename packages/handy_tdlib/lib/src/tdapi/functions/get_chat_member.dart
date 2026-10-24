part of '../tdapi.dart';

/// **GetChatMember** *(getChatMember)* - TDLib function
///
/// Returns information about a single member of a chat.
///
/// * [chatId]: Chat identifier.
/// * [memberId]: Member identifier.
///
/// [ChatMember] is returned on completion.
final class GetChatMember extends TdFunction {
  /// **GetChatMember** *(getChatMember)* - TDLib function
  ///
  /// Returns information about a single member of a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [memberId]: Member identifier.
  ///
  /// [ChatMember] is returned on completion.
  const GetChatMember({
    required this.chatId,
    required this.memberId,
  });

  /// Chat identifier
  final int chatId;

  /// Member identifier
  final MessageSender memberId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "member_id": memberId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [member_id]: Member identifier
  GetChatMember copyWith({
    int? chatId,
    MessageSender? memberId,
  }) =>
      GetChatMember(
        chatId: chatId ?? this.chatId,
        memberId: memberId ?? this.memberId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
