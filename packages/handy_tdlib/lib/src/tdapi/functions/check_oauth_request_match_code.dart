part of '../tdapi.dart';

/// **CheckOauthRequestMatchCode** *(checkOauthRequestMatchCode)* - TDLib function
///
/// Checks a match-code for an OAuth authorization request. If fails, then the authorization request has failed. Otherwise,. authorization confirmation dialog must be shown and the link must be processed using acceptOauthRequest or declineOauthRequest.
///
/// * [url]: URL of the OAuth deep link.
/// * [matchCode]: The matching code chosen by the user.
///
/// [Ok] is returned on completion.
final class CheckOauthRequestMatchCode extends TdFunction {
  /// **CheckOauthRequestMatchCode** *(checkOauthRequestMatchCode)* - TDLib function
  ///
  /// Checks a match-code for an OAuth authorization request. If fails, then the authorization request has failed. Otherwise,. authorization confirmation dialog must be shown and the link must be processed using acceptOauthRequest or declineOauthRequest.
  ///
  /// * [url]: URL of the OAuth deep link.
  /// * [matchCode]: The matching code chosen by the user.
  ///
  /// [Ok] is returned on completion.
  const CheckOauthRequestMatchCode({
    required this.url,
    required this.matchCode,
  });

  /// URL of the OAuth deep link
  final String url;

  /// The matching code chosen by the user
  final String matchCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "match_code": matchCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the OAuth deep link
  /// * [match_code]: The matching code chosen by the user
  CheckOauthRequestMatchCode copyWith({
    String? url,
    String? matchCode,
  }) =>
      CheckOauthRequestMatchCode(
        url: url ?? this.url,
        matchCode: matchCode ?? this.matchCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkOauthRequestMatchCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
