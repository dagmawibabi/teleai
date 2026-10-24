part of '../tdapi.dart';

/// **ChangeWebBrowserSettings** *(changeWebBrowserSettings)* - TDLib function
///
/// Changes web browser settings.
///
/// * [openExternalBrowser]: Pass true if links must be opened in an external browser by default.
/// * [displayCloseButton]: Pass true if a close button must be shown in the in-app browser; for Android app only.
///
/// [Ok] is returned on completion.
final class ChangeWebBrowserSettings extends TdFunction {
  /// **ChangeWebBrowserSettings** *(changeWebBrowserSettings)* - TDLib function
  ///
  /// Changes web browser settings.
  ///
  /// * [openExternalBrowser]: Pass true if links must be opened in an external browser by default.
  /// * [displayCloseButton]: Pass true if a close button must be shown in the in-app browser; for Android app only.
  ///
  /// [Ok] is returned on completion.
  const ChangeWebBrowserSettings({
    required this.openExternalBrowser,
    required this.displayCloseButton,
  });

  /// Pass true if links must be opened in an external browser by default
  final bool openExternalBrowser;

  /// Pass true if a close button must be shown in the in-app browser; for Android app only
  final bool displayCloseButton;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "open_external_browser": openExternalBrowser,
      "display_close_button": displayCloseButton,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [open_external_browser]: Pass true if links must be opened in an external browser by default
  /// * [display_close_button]: Pass true if a close button must be shown in the in-app browser; for Android app only
  ChangeWebBrowserSettings copyWith({
    bool? openExternalBrowser,
    bool? displayCloseButton,
  }) =>
      ChangeWebBrowserSettings(
        openExternalBrowser: openExternalBrowser ?? this.openExternalBrowser,
        displayCloseButton: displayCloseButton ?? this.displayCloseButton,
      );

  /// TDLib object type
  static const String defaultObjectId = 'changeWebBrowserSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
