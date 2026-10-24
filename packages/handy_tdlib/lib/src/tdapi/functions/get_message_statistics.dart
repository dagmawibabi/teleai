part of '../tdapi.dart';

/// **GetMessageStatistics** *(getMessageStatistics)* - TDLib function
///
/// Returns detailed statistics about a message. Can be used only if messageProperties.can_get_statistics == true.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Message identifier.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [MessageStatistics] is returned on completion.
final class GetMessageStatistics extends TdFunction {
  /// **GetMessageStatistics** *(getMessageStatistics)* - TDLib function
  ///
  /// Returns detailed statistics about a message. Can be used only if messageProperties.can_get_statistics == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Message identifier.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [MessageStatistics] is returned on completion.
  const GetMessageStatistics({
    required this.chatId,
    required this.messageId,
    required this.isDark,
  });

  /// Chat identifier
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Message identifier
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetMessageStatistics copyWith({
    int? chatId,
    int? messageId,
    bool? isDark,
  }) =>
      GetMessageStatistics(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
