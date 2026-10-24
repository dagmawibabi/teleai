part of '../tdapi.dart';

/// **GetDeepLinkInfo** *(getDeepLinkInfo)* - TDLib function
///
/// Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization.
///
/// * [link]: The link.
///
/// [DeepLinkInfo] is returned on completion.
final class GetDeepLinkInfo extends TdFunction {
  /// **GetDeepLinkInfo** *(getDeepLinkInfo)* - TDLib function
  ///
  /// Returns information about a tg:// deep link. Use "tg://need_update_for_some_feature" or "tg:some_unsupported_feature" for testing. Returns a 404 error for unknown links. Can be called before authorization.
  ///
  /// * [link]: The link.
  ///
  /// [DeepLinkInfo] is returned on completion.
  const GetDeepLinkInfo({
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
  GetDeepLinkInfo copyWith({
    String? link,
  }) =>
      GetDeepLinkInfo(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getDeepLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
