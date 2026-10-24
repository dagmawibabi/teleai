part of '../tdapi.dart';

/// **GetChatStatistics** *(getChatStatistics)* - TDLib function
///
/// Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true.
///
/// * [chatId]: Chat identifier.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [ChatStatistics] is returned on completion.
final class GetChatStatistics extends TdFunction {
  /// **GetChatStatistics** *(getChatStatistics)* - TDLib function
  ///
  /// Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [ChatStatistics] is returned on completion.
  const GetChatStatistics({
    required this.chatId,
    required this.isDark,
  });

  /// Chat identifier
  final int chatId;

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetChatStatistics copyWith({
    int? chatId,
    bool? isDark,
  }) =>
      GetChatStatistics(
        chatId: chatId ?? this.chatId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
