part of '../tdapi.dart';

/// **GetSecretChat** *(getSecretChat)* - TDLib function
///
/// Returns information about a secret chat by its identifier. This is an offline method.
///
/// * [secretChatId]: Secret chat identifier.
///
/// [SecretChat] is returned on completion.
final class GetSecretChat extends TdFunction {
  /// **GetSecretChat** *(getSecretChat)* - TDLib function
  ///
  /// Returns information about a secret chat by its identifier. This is an offline method.
  ///
  /// * [secretChatId]: Secret chat identifier.
  ///
  /// [SecretChat] is returned on completion.
  const GetSecretChat({
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
  GetSecretChat copyWith({
    int? secretChatId,
  }) =>
      GetSecretChat(
        secretChatId: secretChatId ?? this.secretChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
