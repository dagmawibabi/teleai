part of '../tdapi.dart';

/// **GetLinkWebBrowserType** *(getLinkWebBrowserType)* - TDLib function
///
/// Returns a type of the web browser which must be used to open the link.
///
/// * [link]: The HTTP link.
///
/// [WebBrowserType] is returned on completion.
final class GetLinkWebBrowserType extends TdFunction {
  /// **GetLinkWebBrowserType** *(getLinkWebBrowserType)* - TDLib function
  ///
  /// Returns a type of the web browser which must be used to open the link.
  ///
  /// * [link]: The HTTP link.
  ///
  /// [WebBrowserType] is returned on completion.
  const GetLinkWebBrowserType({
    required this.link,
  });

  /// The HTTP link
  final String link;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link": link,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The HTTP link
  GetLinkWebBrowserType copyWith({
    String? link,
  }) =>
      GetLinkWebBrowserType(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLinkWebBrowserType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
