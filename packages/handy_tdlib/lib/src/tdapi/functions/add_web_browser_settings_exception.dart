part of '../tdapi.dart';

/// **AddWebBrowserSettingsException** *(addWebBrowserSettingsException)* - TDLib function
///
/// Adds a special handling for the opening of the specified URL.
///
/// * [openExternalBrowser]: Pass true if the specified website must be opened in an external browser; pass false to open it in the in-app browser. There can be at most 100 exceptions in each list of the exceptions.
/// * [url]: URL of the website.
///
/// [Ok] is returned on completion.
final class AddWebBrowserSettingsException extends TdFunction {
  /// **AddWebBrowserSettingsException** *(addWebBrowserSettingsException)* - TDLib function
  ///
  /// Adds a special handling for the opening of the specified URL.
  ///
  /// * [openExternalBrowser]: Pass true if the specified website must be opened in an external browser; pass false to open it in the in-app browser. There can be at most 100 exceptions in each list of the exceptions.
  /// * [url]: URL of the website.
  ///
  /// [Ok] is returned on completion.
  const AddWebBrowserSettingsException({
    required this.openExternalBrowser,
    required this.url,
  });

  /// Pass true if the specified website must be opened in an external browser; pass false to open it in the in-app browser. There can be at most 100 exceptions in each list of the exceptions
  final bool openExternalBrowser;

  /// URL of the website
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "open_external_browser": openExternalBrowser,
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [open_external_browser]: Pass true if the specified website must be opened in an external browser; pass false to open it in the in-app browser. There can be at most 100 exceptions in each list of the exceptions
  /// * [url]: URL of the website
  AddWebBrowserSettingsException copyWith({
    bool? openExternalBrowser,
    String? url,
  }) =>
      AddWebBrowserSettingsException(
        openExternalBrowser: openExternalBrowser ?? this.openExternalBrowser,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addWebBrowserSettingsException';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
