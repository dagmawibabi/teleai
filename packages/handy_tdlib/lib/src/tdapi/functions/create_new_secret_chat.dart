part of '../tdapi.dart';

/// **CreateNewSecretChat** *(createNewSecretChat)* - TDLib function
///
/// Creates a new secret chat. Returns the newly created chat.
///
/// * [userId]: Identifier of the target user.
///
/// [Chat] is returned on completion.
final class CreateNewSecretChat extends TdFunction {
  /// **CreateNewSecretChat** *(createNewSecretChat)* - TDLib function
  ///
  /// Creates a new secret chat. Returns the newly created chat.
  ///
  /// * [userId]: Identifier of the target user.
  ///
  /// [Chat] is returned on completion.
  const CreateNewSecretChat({
    required this.userId,
  });

  /// Identifier of the target user
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the target user
  CreateNewSecretChat copyWith({
    int? userId,
  }) =>
      CreateNewSecretChat(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createNewSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
