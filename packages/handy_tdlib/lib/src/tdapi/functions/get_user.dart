part of '../tdapi.dart';

/// **GetUser** *(getUser)* - TDLib function
///
/// Returns information about a user by their identifier. This is an offline method if the current user is not a bot.
///
/// * [userId]: User identifier.
///
/// [User] is returned on completion.
final class GetUser extends TdFunction {
  /// **GetUser** *(getUser)* - TDLib function
  ///
  /// Returns information about a user by their identifier. This is an offline method if the current user is not a bot.
  ///
  /// * [userId]: User identifier.
  ///
  /// [User] is returned on completion.
  const GetUser({
    required this.userId,
  });

  /// User identifier
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
  /// * [user_id]: User identifier
  GetUser copyWith({
    int? userId,
  }) =>
      GetUser(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
