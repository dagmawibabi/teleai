part of '../tdapi.dart';

/// **GetWebPageInstantView** *(getWebPageInstantView)* - TDLib function
///
/// Returns an instant view version of a web page if available. This is an offline method if only_local is true. Returns a 404 error if the web page has no instant view page.
///
/// * [url]: The web page URL.
/// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
///
/// [WebPageInstantView] is returned on completion.
final class GetWebPageInstantView extends TdFunction {
  /// **GetWebPageInstantView** *(getWebPageInstantView)* - TDLib function
  ///
  /// Returns an instant view version of a web page if available. This is an offline method if only_local is true. Returns a 404 error if the web page has no instant view page.
  ///
  /// * [url]: The web page URL.
  /// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
  ///
  /// [WebPageInstantView] is returned on completion.
  const GetWebPageInstantView({
    required this.url,
    required this.onlyLocal,
  });

  /// The web page URL
  final String url;

  /// Pass true to get only locally available information without sending network requests
  final bool onlyLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "only_local": onlyLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: The web page URL
  /// * [only_local]: Pass true to get only locally available information without sending network requests
  GetWebPageInstantView copyWith({
    String? url,
    bool? onlyLocal,
  }) =>
      GetWebPageInstantView(
        url: url ?? this.url,
        onlyLocal: onlyLocal ?? this.onlyLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getWebPageInstantView';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
