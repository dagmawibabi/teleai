part of '../tdapi.dart';

/// **SetChatPhoto** *(setChatPhoto)* - TDLib function
///
/// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info member right.
///
/// * [chatId]: Chat identifier.
/// * [photo]: New chat photo; pass null to delete the chat photo *(optional)*.
///
/// [Ok] is returned on completion.
final class SetChatPhoto extends TdFunction {
  /// **SetChatPhoto** *(setChatPhoto)* - TDLib function
  ///
  /// Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info member right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [photo]: New chat photo; pass null to delete the chat photo *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetChatPhoto({
    required this.chatId,
    this.photo,
  });

  /// Chat identifier
  final int chatId;

  /// New chat photo; pass null to delete the chat photo
  final InputChatPhoto? photo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "photo": photo?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [photo]: New chat photo; pass null to delete the chat photo
  SetChatPhoto copyWith({
    int? chatId,
    InputChatPhoto? photo,
  }) =>
      SetChatPhoto(
        chatId: chatId ?? this.chatId,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
