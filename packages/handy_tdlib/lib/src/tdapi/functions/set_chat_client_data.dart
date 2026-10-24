part of '../tdapi.dart';

/// **SetChatClientData** *(setChatClientData)* - TDLib function
///
/// Changes application-specific data associated with a chat.
///
/// * [chatId]: Chat identifier.
/// * [clientData]: New value of client_data.
///
/// [Ok] is returned on completion.
final class SetChatClientData extends TdFunction {
  /// **SetChatClientData** *(setChatClientData)* - TDLib function
  ///
  /// Changes application-specific data associated with a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [clientData]: New value of client_data.
  ///
  /// [Ok] is returned on completion.
  const SetChatClientData({
    required this.chatId,
    required this.clientData,
  });

  /// Chat identifier
  final int chatId;

  /// New value of client_data
  final String clientData;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "client_data": clientData,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [client_data]: New value of client_data
  SetChatClientData copyWith({
    int? chatId,
    String? clientData,
  }) =>
      SetChatClientData(
        chatId: chatId ?? this.chatId,
        clientData: clientData ?? this.clientData,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatClientData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
