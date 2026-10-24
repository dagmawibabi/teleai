part of '../tdapi.dart';

/// **GetApplicationDownloadLink** *(getApplicationDownloadLink)* - TDLib function
///
/// Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram.
///
/// [HttpUrl] is returned on completion.
final class GetApplicationDownloadLink extends TdFunction {
  /// **GetApplicationDownloadLink** *(getApplicationDownloadLink)* - TDLib function
  ///
  /// Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram.
  ///
  /// [HttpUrl] is returned on completion.
  const GetApplicationDownloadLink();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetApplicationDownloadLink copyWith() => const GetApplicationDownloadLink();

  /// TDLib object type
  static const String defaultObjectId = 'getApplicationDownloadLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
