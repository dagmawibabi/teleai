part of '../tdapi.dart';

/// **SetProfileShareTheme** *(setProfileShareTheme)* - TDLib function
///
/// Changes the theme of the screen for sharing a link to the current user or a chat. The chat must have a username.. Requires can_change_info administrator right in supergroups and channels.
///
/// * [chatId]: Identifier of the chat with the current user, or identifier of a supergroup or a channel chat.
/// * [theme]: The new theme; pass null to use the default theme *(optional)*.
///
/// [Ok] is returned on completion.
final class SetProfileShareTheme extends TdFunction {
  /// **SetProfileShareTheme** *(setProfileShareTheme)* - TDLib function
  ///
  /// Changes the theme of the screen for sharing a link to the current user or a chat. The chat must have a username.. Requires can_change_info administrator right in supergroups and channels.
  ///
  /// * [chatId]: Identifier of the chat with the current user, or identifier of a supergroup or a channel chat.
  /// * [theme]: The new theme; pass null to use the default theme *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetProfileShareTheme({
    required this.chatId,
    this.theme,
  });

  /// Identifier of the chat with the current user, or identifier of a supergroup or a channel chat
  final int chatId;

  /// The new theme; pass null to use the default theme
  final InputProfileShareTheme? theme;

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
  /// * [chat_id]: Identifier of the chat with the current user, or identifier of a supergroup or a channel chat
  /// * [theme]: The new theme; pass null to use the default theme
  SetProfileShareTheme copyWith({
    int? chatId,
    InputProfileShareTheme? theme,
  }) =>
      SetProfileShareTheme(
        chatId: chatId ?? this.chatId,
        theme: theme ?? this.theme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setProfileShareTheme';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
