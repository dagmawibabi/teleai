part of '../tdapi.dart';

/// **DeclineOauthRequest** *(declineOauthRequest)* - TDLib function
///
/// Declines an OAuth authorization request.
///
/// * [url]: URL of the OAuth deep link.
///
/// [Ok] is returned on completion.
final class DeclineOauthRequest extends TdFunction {
  /// **DeclineOauthRequest** *(declineOauthRequest)* - TDLib function
  ///
  /// Declines an OAuth authorization request.
  ///
  /// * [url]: URL of the OAuth deep link.
  ///
  /// [Ok] is returned on completion.
  const DeclineOauthRequest({
    required this.url,
  });

  /// URL of the OAuth deep link
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the OAuth deep link
  DeclineOauthRequest copyWith({
    String? url,
  }) =>
      DeclineOauthRequest(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'declineOauthRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
