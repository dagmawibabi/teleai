part of '../tdapi.dart';

/// **GetUserSupportInfo** *(getUserSupportInfo)* - TDLib function
///
/// Returns support information for the given user; for Telegram support only.
///
/// * [userId]: User identifier.
///
/// [UserSupportInfo] is returned on completion.
final class GetUserSupportInfo extends TdFunction {
  /// **GetUserSupportInfo** *(getUserSupportInfo)* - TDLib function
  ///
  /// Returns support information for the given user; for Telegram support only.
  ///
  /// * [userId]: User identifier.
  ///
  /// [UserSupportInfo] is returned on completion.
  const GetUserSupportInfo({
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
  GetUserSupportInfo copyWith({
    int? userId,
  }) =>
      GetUserSupportInfo(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserSupportInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
