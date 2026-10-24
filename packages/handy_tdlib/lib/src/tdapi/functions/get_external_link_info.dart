part of '../tdapi.dart';

/// **GetExternalLinkInfo** *(getExternalLinkInfo)* - TDLib function
///
/// Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats. if link preview is disabled in secret chats, and use directly getLinkWebBrowserType.
///
/// * [link]: The link.
///
/// [LoginUrlInfo] is returned on completion.
final class GetExternalLinkInfo extends TdFunction {
  /// **GetExternalLinkInfo** *(getExternalLinkInfo)* - TDLib function
  ///
  /// Returns information about an action to be done when the current user clicks an external link. Don't use this method for links from secret chats. if link preview is disabled in secret chats, and use directly getLinkWebBrowserType.
  ///
  /// * [link]: The link.
  ///
  /// [LoginUrlInfo] is returned on completion.
  const GetExternalLinkInfo({
    required this.link,
  });

  /// The link
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
  /// * [link]: The link
  GetExternalLinkInfo copyWith({
    String? link,
  }) =>
      GetExternalLinkInfo(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getExternalLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
