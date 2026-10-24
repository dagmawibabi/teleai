part of '../tdapi.dart';

/// **GetOauthLinkInfo** *(getOauthLinkInfo)* - TDLib function
///
/// Returns information about an OAuth deep link. Use checkOauthRequestMatchCode, acceptOauthRequest, or declineOauthRequest to process the link.
///
/// * [url]: URL of the link.
/// * [inAppOrigin]: Origin of the OAuth request if the request was received from the in-app browser; pass an empty string otherwise.
///
/// [OauthLinkInfo] is returned on completion.
final class GetOauthLinkInfo extends TdFunction {
  /// **GetOauthLinkInfo** *(getOauthLinkInfo)* - TDLib function
  ///
  /// Returns information about an OAuth deep link. Use checkOauthRequestMatchCode, acceptOauthRequest, or declineOauthRequest to process the link.
  ///
  /// * [url]: URL of the link.
  /// * [inAppOrigin]: Origin of the OAuth request if the request was received from the in-app browser; pass an empty string otherwise.
  ///
  /// [OauthLinkInfo] is returned on completion.
  const GetOauthLinkInfo({
    required this.url,
    required this.inAppOrigin,
  });

  /// URL of the link
  final String url;

  /// Origin of the OAuth request if the request was received from the in-app browser; pass an empty string otherwise
  final String inAppOrigin;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "in_app_origin": inAppOrigin,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the link
  /// * [in_app_origin]: Origin of the OAuth request if the request was received from the in-app browser; pass an empty string otherwise
  GetOauthLinkInfo copyWith({
    String? url,
    String? inAppOrigin,
  }) =>
      GetOauthLinkInfo(
        url: url ?? this.url,
        inAppOrigin: inAppOrigin ?? this.inAppOrigin,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOauthLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
