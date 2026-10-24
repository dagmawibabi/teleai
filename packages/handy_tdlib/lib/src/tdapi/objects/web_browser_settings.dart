part of '../tdapi.dart';

/// **WebBrowserSettings** *(webBrowserSettings)* - basic class
///
/// Describes web browser settings.
///
/// * [openExternalBrowser]: True, if links are opened in an external browser by default.
/// * [externalExceptions]: The list of websites which must always be opened in an external browser.
/// * [inAppExceptions]: The list of websites which must always be opened in the in-app browser.
/// * [displayCloseButton]: True, if a close button must be shown in the in-app browser; for Android app only.
final class WebBrowserSettings extends TdObject {
  /// **WebBrowserSettings** *(webBrowserSettings)* - basic class
  ///
  /// Describes web browser settings.
  ///
  /// * [openExternalBrowser]: True, if links are opened in an external browser by default.
  /// * [externalExceptions]: The list of websites which must always be opened in an external browser.
  /// * [inAppExceptions]: The list of websites which must always be opened in the in-app browser.
  /// * [displayCloseButton]: True, if a close button must be shown in the in-app browser; for Android app only.
  const WebBrowserSettings({
    required this.openExternalBrowser,
    required this.externalExceptions,
    required this.inAppExceptions,
    required this.displayCloseButton,
  });

  /// True, if links are opened in an external browser by default
  final bool openExternalBrowser;

  /// The list of websites which must always be opened in an external browser
  final List<WebDomainException> externalExceptions;

  /// The list of websites which must always be opened in the in-app browser
  final List<WebDomainException> inAppExceptions;

  /// True, if a close button must be shown in the in-app browser; for Android app only
  final bool displayCloseButton;

  /// Parse from a json
  factory WebBrowserSettings.fromJson(Map<String, dynamic> json) =>
      WebBrowserSettings(
        openExternalBrowser: json['open_external_browser'],
        externalExceptions: List<WebDomainException>.from(
            (json['external_exceptions'] ?? [])
                .map((item) => WebDomainException.fromJson(item))
                .toList()),
        inAppExceptions: List<WebDomainException>.from(
            (json['in_app_exceptions'] ?? [])
                .map((item) => WebDomainException.fromJson(item))
                .toList()),
        displayCloseButton: json['display_close_button'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "open_external_browser": openExternalBrowser,
      "external_exceptions": externalExceptions.map((i) => i.toJson()).toList(),
      "in_app_exceptions": inAppExceptions.map((i) => i.toJson()).toList(),
      "display_close_button": displayCloseButton,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [open_external_browser]: True, if links are opened in an external browser by default
  /// * [external_exceptions]: The list of websites which must always be opened in an external browser
  /// * [in_app_exceptions]: The list of websites which must always be opened in the in-app browser
  /// * [display_close_button]: True, if a close button must be shown in the in-app browser; for Android app only
  WebBrowserSettings copyWith({
    bool? openExternalBrowser,
    List<WebDomainException>? externalExceptions,
    List<WebDomainException>? inAppExceptions,
    bool? displayCloseButton,
  }) =>
      WebBrowserSettings(
        openExternalBrowser: openExternalBrowser ?? this.openExternalBrowser,
        externalExceptions: externalExceptions ?? this.externalExceptions,
        inAppExceptions: inAppExceptions ?? this.inAppExceptions,
        displayCloseButton: displayCloseButton ?? this.displayCloseButton,
      );

  /// TDLib object type
  static const String defaultObjectId = 'webBrowserSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
