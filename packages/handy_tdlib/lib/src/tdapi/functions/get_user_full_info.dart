part of '../tdapi.dart';

/// **GetUserFullInfo** *(getUserFullInfo)* - TDLib function
///
/// Returns full information about a user by their identifier.
///
/// * [userId]: User identifier.
///
/// [UserFullInfo] is returned on completion.
final class GetUserFullInfo extends TdFunction {
  /// **GetUserFullInfo** *(getUserFullInfo)* - TDLib function
  ///
  /// Returns full information about a user by their identifier.
  ///
  /// * [userId]: User identifier.
  ///
  /// [UserFullInfo] is returned on completion.
  const GetUserFullInfo({
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
  GetUserFullInfo copyWith({
    int? userId,
  }) =>
      GetUserFullInfo(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
