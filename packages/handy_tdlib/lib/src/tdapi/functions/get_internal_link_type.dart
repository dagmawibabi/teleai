part of '../tdapi.dart';

/// **GetInternalLinkType** *(getInternalLinkType)* - TDLib function
///
/// Returns information about the type of internal link. Returns a 404 error if the link is not internal. Can be called before authorization.
///
/// * [link]: The link.
///
/// [InternalLinkType] is returned on completion.
final class GetInternalLinkType extends TdFunction {
  /// **GetInternalLinkType** *(getInternalLinkType)* - TDLib function
  ///
  /// Returns information about the type of internal link. Returns a 404 error if the link is not internal. Can be called before authorization.
  ///
  /// * [link]: The link.
  ///
  /// [InternalLinkType] is returned on completion.
  const GetInternalLinkType({
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
  GetInternalLinkType copyWith({
    String? link,
  }) =>
      GetInternalLinkType(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getInternalLinkType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
