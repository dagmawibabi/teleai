part of '../tdapi.dart';

/// **GetInternalLink** *(getInternalLink)* - TDLib function
///
/// Returns an HTTPS or a tg: link with the given type. Can be called before authorization.
///
/// * [type]: Expected type of the link.
/// * [isHttp]: Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link.
///
/// [HttpUrl] is returned on completion.
final class GetInternalLink extends TdFunction {
  /// **GetInternalLink** *(getInternalLink)* - TDLib function
  ///
  /// Returns an HTTPS or a tg: link with the given type. Can be called before authorization.
  ///
  /// * [type]: Expected type of the link.
  /// * [isHttp]: Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link.
  ///
  /// [HttpUrl] is returned on completion.
  const GetInternalLink({
    required this.type,
    required this.isHttp,
  });

  /// Expected type of the link
  final InternalLinkType type;

  /// Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link
  final bool isHttp;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "is_http": isHttp,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Expected type of the link
  /// * [is_http]: Pass true to create an HTTPS link (only available for some link types); pass false to create a tg: link
  GetInternalLink copyWith({
    InternalLinkType? type,
    bool? isHttp,
  }) =>
      GetInternalLink(
        type: type ?? this.type,
        isHttp: isHttp ?? this.isHttp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getInternalLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
