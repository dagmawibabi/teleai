part of '../tdapi.dart';

/// **ToggleChatIsTranslatable** *(toggleChatIsTranslatable)* - TDLib function
///
/// Changes the translatable state of a chat.
///
/// * [chatId]: Chat identifier.
/// * [isTranslatable]: New value of is_translatable.
///
/// [Ok] is returned on completion.
final class ToggleChatIsTranslatable extends TdFunction {
  /// **ToggleChatIsTranslatable** *(toggleChatIsTranslatable)* - TDLib function
  ///
  /// Changes the translatable state of a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isTranslatable]: New value of is_translatable.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatIsTranslatable({
    required this.chatId,
    required this.isTranslatable,
  });

  /// Chat identifier
  final int chatId;

  /// New value of is_translatable
  final bool isTranslatable;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_translatable": isTranslatable,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_translatable]: New value of is_translatable
  ToggleChatIsTranslatable copyWith({
    int? chatId,
    bool? isTranslatable,
  }) =>
      ToggleChatIsTranslatable(
        chatId: chatId ?? this.chatId,
        isTranslatable: isTranslatable ?? this.isTranslatable,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatIsTranslatable';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
