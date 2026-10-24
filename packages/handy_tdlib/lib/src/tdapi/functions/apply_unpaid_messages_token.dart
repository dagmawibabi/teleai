part of '../tdapi.dart';

/// **ApplyUnpaidMessagesToken** *(applyUnpaidMessagesToken)* - TDLib function
///
/// Allows the current user to send unpaid messages to the given user, which requires payment for incoming messages, using a token from an internal link. of the type internalLinkTypePublicChat, internalLinkTypeUserPhoneNumber, or internalLinkTypeUserToken. The first message sent to the user will be preceded by a messageUnpaidMessagesAllowedByLink message.. Repeated calls and calls for the current user have no effect.
///
/// * [userId]: Identifier of the user.
/// * [token]: Token from the link.
///
/// [Ok] is returned on completion.
final class ApplyUnpaidMessagesToken extends TdFunction {
  /// **ApplyUnpaidMessagesToken** *(applyUnpaidMessagesToken)* - TDLib function
  ///
  /// Allows the current user to send unpaid messages to the given user, which requires payment for incoming messages, using a token from an internal link. of the type internalLinkTypePublicChat, internalLinkTypeUserPhoneNumber, or internalLinkTypeUserToken. The first message sent to the user will be preceded by a messageUnpaidMessagesAllowedByLink message.. Repeated calls and calls for the current user have no effect.
  ///
  /// * [userId]: Identifier of the user.
  /// * [token]: Token from the link.
  ///
  /// [Ok] is returned on completion.
  const ApplyUnpaidMessagesToken({
    required this.userId,
    required this.token,
  });

  /// Identifier of the user
  final int userId;

  /// Token from the link
  final String token;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "token": token,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [token]: Token from the link
  ApplyUnpaidMessagesToken copyWith({
    int? userId,
    String? token,
  }) =>
      ApplyUnpaidMessagesToken(
        userId: userId ?? this.userId,
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'applyUnpaidMessagesToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
