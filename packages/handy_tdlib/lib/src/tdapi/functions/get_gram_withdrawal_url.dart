part of '../tdapi.dart';

/// **GetGramWithdrawalUrl** *(getGramWithdrawalUrl)* - TDLib function
///
/// Returns a URL for TON Gram withdrawal from the current user's account. The user must have at least 10 Grams to withdraw. and can withdraw up to 100000 Grams in one transaction.
///
/// * [password]: The 2-step verification password of the current user.
///
/// [HttpUrl] is returned on completion.
final class GetGramWithdrawalUrl extends TdFunction {
  /// **GetGramWithdrawalUrl** *(getGramWithdrawalUrl)* - TDLib function
  ///
  /// Returns a URL for TON Gram withdrawal from the current user's account. The user must have at least 10 Grams to withdraw. and can withdraw up to 100000 Grams in one transaction.
  ///
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [HttpUrl] is returned on completion.
  const GetGramWithdrawalUrl({
    required this.password,
  });

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: The 2-step verification password of the current user
  GetGramWithdrawalUrl copyWith({
    String? password,
  }) =>
      GetGramWithdrawalUrl(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGramWithdrawalUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
