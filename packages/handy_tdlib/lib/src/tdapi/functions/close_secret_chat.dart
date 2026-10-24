part of '../tdapi.dart';

/// **CloseSecretChat** *(closeSecretChat)* - TDLib function
///
/// Closes a secret chat, effectively transferring its state to secretChatStateClosed.
///
/// * [secretChatId]: Secret chat identifier.
///
/// [Ok] is returned on completion.
final class CloseSecretChat extends TdFunction {
  /// **CloseSecretChat** *(closeSecretChat)* - TDLib function
  ///
  /// Closes a secret chat, effectively transferring its state to secretChatStateClosed.
  ///
  /// * [secretChatId]: Secret chat identifier.
  ///
  /// [Ok] is returned on completion.
  const CloseSecretChat({
    required this.secretChatId,
  });

  /// Secret chat identifier
  final int secretChatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "secret_chat_id": secretChatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [secret_chat_id]: Secret chat identifier
  CloseSecretChat copyWith({
    int? secretChatId,
  }) =>
      CloseSecretChat(
        secretChatId: secretChatId ?? this.secretChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
