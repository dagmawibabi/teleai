part of '../tdapi.dart';

/// **GetExternalLink** *(getExternalLink)* - TDLib function
///
/// Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link.. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed. May return an empty link if just a toast about successful login has to be shown.
///
/// * [link]: The HTTP link.
/// * [allowWriteAccess]: Pass true if the current user allowed the bot that was returned in getExternalLinkInfo, to send them messages.
///
/// [HttpUrl] is returned on completion.
final class GetExternalLink extends TdFunction {
  /// **GetExternalLink** *(getExternalLink)* - TDLib function
  ///
  /// Returns an HTTP URL which can be used to automatically authorize the current user on a website after clicking an HTTP link.. Use the method getExternalLinkInfo to find whether a prior user confirmation is needed. May return an empty link if just a toast about successful login has to be shown.
  ///
  /// * [link]: The HTTP link.
  /// * [allowWriteAccess]: Pass true if the current user allowed the bot that was returned in getExternalLinkInfo, to send them messages.
  ///
  /// [HttpUrl] is returned on completion.
  const GetExternalLink({
    required this.link,
    required this.allowWriteAccess,
  });

  /// The HTTP link
  final String link;

  /// Pass true if the current user allowed the bot that was returned in getExternalLinkInfo, to send them messages
  final bool allowWriteAccess;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "link": link,
      "allow_write_access": allowWriteAccess,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The HTTP link
  /// * [allow_write_access]: Pass true if the current user allowed the bot that was returned in getExternalLinkInfo, to send them messages
  GetExternalLink copyWith({
    String? link,
    bool? allowWriteAccess,
  }) =>
      GetExternalLink(
        link: link ?? this.link,
        allowWriteAccess: allowWriteAccess ?? this.allowWriteAccess,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getExternalLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
