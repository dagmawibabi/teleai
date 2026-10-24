part of '../tdapi.dart';

/// **CreatePrivateChat** *(createPrivateChat)* - TDLib function
///
/// Returns an existing chat corresponding to a given user.
///
/// * [userId]: User identifier.
/// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
///
/// [Chat] is returned on completion.
final class CreatePrivateChat extends TdFunction {
  /// **CreatePrivateChat** *(createPrivateChat)* - TDLib function
  ///
  /// Returns an existing chat corresponding to a given user.
  ///
  /// * [userId]: User identifier.
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect.
  ///
  /// [Chat] is returned on completion.
  const CreatePrivateChat({
    required this.userId,
    required this.force,
  });

  /// User identifier
  final int userId;

  /// Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  final bool force;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "force": force,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [force]: Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
  CreatePrivateChat copyWith({
    int? userId,
    bool? force,
  }) =>
      CreatePrivateChat(
        userId: userId ?? this.userId,
        force: force ?? this.force,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createPrivateChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
