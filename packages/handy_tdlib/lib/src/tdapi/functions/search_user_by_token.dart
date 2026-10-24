part of '../tdapi.dart';

/// **SearchUserByToken** *(searchUserByToken)* - TDLib function
///
/// Searches a user by a token from the user's link.
///
/// * [token]: Token to search for.
///
/// [User] is returned on completion.
final class SearchUserByToken extends TdFunction {
  /// **SearchUserByToken** *(searchUserByToken)* - TDLib function
  ///
  /// Searches a user by a token from the user's link.
  ///
  /// * [token]: Token to search for.
  ///
  /// [User] is returned on completion.
  const SearchUserByToken({
    required this.token,
  });

  /// Token to search for
  final String token;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "token": token,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: Token to search for
  SearchUserByToken copyWith({
    String? token,
  }) =>
      SearchUserByToken(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchUserByToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
