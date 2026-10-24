part of '../tdapi.dart';

/// **ToggleChatDefaultDisableNotification** *(toggleChatDefaultDisableNotification)* - TDLib function
///
/// Changes the value of the default disable_notification parameter, used when a message is sent to a chat.
///
/// * [chatId]: Chat identifier.
/// * [defaultDisableNotification]: New value of default_disable_notification.
///
/// [Ok] is returned on completion.
final class ToggleChatDefaultDisableNotification extends TdFunction {
  /// **ToggleChatDefaultDisableNotification** *(toggleChatDefaultDisableNotification)* - TDLib function
  ///
  /// Changes the value of the default disable_notification parameter, used when a message is sent to a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [defaultDisableNotification]: New value of default_disable_notification.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatDefaultDisableNotification({
    required this.chatId,
    required this.defaultDisableNotification,
  });

  /// Chat identifier
  final int chatId;

  /// New value of default_disable_notification
  final bool defaultDisableNotification;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "default_disable_notification": defaultDisableNotification,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [default_disable_notification]: New value of default_disable_notification
  ToggleChatDefaultDisableNotification copyWith({
    int? chatId,
    bool? defaultDisableNotification,
  }) =>
      ToggleChatDefaultDisableNotification(
        chatId: chatId ?? this.chatId,
        defaultDisableNotification:
            defaultDisableNotification ?? this.defaultDisableNotification,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatDefaultDisableNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
