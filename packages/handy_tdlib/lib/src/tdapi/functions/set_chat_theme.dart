part of '../tdapi.dart';

/// **SetChatTheme** *(setChatTheme)* - TDLib function
///
/// Changes the chat theme. Supported only in private and secret chats.
///
/// * [chatId]: Chat identifier.
/// * [theme]: New chat theme; pass null to return the default theme *(optional)*.
///
/// [Ok] is returned on completion.
final class SetChatTheme extends TdFunction {
  /// **SetChatTheme** *(setChatTheme)* - TDLib function
  ///
  /// Changes the chat theme. Supported only in private and secret chats.
  ///
  /// * [chatId]: Chat identifier.
  /// * [theme]: New chat theme; pass null to return the default theme *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetChatTheme({
    required this.chatId,
    this.theme,
  });

  /// Chat identifier
  final int chatId;

  /// New chat theme; pass null to return the default theme
  final InputChatTheme? theme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "theme": theme?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [theme]: New chat theme; pass null to return the default theme
  SetChatTheme copyWith({
    int? chatId,
    InputChatTheme? theme,
  }) =>
      SetChatTheme(
        chatId: chatId ?? this.chatId,
        theme: theme ?? this.theme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
