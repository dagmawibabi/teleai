part of '../tdapi.dart';

/// **CreateSecretChat** *(createSecretChat)* - TDLib function
///
/// Returns an existing chat corresponding to a known secret chat.
///
/// * [secretChatId]: Secret chat identifier.
///
/// [Chat] is returned on completion.
final class CreateSecretChat extends TdFunction {
  /// **CreateSecretChat** *(createSecretChat)* - TDLib function
  ///
  /// Returns an existing chat corresponding to a known secret chat.
  ///
  /// * [secretChatId]: Secret chat identifier.
  ///
  /// [Chat] is returned on completion.
  const CreateSecretChat({
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
  CreateSecretChat copyWith({
    int? secretChatId,
  }) =>
      CreateSecretChat(
        secretChatId: secretChatId ?? this.secretChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
