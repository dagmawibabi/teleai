part of '../tdapi.dart';

/// **CanSendMessageToUser** *(canSendMessageToUser)* - TDLib function
///
/// Checks whether the current user can message another user or try to create a chat with them.
///
/// * [userId]: Identifier of the other user.
/// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
///
/// [CanSendMessageToUserResult] is returned on completion.
final class CanSendMessageToUser extends TdFunction {
  /// **CanSendMessageToUser** *(canSendMessageToUser)* - TDLib function
  ///
  /// Checks whether the current user can message another user or try to create a chat with them.
  ///
  /// * [userId]: Identifier of the other user.
  /// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
  ///
  /// [CanSendMessageToUserResult] is returned on completion.
  const CanSendMessageToUser({
    required this.userId,
    required this.onlyLocal,
  });

  /// Identifier of the other user
  final int userId;

  /// Pass true to get only locally available information without sending network requests
  final bool onlyLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "only_local": onlyLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the other user
  /// * [only_local]: Pass true to get only locally available information without sending network requests
  CanSendMessageToUser copyWith({
    int? userId,
    bool? onlyLocal,
  }) =>
      CanSendMessageToUser(
        userId: userId ?? this.userId,
        onlyLocal: onlyLocal ?? this.onlyLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canSendMessageToUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
