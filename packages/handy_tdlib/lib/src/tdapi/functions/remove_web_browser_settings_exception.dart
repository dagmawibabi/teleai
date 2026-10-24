part of '../tdapi.dart';

/// **RemoveWebBrowserSettingsException** *(removeWebBrowserSettingsException)* - TDLib function
///
/// Removes a special handling for the opening of the specified URL.
///
/// * [url]: URL of the website.
///
/// [Ok] is returned on completion.
final class RemoveWebBrowserSettingsException extends TdFunction {
  /// **RemoveWebBrowserSettingsException** *(removeWebBrowserSettingsException)* - TDLib function
  ///
  /// Removes a special handling for the opening of the specified URL.
  ///
  /// * [url]: URL of the website.
  ///
  /// [Ok] is returned on completion.
  const RemoveWebBrowserSettingsException({
    required this.url,
  });

  /// URL of the website
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: URL of the website
  RemoveWebBrowserSettingsException copyWith({
    String? url,
  }) =>
      RemoveWebBrowserSettingsException(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeWebBrowserSettingsException';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
