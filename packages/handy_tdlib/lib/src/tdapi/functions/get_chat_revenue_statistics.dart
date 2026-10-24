part of '../tdapi.dart';

/// **GetChatRevenueStatistics** *(getChatRevenueStatistics)* - TDLib function
///
/// Returns detailed revenue statistics about a chat. Currently, this method can be used only. for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true.
///
/// * [chatId]: Chat identifier.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [ChatRevenueStatistics] is returned on completion.
final class GetChatRevenueStatistics extends TdFunction {
  /// **GetChatRevenueStatistics** *(getChatRevenueStatistics)* - TDLib function
  ///
  /// Returns detailed revenue statistics about a chat. Currently, this method can be used only. for channels if supergroupFullInfo.can_get_revenue_statistics == true or bots if userFullInfo.bot_info.can_get_revenue_statistics == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [ChatRevenueStatistics] is returned on completion.
  const GetChatRevenueStatistics({
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
  GetChatRevenueStatistics copyWith({
    int? chatId,
    bool? isDark,
  }) =>
      GetChatRevenueStatistics(
        chatId: chatId ?? this.chatId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatRevenueStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
