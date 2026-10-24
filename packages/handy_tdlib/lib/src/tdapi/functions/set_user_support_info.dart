part of '../tdapi.dart';

/// **SetUserSupportInfo** *(setUserSupportInfo)* - TDLib function
///
/// Sets support information for the given user; for Telegram support only.
///
/// * [userId]: User identifier.
/// * [message]: New information message.
///
/// [UserSupportInfo] is returned on completion.
final class SetUserSupportInfo extends TdFunction {
  /// **SetUserSupportInfo** *(setUserSupportInfo)* - TDLib function
  ///
  /// Sets support information for the given user; for Telegram support only.
  ///
  /// * [userId]: User identifier.
  /// * [message]: New information message.
  ///
  /// [UserSupportInfo] is returned on completion.
  const SetUserSupportInfo({
    required this.userId,
    required this.message,
  });

  /// User identifier
  final int userId;

  /// New information message
  final FormattedText message;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "message": message.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [message]: New information message
  SetUserSupportInfo copyWith({
    int? userId,
    FormattedText? message,
  }) =>
      SetUserSupportInfo(
        userId: userId ?? this.userId,
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUserSupportInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
